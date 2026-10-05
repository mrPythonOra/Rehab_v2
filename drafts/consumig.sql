create or replace TYPE rehab_druguse_dashboard_rec AS OBJECT (
    id           number,
    mainlabel    VARCHAR2(4000),
    sublabel     varchar2(4000),
    data1        VARCHAR2(4000),
    data2        VARCHAR2(4000),
    bagecol      VARCHAR2(4000),
    bagelabel    VARCHAR2(4000),
    app_page     number,
    dru_id       number,
    dr_id        number,
    pr_id        number,
    prd_id       number,
    cptr_id      number,
    drug_img     blob
);
/
create or replace TYPE rehab_druguse_dashboard_tab AS TABLE OF rehab_druguse_dashboard_rec;
/
create or replace TYPE rehab_dashboard_rec AS OBJECT (
    id           number,
    mainlabel    VARCHAR2(4000),
    sublabel     varchar2(4000),
    data1        VARCHAR2(4000),
    data2        VARCHAR2(4000),
    iconfile     VARCHAR2(4000),
    bagecol      VARCHAR2(4000),
    bagelabel    VARCHAR2(4000),    
    app_page     number
);
/
create or replace TYPE rehab_dashboard_tab AS TABLE OF rehab_dashboard_rec;
/

select da.*, dr.DR_ITEM_IMAGE1 from table(REHAB_DRUGUSE_PKG.druguse_dashboard_ref) da, REHAB_DRUGS dr where da.dr_id = dr.dr_id;

set serveroutput on
DECLARE
    v_checkbox VARCHAR2(10) := UNISTR('\D83D\DDF9');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Task Status: ' || v_checkbox || ' Completed');
END;
/
DECLARE
    v_cross_box VARCHAR2(10) := UNISTR('\D83D\DDF7');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Task Status: ' || v_cross_box || ' Cancelled');
END;
/
select * from V$REHAB_CONSUME_TIME_RANGES ;



CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_TIME_PERIODS
AS 
select  x.*,
        (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||TP_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_START_TIME_DT_CURR,
        (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||TP_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_END_TIME_DT_CURR,
        (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||TP_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_START_TIME_DT_GDT,
        (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||TP_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_END_TIME_DT_GDT    
from REHAB_TIME_PERIODS x;

CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_TIME_PERIODS_AVAILABLE
as
select * from V$REHAB_TIME_PERIODS
where TP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
union
select * from V$REHAB_TIME_PERIODS
where TP_TE_ID = REHAB_CONTEXT_PKG.getTENANT() and REHAB_CONTEXT_PKG.getPATIENT() is not null and TP_PAT_ID is null and not exists (select 1 from V$REHAB_TIME_PERIODS where TP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())
union
select * from V$REHAB_TIME_PERIODS
where TP_TE_ID is null and TP_PAT_ID is null and REHAB_CONTEXT_PKG.getTENANT() is not null and REHAB_CONTEXT_PKG.getPATIENT() is not null and not exists (select 1 from V$REHAB_TIME_PERIODS where TP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() or TP_TE_ID = REHAB_CONTEXT_PKG.getTENANT());

select TP_ID from V$REHAB_TIME_PERIODS_AVAILABLE where systimestamp between TP_START_TIME_DT_CURR and TP_END_TIME_DT_CURR;

CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_CONSUME_TIME_RANGES 
AS 
select  x.*,
        (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_START_TIME_DT_CURR,
        (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_END_TIME_DT_CURR,
        (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||CPTR_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_START_TIME_DT_GDT,
        (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||CPTR_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_END_TIME_DT_GDT    
from REHAB_CONSUME_TIME_RANGES x;

CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_CONSUME_TIME_RANGES_AVAILABLE 
AS 
select  x.*
from V$REHAB_CONSUME_TIME_RANGES x, 
     (select * from REHAB_CONSUME_PATTERNS where CP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
      union
      select * from REHAB_CONSUME_PATTERNS
      where CP_TE_ID = REHAB_CONTEXT_PKG.getTENANT() and REHAB_CONTEXT_PKG.getPATIENT() is not null and CP_PAT_ID is null 
        and not exists (select 1 from REHAB_CONSUME_PATTERNS where CP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())
      union
      select * from REHAB_CONSUME_PATTERNS
      where CP_TE_ID is null and CP_PAT_ID is null and REHAB_CONTEXT_PKG.getTENANT() is not null and REHAB_CONTEXT_PKG.getPATIENT() is not null 
        and not exists (select 1 from REHAB_CONSUME_PATTERNS where CP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() or CP_TE_ID = REHAB_CONTEXT_PKG.getTENANT())
    ) y
where x.CPTR_CP_ID = y.CP_ID;

create or replace view V$REHAB_CONSUME_DATA as
select *
from REHAB_PRESCRIPTIONS_DETAILS d, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period REHAB_CONTEXT_PKG.getGLOBAL_DATE() 
     tr,
     REHAB_PRESCRIPTIONS p,
     REHAB_DRUG_USES du,
     V$REHAB_CONSUME_TIME_RANGES CPTR,
     REHAB_CONSUME_PATTERNS CP,
     REHAB_DRUGS DR
where d.PRD_PRATR_ID = tr.PRATR_ID and tr.PRATR_PR_ID = p.PR_ID
  and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
  and du.DRU_PR_ID(+) = p.PR_ID and du.DRU_CPTR_ID(+) = d.PRD_CPTR_ID and DRU_PAT_ID(+) = REHAB_CONTEXT_PKG.getPATIENT()
  and trunc(DRU_CONSUMED(+)) = trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())
  and d.PRD_CPTR_ID = CPTR.CPTR_ID
  and CPTR.CPTR_CP_ID = CP.CP_ID
  and d.PRD_DR_ID = DR.DR_ID
;
select pa.* from V$REHAB_TIME_PERIODS_AVAILABLE pa
where exists (select 1 from V$REHAB_CONSUME_DATA d where 
                  CPTR_START_TIME_DT_GDT between TP_START_TIME_DT_GDT and TP_END_TIME_DT_GDT or 
                  CPTR_END_TIME_DT_GDT between TP_START_TIME_DT_GDT and TP_END_TIME_DT_GDT);
select *
from REHAB_PRESCRIPTIONS_DETAILS d, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date('20260929','yyyymmdd') 
     tr,
     REHAB_PRESCRIPTIONS p,
     REHAB_DRUG_USES du,
     REHAB_CONSUME_TIME_RANGES CPTR,
     REHAB_CONSUME_PATTERNS CP,
     REHAB_DRUGS DR
where d.PRD_PRATR_ID = tr.PRATR_ID and tr.PRATR_PR_ID = p.PR_ID
  and PR_PAT_ID = 5 -- REHAB_CONTEXT_PKG.getPATIENT()
  and du.DRU_PR_ID(+) = p.PR_ID and du.DRU_CPTR_ID(+) = d.PRD_CPTR_ID and DRU_PAT_ID(+) = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and trunc(DRU_CONSUMED(+)) = to_date('20260929','yyyymmdd')
  and d.PRD_CPTR_ID = CPTR.CPTR_ID
  and CPTR.CPTR_CP_ID = CP.CP_ID
  and d.PRD_DR_ID = DR.DR_ID
;

select 
--       count(*) max_value, 
--       count(DRU_CONSUMED) value,
--       count(DRU_CONSUMED) || ' з '|| count(*) ||' добових медікаментів спожито' tip1,
--       'Спожито таблеток' label
*
from REHAB_PRESCRIPTIONS_DETAILS d, 
     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date('20260929','yyyymmdd') tr,
     REHAB_PRESCRIPTIONS p,
     REHAB_DRUG_USES du
where d.PRD_PRATR_ID = tr.PRATR_ID and tr.PRATR_PR_ID = p.PR_ID
  and PR_PAT_ID = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and du.DRU_PR_ID(+) = p.PR_ID and du.DRU_CPTR_ID(+) = d.PRD_CPTR_ID
  and du.DRU_PAT_ID(+) = 5 --REHAB_CONTEXT_PKG.getPATIENT()
  and trunc(DRU_CONSUMED(+)) = to_date('20260902','yyyymmdd') --REHAB_CONTEXT_PKG.getGLOBAL_DATE()
  ;
  
select * from REHAB_CONSUME_TIME_RANGES where CPTR_CP_ID in (
select CP_ID from REHAB_CONSUME_PATTERNS
where CP_PAT_ID = 5
union all
select CP_ID from REHAB_CONSUME_PATTERNS
where CP_TE_ID = 1 and CP_PAT_ID is null and cp_id not in (select CP_PRNT_ID from REHAB_CONSUME_PATTERNS where CP_PAT_ID = 5)
union all
select CP_ID from REHAB_CONSUME_PATTERNS
where CP_TE_ID is null and CP_PAT_ID is null and cp_id not in (select CP_PRNT_ID from REHAB_CONSUME_PATTERNS where CP_PAT_ID = 5))
order by 4;

select * from REHAB_TIME_PERIODS
where TP_PAT_ID = 5
union all
select * from REHAB_TIME_PERIODS
where TP_TE_ID = 1 and TP_PAT_ID is null and not exists (select 1 from REHAB_TIME_PERIODS where TP_PAT_ID = 5)
union all
select * from REHAB_TIME_PERIODS
where TP_TE_ID is null and TP_PAT_ID is null and not exists (select 1 from REHAB_TIME_PERIODS where TP_PAT_ID = 5 or TP_TE_ID = 1);


select pa.* from V$REHAB_TIME_PERIODS_AVAILABLE pa
where exists (select 1 from V$REHAB_CONSUME_DATA d where 
                  CPTR_START_TIME_DT_GDT > TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT <= TP_END_TIME_DT_GDT or 
                  CPTR_END_TIME_DT_GDT   > TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   <= TP_END_TIME_DT_GDT);
select * from V$REHAB_CONSUME_DATA;
select * from V$REHAB_TIME_PERIODS tp where tp.TP_ID = 3 ;
select DR_NAME, TP_NAME, CPTR_START_TIME_DT_GDT, TP_START_TIME_DT_GDT, TP_END_TIME_DT_GDT, CPTR_END_TIME_DT_GDT, TP_START_TIME_DT_GDT, TP_END_TIME_DT_GDT 
from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS tp 
                where tp.TP_ID = 3 
                  and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or 
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT);
                      
DECLARE
  P_DRU_PRD_ID NUMBER;
  P_DRU_PR_ID NUMBER;
  P_DRU_PAT_ID NUMBER;
  P_DRU_CPTR_ID NUMBER;
  P_DRU_DR_ID NUMBER;
    
BEGIN
  P_DRU_PRD_ID := NULL;
  P_DRU_PR_ID := NULL;
  P_DRU_PAT_ID := NULL;
  P_DRU_CPTR_ID := NULL;
  P_DRU_DR_ID := NULL;

  REHAB_DRUGUSE_PKG.consume_drug_now (  P_DRU_PRD_ID => P_DRU_PRD_ID,
P_DRU_PR_ID => P_DRU_PR_ID,
P_DRU_PAT_ID => P_DRU_PAT_ID,
P_DRU_CPTR_ID => P_DRU_CPTR_ID,
P_DRU_DR_ID => P_DRU_DR_ID) ;  
END;
/

create or replace view V$REHAB_REMAINS
as
        select
          stor.PAT_ID, stor.DR_ID,
          DA_STORED_AMOUNT, DRU_CONSUMED,DRU_CONSUMED_BEFORE,DRU_CONSUMED_TODAY,
          DA_STORED_AMOUNT - DRU_CONSUMED BALANCE, 
          days_planned,PRD_DOSAGE_PLANNED,
          daily_dose, 
          (DA_STORED_AMOUNT - DRU_CONSUMED)/daily_dose days_remain,
          (DA_STORED_AMOUNT - DRU_CONSUMED_BEFORE - daily_dose)/daily_dose days_remain_from_tomorrow,
          DR_NAME,
          PRATR_ACTUAL_END, PR_PLANNED_END,
          trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()+(DA_STORED_AMOUNT - DRU_CONSUMED_BEFORE - daily_dose)/daily_dose) end_date
        from
            (select P2S_PAT_ID PAT_ID, DA_DR_ID DR_ID,sum(DA_QUANTITY*DA_ENTIRY_WEIGHT) DA_STORED_AMOUNT, min(DA_CHECK_POINT_DT) DA_CHECK_POINT_DT 
               from REHAB_DRUG_ACCOUNTINGS A, REHAB_PATIENT2STORAGES P2S 
              where A.DA_DS_ID = P2S.P2S_DS_ID and P2S.P2S_IS_OWNER
                and DA_CHECK_POINT_DT <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
              group by P2S_PAT_ID, DA_DR_ID) stor,
            lateral
            (select DRU_PAT_ID PAT_ID, DRU_DR_ID DR_ID,
                    sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT) DRU_CONSUMED,
                    sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT and DRU_CONSUMED < trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())) DRU_CONSUMED_BEFORE,
                    sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT and trunc(DRU_CONSUMED) = trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())) DRU_CONSUMED_TODAY
               from REHAB_DRUG_USES c 
              where stor.PAT_ID=c.DRU_PAT_ID and stor.DR_ID=c.DRU_DR_ID
                and DRU_CONSUMED <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                and DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
              group by DRU_PAT_ID, DRU_DR_ID) cons,
             (select PR_PAT_ID PAT_ID, PR_DR_ID DR_ID, sum(days_planned) days_planned,
                     sum(PRD_DOSAGE * days_planned ) PRD_DOSAGE_PLANNED,
                     sum(PRD_DOSAGE) daily_dose,
                     max(PRATR_ACTUAL_END) PRATR_ACTUAL_END,
                     max(PR_PLANNED_END) PR_PLANNED_END
                from (select * from REHAB_PRESCRIPTIONS 
                       where (PR_PLANNED_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PR_PLANNED_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE())>=REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                          or PR_PLANNED_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE())
                         and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()) PR,
                     (select A.*,
                             case when PRATR_ACTUAL_END is null then null 
                                  else case when PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and PRATR_ACTUAL_END > REHAB_CONTEXT_PKG.getGLOBAL_DATE() 
                                            then (PRATR_ACTUAL_END+0) - REHAB_CONTEXT_PKG.getGLOBAL_DATE() --+ 1
                                            else (PRATR_ACTUAL_END+0) - (PRATR_ACTUAL_START+0)--+ 1
                                       end
                             end days_planned
                        from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES A
                       where PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PRATR_ACTUAL_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE()) >= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                          or PRATR_ACTUAL_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE())
                        PRATR,
                     REHAB_PRESCRIPTIONS_DETAILS PRD
                where PR.PR_ID=PRATR_PR_ID and PRATR.PRATR_ID=PRD.PRD_PRATR_ID
                group by PR_PAT_ID, PR_DR_ID) planned,
             REHAB_DRUGS d
        where stor.PAT_ID=cons.PAT_ID and stor.DR_ID=cons.DR_ID and stor.DR_ID=d.DR_ID
          and stor.PAT_ID=planned.PAT_ID and stor.DR_ID=planned.DR_ID;

