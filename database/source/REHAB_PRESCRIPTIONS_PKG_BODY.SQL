

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_PRESCRIPTIONS_PKG" AS

    procedure delete_prescriptor(p_PRR_ID REHAB_PRESCRIPTORS.PRR_ID%type) AS
        l_cnt number;
    BEGIN
        select count(*) into l_cnt from REHAB_PRESCRIPTIONS where PR_PRR_ID = p_PRR_ID;
        if l_cnt > 0 then
            raise_application_error(-20101,'Зпочатку треба видалити призначені медикоменти.');
        end if;
        update REHAB_DRUG_ACCOUNTINGS set DA_PRR_ID = null where DA_PRR_ID =  p_PRR_ID;
        delete from REHAB_PRESCRIPTOR2DRUG_FLTS where PRRF_PRR_ID = p_PRR_ID;
    END delete_prescriptor;

    procedure validate_dr_ws(p_PR_DR_ID in out REHAB_PRESCRIPTIONS.PR_DR_ID%type
                            ,p_PR_WS_ID in out REHAB_PRESCRIPTIONS.PR_WS_ID%type)
    is
    begin
      if p_PR_DR_ID is not null then
        select DR_WS_ID into p_PR_WS_ID from REHAB_DRUGS where dr_id=p_PR_DR_ID;
      end if;
      if p_PR_WS_ID is not null then
        p_PR_DR_ID := null;
      end if;
    end;

    procedure insert_PRESCRIPTION (
         p_PR_ID in REHAB_PRESCRIPTIONS.PR_ID%type
        ,p_PR_DR_ID in out REHAB_PRESCRIPTIONS.PR_DR_ID%type
        ,p_PR_WS_ID in out REHAB_PRESCRIPTIONS.PR_WS_ID%type
        ,p_PR_PAT_ID in REHAB_PRESCRIPTIONS.PR_PAT_ID%type
        ,p_PR_PRR_ID in REHAB_PRESCRIPTIONS.PR_PRR_ID%type
        ,p_PR_NOTES in REHAB_PRESCRIPTIONS.PR_NOTES%type default null
        ,p_PR_PLANNED_START in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_START%type default null
        ,p_PR_PLANNED_END in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_END%type default null,
        ,p_ts_format varchar2
    ) is
    begin
        validate_dr_ws(p_PR_DR_ID,p_PR_WS_ID);
        insert into REHAB_PRESCRIPTIONS(
                 PR_ID
                ,PR_DR_ID
                ,PR_PAT_ID
                ,PR_PRR_ID
                ,PR_WS_ID
                ,PR_NOTES
                ,PR_PLANNED_START
                ,PR_PLANNED_END
            ) values (
                 p_PR_ID
                ,p_PR_DR_ID
                ,p_PR_PAT_ID
                ,p_PR_PRR_ID
                ,p_PR_WS_ID
                ,p_PR_NOTES
                ,to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_START,p_ts_format),'DD'),'YYYYMMDD')||' '||sessiontimezone,'YYYYMMDD TZR')
                ,decode(p_PR_PLANNED_END,null,null,to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_END,p_ts_format),'DD'),'YYYYMMDD')||'235959 '||sessiontimezone,'YYYYMMDDHH24MISS TZR'))
        );
    end;
    -- update
    procedure update_PRESCRIPTION (
         p_PR_ID in REHAB_PRESCRIPTIONS.PR_ID%type
        ,p_PR_DR_ID in out REHAB_PRESCRIPTIONS.PR_DR_ID%type
        ,p_PR_WS_ID in out REHAB_PRESCRIPTIONS.PR_WS_ID%type
        ,p_PR_NOTES in REHAB_PRESCRIPTIONS.PR_NOTES%type default null
        ,p_PR_PLANNED_START in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_START%type default null
        ,p_PR_PLANNED_END in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_END%type default null
        ,p_ts_format varchar2
    ) is
    begin
        validate_dr_ws(p_PR_DR_ID,p_PR_WS_ID);
        update REHAB_PRESCRIPTIONS set
             PR_DR_ID = p_PR_DR_ID
            ,PR_WS_ID = p_PR_WS_ID
            ,PR_NOTES = p_PR_NOTES
            ,PR_PLANNED_START = to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_START,p_ts_format),'DD'),'YYYYMMDD')||' '||sessiontimezone,'YYYYMMDD TZR')
            ,PR_PLANNED_END = decode(p_PR_PLANNED_END,null,null,to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_END,p_ts_format),'DD'),'YYYYMMDD')||'235959 '||sessiontimezone,'YYYYMMDDHH24MISS TZR'))
        where PR_ID = p_PR_ID;
--    exception
--      when others then raise_application_error(-20000,sqlerrm||chr(10)||p_PR_PLANNED_START||';'||p_PR_PLANNED_END||';'||p_ts_format||';'||nvl2(p_PR_PLANNED_END,p_PR_PLANNED_END,'null'));
    end;
    -- del
    procedure delete_PRESCRIPTION (
        p_PR_ID in REHAB_PRESCRIPTIONS.PR_ID%type
    ) is
    begin
        delete from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID in (select PRATR_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES where PRATR_PR_ID = p_PR_ID);
        delete from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES where PRATR_PR_ID = p_PR_ID;
        delete from REHAB_PRESCRIPTIONS where PR_ID = p_PR_ID;
    end;
END REHAB_PRESCRIPTIONS_PKG;
/

