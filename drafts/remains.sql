select /*insert*/ * from REHAB_CONFIGS order by 3,1;

select
  stor.PAT_ID, stor.DR_ID,
  DA_STORED_AMOUNT, DRU_CONSUMED,
  DA_STORED_AMOUNT - DRU_CONSUMED BALANCE, 
  days_planned,PRD_DOSAGE_PLANNED,
  daily_dose, round((DA_STORED_AMOUNT - DRU_CONSUMED)/daily_dose,1) days_remain,
  DR_NAME,to_date(:DT,'YYYYMMDD') dt
from
    (select P2S_PAT_ID PAT_ID, DA_DR_ID DR_ID,sum(DA_QUANTITY*DA_ENTIRY_WEIGHT) DA_STORED_AMOUNT, min(DA_CHECK_POINT_DT) DA_CHECK_POINT_DT 
       from REHAB_DRUG_ACCOUNTINGS A, REHAB_PATIENT2STORAGES P2S 
      where A.DA_DS_ID = P2S.P2S_DS_ID and P2S.P2S_IS_OWNER
        and DA_CHECK_POINT_DT <= to_date(:DT,'YYYYMMDD')
      group by P2S_PAT_ID, DA_DR_ID) stor,
    lateral
    (select DRU_PAT_ID PAT_ID, DRU_DR_ID DR_ID, sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT) DRU_CONSUMED 
       from REHAB_DRUG_USES c 
      where stor.PAT_ID=c.DRU_PAT_ID and stor.DR_ID=c.DRU_DR_ID
        and DRU_CONSUMED <= to_date(:DT,'YYYYMMDD')
      group by DRU_PAT_ID, DRU_DR_ID) cons,
     (select PR_PAT_ID PAT_ID, PR_DR_ID DR_ID, sum(days_planned) days_planned,
               sum(PRD_DOSAGE * days_planned ) PRD_DOSAGE_PLANNED,
               sum(PRD_DOSAGE) daily_dose
        from (select * from REHAB_PRESCRIPTIONS 
               where PR_PLANNED_START <=to_date(:DT,'YYYYMMDD') and nvl(PR_PLANNED_END,to_date(:DT,'YYYYMMDD'))>=to_date(:DT,'YYYYMMDD')
                  or PR_PLANNED_START >to_date(:DT,'YYYYMMDD'))
                --as of period for REHAB_PRESCRIPTIONS_PLANNED_period to_date(:DT,'YYYYMMDD') 
                PR,
             (select A.*,
                     case when PRATR_ACTUAL_END is null then 30 
                          else case when PRATR_ACTUAL_START <= to_date(:DT,'YYYYMMDD') then (PRATR_ACTUAL_END+0) - to_date(:DT,'YYYYMMDD') + 1
                                    else (PRATR_ACTUAL_END+0) - (PRATR_ACTUAL_START+0) + 1
                               end
                     end days_planned
                from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES A
               where PRATR_ACTUAL_START <= to_date(:DT,'YYYYMMDD') and nvl(PRATR_ACTUAL_END,to_date(:DT,'YYYYMMDD')) >= to_date(:DT,'YYYYMMDD')
                  or PRATR_ACTUAL_START > to_date(:DT,'YYYYMMDD'))
                --as of  period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date(:DT,'YYYYMMDD') 
                PRATR,
             REHAB_PRESCRIPTIONS_DETAILS PRD
        where PR.PR_ID=PRATR_PR_ID and PRATR.PRATR_ID=PRD.PRD_PRATR_ID
        group by PR_PAT_ID, PR_DR_ID) planned,
     REHAB_DRUGS d
where stor.PAT_ID=cons.PAT_ID and stor.DR_ID=cons.DR_ID and stor.DR_ID=d.DR_ID
  and stor.PAT_ID=planned.PAT_ID and stor.DR_ID=planned.DR_ID
order by 1,2;

select PR_PAT_ID PAT_ID, PR_DR_ID DR_ID, sum(days_ahead) days_ahead,
       sum(PRD_DOSAGE * days_ahead ) PRD_DOSAGE_PLANNED, DR_NAME
