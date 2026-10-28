

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_PRESCRIPTIONS_PKG" AS

    exUniqueConstrViolation exception;
    PRAGMA EXCEPTION_INIT(exUniqueConstrViolation, -1);

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

    function to_ts_tz(p_dt_str varchar2, p_fmt varchar2, p_add_2355959 boolean default false) return timestamp with time zone
    is
    begin
      if p_add_2355959 then
         return case when p_dt_str is not null then to_timestamp_tz(to_char(trunc(to_date(p_dt_str,p_fmt),'DD'),'YYYYMMDD')||'235959 '||sessiontimezone,'YYYYMMDDHH24MISS TZR') else null end;
      else
         return case when p_dt_str is not null then to_timestamp_tz(to_char(trunc(to_date(p_dt_str,p_fmt),'DD'),'YYYYMMDD')||' '||sessiontimezone,'YYYYMMDD TZR') else null end;
      end if;
      exception
        when others then --raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.delete_prescriptor'||chr(10)||sqlerrm);
          REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,'p_dt_str: "%p"; p_fmt: "%p"; p_add_2355959: %p;'||chr(10)||'Err: %p',
            nvl2(p_dt_str,'Not Null: '||p_dt_str,'null'), p_fmt, case when p_add_2355959 then 'True' else 'False' end, sqlerrm);
    end;

    procedure validate_dr_assignement(
         p_PRD_PRATR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_PRATR_ID%type
        ,p_PRD_DR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_DR_ID%type)
    is
      l_cnt1 number;
      l_cnt2 number;
    begin
      select count(1) into l_cnt1
        from REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES
       where PRATR_PR_ID = PR_ID
         and PRATR_ID = p_PRD_PRATR_ID
         and PR_DR_ID = p_PRD_DR_ID
         and PR_WS_ID is null;
      select count(1) into l_cnt2
        from REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES
       where PRATR_PR_ID = PR_ID
         and PRATR_ID = p_PRD_PRATR_ID
         and PR_DR_ID is null and PR_WS_ID is not null
         and PR_WS_ID = (select DR_WS_ID from REHAB_DRUGS where DR_ID = p_PRD_DR_ID);
      if l_cnt1 + l_cnt2 != 1 then
         raise_application_error(-20102,case when l_cnt1 = 0 then 'Not ' else null end ||'Found DR assignement; '||
                                        case when l_cnt2 = 0 then 'Not ' else null end ||'Found WS assignement'||chr(10)||'PRATR_ID: '||p_PRD_PRATR_ID||'; DR_ID: '||p_PRD_DR_ID);
      end if;
    end;

    function decode_uq_constr_error(p_errm varchar2) return varchar2
    is
    begin
      return case when upper(p_errm) like upper('%UK_REHAB_PRESCRIPTIONS_DETAILS_1%') then 'Заборонено додавати один і той же медікамент в використаний час прийому.'
                  when upper(p_errm) like upper('%UK_REHAB_PRESCRIPTIONS_DETAILS_2%') then 'Заборонено використовувати час прийому більше одного разу.'
                  else p_errm end;
    end;

