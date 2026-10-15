

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_PRESCRIPTIONS_PKG" AS

    function get_prescriptor_status(p_PRR_ID REHAB_PRESCRIPTORS.PRR_ID%type) return varchar2
    is
      l_cnt number;
      l_cnt_open_ended number;
      l_cnt_in_progress number;
      l_cnt_finished number;
      l_cnt_not_started number;
      l_res varchar2(4000);
    begin
      select
        count(1),
        count(1) filter (where PR_PLANNED_END is null and PR_PLANNED_START < REHAB_CONTEXT_PKG.getGLOBAL_DATE()),
        count(1) filter (where PR_PLANNED_END > REHAB_CONTEXT_PKG.getGLOBAL_DATE() and PR_PLANNED_START < REHAB_CONTEXT_PKG.getGLOBAL_DATE()),
        count(1) filter (where PR_PLANNED_END < REHAB_CONTEXT_PKG.getGLOBAL_DATE()),
        count(1) filter (where PR_PLANNED_START > REHAB_CONTEXT_PKG.getGLOBAL_DATE())
      into
        l_cnt,l_cnt_open_ended, l_cnt_in_progress, l_cnt_finished, l_cnt_not_started
      from REHAB_PRESCRIPTIONS where PR_PRR_ID = p_PRR_ID;
      --return 'Tot: '||l_cnt||'; OpenEnd: '||l_cnt_open_ended||'; In progress: '||l_cnt_in_progress||'; Finished: '||l_cnt_finished||'; Not started: '||l_cnt_not_started;
      if l_cnt = 0 then
        l_res := 'Нове';
      elsif l_cnt_open_ended > 0 or l_cnt_in_progress > 0 then
        l_res := 'Активне';
      elsif l_cnt_finished > 0 then
        l_res := 'Завершене';
      elsif l_cnt_not_started > 0 then
        l_res := 'Ще не почалося';
      end if;
      return l_res;
    end;

    procedure insert_PRESCRIPTOR (
         p_PRR_ID in REHAB_PRESCRIPTORS.PRR_ID%type
        ,p_PRR_PRESCRIPTED_BY_SHORT in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_SHORT%type
        ,p_PRR_PRESCRIPTED_WHEN in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_WHEN%type
        ,p_PRR_PRESCRIPTED_BY_FULL in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_FULL%type
        ,p_PRR_PAT_ID in REHAB_PRESCRIPTORS.PRR_PAT_ID%type
        ,p_PRR_FULL_TEXT in REHAB_PRESCRIPTORS.PRR_FULL_TEXT%type
        ,p_PRR_PAGE1 in REHAB_PRESCRIPTORS.PRR_PAGE1%type
        ,p_PRR_PAGE2 in REHAB_PRESCRIPTORS.PRR_PAGE2%type
        ,p_PRR_PAGE3 in REHAB_PRESCRIPTORS.PRR_PAGE3%type
        ,p_PRR_PAGE4 in REHAB_PRESCRIPTORS.PRR_PAGE4%type
        ,p_PRR_PAGE5 in REHAB_PRESCRIPTORS.PRR_PAGE5%type
    ) is
    begin
    insert into REHAB_PRESCRIPTORS(
            PRR_PRESCRIPTED_WHEN
            ,PRR_PAGE2
            ,PRR_PAGE3
            ,PRR_PRESCRIPTED_BY_SHORT
            ,PRR_PAGE4
            ,PRR_PAGE5
            ,PRR_ID
            ,PRR_PRESCRIPTED_BY_FULL
            ,PRR_PAGE1
            ,PRR_PAT_ID
            ,PRR_FULL_TEXT
        ) values (
            p_PRR_PRESCRIPTED_WHEN
            ,p_PRR_PAGE2
            ,p_PRR_PAGE3
            ,p_PRR_PRESCRIPTED_BY_SHORT
            ,p_PRR_PAGE4
            ,p_PRR_PAGE5
            ,p_PRR_ID
            ,p_PRR_PRESCRIPTED_BY_FULL
            ,p_PRR_PAGE1
            ,p_PRR_PAT_ID
            ,p_PRR_FULL_TEXT
        );
    exception
      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.insert_PRESCRIPTORS'||chr(10)||sqlerrm);
    end;
    -- update
    procedure update_PRESCRIPTOR (
         p_PRR_ID in REHAB_PRESCRIPTORS.PRR_ID%type
        ,p_PRR_PRESCRIPTED_BY_SHORT in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_SHORT%type
        ,p_PRR_PRESCRIPTED_WHEN in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_WHEN%type
        ,p_PRR_PRESCRIPTED_BY_FULL in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_FULL%type
        ,p_PRR_PAT_ID in REHAB_PRESCRIPTORS.PRR_PAT_ID%type
        ,p_PRR_FULL_TEXT in REHAB_PRESCRIPTORS.PRR_FULL_TEXT%type
        ,p_PRR_PAGE1 in REHAB_PRESCRIPTORS.PRR_PAGE1%type
        ,p_PRR_PAGE2 in REHAB_PRESCRIPTORS.PRR_PAGE2%type
        ,p_PRR_PAGE3 in REHAB_PRESCRIPTORS.PRR_PAGE3%type
        ,p_PRR_PAGE4 in REHAB_PRESCRIPTORS.PRR_PAGE4%type
        ,p_PRR_PAGE5 in REHAB_PRESCRIPTORS.PRR_PAGE5%type
    ) is
    begin
        update REHAB_PRESCRIPTORS set
        PRR_PRESCRIPTED_WHEN = p_PRR_PRESCRIPTED_WHEN
        ,PRR_PAGE2 = p_PRR_PAGE2
        ,PRR_PAGE3 = p_PRR_PAGE3
        ,PRR_PRESCRIPTED_BY_SHORT = p_PRR_PRESCRIPTED_BY_SHORT
        ,PRR_PAGE4 = p_PRR_PAGE4
        ,PRR_PAGE5 = p_PRR_PAGE5
        ,PRR_PRESCRIPTED_BY_FULL = p_PRR_PRESCRIPTED_BY_FULL
        ,PRR_PAGE1 = p_PRR_PAGE1
        ,PRR_PAT_ID = p_PRR_PAT_ID
        ,PRR_FULL_TEXT = p_PRR_FULL_TEXT
        where PRR_ID = p_PRR_ID;
    exception
      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.update_PRESCRIPTORS'||chr(10)||sqlerrm);
    end;
    procedure delete_prescriptor(p_PRR_ID REHAB_PRESCRIPTORS.PRR_ID%type) AS
        l_cnt number;
    BEGIN
        select count(*) into l_cnt from REHAB_PRESCRIPTIONS where PR_PRR_ID = p_PRR_ID;
        if l_cnt > 0 then
            raise_application_error(-20101,'Зпочатку треба видалити призначені медикоменти.');
        end if;
        update REHAB_DRUG_ACCOUNTINGS set DA_PRR_ID = null where DA_PRR_ID =  p_PRR_ID;
        delete from REHAB_PRESCRIPTOR2DRUG_FLTS where PRRF_PRR_ID = p_PRR_ID;
        delete from REHAB_PRESCRIPTORS where PRR_ID = p_PRR_ID;
    exception
      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.delete_prescriptor'||chr(10)||sqlerrm);
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
    exception
      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.insert_PRESCRIPTION'||chr(10)||sqlerrm);
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
    exception
      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.update_PRESCRIPTION'||chr(10)||sqlerrm);
    end;
    -- del
    procedure delete_PRESCRIPTION (
        p_PR_ID in REHAB_PRESCRIPTIONS.PR_ID%type
    ) is
    begin
        delete from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID in (select PRATR_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES where PRATR_PR_ID = p_PR_ID);
        delete from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES where PRATR_PR_ID = p_PR_ID;
        delete from REHAB_PRESCRIPTIONS where PR_ID = p_PR_ID;
    exception
      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.delete_PRESCRIPTION'||chr(10)||sqlerrm);
    end;
END REHAB_PRESCRIPTIONS_PKG;
/

