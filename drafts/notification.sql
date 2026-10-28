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