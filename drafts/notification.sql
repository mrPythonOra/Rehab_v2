with dates as (select trunc(to_date(:P601_START,'YYYY-MON-DD') + level - 1,'DD') dd
from dual 
connect by level <= to_date(:P601_END,'YYYY-MON-DD') - to_date(:P601_START,'YYYY-MON-DD')),
dr_data1 as 
(select unique 
        d.DR_NAME||' - '||PRR_PRESCRIPTED_BY_SHORT||' ('||to_char(PRR_PRESCRIPTED_WHEN,'YYYY-MON-DD')||')' nm,
        pr.pr_id, PRD_DR_ID
 from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d
where pr.pr_prr_id=prr.prr_id 
  and PR_ID=123 --(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,':'))) where rn=1)
  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID
  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())
select
  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, 'Спожито: ' ||ACTUAL_DOSAGE||' мг в '|| to_char(CONSUMED,'Day YYYY-Mon-DD') ct
from
 dr_data1, 
 dates,
 (
   select du.dru_pr_id,du.DRU_DR_ID,
          trunc(DRU_CONSUMED,'dd') CONSUMED, 
          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE
  from REHAB_DRUG_USES du, dr_data1 d
  where du.DRU_ACTUAL_DOSAGE is not null
    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() 
    and du.dru_pr_id = d.pr_id
    and du.DRU_DR_ID = PRD_DR_ID
    and trunc(DRU_CONSUMED,'dd') between to_date(:P601_START,'YYYY-MON-DD') and to_date(:P601_END,'YYYY-MON-DD')
    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,'dd')
    ) duu
where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID
order by CONSUMED
;

begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/

select to_char(to_date(to_char(trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()),'YYYYMMDD')||to_char(systimestamp at time zone SESSIONTIMEZONE,'HH24MISS'),'YYYYMMDDHH24MISS'),'&APP_DTFMT_SHORT_T.');
select
  TP_NAME || ' ' || count(PRD_ID) ||'/'|| count(DRU_ID) d,
  TP_ID r,
  min(TP_START_TIME_DT_GDT)
from (
select TP_NAME,
       TP_ID,
       PRD_ID, DRU_ID, TP_START_TIME_DT_GDT
  from V$REHAB_TIME_PERIODS_AVAILABLE, V$REHAB_CONSUME_DATA
where (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or 
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT) )
group by TP_NAME, TP_ID
  order by 3;
  
BEGIN
    apex_pwa.send_push_notification (
        p_application_id => 200,             -- Your Application ID
        p_user_name      => 'YURI',         -- Recipient username
        p_title          => 'Order Update',  -- Notification Title
        p_body           => 'from SQL Dev Your order 123 has been shipped.', -- Notification Body
        p_target_url     => 'f?p=100:2:::::'   -- Optional: Page to open on click
    );
END;
/

DECLARE
    l_workspace_id NUMBER;
BEGIN
    -- 1. Look up the Security Group ID for your workspace name
    l_workspace_id := apex_util.find_security_group_id (
        p_workspace => 'REHABILITATION' -- e.g., 'MY_WORKSPACE'
    );

    -- 2. Set the APEX session security group context
    apex_util.set_security_group_id (
        p_security_group_id => l_workspace_id
    );

    -- 3. Now you can safely call your APEX PWA or utility functions
    apex_pwa.send_push_notification (
        p_application_id => 200,             -- Your Application ID
        p_user_name      => 'YURI',         -- Recipient username
        p_title          => 'Order Update',  -- Notification Title
        p_body           => 'from SQL Dev 2 Your order #123 has been shipped.',
        p_target_url     => 'f?p=100:2:::::'
    );
    
    COMMIT;
END;
/

alter table REHAB_LOG add log_te_id number;

ALTER TABLE REHAB_LOG ADD CONSTRAINT FK_REHAB_LOG_TE FOREIGN KEY (log_te_id)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;
      
drop table rehab_notification_defs;
create table rehab_notification_defs (
nd_id varchar2(10),
nd_name   varchar2(128),
nd_description varchar2(4000),
nd_title  varchar2(128),
nd_body   varchar2(512),
nd_target_url varchar2(256));

ALTER TABLE rehab_notification_defs ADD CONSTRAINT PK_rehab_notification_defs PRIMARY KEY (nd_id)
  USING INDEX;

drop sequence sq_rehab_notification_defs;
drop table rehab_notification_pars;
create table rehab_notification_pars (
np_id number,
np_nd_id varchar2(10),
np_time_delay number, --minutes
np_app_user varchar2(128),
np_PR_ID_EVENT number, -- notify to consume next med
np_PR_ID_TRG number,
np_CPTR_ID number, --notify when a window starts
np_dr_id number, -- notify when low remains
np_dr_days_remain number
);

ALTER TABLE rehab_notification_pars ADD CONSTRAINT PK_rehab_notification_pars PRIMARY KEY (np_id)
  USING INDEX;
  
ALTER TABLE rehab_notification_pars ADD CONSTRAINT FK_rehab_notification_pars_nd FOREIGN KEY (np_nd_id)
	  REFERENCES rehab_notification_defs (nd_id) ENABLE;
      
create unique index IX_rehab_notification_pars_NEXTMED on rehab_notification_pars(np_nd_id, np_app_user, np_PR_ID_EVENT, np_PR_ID_TRG);
create unique index IX_rehab_notification_pars_WIN on rehab_notification_pars(np_nd_id, np_app_user, np_CPTR_ID);
create unique index IX_rehab_notification_pars_DRUG on rehab_notification_pars(np_nd_id, np_app_user, np_dr_id);
create sequence sq_rehab_notification_pars;

