

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_DRUGUSE_PKG" AS

  function druguse_dashboard_ref(p_tp_id REHAB_TIME_PERIODS.TP_ID%type, p_sortbyconsumed boolean default true) return rehab_druguse_dashboard_tab pipelined AS
    l_img blob;
    l_img2 blob;
  BEGIN
    for i in (
--              select ----d.*, r.BALANCE, r.DAYS_PLANNED, r.DAYS_REMAIN, r.DA_STORED_AMOUNT, r.end_date
--                       PRD_ID, d.DR_NAME, PRD_DOSAGE, CPTR_START_TIME_STR, CPTR_END_TIME_STR, DR_WHEN2CONSUME, PRD_NOTES, d.DRU_CONSUMED, DRU_ACTUAL_DOSAGE, DR_USE_CASE, DR_TYPE_SHORT,
--                       PR_NOTES, PRATR_NOTES, d.PR_PLANNED_END, d.PRATR_ACTUAL_END,
--                       DRU_ID, PRD_DR_ID, PR_PRR_ID, PR_ID,   PRATR_ID, PRD_CPTR_ID,  DR_ITEM_IMAGE1,
--                       r.BALANCE, r.DAYS_PLANNED, r.DAYS_REMAIN, r.DA_STORED_AMOUNT, r.end_date
--                from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS tp, V$REHAB_REMAINS r
--               where tp.TP_ID = p_tp_id
--                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or
--                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
--                 and d.PRD_DR_ID = r.DR_ID(+)
--               order by --case when p_sortbyconsumed then decode(d.DRU_CONSUMED,null,-1e6,PRD_SORT_ORDER) else PRD_SORT_ORDER end nulls last
--                        case when p_sortbyconsumed then d.DRU_CONSUMED else systimestamp end nulls first,PRD_SORT_ORDER
                select PRD_ID, d.DR_NAME, PRD_DOSAGE, CPTR_START_TIME_STR, CPTR_END_TIME_STR, DR_WHEN2CONSUME, PRD_NOTES, d.DRU_CONSUMED, DRU_ACTUAL_DOSAGE, DR_USE_CASE, DR_TYPE_SHORT,
                       PR_NOTES, PRATR_NOTES, d.PR_PLANNED_END, d.PRATR_ACTUAL_END,
                       DRU_ID, d.PRD_DR_ID, d.PR_PRR_ID, d.PR_ID, d.PRATR_ID, PRD_CPTR_ID,  DR_ITEM_IMAGE1,
                       --r.BALANCE BALANCE0,
                       b.BALANCE_TOTAL BALANCE,
                       --r.DAYS_PLANNED DAYS_PLANNED0,
                       pe.DAYS_FROM_START_DATE_TO_END DAYS_PLANNED,
                       --r.DAYS_REMAIN DAYS_REMAIN0,
                       (b.BALANCE_BEFORE_TODAY-pe.DAILY_DOSAGE)/pe.DAILY_DOSAGE DAYS_REMAIN,
                       --r.DA_STORED_AMOUNT DA_STORED_AMOUNT0,
                       b.REMAINED_AMOUNT DA_STORED_AMOUNT,
                       --r.end_date end_date0,
                       REHAB_CONTEXT_PKG.getGLOBAL_DATE_TRUNC() + NUMTODSINTERVAL((b.BALANCE_BEFORE_TODAY-pe.DAILY_DOSAGE)/pe.DAILY_DOSAGE, 'DAY') end_date
                from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS_AVAILABLE tp, --V$REHAB_REMAINS r,
                     v$rb_plans_ext pe,
                     (select DA_DR_ID, sum(BALANCE_BEFORE_TODAY) BALANCE_BEFORE_TODAY, sum(BALANCE_TOTAL) BALANCE_TOTAL, max(REMAINED_AMOUNT) REMAINED_AMOUNT from V$RB_BALANCE group by DA_DR_ID) b
               where tp.TP_ID = p_tp_id
                 and pe.PR_PRR_ID = d.PR_PRR_ID and pe.PR_ID = d.PR_ID and pe.PRATR_ID = d.PRATR_ID and pe.PRD_DR_ID = d.PRD_DR_ID
                 and d.PRD_DR_ID = b.DA_DR_ID(+)
                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
                 --and d.PRD_DR_ID = r.DR_ID(+)
               order by --case when p_sortbyconsumed then decode(d.DRU_CONSUMED,null,-1e6,PRD_SORT_ORDER) else PRD_SORT_ORDER end nulls last
                        case when p_sortbyconsumed then d.DRU_CONSUMED else systimestamp end nulls first,PRD_SORT_ORDER
               )
    loop
        pipe row (rehab_druguse_dashboard_rec(
           id        => i.PRD_ID,           --     id           number,
           mainlabel => i.DR_NAME,      --     mainlabel    VARCHAR2(4000),
           sublabel  => '<b>'||UNISTR('\2710')||'</b> '||i.PRD_DOSAGE|| ' мг ' ||i.CPTR_START_TIME_STR||'-'||i.CPTR_END_TIME_STR||' '||i.DR_WHEN2CONSUME||
                        nvl2(i.PRD_NOTES,'<br>'||i.PRD_NOTES,null),  --     sublabel     varchar2(4000),
           data1     => nvl2(i.DRU_CONSUMED,REHAB_UI_REPORTS_PKG.clr('lime','Спожито '||UNISTR('\D83C\DF23'))||to_char(i.DRU_CONSUMED at time zone SESSIONTIMEZONE,'YYYY-Mon-DD HH24:MI')||
                                            REHAB_UI_REPORTS_PKG.clr(case when i.DRU_ACTUAL_DOSAGE = i.PRD_DOSAGE then 'lime' else 'yellow' end,' '||i.DRU_ACTUAL_DOSAGE||' мг'),--||
                                            --UNISTR('\D83D\DDD2')||' "'||i.CPTR_NAME||'; '||i.CPTR_START_TIME_STR||'-'||i.CPTR_END_TIME_STR||'"',
                                            REHAB_UI_REPORTS_PKG.clr('yellow',UNISTR('\D83C\DF27')||' Не спожито')),
           data2     => REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\2762'))||' '||
                         nvl(i.DR_USE_CASE,i.DR_TYPE_SHORT)||
                         nvl2(i.PR_NOTES,'<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DD8E'))||' '||i.PR_NOTES,null)||
                         nvl2(i.PRATR_NOTES,'<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DDB9'))||' '||i.PRATR_NOTES,null)||
                        case when i.DA_STORED_AMOUNT is not null then
                        '<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DDC4'))||' Залишок на: '||
                                REHAB_UI_REPORTS_PKG.clr(case when i.DAYS_PLANNED is null
                                     then case when i.DAYS_REMAIN >= to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')) then 'lime' else 'yellow' end
                                     else case when i.DAYS_REMAIN >= i.DAYS_PLANNED then 'lime' else 'yellow' end
                                     end, round(i.DAYS_REMAIN)||' дні(в)')||' до '||to_char(i.end_date, 'YYYY-Mon-DD')||
                                     '. Заплановано'||case when i.PR_PLANNED_END is null then ': без обмеження дати' else ' до: ' || to_char(i.PR_PLANNED_END, 'YYYY-Mon-DD') end ||
                                     case when i.PRATR_ACTUAL_END is not null and (i.PR_PLANNED_END is null or trunc(i.PR_PLANNED_END)<>trunc(i.PRATR_ACTUAL_END)) then '. Період до: ' || to_char(i.PRATR_ACTUAL_END, 'YYYY-Mon-DD') else null end
                        else '<br>Інформація по залишкам відсутня' end,     --     data2        VARCHAR2(4000),
           bagecol   => '',   --bagecol      VARCHAR2(4000),
           bagelabel => '', --bagelabel    VARCHAR2(4000),
           app_page  => null,           -- app_page     number,
           dru_id    => i.DRU_ID,
           dr_id     => i.PRD_DR_ID,           -- dr_id        number,
           prr_id    => i.PR_PRR_ID,
           pr_id     => i.PR_ID,           -- pr_id        number,
           pratr_id  => i.PRATR_ID,
           prd_id    => i.PRD_ID,           -- prr_id       number,
           cptr_id   => i.PRD_CPTR_ID,           -- cptr_id      number,
           drug_img  => i.DR_ITEM_IMAGE1        -- drug_img     blob
        ));
    end loop;
    RETURN;
  END druguse_dashboard_ref;

  function druguse_assembly_ref(p_tp_id REHAB_TIME_PERIODS.TP_ID%type, p_days_ahead number default 7) return rehab_druguse_dashboard_tab pipelined
  is
    l_img blob;
    l_img2 blob;
  BEGIN
    for i in (
--              select d.*, r.BALANCE, r.DAYS_PLANNED, r.DAYS_REMAIN, r.DA_STORED_AMOUNT, r.end_date
--                from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS tp, V$REHAB_REMAINS r
--               where tp.TP_ID = p_tp_id
--                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or
--                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
--                 and d.PRD_DR_ID = r.DR_ID(+)
                select PRD_ID, d.DR_NAME, PRD_DOSAGE, CPTR_START_TIME_STR, CPTR_END_TIME_STR, DR_WHEN2CONSUME, PRD_NOTES, DR_USE_CASE, DR_TYPE_SHORT,
                       PR_NOTES, PRATR_NOTES, d.PR_PLANNED_END, d.PRATR_ACTUAL_END,d.PRATR_ACTUAL_START,
                       d.PRD_DR_ID, d.PR_PRR_ID, d.PR_ID, d.PRATR_ID, PRD_CPTR_ID,  DR_ITEM_IMAGE1,
                       --r.BALANCE BALANCE0,
                       b.BALANCE_TOTAL BALANCE,
                       --r.DAYS_PLANNED DAYS_PLANNED0,
                       pe.DAYS_FROM_START_DATE_TO_END DAYS_PLANNED,
                       --r.DAYS_REMAIN DAYS_REMAIN0,
                       (b.BALANCE_BEFORE_TODAY-pe.DAILY_DOSAGE)/pe.DAILY_DOSAGE DAYS_REMAIN,
                       --r.DA_STORED_AMOUNT DA_STORED_AMOUNT0,
                       b.REMAINED_AMOUNT DA_STORED_AMOUNT,
                       --r.end_date end_date0,
                       REHAB_CONTEXT_PKG.getGLOBAL_DATE_TRUNC() + (b.BALANCE_BEFORE_TODAY-pe.DAILY_DOSAGE)/pe.DAILY_DOSAGE end_date
                from V$REHAB_CONSUME_PLANS_ALL d, V$REHAB_TIME_PERIODS_AVAILABLE tp, --V$REHAB_REMAINS r,
                     v$rb_plans_ext pe,
                     (select DA_DR_ID, sum(BALANCE_BEFORE_TODAY) BALANCE_BEFORE_TODAY, sum(BALANCE_TOTAL) BALANCE_TOTAL, max(REMAINED_AMOUNT) REMAINED_AMOUNT from V$RB_BALANCE group by DA_DR_ID) b
               where tp.TP_ID = p_tp_id
                 and pe.PR_PRR_ID = d.PR_PRR_ID and pe.PR_ID = d.PR_ID and pe.PRATR_ID = d.PRATR_ID and pe.PRD_DR_ID = d.PRD_DR_ID
                 and d.PRD_DR_ID = b.DA_DR_ID(+)
                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
                 --and d.PRD_DR_ID = r.DR_ID(+)
                 and ((d.PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and (d.PRATR_ACTUAL_END is null or d.PRATR_ACTUAL_END >= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ()))
                     or
                     d.PRATR_ACTUAL_START between REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(p_days_ahead, 'DAY'))
               order by PRD_SORT_ORDER
               )
    loop
        pipe row (rehab_druguse_dashboard_rec(
           id        => i.PRD_ID,           --     id           number,
           mainlabel => i.DR_NAME,      --     mainlabel    VARCHAR2(4000),
           sublabel  => '<b>'||UNISTR('\2710')||'</b> '||i.PRD_DOSAGE|| ' мг ' ||i.CPTR_START_TIME_STR||'-'||i.CPTR_END_TIME_STR||' '||i.DR_WHEN2CONSUME||
                        nvl2(i.PRD_NOTES,'<br>'||i.PRD_NOTES,null),  --     sublabel     varchar2(4000),
           data1     => case when i.PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and (i.PRATR_ACTUAL_END is null or i.PRATR_ACTUAL_END >= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(p_days_ahead, 'DAY'))
                               then 'Набирати на '||p_days_ahead||' дні(в)'
                             when i.PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and i.PRATR_ACTUAL_END < REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(p_days_ahead, 'DAY')
                               then 'Набирати на '||(EXTRACT(DAY FROM (i.PRATR_ACTUAL_END - REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ()))+1)||' дні(в), період завершується раніше: '||to_char(i.PRATR_ACTUAL_END, 'YYYY-Mon-DD Day')
                             when i.PRATR_ACTUAL_START > REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and i.PRATR_ACTUAL_END < REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(p_days_ahead, 'DAY')
                               then 'Набирати на '||(EXTRACT(DAY FROM (i.PRATR_ACTUAL_END - i.PRATR_ACTUAL_START))+1)||' дні(в), період з ' || to_char(i.PRATR_ACTUAL_START, 'YYYY-Mon-DD Day') || ' по ' ||to_char(i.PRATR_ACTUAL_END, 'YYYY-Mon-DD Day')
                             when i.PRATR_ACTUAL_START > REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() and (i.PRATR_ACTUAL_END is null or i.PRATR_ACTUAL_END >= REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(p_days_ahead, 'DAY'))
                               then 'Набирати на '||(EXTRACT(DAY FROM (REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(p_days_ahead, 'DAY') - i.PRATR_ACTUAL_START)))||' дні(в), період почнеться пізніше з ' || to_char(i.PRATR_ACTUAL_START, 'YYYY-Mon-DD Day')
                             else 'Помилка обчислення періоду'
                        end,
           data2     => REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\2762'))||' '||
                         nvl(i.DR_USE_CASE,i.DR_TYPE_SHORT)||
                         nvl2(i.PR_NOTES,'<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DD8E'))||' '||i.PR_NOTES,null)||
                         nvl2(i.PRATR_NOTES,'<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DDB9'))||' '||i.PRATR_NOTES,null)||
                        case when i.DA_STORED_AMOUNT is not null then
                        '<br>'||REHAB_UI_REPORTS_PKG.clr('lime',UNISTR('\D83D\DDC4'))||' Залишок на: '||
                                REHAB_UI_REPORTS_PKG.clr(case when i.DAYS_PLANNED is null
                                     then case when i.DAYS_REMAIN >= to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')) then 'lime' else 'yellow' end
                                     else case when i.DAYS_REMAIN >= i.DAYS_PLANNED then 'lime' else 'yellow' end
                                     end, round(i.DAYS_REMAIN)||' дні(в)')||' до '||to_char(i.end_date, 'YYYY-Mon-DD')||
                                     '. Заплановано'||case when i.PR_PLANNED_END is null then ': без обмеження дати' else ' до: ' || to_char(i.PR_PLANNED_END, 'YYYY-Mon-DD') end ||
                                     case when i.PRATR_ACTUAL_END is not null and (i.PR_PLANNED_END is null or trunc(i.PR_PLANNED_END)<>trunc(i.PRATR_ACTUAL_END)) then '. Період до: ' || to_char(i.PRATR_ACTUAL_END, 'YYYY-Mon-DD') else null end
                        else '<br>Інформація по залишкам відсутня' end,     --     data2        VARCHAR2(4000),
           bagecol   => '',   --bagecol      VARCHAR2(4000),
           bagelabel => '', --bagelabel    VARCHAR2(4000),
           app_page  => null,           -- app_page     number,
           dru_id    => i.PRD_DR_ID,
           dr_id     => i.PRD_DR_ID,           -- dr_id        number,
           prr_id    => i.PR_PRR_ID,
           pr_id     => i.PR_ID,           -- pr_id        number,
           pratr_id  => i.PRATR_ID,
           prd_id    => i.PRD_ID,           -- prr_id       number,
           cptr_id   => i.PRD_CPTR_ID,           -- cptr_id      number,
           drug_img  => i.DR_ITEM_IMAGE1        -- drug_img     blob
        ));
    end loop;
    RETURN;
  END druguse_assembly_ref;

  procedure consume_drug(p_dru_prd_id REHAB_DRUG_USES.dru_prd_id%type,
                         P_DRU_PR_ID REHAB_DRUG_USES.DRU_PR_ID%type,
                         P_DRU_CPTR_ID REHAB_DRUG_USES.DRU_CPTR_ID%type,
                         P_DRU_DR_ID REHAB_DRUG_USES.DRU_DR_ID%type,
                         P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type,
                         P_DRU_ACTUAL_DOSAGE REHAB_DRUG_USES.DRU_ACTUAL_DOSAGE%type)
  is
  begin
    INSERT INTO rehab_drug_uses
       (  dru_id,
          dru_prd_id,  dru_pr_id, dru_PRATR_ID,
          dru_pat_id,
          dru_cptr_id,  dru_dr_id,
          dru_ws_id,
          dru_consumed,dru_actual_dosage)
    VALUES
       (SQ_REHAB_DRUG_USES.nextval,
        p_dru_prd_id,P_DRU_PR_ID, (select PRD_PRATR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_ID = p_dru_prd_id),
        REHAB_CONTEXT_PKG.getPATIENT(),
        P_DRU_CPTR_ID,P_DRU_DR_ID,
        (select DR_WS_ID from REHAB_DRUGS where DR_ID = p_dru_dr_id),
        P_DRU_CONSUMED,
        nvl(P_DRU_ACTUAL_DOSAGE,(select PRD_DOSAGE from REHAB_PRESCRIPTIONS_DETAILS where PRD_ID = p_dru_prd_id))
        );
    REHAB_NOTIFY_API_PKG.add_notification_next_med(P_DRU_PR_ID, P_DRU_CONSUMED);
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

  procedure sort_drugs_in_window(p_tp_id REHAB_TIME_PERIODS.TP_ID%type, p_prd_id REHAB_PRESCRIPTIONS_DETAILS.PRD_ID%type, p_dir varchar2)
  is
    l_swap_prd_id REHAB_PRESCRIPTIONS_DETAILS.PRD_ID%type;
    l_swap_ordr pls_integer;
    type t_sort_ordr is table of number index by pls_integer;
    l_sort_ordr t_sort_ordr;
    l_id        t_sort_ordr;
    l_min       pls_integer;
    l_max       pls_integer;
  begin
    --REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'p_tp_id: "%p", p_prd_id: "%p", p_dir: "%p".',p_tp_id,p_prd_id,p_dir);
    for i in (select PRD_ID, rownum rn from
             (select d.PRD_ID
                from V$REHAB_CONSUME_DATA d, V$REHAB_TIME_PERIODS tp
               where tp.TP_ID = p_tp_id
                 and (CPTR_START_TIME_DT_GDT >= TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT < TP_END_TIME_DT_GDT or
                      CPTR_END_TIME_DT_GDT   >= TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   < TP_END_TIME_DT_GDT)
               order by PRD_SORT_ORDER nulls last))
    loop
      l_sort_ordr(i.rn*10) := i.PRD_ID;
      l_id(i.PRD_ID) := i.rn*10;
      if l_min is null then l_min := i.rn*10; end if;
      l_max := i.rn*10;
      --REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'l_min: %p,l_max: %p',l_min,l_max);
    end loop;

    if p_dir = 'UP' and l_id(p_prd_id) = l_min or p_dir = 'DOWN' and l_id(p_prd_id) = l_max then
      return;
    end if;

    if    p_dir = 'UP'   then l_swap_prd_id := l_sort_ordr(l_sort_ordr.prior(l_id(p_prd_id)));
    elsif p_dir = 'DOWN' then l_swap_prd_id := l_sort_ordr(l_sort_ordr.next (l_id(p_prd_id)));
    end if;
    l_swap_ordr   := l_id(l_swap_prd_id);
    l_id(l_swap_prd_id) := l_id(p_prd_id);

    l_id(p_prd_id) := l_swap_ordr;

    l_min := l_id.first;
    while (l_min is not null)
    loop
      update REHAB_PRESCRIPTIONS_DETAILS set PRD_SORT_ORDER = l_id(l_min) where PRD_ID = l_min;
      l_min := l_id.next(l_min);
    end loop;
  end;
--  procedure refresh_cahce_rehab_rb_balance_cache
--  is
--  begin
--    select max(created_ts)
--      from rehab_v$rb_balance_cache
--  end;

END REHAB_DRUGUSE_PKG;
/

