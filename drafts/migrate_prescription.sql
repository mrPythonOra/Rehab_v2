select * from REHAB_PRESCRIPTIONS where pr_ws_id=2;
select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES where PRATR_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=2);
select * from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID in (select PRATR_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES where PRATR_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=2))
;
select * from REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES PRATR, REHAB_PRESCRIPTIONS_DETAILS PRD
where pr_ws_id=2 and PRATR_PR_ID = pr_id and PRD_PRATR_ID = PRATR_ID
order by 1;
--******************************************************************************
update REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES set PRATR_PR_ID = (select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81)
where PRATR_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81);

update REHAB_DRUG_ACCOUNTINGS set DA_PR_ID = (select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81)
where DA_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81);

update REHAB_DRUG_USES set DRU_PR_ID = (select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81)
where DRU_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81);

delete from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81 and pr_id<>(select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81);
update REHAB_PRESCRIPTIONS set PR_PLANNED_END = null, pr_dr_id=null where pr_ws_id=2 and pr_prr_id=81;
--******************************************************************************
select * from REHAB_DRUG_ACCOUNTINGS
where DA_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81);

select * from REHAB_PRESCRIPTIONS where pr_ws_id=2 and pr_prr_id=81 and pr_id<>(select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=2);


create unique index IDX_UQ_REHAB_PRESCRIPTIONS_PRR_WS_DR on REHAB_PRESCRIPTIONS(pr_prr_id,PR_WS_ID,PR_DR_ID); --decode(PR_DR_ID,null,PR_WS_ID,null),decode(PR_WS_ID,null,PR_DR_ID,null));
select pr_prr_id,decode(PR_DR_ID,null,PR_WS_ID,null),decode(PR_WS_ID,null,PR_DR_ID,null),PR_WS_ID,PR_DR_ID from REHAB_PRESCRIPTIONS
order by 1,2,3;


select * from REHAB_PRESCRIPTIONS pr--, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES PRATR, REHAB_PRESCRIPTIONS_DETAILS PRD
--where PRATR_PR_ID = pr_id and PRD_PRATR_ID = PRATR_ID
where pr_ws_id is not null
order by pr_prr_id, pr_ws_id, 1;

begin
    for i in (
        select pr_prr_id, pr_ws_id from REHAB_PRESCRIPTIONS
        where pr_ws_id is not null
        group by pr_prr_id, pr_ws_id
        --having count(1) > 1
        )
    loop
      REHAB_MIGRATE_PKG.fix_prescriptions (  P_PRR_ID => i.pr_prr_id,
                                             P_WS_ID => i.pr_ws_id) ;  
    end loop;
end;
/