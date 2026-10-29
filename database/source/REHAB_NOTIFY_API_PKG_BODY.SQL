

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_NOTIFY_API_PKG" AS

    procedure setup_notification_next_med(p_NP_PR_ID_EVENT REHAB_NOTIFICATION_PARS.NP_PR_ID_EVENT%type,
                                          p_NP_PR_ID_TRG REHAB_NOTIFICATION_PARS.NP_PR_ID_TRG%type,
                                          p_NP_TIME_DELAY REHAB_NOTIFICATION_PARS.NP_TIME_DELAY%type)
    is
    begin
      if p_NP_TIME_DELAY is null then
        delete from REHAB_NOTIFICATION_PARS where NP_ND_ID = 'NEXTMEDNF' and NP_APP_USER = REHAB_CONTEXT_PKG.getAPEX_USER and NP_PR_ID_EVENT = p_NP_PR_ID_EVENT;
        REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Deleting notification setup "%p" for user "%p".',p_NP_PR_ID_EVENT,REHAB_CONTEXT_PKG.getAPEX_USER);
      else
        merge into REHAB_NOTIFICATION_PARS trg
        using (select 'NEXTMEDNF' NP_ND_ID, REHAB_CONTEXT_PKG.getAPEX_USER NP_APP_USER, p_NP_PR_ID_EVENT NP_PR_ID_EVENT, p_NP_PR_ID_TRG NP_PR_ID_TRG, p_NP_TIME_DELAY NP_TIME_DELAY from dual) src
        on (src.NP_ND_ID = trg.NP_ND_ID and src.NP_APP_USER=trg.NP_APP_USER and src.NP_PR_ID_EVENT = trg.NP_PR_ID_EVENT)
        when matched then update set trg.NP_PR_ID_TRG = src.NP_PR_ID_TRG, trg.NP_TIME_DELAY = src.NP_TIME_DELAY
        when not matched then insert (
            trg.np_id,
            trg.np_nd_id,
            trg.np_time_delay,
            trg.np_app_user,
            trg.np_pr_id_event,
            trg.np_pr_id_trg,
            trg.np_cptr_id,
            trg.np_dr_id,
            trg.np_dr_days_remain)
        VALUES (
            sq_rehab_notification_pars.nextval,
            src.NP_ND_ID,
            src.NP_TIME_DELAY,
            src.NP_APP_USER,
            src.NP_PR_ID_EVENT,
            src.NP_PR_ID_TRG,
            null,
            null,
            null );
        REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Modifying notification setup "%p" for user "%p".',p_NP_PR_ID_EVENT,REHAB_CONTEXT_PKG.getAPEX_USER);
      end if;
    end;

    procedure add_notification_next_med(p_pr_id REHAB_PRESCRIPTIONS.PR_ID%type,
                                      P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type) AS
        l_drug_name varchar2(128);
    BEGIN
        for i in (select * from REHAB_NOTIFICATION_DEFS, REHAB_NOTIFICATION_PARS
                   where NP_ND_ID = ND_ID
                     and NP_APP_USER = REHAB_CONTEXT_PKG.getAPEX_USER
                     and NP_PR_ID_EVENT = p_pr_id)
        loop
          select DR_NAME || ' ('||DR_TYPE_SHORT ||')' into l_drug_name
          from V$REHAB_CONSUME_DATA
          where PR_ID = i.NP_PR_ID_TRG;
          INSERT INTO rehab_notification_queue (nq_id,    nq_nd_id, nq_send_dt,
                                                nq_title, Nq_BODY, Nq_TARGET_URL,
                                                NQ_APP_USER)
          VALUES ( sq_rehab_notification_queue.nextval, i.np_nd_id, P_DRU_CONSUMED at time zone SESSIONTIMEZONE + NUMTODSINTERVAL(i.NP_TIME_DELAY, 'MINUTE'),
                                                i.ND_TITLE,REHAB_LOGGING_PKG.prepmsg(i.ND_BODY,l_drug_name),i.ND_TARGET_URL,
                                                REHAB_CONTEXT_PKG.getAPEX_USER);
          REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Notification "%p" for user "%p" is added.',i.ND_TITLE,REHAB_CONTEXT_PKG.getAPEX_USER);
        end loop;
    END add_notification_next_med;

END REHAB_NOTIFY_API_PKG;
/