from (select * from REHAB_PRESCRIPTIONS 
       where PR_PLANNED_START <=to_date('20260919','YYYYMMDD') and nvl(PR_PLANNED_END,to_date('20260919','YYYYMMDD'))>=to_date('20260919','YYYYMMDD')
          or PR_PLANNED_START >to_date('20260919','YYYYMMDD'))
        --as of period for REHAB_PRESCRIPTIONS_PLANNED_period to_date('20260919','YYYYMMDD') 
        PR,
     (select A.*,
             case when PRATR_ACTUAL_END is null then 30 
                  else case when PRATR_ACTUAL_START <= to_date('20260919','YYYYMMDD') then (PRATR_ACTUAL_END+0) - to_date('20260919','YYYYMMDD') + 1
                            else (PRATR_ACTUAL_END+0) - (PRATR_ACTUAL_START+0) + 1
                       end
             end days_planned
        from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES A
       where PRATR_ACTUAL_START <= to_date('20260919','YYYYMMDD') and nvl(PRATR_ACTUAL_END,to_date('20260919','YYYYMMDD')) >= to_date('20260919','YYYYMMDD')
          or PRATR_ACTUAL_START > to_date('20260919','YYYYMMDD'))
        --as of  period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period to_date('20260919','YYYYMMDD') 
        PRATR,
     REHAB_PRESCRIPTIONS_DETAILS PRD,
     REHAB_DRUGS d
where PR.PR_ID=PRATR_PR_ID and PRATR.PRATR_ID=PRD.PRD_PRATR_ID and PRD.PRD_DR_ID=d.DR_ID
group by PR_PAT_ID, PR_DR_ID, DR_NAME;

select * from REHAB_PRESCRIPTIONS order by 1;
select * from REHAB_PRESCRIPTIONS 
       where PR_PLANNED_START <=to_date('20260919','YYYYMMDD') and nvl(PR_PLANNED_END,to_date('20260919','YYYYMMDD'))>=to_date('20260919','YYYYMMDD')
          or PR_PLANNED_START >to_date('20260919','YYYYMMDD') order by 1;
select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES  order by 2;
select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES 
       where PRATR_ACTUAL_START <=to_date('20260919','YYYYMMDD') and nvl(PRATR_ACTUAL_END,to_date('20260919','YYYYMMDD'))>=to_date('20260919','YYYYMMDD')
          or PRATR_ACTUAL_START >to_date('20260919','YYYYMMDD') order by 2;
select * from reabilitation.prescription order by 1;

begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/

SELECT
    ds_id,
    ds_te_id,
    ds_name,
    ds_description,
    ds_created,
    ds_updated,
    P2S_IS_OWNER
FROM
    REHAB_DRUG_STORAGES, REHAB_PATIENT2STORAGES
where P2S_DS_ID = ds_id and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ;

select * 
  from 
       V$REHAB_REMAINS;
       
select DA_TOTAL_AMOUNT_IN, PR_ID, PR_PRR_ID, PRATR_ID, PR_WS_ID, PR_DR_ID, PRD_DR_ID, PR_PLANNED_START, PR_PLANNED_END, PRATR_ACTUAL_START, PRATR_ACTUAL_END, PRATR_ACTUAL_END - PRATR_ACTUAL_START dur, sum(PRD_DOSAGE) daily_dosage
from REHAB_NOTIFICATION_PARS, REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS,
     (select DA_PR_ID, DA_PRR_ID, DA_PRATR_ID, sum(DA_QUANTITY * DA_ENTIRY_WEIGHT) DA_TOTAL_AMOUNT_IN from REHAB_DRUG_ACCOUNTINGS group by DA_PR_ID, DA_PRR_ID, DA_PRATR_ID) DA
where NP_ND_ID = 'LOWMEDNF' and NP_APP_USER = 'YURI' and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
  and NP_DR_PR_ID = PR_ID
  and PRATR_PR_ID = PR_ID
  and PRD_PRATR_ID = PRATR_ID
  and coalesce(PRATR_ACTUAL_END,PR_PLANNED_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE())>=REHAB_CONTEXT_PKG.getGLOBAL_DATE()
  and DA_PR_ID(+) = PR_ID and DA_PRR_ID(+) = PR_PRR_ID and DA_PRATR_ID(+) = PRATR_ID
