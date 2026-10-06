

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_DRUGUSE_PKG" AS

  function druguse_dashboard_ref(p_tp_id REHAB_TIME_PERIODS.TP_ID%type) return rehab_druguse_dashboard_tab pipelined AS
    l_img blob;
    l_img2 blob;
  BEGIN
--    select DR_ITEM_IMAGE1 into l_img
--    from REHAB_DRUGS where DR_ID = 21;
--    pipe row (rehab_druguse_dashboard_rec(
--       1,           --     id           number,
--       'Main',      --     mainlabel    VARCHAR2(4000),
--       'SubLabel',  --     sublabel     varchar2(4000),
--       'Data1',     --     data1        VARCHAR2(4000),
--       'Data2',     --     data2        VARCHAR2(4000),
--       'bagecol',   --bagecol      VARCHAR2(4000),
--       'bagelabel', --bagelabel    VARCHAR2(4000),
--       1,           -- app_page     number,
--       21,           -- dr_id        number,
--       0,           -- pr_id        number,
--       0,           -- prr_id       number,
--       0,           -- cptr_id      number,
--       l_img        -- drug_img     blob
--    ));
--
--    select DR_ITEM_IMAGE1 into l_img
--    from REHAB_DRUGS where DR_ID = 61;
--    pipe row (rehab_druguse_dashboard_rec(
--       2,           --     id           number,
--       'Main1',      --     mainlabel    VARCHAR2(4000),
--       'SubLabel1',  --     sublabel     varchar2(4000),
--       'Data11',     --     data1        VARCHAR2(4000),
--       'Data21',     --     data2        VARCHAR2(4000),
--       '',   --bagecol      VARCHAR2(4000),
--       '', --bagelabel    VARCHAR2(4000),
--       1,           -- app_page     number,
--       61,           -- dr_id        number,
--       0,           -- pr_id        number,
--       0,           -- prr_id       number,
--       0,           -- cptr_id      number,
--       l_img        -- drug_img     blob
--    ));

    for i in (select d.*, r.BALANCE, r.DAYS_PLANNED, r.DAYS_REMAIN, r.DA_STORED_AMOUNT, r.end_date
                from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS tp, V$REHAB_REMAINS r
               where tp.TP_ID = p_tp_id
                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
                 and d.PRD_DR_ID = r.DR_ID(+)
               order by decode(d.DRU_CONSUMED,null,-1e6,PRD_SORT_ORDER))
    loop
        pipe row (rehab_druguse_dashboard_rec(
           id        => i.PRD_ID,           --     id           number,
           mainlabel => i.DR_NAME,      --     mainlabel    VARCHAR2(4000),
           sublabel  => '<b>'||UNISTR('\2710')||'</b> '||i.PRD_DOSAGE|| ' мг ' ||i.CPTR_START_TIME_STR||'-'||i.CPTR_END_TIME_STR||' '||i.DR_WHEN2CONSUME||
                        --'<br>'||round(i.DAYS_PLANNED,1)||'; '||i.DAYS_REMAIN||'; '||REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')||'; '||
--                        case when i.DA_STORED_AMOUNT is not null then
--                        '<br>Залишок на: '||case when i.DAYS_PLANNED is null
--                                     then '<span style="color: '||case when i.DAYS_REMAIN >= to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')) then 'lime' else 'yellow' end||';"> '
--                                     else '<span style="color: '||case when i.DAYS_REMAIN >= i.DAYS_PLANNED then 'lime' else 'yellow' end||';"> '
--                                     end ||i.DAYS_REMAIN||' дні(в)</span> до '||to_char(i.end_date, 'YYYY-Mon-DD')||'. Заплановано'||case when i.DAYS_PLANNED is null then ': без обмеження дати' else ' до: ' || to_char(i.PR_PLANNED_END, 'YYYY-Mon-DD') --||
--                                     --'<br>В наявності до '||to_char(i.end_date, 'YYYY-Mon-DD')
--                                     end
--                        else '<br>Інформація по залишкам відсутня' end ||
                        nvl2(i.PRD_NOTES,'<br>'||i.PRD_NOTES,null),  --     sublabel     varchar2(4000),
           data1     => nvl2(i.DRU_CONSUMED,'<span style="color: lime;">'||UNISTR('\D83C\DF23')||/*Прийнято*/'</span> '||to_char(i.DRU_CONSUMED at time zone SESSIONTIMEZONE,'YYYY-Mon-DD HH24:MI')||
                                            '<span style="color: '||case when i.DRU_ACTUAL_DOSAGE = i.PRD_DOSAGE then 'lime' else 'yellow' end||';"> '||i.DRU_ACTUAL_DOSAGE||' мг</span>',--||
                                            --UNISTR('\D83D\DDD2')||' "'||i.CPTR_NAME||'; '||i.CPTR_START_TIME_STR||'-'||i.CPTR_END_TIME_STR||'"',
                                            '<span style="color: yellow;">'||UNISTR('\D83C\DF27')||' Не прийнято</span>'),     --     data1        VARCHAR2(4000),
           data2     => REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\2762'))||' '||
                         nvl(i.DR_USE_CASE,i.DR_TYPE_SHORT)||
                         nvl2(i.PR_NOTES,'<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DD8E'))||' '||i.PR_NOTES,null)||
                         nvl2(i.PRATR_NOTES,'<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DDB9'))||' '||i.PRATR_NOTES,null)||
                        case when i.DA_STORED_AMOUNT is not null then
                        '<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DDC4'))||' Залишок на: '||case when i.DAYS_PLANNED is null
                                     then '<span style="color: '||case when i.DAYS_REMAIN >= to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')) then 'lime' else 'yellow' end||';"> '
                                     else '<span style="color: '||case when i.DAYS_REMAIN >= i.DAYS_PLANNED then 'lime' else 'yellow' end||';"> '
                                     end ||i.DAYS_REMAIN||' дні(в)</span> до '||to_char(i.end_date, 'YYYY-Mon-DD')||'. Заплановано'||case when i.DAYS_PLANNED is null then ': без обмеження дати' else ' до: ' || to_char(i.PR_PLANNED_END, 'YYYY-Mon-DD') --||
                                     --'<br>В наявності до '||to_char(i.end_date, 'YYYY-Mon-DD')
                                     end
                        else '<br>Інформація по залишкам відсутня' end
           ,     --     data2        VARCHAR2(4000),
           bagecol   => '',   --bagecol      VARCHAR2(4000),
           bagelabel => '', --bagelabel    VARCHAR2(4000),
           app_page  => null,           -- app_page     number,
           dru_id    => i.DRU_ID,
           dr_id     => i.PR_DR_ID,           -- dr_id        number,
           pr_id     => i.PR_ID,           -- pr_id        number,
           prd_id    => i.PRD_ID,           -- prr_id       number,
           cptr_id   => i.PRD_CPTR_ID,           -- cptr_id      number,
           drug_img  => i.DR_ITEM_IMAGE1        -- drug_img     blob
        ));
    end loop;
    RETURN;
  END druguse_dashboard_ref;

  procedure consume_drug(p_dru_prd_id REHAB_DRUG_USES.dru_prd_id%type,
                         P_DRU_PR_ID REHAB_DRUG_USES.DRU_PR_ID%type,
                         P_DRU_CPTR_ID REHAB_DRUG_USES.DRU_CPTR_ID%type,
                         P_DRU_DR_ID REHAB_DRUG_USES.DRU_DR_ID%type,
                         P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type,
                         P_DRU_ACTUAL_DOSAGE REHAB_DRUG_USES.DRU_ACTUAL_DOSAGE%type)
  is
  begin
    INSERT INTO rehab_drug_uses
       (dru_id,
          dru_prd_id,  dru_pr_id,
          dru_pat_id,
          dru_cptr_id,  dru_dr_id,
          dru_ws_id,
          dru_consumed,dru_actual_dosage)
    VALUES
       (SQ_REHAB_DRUG_USES.nextval,
        p_dru_prd_id,P_DRU_PR_ID,
        REHAB_CONTEXT_PKG.getPATIENT(),
        P_DRU_CPTR_ID,P_DRU_DR_ID,
        (select DR_WS_ID from REHAB_DRUGS where DR_ID = p_dru_dr_id),
        P_DRU_CONSUMED,
        nvl(P_DRU_ACTUAL_DOSAGE,(select PRD_DOSAGE from REHAB_PRESCRIPTIONS_DETAILS where PRD_ID = p_dru_prd_id))
        );
  end;

  procedure modify_drug_use(p_dru_id REHAB_DRUG_USES.dru_id%type,
                            P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type,
                            P_DRU_ACTUAL_DOSAGE REHAB_DRUG_USES.DRU_ACTUAL_DOSAGE%type)
  is
  begin
    update rehab_drug_uses set dru_consumed = P_DRU_CONSUMED, dru_actual_dosage = P_DRU_ACTUAL_DOSAGE where dru_id = p_dru_id;
  end;

  procedure remove_drug_use(p_dru_id REHAB_DRUG_USES.dru_id%type)
  is
  begin
    delete from rehab_drug_uses where dru_id = p_dru_id;
  end;
--  procedure consume_drug_now
--                        (p_dru_prd_id REHAB_DRUG_USES.dru_prd_id%type,
--                         P_DRU_PR_ID REHAB_DRUG_USES.DRU_PR_ID%type,
--                         P_DRU_CPTR_ID REHAB_DRUG_USES.DRU_CPTR_ID%type,
--                         P_DRU_DR_ID REHAB_DRUG_USES.DRU_DR_ID%type)
--  is
--  begin
--    consume_drug(p_dru_prd_id, P_DRU_PR_ID, P_DRU_CPTR_ID, P_DRU_DR_ID, systimestamp at time zone SESSIONTIMEZONE, null);
--  end;

END REHAB_DRUGUSE_PKG;
/