--    procedure insert_PRESCRIPTOR (
--         p_PRR_ID in REHAB_PRESCRIPTORS.PRR_ID%type
--        ,p_PRR_PRESCRIPTED_BY_SHORT in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_SHORT%type
--        ,p_PRR_PRESCRIPTED_WHEN in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_WHEN%type
--        ,p_PRR_PRESCRIPTED_BY_FULL in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_FULL%type
--        ,p_PRR_PAT_ID in REHAB_PRESCRIPTORS.PRR_PAT_ID%type
--        ,p_PRR_FULL_TEXT in REHAB_PRESCRIPTORS.PRR_FULL_TEXT%type
--        ,p_PRR_PAGE1 in REHAB_PRESCRIPTORS.PRR_PAGE1%type
--        ,p_PRR_PAGE2 in REHAB_PRESCRIPTORS.PRR_PAGE2%type
--        ,p_PRR_PAGE3 in REHAB_PRESCRIPTORS.PRR_PAGE3%type
--        ,p_PRR_PAGE4 in REHAB_PRESCRIPTORS.PRR_PAGE4%type
--        ,p_PRR_PAGE5 in REHAB_PRESCRIPTORS.PRR_PAGE5%type
--    ) is
--    begin
--    insert into REHAB_PRESCRIPTORS(
--            PRR_PRESCRIPTED_WHEN
--            ,PRR_PAGE2
--            ,PRR_PAGE3
--            ,PRR_PRESCRIPTED_BY_SHORT
--            ,PRR_PAGE4
--            ,PRR_PAGE5
--            ,PRR_ID
--            ,PRR_PRESCRIPTED_BY_FULL
--            ,PRR_PAGE1
--            ,PRR_PAT_ID
--            ,PRR_FULL_TEXT
--        ) values (
--            p_PRR_PRESCRIPTED_WHEN
--            ,p_PRR_PAGE2
--            ,p_PRR_PAGE3
--            ,p_PRR_PRESCRIPTED_BY_SHORT
--            ,p_PRR_PAGE4
--            ,p_PRR_PAGE5
--            ,p_PRR_ID
--            ,p_PRR_PRESCRIPTED_BY_FULL
--            ,p_PRR_PAGE1
--            ,p_PRR_PAT_ID
--            ,p_PRR_FULL_TEXT
--        );
--    exception
--      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.insert_PRESCRIPTORS'||chr(10)||sqlerrm);
--    end;
--    -- update
--    procedure update_PRESCRIPTOR (
--         p_PRR_ID in REHAB_PRESCRIPTORS.PRR_ID%type
--        ,p_PRR_PRESCRIPTED_BY_SHORT in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_SHORT%type
--        ,p_PRR_PRESCRIPTED_WHEN in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_WHEN%type
--        ,p_PRR_PRESCRIPTED_BY_FULL in REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_FULL%type
--        ,p_PRR_PAT_ID in REHAB_PRESCRIPTORS.PRR_PAT_ID%type
--        ,p_PRR_FULL_TEXT in REHAB_PRESCRIPTORS.PRR_FULL_TEXT%type
--        ,p_PRR_PAGE1 in REHAB_PRESCRIPTORS.PRR_PAGE1%type
--        ,p_PRR_PAGE2 in REHAB_PRESCRIPTORS.PRR_PAGE2%type
--        ,p_PRR_PAGE3 in REHAB_PRESCRIPTORS.PRR_PAGE3%type
--        ,p_PRR_PAGE4 in REHAB_PRESCRIPTORS.PRR_PAGE4%type
--        ,p_PRR_PAGE5 in REHAB_PRESCRIPTORS.PRR_PAGE5%type
--    ) is
--    begin
--        update REHAB_PRESCRIPTORS set
--        PRR_PRESCRIPTED_WHEN = p_PRR_PRESCRIPTED_WHEN
--        ,PRR_PAGE2 = p_PRR_PAGE2
--        ,PRR_PAGE3 = p_PRR_PAGE3
--        ,PRR_PRESCRIPTED_BY_SHORT = p_PRR_PRESCRIPTED_BY_SHORT
--        ,PRR_PAGE4 = p_PRR_PAGE4
--        ,PRR_PAGE5 = p_PRR_PAGE5
--        ,PRR_PRESCRIPTED_BY_FULL = p_PRR_PRESCRIPTED_BY_FULL
--        ,PRR_PAGE1 = p_PRR_PAGE1
--        ,PRR_PAT_ID = p_PRR_PAT_ID
--        ,PRR_FULL_TEXT = p_PRR_FULL_TEXT
--        where PRR_ID = p_PRR_ID;
--    exception
--      when others then raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.update_PRESCRIPTORS'||chr(10)||sqlerrm);
--    end;

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
      when others then --raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.delete_prescriptor'||chr(10)||sqlerrm);
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    END delete_prescriptor;

    procedure validate_dr_ws(p_PR_DR_ID in out REHAB_PRESCRIPTIONS.PR_DR_ID%type
                            ,p_PR_WS_ID in out REHAB_PRESCRIPTIONS.PR_WS_ID%type)
    is
    begin
      if p_PR_WS_ID is not null then
        p_PR_DR_ID := null;
      end if;
      if p_PR_DR_ID is not null then
        --select DR_WS_ID into p_PR_WS_ID from REHAB_DRUGS where dr_id=p_PR_DR_ID;
        p_PR_WS_ID := null;
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
                ,to_ts_tz(p_PR_PLANNED_START, p_ts_format) -- to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_START,p_ts_format),'DD'),'YYYYMMDD')||' '||sessiontimezone,'YYYYMMDD TZR')
                ,to_ts_tz(p_PR_PLANNED_END, p_ts_format, true) -- decode(p_PR_PLANNED_END,null,null,to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_END,p_ts_format),'DD'),'YYYYMMDD')||'235959 '||sessiontimezone,'YYYYMMDDHH24MISS TZR'))
        );
    exception
      when others then --raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.insert_PRESCRIPTION'||chr(10)||sqlerrm);
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
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
            ,PR_PLANNED_START = to_ts_tz(p_PR_PLANNED_START, p_ts_format) --to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_START,p_ts_format),'DD'),'YYYYMMDD')||' '||sessiontimezone,'YYYYMMDD TZR')
            ,PR_PLANNED_END = to_ts_tz(p_PR_PLANNED_END, p_ts_format, true) --decode(p_PR_PLANNED_END,null,null,to_timestamp_tz(to_char(trunc(to_date(p_PR_PLANNED_END,p_ts_format),'DD'),'YYYYMMDD')||'235959 '||sessiontimezone,'YYYYMMDDHH24MISS TZR'))
        where PR_ID = p_PR_ID;
        for i in (select PRATR_ID, PRD_DR_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = p_PR_ID) loop
          validate_dr_assignement(i.PRATR_ID, i.PRD_DR_ID);
        end loop;
    exception
      when others then --raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.update_PRESCRIPTION'||chr(10)||sqlerrm);
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE, sqlerrm||'; p_PR_DR_ID: '||p_PR_DR_ID||'; p_PR_WS_ID: '||p_PR_WS_ID);
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
      when others then --raise_application_error(-20000,'Exception happened in REHAB_PRESCRIPTIONS_PKG.delete_PRESCRIPTION'||chr(10)||sqlerrm);
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;

    -- insert
    procedure insert_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (
         p_PRATR_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%type
        ,p_PRATR_CP_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_CP_ID%type
        ,p_PRATR_PR_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_PR_ID%type
        ,p_PRATR_ACTUAL_END in varchar2 --REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ACTUAL_END%type
        ,p_PRATR_ACTUAL_START in varchar2 --REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ACTUAL_START%type
        ,p_PRATR_NOTES in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_NOTES%type
        ,p_ts_format varchar2
    ) is
    begin
        insert into REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES(
             PRATR_ID
            ,PRATR_NOTES
            ,PRATR_ACTUAL_END
            ,PRATR_ACTUAL_START
            ,PRATR_CP_ID
            ,PRATR_PR_ID
        ) values (
             p_PRATR_ID
            ,p_PRATR_NOTES
            ,to_ts_tz(p_PRATR_ACTUAL_END, p_ts_format, true) -- decode(p_PRATR_ACTUAL_END,null,null,to_timestamp_tz(to_char(trunc(to_date(p_PRATR_ACTUAL_END,p_ts_format),'DD'),'YYYYMMDD')||'235959 '||sessiontimezone,'YYYYMMDDHH24MISS TZR'))
            ,to_ts_tz(p_PRATR_ACTUAL_START, p_ts_format) -- to_timestamp_tz(to_char(trunc(to_date(p_PRATR_ACTUAL_START,p_ts_format),'DD'),'YYYYMMDD')||' '||sessiontimezone,'YYYYMMDD TZR')
            ,p_PRATR_CP_ID
            ,p_PRATR_PR_ID
        );
    exception
      when others then
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;
    -- update
    procedure update_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (
         p_PRATR_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%type
        ,p_PRATR_CP_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_CP_ID%type
        --,p_PRATR_PR_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_PR_ID%type
        ,p_PRATR_ACTUAL_END in varchar2 --REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ACTUAL_END%type
        ,p_PRATR_ACTUAL_START in varchar2 --REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ACTUAL_START%type
        ,p_PRATR_NOTES in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_NOTES%type
        ,p_ts_format varchar2
    ) is
    begin
        update REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES set
             PRATR_NOTES = p_PRATR_NOTES
            ,PRATR_ACTUAL_END = to_ts_tz(p_PRATR_ACTUAL_END, p_ts_format, true)
            ,PRATR_ACTUAL_START = to_ts_tz(p_PRATR_ACTUAL_START, p_ts_format)
            ,PRATR_CP_ID = p_PRATR_CP_ID
            --,PRATR_PR_ID = p_PRATR_PR_ID
        where PRATR_ID = p_PRATR_ID;
    exception
      when others then
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;
    -- del
    procedure delete_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (
        p_PRATR_ID in REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%type
    ) is
    begin
        delete from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES
         where PRATR_ID = p_PRATR_ID;
    exception
      when others then
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;

    procedure insert_REHAB_PRESCRIPTIONS_DETAILS (
         p_PRD_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_ID%type
        ,p_PRD_PRATR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_PRATR_ID%type
        ,p_PRD_DR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_DR_ID%type
        ,p_PRD_CPTR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_CPTR_ID%type
        ,p_PRD_DOSAGE in REHAB_PRESCRIPTIONS_DETAILS.PRD_DOSAGE%type
        ,p_PRD_SORT_ORDER in REHAB_PRESCRIPTIONS_DETAILS.PRD_SORT_ORDER%type
        ,p_PRD_NOTES in REHAB_PRESCRIPTIONS_DETAILS.PRD_NOTES%type
    ) is
    begin
        insert into REHAB_PRESCRIPTIONS_DETAILS(
             PRD_PRATR_ID
            ,PRD_SORT_ORDER
            ,PRD_DR_ID
            ,PRD_NOTES
            ,PRD_CPTR_ID
            ,PRD_DOSAGE
            ,PRD_ID
        ) values (
             p_PRD_PRATR_ID
            ,p_PRD_SORT_ORDER
            ,p_PRD_DR_ID
            ,p_PRD_NOTES
            ,p_PRD_CPTR_ID
            ,p_PRD_DOSAGE
            ,p_PRD_ID
        );
        validate_dr_assignement(p_PRD_PRATR_ID, p_PRD_DR_ID);
    exception
      when exUniqueConstrViolation then raise_application_error(-20102,decode_uq_constr_error(sqlerrm));
      when others then
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;
    -- update
    procedure update_REHAB_PRESCRIPTIONS_DETAILS (
         p_PRD_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_ID%type
        ,p_PRD_DR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_DR_ID%type
        ,p_PRD_CPTR_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_CPTR_ID%type
        ,p_PRD_DOSAGE in REHAB_PRESCRIPTIONS_DETAILS.PRD_DOSAGE%type
        ,p_PRD_SORT_ORDER in REHAB_PRESCRIPTIONS_DETAILS.PRD_SORT_ORDER%type
        ,p_PRD_NOTES in REHAB_PRESCRIPTIONS_DETAILS.PRD_NOTES%type
    ) is
      l_PRD_PRATR_ID REHAB_PRESCRIPTIONS_DETAILS.PRD_PRATR_ID%type;
    begin
        update REHAB_PRESCRIPTIONS_DETAILS set
             PRD_SORT_ORDER = p_PRD_SORT_ORDER
            ,PRD_DR_ID = p_PRD_DR_ID
            ,PRD_NOTES = p_PRD_NOTES
            ,PRD_CPTR_ID = p_PRD_CPTR_ID
            ,PRD_DOSAGE = p_PRD_DOSAGE
        where PRD_ID = p_PRD_ID returning PRD_PRATR_ID into l_PRD_PRATR_ID;
        validate_dr_assignement(l_PRD_PRATR_ID, p_PRD_DR_ID);
    exception
      when others then
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;
    -- del
    procedure delete_REHAB_PRESCRIPTIONS_DETAILS (
        p_PRD_ID in REHAB_PRESCRIPTIONS_DETAILS.PRD_ID%type
    ) is
    begin
        delete from REHAB_PRESCRIPTIONS_DETAILS
         where PRD_ID = p_PRD_ID;
    exception
      when others then
        REHAB_LOGGING_PKG.lognraise($$PLSQL_UNIT, $$PLSQL_LINE,sqlerrm);
    end;
END REHAB_PRESCRIPTIONS_PKG;
/