group by PR_ID, PR_PRR_ID, PRATR_ID, PR_WS_ID, PR_DR_ID, PRD_DR_ID, PR_PLANNED_START, PR_PLANNED_END, PRATR_ACTUAL_END, PRATR_ACTUAL_START, DA_TOTAL_AMOUNT_IN
order by PRATR_ACTUAL_START;


select * from rehab_drug_acc2prr where 11011 = DA2PRR_PRATR_ID;
drop table REHAB_DRUG_ACC2PRR purge;
select * from REHAB_DRUG_ACC2PRR;
create table rehab_drug_acc2prr (
DA2PRR_DA_ID number,
DA2PRR_PRATR_ID number);
alter table rehab_drug_acc2prr add constraint PK_rehab_drug_acc2prr primary key (DA2PRR_DA_ID, DA2PRR_PRATR_ID);

insert into rehab_drug_acc2prr(DA2PRR_DA_ID, DA2PRR_PRATR_ID)
select DA_ID, DA_PRATR_ID from REHAB_DRUG_ACCOUNTINGS where DA_PRATR_ID is not null;
insert into rehab_drug_acc2prr(DA2PRR_DA_ID, DA2PRR_PRATR_ID) values(261,11011);
insert into rehab_drug_acc2prr(DA2PRR_DA_ID, DA2PRR_PRATR_ID) values(302,11122);
insert into rehab_drug_acc2prr(DA2PRR_DA_ID, DA2PRR_PRATR_ID) values(302,11123);
delete from rehab_drug_acc2prr where DA2PRR_PRATR_ID in (11122, 11123);

--------------------------------------------------------------------------------
drop table rehab_drug_reservation;
drop sequence sq_rehab_drug_reservation;
create table rehab_drug_reservation (
DARES_ID number,
DARES_DA_ID number,
DARES_PRR_ID number,
DARES_PR_ID number,
DARES_PRATR_ID number,
DARES_PRD_ID number,
DARES_RESERVED_AMOUNT number,
DARES_RESERVATION_TS timestamp with time zone);

alter table rehab_drug_reservation add constraint PK_rehab_drug_reservation primary key (DARES_ID);

ALTER TABLE rehab_drug_reservation ADD CONSTRAINT UK_rehab_drug_reservation UNIQUE (DARES_DA_ID, DARES_PRD_ID) USING INDEX;
CREATE INDEX IDX_rehab_drug_reservation_pratr ON rehab_drug_reservation (DARES_PRD_ID);

ALTER TABLE rehab_drug_reservation ADD CONSTRAINT FK_REHAB_drug_reservation_PRR FOREIGN KEY (DARES_PRR_ID)
	  REFERENCES REHAB_PRESCRIPTORS (PRR_ID) ENABLE;
      
