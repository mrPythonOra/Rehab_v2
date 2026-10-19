begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/


select unique DR_NAME||' ('||DR_TYPE_SHORT||')' d, DR_ID r
from rehab_drugs, REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS
where PRD_DR_ID = DR_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
order by 1;


select
   PRD_ID id,ora_hash(dr_id,16)  aa,
   case ora_hash(dr_id,16) 
     when 0 then 'apex-cal-red'
     when 1 then 'apex-cal-green'
     when 2 then 'apex-cal-blue'
     when 3 then 'apex-cal-yellow'
     when 4 then 'apex-cal-orange'
     when 5 then 'apex-cal-cyan'
     when 6 then 'apex-cal-purple'
     when 7 then 'apex-cal-pink'
     when 8 then 'apex-cal-brown'
     when 9 then 'apex-cal-magenta'
     when 10 then 'apex-cal-lime'
     when 11 then 'apex-cal-maroon'
     when 12 then 'apex-cal-navy'
     when 13 then 'apex-cal-olive'
     when 14 then 'apex-cal-teal'
     when 15 then 'apex-cal-silver'
     when 16 then 'apex-cal-Salmon'
   end ccc,CP_NAME,
   DR_NAME||' ('||DR_TYPE_SHORT||')' project,
   DR_NAME task_name,
   'Open' status,
   0 assigned_to,
   0 cost,
   PRATR_ACTUAL_START start_date,
   PRATR_ACTUAL_END end_date,
--   case
--      when status = 'Pending' then 'apex-cal-blue'
--      when status = 'Open' then 'apex-cal-green'
--      when status = 'Closed' then 'apex-cal-gray'
--      when status = 'On-Hold' then 'apex-cal-orange'
--   end as 
   'apex-cal-green' css_class
from rehab_drugs, REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS, REHAB_CONSUME_PATTERNS
where PRD_DR_ID = DR_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and CP_ID = PRATR_CP_ID
order by PRATR_ACTUAL_START, PRATR_ACTUAL_END;

select d,r from(
select PRR_PRESCRIPTED_BY_SHORT ||' ('||to_char(PRR_PRESCRIPTED_WHEN,'YYYY-Mon-DD')||')' d, PRR_PRESCRIPTED_BY_SHORT ||' ('||to_char(PRR_PRESCRIPTED_WHEN,'YYYY-Mon-DD')||')' r, PRR_PRESCRIPTED_WHEN
from rehab_drugs, REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTORS
where PRD_DR_ID = DR_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID
and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and PRR_ID = PR_PRR_ID
group by PRR_PRESCRIPTED_BY_SHORT, PRR_PRESCRIPTED_WHEN
order by PRR_PRESCRIPTED_WHEN desc);


select
   PRATR_ID id,
   PRR_PRESCRIPTED_BY_SHORT ||' ('||to_char(PRR_PRESCRIPTED_WHEN,'YYYY-Mon-DD')||')' prescriptor,
   DR_NAME||' ('||DR_TYPE_SHORT||')' drug, DR_ID,trunc(DRU_CONSUMED,'dd') DRU_CONSUMED,
   --PRATR_ACTUAL_START start_date,
   --nvl(PRATR_ACTUAL_END,systimestamp + INTERVAL '10' YEAR) end_date,
   case ora_hash(dr_id,16) 
     when 0 then 'apex-cal-red'
     when 1 then 'apex-cal-green'
     when 2 then 'apex-cal-blue'
     when 3 then 'apex-cal-yellow'
     when 4 then 'apex-cal-orange'
     when 5 then 'apex-cal-cyan'
     when 6 then 'apex-cal-purple'
     when 7 then 'apex-cal-pink'
     when 8 then 'apex-cal-brown'
     when 9 then 'apex-cal-magenta'
     when 10 then 'apex-cal-lime'
     when 11 then 'apex-cal-maroon'
     when 12 then 'apex-cal-navy'
     when 13 then 'apex-cal-olive'
     when 14 then 'apex-cal-teal'
     when 15 then 'apex-cal-Fuchsia'
     when 16 then 'apex-cal-Salmon'
   end  css_class,WS_NAME,WS_ID,
   nvl2(WS_NAME,'Діюча речовина: '||WS_NAME||' ',null)||'Приймати: '||CP_NAME add_info,
   DRU_ID
from REHAB_DRUG_USES, rehab_drugs, REHAB_WORKING_SUBSTANCE, 
     REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTORS, REHAB_CONSUME_PATTERNS
