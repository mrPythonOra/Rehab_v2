

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_LOGGING_PKG" AS

  function prepmsg(p_msg varchar2,
                p1 varchar2 default null,
                p2 varchar2 default null,
                p3 varchar2 default null,
                p4 varchar2 default null,
                p5 varchar2 default null,
                p6 varchar2 default null,
                p7 varchar2 default null,
                p8 varchar2 default null) return varchar2
  is
  begin
    return REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(
     p_msg,'%p',p1,1,1),
           '%p',p2,1,1),
           '%p',p3,1,1),
           '%p',p4,1,1),
           '%p',p5,1,1),
           '%p',p6,1,1),
           '%p',p7,1,1),
           '%p',p8,1,1);
  end;

  procedure logmsg(p_unit varchar2,
                p_line varchar2,
                p_msg varchar2,
                p1 varchar2 default null,
                p2 varchar2 default null,
                p3 varchar2 default null,
                p4 varchar2 default null,
                p5 varchar2 default null,
                p6 varchar2 default null,
                p7 varchar2 default null,
                p8 varchar2 default null) AS
    pragma autonomous_transaction;
  begin
    INSERT INTO REHAB_LOG
           (log_id,              LOG_TIMESTAMPT,                            LOG_MODULE, LOG_MODULE_LINE, log_te_id,
            LOG_MESSAGE)
    VALUES (SQ_REHAB_LOG.nextval,systimestamp at time zone SESSIONTIMEZONE, p_unit,     p_line,         REHAB_CONTEXT_PKG.getTENANT(),
            prepmsg(p_msg, p1, p2, p3, p4, p5, p6, p7, p8));
    commit;
  END logmsg;

  procedure lognraise
               (p_unit varchar2,
                p_line varchar2,
                p_msg varchar2,
                p1 varchar2 default null,
                p2 varchar2 default null,
                p3 varchar2 default null,
                p4 varchar2 default null,
                p5 varchar2 default null,
                p6 varchar2 default null,
                p7 varchar2 default null,
                p8 varchar2 default null) AS
    pragma autonomous_transaction;
    l_msg varchar2(4000);
  begin
    l_msg := prepmsg(p_msg, p1, p2, p3, p4, p5, p6, p7, p8) || chr(10) || DBMS_UTILITY.FORMAT_CALL_STACK;
    INSERT INTO REHAB_LOG
           (log_id,              LOG_TIMESTAMPT,                            LOG_MODULE, LOG_MODULE_LINE,
            LOG_MESSAGE)
    VALUES (SQ_REHAB_LOG.nextval,systimestamp at time zone SESSIONTIMEZONE, p_unit,     p_line,
            l_msg);
    commit;
    raise_application_error(-20101,'Error at unit: '||p_unit||'.'||p_line||': '||l_msg);
  END lognraise;

  procedure cleanup_log
  is
  begin
    for i in (select * from REHAB_CONFIGS where PAR_NAME = 'ADM_LOG_RETENTION_DAYS' order by PAR_TE_ID nulls last)
    loop
      if i.PAR_TE_ID is not null then
        delete /*+ NO_PARALLEL */ from REHAB_LOG where LOG_TIMESTAMPT < sysdate - to_number(i.PAR_VALUE) and LOG_TE_ID = i.PAR_TE_ID;
        logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Deleted %p rows for tenant id %p.',sql%rowcount, i.PAR_TE_ID);
      else
        delete /*+ NO_PARALLEL */ from REHAB_LOG where LOG_TIMESTAMPT < sysdate - to_number(i.PAR_VALUE) and LOG_TE_ID is null;
        logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Deleted %p rows for empty tenant id.',sql%rowcount);
        delete /*+ NO_PARALLEL */ from REHAB_LOG where LOG_TIMESTAMPT < sysdate - to_number(i.PAR_VALUE) and LOG_TE_ID not in (select PAR_TE_ID from REHAB_CONFIGS where PAR_NAME = 'ADM_LOG_RETENTION_DAYS' and PAR_TE_ID is not null);
        logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Deleted %p rows for tenants not specifued its retention ploicy.',sql%rowcount);
      end if;
      commit;
    end loop;
  end;

  procedure setup_cleanup_log
  is
  begin
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'REHAB_LOG_CLEANUP',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                               REHAB_LOGGING_PKG.cleanup_log;
                            END;',
        start_date      => trunc(SYSDATE) + 2/24,
        repeat_interval => 'FREQ=DAILY; INTERVAL=1', -- Optional: runs daily
        enabled         => TRUE,
        comments        => 'Cleaning up REHAB APP logs'
    );
  end;

END REHAB_LOGGING_PKG;
/