ALTER TABLE rehab_drug_reservation ADD CONSTRAINT FK_REHAB_drug_reservation_PR FOREIGN KEY (DARES_PR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS (PR_ID) ENABLE;

ALTER TABLE rehab_drug_reservation ADD CONSTRAINT FK_REHAB_drug_reservation_PRATR FOREIGN KEY (DARES_PRATR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (PRATR_ID) ENABLE;

ALTER TABLE rehab_drug_reservation ADD CONSTRAINT FK_REHAB_drug_reservation_PRD FOREIGN KEY (DARES_PRD_ID)
	  REFERENCES REHAB_PRESCRIPTIONS_DETAILS (PRD_ID) ENABLE;
      
create sequence sq_rehab_drug_reservation;
--------------------------------------------------------------------------------
insert into rehab_drug_reservation 
      (dares_id, 
       DARES_DA_ID, DARES_PRR_ID, DARES_PR_ID, DARES_PRATR_ID, DARES_PRD_ID, DARES_RESERVED_AMOUNT, DARES_RESERVATION_TS)
select sq_rehab_drug_reservation.nextval,
       DA_ID,             PRR_ID,       PR_ID,       PRATR_ID,       PRD_ID, DA_AMOUNT, DA_CHECK_POINT_DT
from (select
       DA_ID, PR_PRR_ID PRR_ID, DR_ID, PRD_ID, PRATR_PR_ID PR_ID, PRATR_ID, DR_NAME, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_QUANTITY*DA_ENTIRY_WEIGHT DA_AMOUNT,DA_CHECK_POINT_DT,
       PRATR_ACTUAL_START, PRATR_ACTUAL_END, PRD_DOSAGE, DA_QUANTITY*DA_ENTIRY_WEIGHT/PRD_DOSAGE days_covered
from rehab_drug_acc2prr, REHAB_DRUG_ACCOUNTINGS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_DRUGS, REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTIONS_DETAILS
     --lateral(select sum(PRD_DOSAGE) PRD_DOSAGE from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID)
where DA2PRR_DA_ID = DA_ID and DA2PRR_PRATR_ID = PRATR_ID and DA_DR_ID = DR_ID and PRATR_PR_ID = PR_ID and PRD_PRATR_ID = PRATR_ID);
order by 2,1;
--------------------------------------------------------------------------------
select r.*,
       PRATR_ACTUAL_END,
       x.*,
       sum(DARES_RESERVED_AMOUNT) over(partition by DARES_PR_ID) RESERVED_AMOUNT_TOT
       --case when DRU_CONSUMED
from rehab_drug_reservation r, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES,
lateral(select sum(DRU_ACTUAL_DOSAGE) DRU_ACTUAL_DOSAGE, min(DR_NAME) DR_NAME,  max(DRU_CONSUMED) DRU_CONSUMED from REHAB_DRUG_USES, REHAB_DRUGS where DRU_PR_ID = DARES_PR_ID and DRU_DR_ID = DR_ID) x
where DARES_PRATR_ID = PRATR_ID
order by 3,2, PRATR_ACTUAL_END
;
select *
from rehab_drug_reservation, REHAB_DRUG_ACCOUNTINGS where DARES_DA_ID = DA_ID;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_REMAINS
  AS 
  select
          stor.PAT_ID, stor.DR_ID,
          DA_STORED_AMOUNT, DRU_CONSUMED,DRU_CONSUMED_BEFORE,DRU_CONSUMED_TODAY,
          DA_STORED_AMOUNT - DRU_CONSUMED BALANCE, 
          days_planned,PRD_DOSAGE_PLANNED,
          daily_dose, 
          (DA_STORED_AMOUNT - DRU_CONSUMED)/daily_dose days_remain,
          (DA_STORED_AMOUNT - DRU_CONSUMED_BEFORE - daily_dose)/daily_dose days_remain_from_tomorrow,
          DR_NAME,WS_ID,WS_NAME,
          PRATR_ACTUAL_END, PR_PLANNED_START,PR_PLANNED_END,
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
              group by DRU_PAT_ID, DRU_DR_ID)(+) cons,
             (select PR_PAT_ID PAT_ID, nvl(PR_DR_ID,PRD_DR_ID) DR_ID, max(days_planned) days_planned,
                     sum(PRD_DOSAGE * days_planned ) PRD_DOSAGE_PLANNED,
                     sum(PRD_DOSAGE) daily_dose,
                     max(PRATR_ACTUAL_END) PRATR_ACTUAL_END,
                     max(PR_PLANNED_END) PR_PLANNED_END,
                     min(PR_PLANNED_START) PR_PLANNED_START
                from (select * from REHAB_PRESCRIPTIONS 
                       where (PR_PLANNED_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PR_PLANNED_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE())>=REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                          or PR_PLANNED_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE())
                         and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()) PR,
                     (select A.*,
                             case when PRATR_ACTUAL_END is null then null 
                                  else case when PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and PRATR_ACTUAL_END >= REHAB_CONTEXT_PKG.getGLOBAL_DATE() 
                                            then (PRATR_ACTUAL_END+0) - REHAB_CONTEXT_PKG.getGLOBAL_DATE()--+ 1
                                            else (PRATR_ACTUAL_END+0) - (PRATR_ACTUAL_START+0)--+ 1
                                       end
                             end days_planned
                        from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES A
                       where PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PRATR_ACTUAL_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE()) >= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                          or PRATR_ACTUAL_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                          )
                        PRATR,
                     REHAB_PRESCRIPTIONS_DETAILS PRD
                where PR.PR_ID=PRATR_PR_ID and PRATR.PRATR_ID=PRD.PRD_PRATR_ID
                group by PR_PAT_ID, nvl(PR_DR_ID,PRD_DR_ID)) planned,
             REHAB_DRUGS d, REHAB_WORKING_SUBSTANCE w
        where stor.PAT_ID=cons.PAT_ID(+) and stor.DR_ID=cons.DR_ID(+) and stor.DR_ID=d.DR_ID
          and stor.PAT_ID=planned.PAT_ID and stor.DR_ID=planned.DR_ID and d.DR_WS_ID = w.WS_ID(+);