SELECT
    pat_id,
    dr_id,
    da_stored_amount,
    dru_consumed,DRU_CONSUMED_BEFORE,DRU_CONSUMED_TODAY,
    balance,
    round(days_planned) days_planned,
    round(prd_dosage_planned) prd_dosage_planned,
    daily_dose,
    days_remain,days_remain_from_tomorrow,
    dr_name,
    pratr_actual_end,
    pr_planned_end
FROM
    v$rehab_remains;
    
select REHAB_CONTEXT_PKG.getGLOBAL_DATE()+4;

begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
end;
/

SELECT
    pat_id,
    dr_id,
    da_stored_amount,
    dru_consumed,DRU_CONSUMED_BEFORE,--nvl(DRU_CONSUMED_TODAY,0)
    DRU_CONSUMED_TODAY,
    balance,
    round(days_planned) days_planned,
    round(prd_dosage_planned) prd_dosage_planned,
    daily_dose,
    days_remain,days_remain_from_tomorrow,
    dr_name,
    pratr_actual_end,
    pr_planned_end,
    trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()+days_remain_from_tomorrow) end_date,
REHAB_CONTEXT_PKG.getGLOBAL_DATE() GD
FROM
    v$rehab_remains;
    
    
select * from nls_session_parameters order by 1;

alter TABLE REHAB_DRUG_USES modify DRU_WS_ID number null; 
alter TABLE REHAB_TRAININGS add (real_distance number,
    real_step_length number,
    real_speed number);