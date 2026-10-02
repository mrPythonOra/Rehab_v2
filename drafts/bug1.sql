
select 
--       count(*) max_value, 
--       count(DRU_CONSUMED) value,
--       count(DRU_CONSUMED) || ' з '|| count(*) ||' добових медікаментів спожито' tip1,
--       'Спожито таблеток' label
*
from REHAB_PRESCRIPTIONS_DETAILS d, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date('20260902','yyyymmdd') tr,
     REHAB_PRESCRIPTIONS p,
     REHAB_DRUG_USES du
where d.PRD_PRATR_ID = tr.PRATR_ID and tr.PRATR_PR_ID = p.PR_ID
  and PR_PAT_ID = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and du.DRU_PR_ID(+) = p.PR_ID and du.DRU_CPTR_ID(+) = d.PRD_CPTR_ID
  and du.DRU_PAT_ID(+) = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and trunc(DRU_CONSUMED(+)) = to_date('20260902','yyyymmdd') --REHAB_CONTEXT_PKG.getGLOBAL_DATE()
  ;
select 
*
from --REHAB_PRESCRIPTIONS_DETAILS d, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date('20260902','yyyymmdd') tr,
     REHAB_PRESCRIPTIONS p,
     REHAB_DRUG_USES du
where 
--      d.PRD_PRATR_ID = tr.PRATR_ID and 
  tr.PRATR_PR_ID = p.PR_ID
  and 
  p.PR_PAT_ID = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and 
   du.DRU_PR_ID = p.PR_ID 
--  and du.DRU_CPTR_ID(+) = d.PRD_CPTR_ID
  and 
  du.DRU_PAT_ID(+) = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and trunc(du.DRU_CONSUMED(+)) = to_date('20260902','yyyymmdd') --REHAB_CONTEXT_PKG.getGLOBAL_DATE()
  ;
select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES  order by 4;
as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date('20260902','yyyymmdd');  
        select DRU_ID, null /*PRD_ID*/,     u.pr_id,     PAT_ID,                  
               --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') 
               (select CPTR_ID from 
               (select CPTR_ID --||' (1) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR 
                       CPTR_ID from REHAB_CONSUME_TIME_RANGES 
                 where CPTR_CP_ID=PRATR_CP_ID 
                   and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') between to_date(CPTR_START_TIME_STR,'HH24:MI') and to_date(CPTR_END_TIME_STR,'HH24:MI')
                union all
                select CPTR_ID from (
                select CPTR_ID--||' (2) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID 
                  from REHAB_CONSUME_TIME_RANGES 
                 where CPTR_CP_ID=PRATR_CP_ID 
                   and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') < to_date(CPTR_END_TIME_STR,'HH24:MI')
                order by to_date(CPTR_START_TIME_STR,'HH24:MI')
                )
                union all
                select CPTR_ID from (
                select CPTR_ID--||' (3) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID 
                  from REHAB_CONSUME_TIME_RANGES 
                 where CPTR_CP_ID=PRATR_CP_ID 
                   and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') > to_date(CPTR_END_TIME_STR,'HH24:MI')
                order by to_date(CPTR_START_TIME_STR,'HH24:MI')
                )        
                ) where rownum=1) DRU_CPTR_ID,
               null/*PRD_DR_ID*/, PR_WS_ID, CONSUMED,     ACTUAL_DOSAGE--,
               --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') cc, PRATR_CP_ID
        from reabilitation.DRUG_USE u, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES r, --REHAB_PRESCRIPTIONS_DETAILS d, 
             REHAB_PRESCRIPTIONS p
        where u.PR_ID=r.PRATR_PR_ID --and r.pratr_id=d.PRD_PRATR_ID 
          and p.PR_ID = u.PR_ID
        order by consumed
        desc;