select * from V$REHAB_REMAINS;
begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/

create or replace view v$rb_accessible_storages as
  select ds_id, DS_NAME, DS_DESCRIPTION
    from REHAB_DRUG_STORAGES, REHAB_PATIENT2STORAGES
    where P2S_DS_ID = DS_ID and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and DS_TE_ID = REHAB_CONTEXT_PKG.getTENANT()
;
create or replace view v$rb_accessible_meds as
  select da_id, DA_DS_ID, DA_DR_ID, /*DA_PRR_ID, DA_PR_ID, DA_PRATR_ID,*/ DA_WS_ID, DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, DA_CHECK_POINT_DT, DA_BEST_BEFORE
    from REHAB_DRUG_ACCOUNTINGS
   where DA_DS_ID in (select ds_id from v$rb_accessible_storages)
     and DA_CHECK_POINT_DT <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
;
create or replace view v$rb_accessible_meds_totals as
  select DA_DR_ID, DA_WS_ID, sum(DA_QUANTITY*DA_ENTIRY_WEIGHT) remained_amount
    from v$rb_accessible_meds
   group by DA_DR_ID, DA_WS_ID
;
alter table REHAB_DRUG_USES add dru_PRATR_ID number;
update REHAB_DRUG_USES set dru_PRATR_ID = (select PRD_PRATR_ID from REHAB_PRESCRIPTIONS_DETAILS where DRU_PRD_ID = PRD_ID);
create or replace view v$rb_consumed_meds as
  select REHAB_DRUG_USES.*, min_DA_CHECK_POINT_DT consumed_since_dt
    from REHAB_DRUG_USES, lateral(select min(DA_CHECK_POINT_DT) min_DA_CHECK_POINT_DT from v$rb_accessible_meds where DA_DR_ID = DRU_DR_ID)
   where DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
     and DRU_CONSUMED <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
     --and DRU_CONSUMED >= min_DA_CHECK_POINT_DT
;
create or replace view v$rb_consumed_totals as 
  select DRU_DR_ID, DRU_WS_ID,-- DRU_PR_ID, DRU_PRATR_ID,
          max(DRU_CONSUMED) FILTER (WHERE DRU_CONSUMED >= consumed_since_dt) MAX_DRU_CONSUMED_DATE,
          min(consumed_since_dt) consumed_since_dt,
          sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED >= consumed_since_dt) DRU_CONSUMED_AMOUNT,
          sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED >= consumed_since_dt and DRU_CONSUMED < trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())) DRU_CONSUMED_BEFORE,
          sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED >= consumed_since_dt and trunc(DRU_CONSUMED) = trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())) DRU_CONSUMED_TODAY
     from v$rb_consumed_meds c 
    group by DRU_DR_ID, DRU_WS_ID--, DRU_PR_ID, DRU_PRATR_ID
;
select * from v$rb_consumed_totals where DRU_DR_ID = 44;
create or replace view v$rb_balance as
with a as (select /* materialize */ * from v$rb_accessible_meds_totals)
  select /*+ leading(a) use_hash(c)*/ c.*, a.*, remained_amount - nvl(DRU_CONSUMED_AMOUNT,0) balance_total, remained_amount - nvl(DRU_CONSUMED_BEFORE,0) balance_before_today
    from  a, v$rb_consumed_totals c
   where a.DA_DR_ID = c.DRU_DR_ID(+)
