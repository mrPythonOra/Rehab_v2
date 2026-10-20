select id                            task_id,
       task_name                     task_name,
       parent_task                   parent_task_id,
       start_date                    task_start_date,
       end_date                      task_end_date,
       decode(status,'Closed',1,
                     'Open',0.6,
                     'On-Hold',0.1,
                     'Pending',0)    status,
       start_date-2                  baseline_start,
       end_date+3                    baseline_end,
       SYSDATE-200                   GANTT_START,
       SYSDATE+10                    GANTT_END
from eba_demo_chart_tasks
start with parent_task is null
connect by prior id = parent_task
order siblings by task_name;

select PRATR_ID                            task_id,
       DR_NAME                     task_name,
       null                   parent_task_id,
       PRATR_ACTUAL_START                    task_start_date,
       nvl(PRATR_ACTUAL_END,sysdate+365)                       task_end_date,
       case when PRATR_ACTUAL_START > systimestamp then 0
            when systimestamp > PRATR_ACTUAL_START and (PRATR_ACTUAL_END is not null and PRATR_ACTUAL_END > systimestamp) then
                round((sysdate-(PRATR_ACTUAL_START+0))/((nvl(PRATR_ACTUAL_END+0,sysdate+365)+0)-(PRATR_ACTUAL_START+0)),3)
            when systimestamp > PRATR_ACTUAL_START and PRATR_ACTUAL_END is null then 0.01
            when systimestamp > PRATR_ACTUAL_END then 1 
            end status,
       min(PR_PLANNED_START) over (partition by PR_ID)                  baseline_start,
       max(nvl(PR_PLANNED_END,sysdate+365)) over (partition by PR_ID)                    baseline_end,
       SYSDATE-200                   GANTT_START,
       SYSDATE+10                    GANTT_END
from REHAB_PRESCRIPTORS, 
     REHAB_PRESCRIPTIONS, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, 
     lateral(select unique PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID),
    REHAB_DRUGS
where PRR_ID = PR_PRR_ID and PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
and PRD_DR_ID = DR_ID
order by task_name;


begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/
select prr_id                                                                           task_id, 
       null                                                                             parent_task_id,
       PRR_PRESCRIPTED_BY_SHORT||' ('||to_char(PRR_PRESCRIPTED_WHEN,'YYYY-Mon-DD')||')' task_name,
       PRR_PRESCRIPTED_WHEN+0                                                           task_start_date,
       PRR_PRESCRIPTED_WHEN+0                                                           task_end_date,
       1                                                                                status,
       PRR_PRESCRIPTED_WHEN+0                                                           baseline_start,
       PRR_PRESCRIPTED_WHEN+0                                                           baseline_end,
       SYSDATE-30                                                                       GANTT_START,
       SYSDATE+10                                                                       GANTT_END       
from REHAB_PRESCRIPTORS
where PRR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
union all
select PRATR_ID * 1e6                                                                   task_id, 
       PR_PRR_ID                                                                        parent_task_id,
       DR_NAME                                                                          task_name,
       PRATR_ACTUAL_START+0                                                             task_start_date,
       nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              task_end_date,
       1                                                                                status,
       PRATR_ACTUAL_START+0                                                             baseline_start,
       nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              baseline_end,
       SYSDATE-30                                                                       GANTT_START,
       SYSDATE+10                                                                       GANTT_END  
from REHAB_PRESCRIPTIONS, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, 
     lateral(select unique PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID),
    REHAB_DRUGS
where PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
and PRD_DR_ID = DR_ID and PR_WS_ID is null
union all
select PR_ID * 1e9                                                                      task_id, 
       PR_PRR_ID                                                                        parent_task_id,
       WS_NAME                                                                          task_name,
       min(PRATR_ACTUAL_START+0) over (partition by PR_ID)                              task_start_date,
       max(nvl(PRATR_ACTUAL_END+0,sysdate+365)) over (partition by PR_ID)               task_end_date,
       1                                                                                status,
       min(PRATR_ACTUAL_START+0) over (partition by PR_ID)                              baseline_start,
       max(nvl(PRATR_ACTUAL_END+0,sysdate+365)) over (partition by PR_ID)               baseline_end,
       SYSDATE-30                                                                       GANTT_START,
       SYSDATE+10                                                                       GANTT_END  
from REHAB_PRESCRIPTIONS, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES,
     REHAB_WORKING_SUBSTANCE
where PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
and PR_WS_ID is not null
and WS_ID = PR_WS_ID
union all
select PRATR_ID * 1e6                                                                   task_id, 
       PR_ID * 1e9                                                                      parent_task_id,
       DR_NAME                                                                          task_name,
       PRATR_ACTUAL_START+0                                                             task_start_date,
       nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              task_end_date,
       1                                                                                status,
       PRATR_ACTUAL_START+0                                                             baseline_start,
       nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              baseline_end,
       SYSDATE-30                                                                       GANTT_START,
       SYSDATE+10                                                                       GANTT_END  
from REHAB_PRESCRIPTIONS, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, 
     lateral(select unique PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID),
    REHAB_DRUGS
where PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
and PRD_DR_ID = DR_ID and PR_WS_ID is not null
;