where DRU_DR_ID = DR_ID 
and DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
and WS_ID(+) = DRU_WS_ID
and DRU_PRD_ID = PRD_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID and PR_PRR_ID = PRR_ID
and PRATR_CP_ID = CP_ID;
order by PRATR_ACTUAL_START, drug;

WITH 
ds as (select unique
           PRATR_ID id,
           PRR_PRESCRIPTED_BY_SHORT ||' ('||to_char(PRR_PRESCRIPTED_WHEN,'YYYY-Mon-DD')||')' prescriptor,
           DR_NAME||' ('||DR_TYPE_SHORT||')' drug, DR_ID,
--           PRATR_ACTUAL_START start_date,
--           nvl(PRATR_ACTUAL_END,systimestamp + INTERVAL '10' YEAR) end_date,
           case ora_hash(dr_id,16) 
             when 0 then 'apex-cal-red'
             when 1 then 'apex-cal-green'
             when 2 then 'apex-cal-blue'
             when 3 then 'apex-cal-yellow'
             when 4 then 'apex-cal-orange'
             when 5 then 'apex-cal-cyan'
             when 6 then 'apex-cal-purple'
             when 7 then 'apex-cal-pink'
             when 8 then 'apex-cal-brown'
             when 9 then 'apex-cal-magenta'
             when 10 then 'apex-cal-lime'
             when 11 then 'apex-cal-maroon'
             when 12 then 'apex-cal-navy'
             when 13 then 'apex-cal-olive'
             when 14 then 'apex-cal-teal'
             when 15 then 'apex-cal-Fuchsia'
             when 16 then 'apex-cal-Salmon'
           end  css_class,WS_NAME,WS_ID,
           --nvl2(WS_NAME,'Діюча речовина: '||WS_NAME||' ',null)||'Приймати: '||CP_NAME add_info,
           prr_id, pr_id, PRATR_ID,CP_NAME
        from REHAB_PRESCRIPTORS, rehab_drugs, REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS, REHAB_CONSUME_PATTERNS, REHAB_WORKING_SUBSTANCE
        where PRD_DR_ID = DR_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID
        and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and PRR_ID = PR_PRR_ID and CP_ID = PRATR_CP_ID
        and WS_ID(+) = PR_WS_ID),
unique_dates AS (
    -- 1. Ensure unique dates in case your source table has multiple records per day
select
     PR_PRR_ID prr_id, DRU_DR_ID DR_ID, trunc(DRU_CONSUMED,'dd') dt, DRU_ACTUAL_DOSAGE
from REHAB_DRUG_USES, 
     REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS
where DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
  and DRU_PRD_ID = PRD_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID
),
numbered_dates AS (
    -- 2. Assign a sequential row number ordered by the date
    SELECT 
        prr_id,dr_id,dt,
        ROW_NUMBER() OVER (partition by prr_id,dr_id ORDER BY dt) AS rn
    FROM (select unique prr_id,dr_id, dt from unique_dates)
),--select * from numbered_dates order by 1,2,3;--,
grouped_islands AS (
    -- 3. Subtract the row number from the date. 
    -- For consecutive dates, this difference will always yield the exact same constant date.
    SELECT 
        prr_id,dr_id,
        dt,
        dt - rn AS grp
    FROM numbered_dates
),--select * from grouped_islands order by 1,2,4,3;--
-- 4. Aggregate to find the start and end of each consecutive interval
ints as (
SELECT 
    prr_id,dr_id,
    MIN(dt) AS interval_start,
    MAX(dt) AS interval_end,
    COUNT(*) AS total_consecutive_days
FROM grouped_islands
GROUP BY prr_id,dr_id,grp)
select
  ds.*, interval_start start_date, interval_end end_date, total_consecutive_days,
  nvl2(WS_NAME,'Діюча речовина: '||WS_NAME||' ',null)||'Тривало: '||total_consecutive_days||' дні(в). Приймалось: '||CP_NAME add_info
from ds, ints
where ds.prr_id = ints.prr_id and ds.dr_id=ints.dr_id
ORDER BY start_date;

drop INDEX IDX_UQ_REHAB_PRESCRIPTIONS_PRR_WS_DR;
delete from REHAB_PRESCRIPTIONS;
CREATE UNIQUE INDEX IDX_UQ_REHAB_PRESCRIPTIONS_PRR_WS_DR ON REHAB_PRESCRIPTIONS (PR_PRR_ID, PR_WS_ID, PR_DR_ID) ;