;
select * from v$rb_balance where DA_DR_ID = 44;
create or replace view v$rb_plans as
  select PR_ID, PR_PRR_ID, PR_WS_ID, PR_DR_ID, PRD_DR_ID, PRATR_ID, PR_PLANNED_START, PR_PLANNED_END, PRATR_ACTUAL_START, PRATR_ACTUAL_END, sum(PRD_DOSAGE) Daily_DOSAGE
    from REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS
   where PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID
     and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
     and (PR_PLANNED_END is null or trunc(PR_PLANNED_END) >= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TRUNC())
     and (PRATR_ACTUAL_END is null or trunc(PRATR_ACTUAL_END) >= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TRUNC())
   group by PR_ID, PR_PRR_ID, PR_WS_ID, PR_DR_ID, PRD_DR_ID, PRATR_ID, PR_PLANNED_START, PR_PLANNED_END, PRATR_ACTUAL_START, PRATR_ACTUAL_END
;
create or replace view v$rb_plans_ext as
with plans_int as (
  select plans.*,
         REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ()+NUMTODSINTERVAL(1, 'SECOND') tomorrow_date_tstz,
          case when REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ()+NUMTODSINTERVAL(1, 'SECOND') between PRATR_ACTUAL_START and PRATR_ACTUAL_END then REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ()+NUMTODSINTERVAL(1, 'SECOND') 
               when REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ()+NUMTODSINTERVAL(1, 'SECOND') < PRATR_ACTUAL_START then PRATR_ACTUAL_START else null end start_date_tstz   
    from v$rb_plans plans
)
select *, 
  EXTRACT(DAY FROM (PRATR_ACTUAL_END - start_date_tstz))+1 days_from_start_date_to_end,
  (EXTRACT(DAY FROM (PRATR_ACTUAL_END - start_date_tstz))+1) * Daily_DOSAGE planned_amount_from_tomorrow 
from plans_int 
;
--select * from consumed_meds where dru_dr_id=261 order by DRU_CONSUMED desc;
--select c.* from consumed_totals c order by PAT_ID, DR_ID, PR_ID
--select * from balance order by DRU_DR_ID


select                 PRD_ID, d.DR_NAME, PRD_DOSAGE, CPTR_START_TIME_STR, CPTR_END_TIME_STR, DR_WHEN2CONSUME, PRD_NOTES, d.DRU_CONSUMED, DRU_ACTUAL_DOSAGE, DR_USE_CASE, DR_TYPE_SHORT, 
                       PR_NOTES, PRATR_NOTES, d.PR_PLANNED_END, d.PRATR_ACTUAL_END,
                       DRU_ID, d.PRD_DR_ID, d.PR_PRR_ID, d.PR_ID, d.PRATR_ID, PRD_CPTR_ID,  DR_ITEM_IMAGE1,
                       r.BALANCE, b.BALANCE_TOTAL BALANCE1,
                       r.DAYS_PLANNED, DAYS_FROM_START_DATE_TO_END DAYS_PLANNED1, 
                       r.DAYS_REMAIN, 
                       r.DA_STORED_AMOUNT, b.REMAINED_AMOUNT DA_STORED_AMOUNT1, 
                       r.end_date
                from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS tp, V$REHAB_REMAINS r, v$rb_plans_ext pe, 
                     (select DA_DR_ID, sum(DRU_CONSUMED_AMOUNT) DRU_CONSUMED_AMOUNT, sum(BALANCE_TOTAL) BALANCE_TOTAL, max(REMAINED_AMOUNT) REMAINED_AMOUNT from V$RB_BALANCE group by DA_DR_ID) b
               where tp.TP_ID = 2 --p_tp_id 
                 and pe.PR_PRR_ID = d.PR_PRR_ID and pe.PR_ID = d.PR_ID and pe.PRATR_ID = d.PRATR_ID and pe.PRD_DR_ID = d.PRD_DR_ID
                 and d.PRD_DR_ID = b.DA_DR_ID(+)
                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or 
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
                 and d.PRD_DR_ID = r.DR_ID(+);

--explain plan for



begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/

