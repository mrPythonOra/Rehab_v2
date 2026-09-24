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