drop table rehab_notification_queue;
create table rehab_notification_queue (
nq_id number,
nq_send_dt timestamp with time zone,
nq_app_user varchar2(128),
nq_nd_id varchar2(10),
nq_title  varchar2(128),
nq_body   varchar2(512),
nq_target_url varchar2(256),
nq_status varchar2(30) default 'INQUEUE',
nq_sent timestamp with time zone
);

ALTER TABLE rehab_notification_queue ADD CONSTRAINT PK_rehab_notification_queue PRIMARY KEY (nq_id)
  USING INDEX;
  
ALTER TABLE rehab_notification_queue ADD CONSTRAINT FK_rehab_notification_queue_nd FOREIGN KEY (nq_nd_id)
	  REFERENCES rehab_notification_defs (nd_id) ENABLE;
      
create sequence sq_rehab_notification_queue;
--apex_util.prepare_url('f?p='||:app_id||':101:'||:app_session||':T:::P101_PG_ID,P101_PG_PARENT:'||PG_ID||','||PG_PARENT)
set define off
INSERT INTO rehab_notification_defs (
    nd_id,
    nd_name,
    nd_description,
    nd_title,
    nd_body,
    nd_target_url
) VALUES ( 'NEXTMEDNF',
           'Наступний медикамент',
           'Нагадування при необхідність прийому наступного медикаменту',
           'Час приймати наступний медикамент!',
           'Час приймати %p.',
           '/r/reabilitation/rehab-v2-0/medtoconsume' );
--r/rehab-v2-0/medtoconsume           
INSERT INTO rehab_notification_pars (
    np_id,
    np_nd_id,
    np_time_delay,
    np_app_user,
    np_pr_id_event,
    np_pr_id_trg,
    np_cptr_id,
    np_dr_id,
    np_dr_days_remain
) VALUES ( sq_rehab_notification_pars.nextval,
           'NEXTMEDNF',
           5,
           'YURI',
           421,
           422,
           null,
           null,
           null );
commit;

begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/

declare
  l_drug_name varchar2(128);
begin
    for i in (select * from REHAB_NOTIFICATION_DEFS, REHAB_NOTIFICATION_PARS
               where NP_ND_ID = ND_ID
                 and NP_APP_USER = REHAB_CONTEXT_PKG.getAPEX_USER
                 and NP_PR_ID_EVENT = 421) 
    loop
      select DR_NAME || ' ('||DR_TYPE_SHORT ||')' into l_drug_name
      from V$REHAB_CONSUME_DATA
      where PR_ID = i.NP_PR_ID_TRG;
      INSERT INTO rehab_notification_queue (nq_id,    nq_nd_id, nq_send_dt, 
                                            nq_title, Nq_BODY, Nq_TARGET_URL,
                                            NQ_APP_USER) 
      VALUES ( sq_rehab_notification_queue.nextval, i.np_nd_id, systimestamp at time zone SESSIONTIMEZONE + NUMTODSINTERVAL(i.NP_TIME_DELAY, 'MINUTE'),
                                            i.ND_TITLE, REHAB_LOGGING_PKG.prepmsg(i.ND_BODY,l_drug_name), i.ND_TARGET_URL,
                                            REHAB_CONTEXT_PKG.getAPEX_USER);
    end loop;
    commit;
end;
/

DECLARE
    l_workspace_id NUMBER;
BEGIN
    -- 1. Look up the Security Group ID for your workspace name
    l_workspace_id := apex_util.find_security_group_id (
        p_workspace => 'REHABILITATION' -- e.g., 'MY_WORKSPACE'
    );

    -- 2. Set the APEX session security group context
    apex_util.set_security_group_id (
        p_security_group_id => l_workspace_id
    );
    
    for i in (select * from REHAB_NOTIFICATION_QUEUE where NQ_STATUS = 'INQUEUE' --and NQ_SEND_DT  - NUMTODSINTERVAL(2, 'MINUTE') < systimestamp
             )
    loop
        -- 3. Now you can safely call your APEX PWA or utility functions
        apex_pwa.send_push_notification (
            p_application_id => 200,             -- Your Application ID
            p_user_name      => i.NQ_APP_USER,         -- Recipient username
            p_title          => i.NQ_TITLE,  -- Notification Title
            p_body           => i.NQ_BODY,
            p_target_url     => i.NQ_TARGET_URL
        );
        REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Notification "%p" for user "%p" is sent',i.NQ_TITLE,i.NQ_APP_USER);
        update REHAB_NOTIFICATION_QUEUE set NQ_STATUS = 'ISSENT', NQ_SENT = systimestamp at time zone SESSIONTIMEZONE where NQ_ID = i.NQ_ID;
    end loop;
    COMMIT;
END;
/

select systimestamp at time zone SESSIONTIMEZONE - NUMTODSINTERVAL(2, 'MINUTE') a, x.* from REHAB_NOTIFICATION_QUEUE x where NQ_STATUS = 'INQUEUE';-- and NQ_SEND_DT < 

select
apex_page.get_url(
        p_application => 200,
        p_page        => 101,
        p_items       => '',
        p_values      => '',
        p_absolute_url => true
    )
from dual;

SELECT APEX_PAGE.GET_URL (
            p_page   => 1,
            p_items  => 'P1_X,P1_Y',
            p_values => 'somevalue,othervalue' ) f_url_1,
         APEX_UTIL.PREPARE_URL('f?p=&APP_ID.:1:&APP_SESSION.::::P1_X,P1_Y:somevalue,othervalue') f_url_2
     FROM DUAL;
     
    
BEGIN
  REHAB_NOTIFY_PKG.setup_queue_processing  ;  
END;
/