select /*+ gather_plan_statistics qb_name(q6) noparallel*/ * from v$rb_balance order by 1,4;
select * from v$rb_plans_ext order by PR_WS_ID, PR_DR_ID, PRD_DR_ID;
        select REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ() a,
               BALANCE_BEFORE_TODAY - DAILY_DOSAGE*future_consumed balance_from_tomorrow,
               (BALANCE_BEFORE_TODAY - DAILY_DOSAGE*future_consumed)/DAILY_DOSAGE days_remain_from_tomorrow,
               *
        from (
                select DR_NAME, DR_TYPE_SHORT, PR_WS_ID, BALANCE_BEFORE_TODAY, DRU_CONSUMED_TODAY, DAILY_DOSAGE, PLANNED_AMOUNT_FROM_TOMORROW, 
                       DAYS_FROM_START_DATE_TO_END, MAX_DRU_CONSUMED_DATE, PRATR_ACTUAL_START, PRATR_ACTUAL_END, PR_PLANNED_END,
                       EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(MAX_DRU_CONSUMED_DATE))) days_since,
                       case when EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(MAX_DRU_CONSUMED_DATE))) > 1 then EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(MAX_DRU_CONSUMED_DATE))) else 0 end future_consumed
                  from v$rb_balance b, V$RB_PLANS_EXT p, REHAB_DRUGS d
                where b.da_dr_id = prd_dr_id and prd_dr_id = d.dr_id
                  and (PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and (PRATR_ACTUAL_END is null or PRATR_ACTUAL_END >= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ())
                       or
                       PRATR_ACTUAL_START between REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')), 'DAY')
                      )
        ) order by PR_WS_ID nulls first, DR_NAME, PRATR_ACTUAL_START;
set serveroutput on
declare
  l_remain number;
  l_days number;
  l_amount number;
  l_daily_doze number;
  l_days_remain number;
  l_end_date timestamp with time zone;
  --l_max_date timestamp with time zone := REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ() + NUMTODSINTERVAL(1, 'YEAR');
begin
    for b in (select *
                     --case when EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(MAX_DRU_CONSUMED_DATE))) > 1 then EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(MAX_DRU_CONSUMED_DATE))) else 0 end future_consumed
                from V$RB_BALANCE b, REHAB_DRUGS d where b.DA_DR_ID = d.DR_ID order by DA_WS_ID nulls first, DA_DR_ID)
    loop
      l_remain := b.BALANCE_BEFORE_TODAY; -- b.DAILY_DOSAGE*(case when EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(b.MAX_DRU_CONSUMED_DATE))) > 1 then EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC()- trunc(b.MAX_DRU_CONSUMED_DATE))) else 0 end);
      l_end_date := null; l_days_remain := null;
      
      dbms_output.put_line(b.DR_NAME||': l_remain(init): '||l_remain||'; DA_DR_ID: '||b.DA_DR_ID||'; MAX_DRU_CONSUMED_DATE: '||to_char(b.MAX_DRU_CONSUMED_DATE,'YYYY-MM-DD HH24:MI TZH')||'; CONSUMED_SINCE_DT: '||to_char(b.CONSUMED_SINCE_DT,'YYYY-MM-DD HH24:MI TZH'));

      for p in (select *,
                       row_number() over(partition by PRD_DR_ID order by PRATR_ACTUAL_START desc) rn
                  from V$REHAB_CONSUME_PLANS_ALL where PRD_DR_ID = b.DA_DR_ID order by PRATR_ACTUAL_START)
      loop
          rehub_get_planned_consumption(p.PRATR_ID, p.PRD_DR_ID, b.MAX_DRU_CONSUMED_DATE, b.CONSUMED_SINCE_DT, to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')),l_days, l_amount, l_daily_doze);
          l_remain := l_remain - l_amount;
          if l_remain < 0 and l_end_date is null then
            if p.PRATR_ACTUAL_END > REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')), 'DAY')
            then
                l_days_remain := to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')) - abs(l_remain/l_daily_doze);
                --l_end_date := REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + (NUMTODSINTERVAL(to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')), 'DAY') - NUMTODSINTERVAL(abs(l_remain/l_daily_doze), 'DAY'));
                l_end_date := REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(l_days_remain, 'DAY');
            else
                l_end_date := nvl(p.PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')), 'DAY')) - NUMTODSINTERVAL(abs(l_remain/l_daily_doze), 'DAY');
                l_days_remain := EXTRACT(DAY FROM ( l_end_date - REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() ));
            end if;
          end if;
          dbms_output.put_line(p.rn||') l_remain: '||l_remain||'; l_amount: '||l_amount||'; l_days: '||l_days||'; l_daily_doze: '||l_daily_doze||'; PRATR_ACTUAL_START: '||to_char(p.PRATR_ACTUAL_START,'YYYY-MM-DD HH24:MI TZH')||'; PRATR_ACTUAL_END: '||to_char(p.PRATR_ACTUAL_END,'YYYY-MM-DD HH24:MI TZH')||'; l_end_date: '||to_char(l_end_date,'YYYY-MM-DD HH24:MI TZH')||'; l_days_remain: '||l_days_remain);
      end loop;
    end loop;
end;
/

create or replace procedure rehub_get_planned_consumption(P_PRATR_ID REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%TYPE,
                                                         P_PRD_DR_ID REHAB_PRESCRIPTIONS_DETAILS.PRD_DR_ID%TYPE,
                                                         P_MAX_DRU_CONSUMED_DATE timestamp with time zone,
                                                         P_CONSUMED_SINCE_DT timestamp with time zone,
                                                         P_DAYS_AHEAD number,
                                                         p_days out number,
                                                         p_amount out number,
                                                         p_daily_doze out number)
is
  l_alert_ts timestamp with time zone;
  L_MAX_DRU_CONSUMED_DATE timestamp with time zone;
begin
  p_days := 0;
  p_amount := 0;
  p_daily_doze := 0;
  
  l_alert_ts := REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(P_DAYS_AHEAD, 'DAY');

  --dbms_output.put_line('P_PRATR_ID: '||P_PRATR_ID||'; P_PRD_DR_ID: '||P_PRD_DR_ID||'; l_alert_ts: '||to_char(l_alert_ts,'YYYY-MM-DD HH24:MI TZH'));
  for i in (select PRD_DR_ID, sum(PRD_DOSAGE) PRD_DOSAGE, PRATR_ACTUAL_START, nvl(PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_MAX_DATE_TSTZ) PRATR_ACTUAL_END
              from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS
             where PRD_PRATR_ID = PRATR_ID and PRATR_ID = P_PRATR_ID and PRD_DR_ID = P_PRD_DR_ID
             group by PRD_DR_ID, PRATR_ACTUAL_START, nvl(PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_MAX_DATE_TSTZ))
  loop
    if P_MAX_DRU_CONSUMED_DATE is null then
      L_MAX_DRU_CONSUMED_DATE := greatest(P_CONSUMED_SINCE_DT,i.PRATR_ACTUAL_START);
    else
      L_MAX_DRU_CONSUMED_DATE := P_MAX_DRU_CONSUMED_DATE;
    end if;  
    if not(l_alert_ts < i.PRATR_ACTUAL_START or L_MAX_DRU_CONSUMED_DATE > i.PRATR_ACTUAL_END) 
       and L_MAX_DRU_CONSUMED_DATE < l_alert_ts
       and L_MAX_DRU_CONSUMED_DATE < i.PRATR_ACTUAL_END
    then
      p_days := EXTRACT(DAY FROM (least(i.PRATR_ACTUAL_END, l_alert_ts) - greatest(i.PRATR_ACTUAL_START,L_MAX_DRU_CONSUMED_DATE)));
      p_amount := p_amount + p_days * i.PRD_DOSAGE;
      p_daily_doze := i.PRD_DOSAGE;
      --dbms_output.put_line('l_days: '||l_days||'; l_amount: '||l_amount);
    end if;
  end loop;
end;
/
select rehub_get_planned_consumption(PRATR_ID,28,systimestAMP,100) a,REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(100, 'DAY') b, * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;
select REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ() +  + NUMTOYMINTERVAL(1, 'YEAR');
@geteplan
drop table rehab_rb_balance_cache;
drop view rehab_v$rb_balance_cache;
create table rehab_rb_balance_cache as
select REHAB_CONTEXT_PKG.getTENANT() tenant, REHAB_CONTEXT_PKG.getPATIENT() patient, REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ() global_date_ts, systimestamp created_ts, x.* from v$rb_balance x;

create index ix_rehab_rb_balance_cache_cntx on rehab_rb_balance_cache(tenant, patient, global_date_ts);
create or replace view rehab_v$rb_balance_cache as
select * from rehab_rb_balance_cache
where tenant = REHAB_CONTEXT_PKG.getTENANT() and patient = REHAB_CONTEXT_PKG.getPATIENT() and global_date_ts = REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ();
select * from rehab_v$rb_balance_cache;