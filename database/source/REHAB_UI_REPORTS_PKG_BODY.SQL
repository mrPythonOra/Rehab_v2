


  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_UI_REPORTS_PKG" AS

  function dashboard_ref return rehab_dashboard_tab pipelined AS
    l_msg varchar2(4000);
    l_msg2 varchar2(4000);
    l_target_char varchar2(100):= '<span style="color: cyan;">'||UNISTR('\29BF')||'</span>';
    l_badge varchar2(100);
    --**************************************************************************
    procedure get_stat_msg3(p_msg in out nocopy varchar2, p_name varchar2, p_val1_curr number, p_val2_curr number, p_val3_curr number, p_val1_prev number, p_val2_prev number, p_val3_prev number)
    is
    begin
        p_msg := p_msg || case when p_msg is not null then '<br>' else null end || --UNISTR('\2764')||
                         '<b>' || p_name || ':</b> (awg/min/max): '||
                          case when p_val1_curr is not null then p_val1_curr||
                               case when nvl(p_val1_prev,p_val1_curr) < p_val1_curr then UNISTR('\2191')
                                    when nvl(p_val1_prev,p_val1_curr) > p_val1_curr then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when p_val1_prev is not null then '('||p_val1_prev||') / ' else '- / ' end ||
                          case when p_val2_curr is not null then p_val2_curr||
                               case when nvl(p_val2_prev,p_val2_curr) < p_val2_curr then UNISTR('\2191')
                                    when nvl(p_val2_prev,p_val2_curr) > p_val2_curr then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when p_val2_prev is not null then '('||p_val2_prev||') / ' else '- / ' end ||
                          case when p_val3_curr is not null then p_val3_curr||
                               case when nvl(p_val3_prev,p_val3_curr) < p_val3_curr then UNISTR('\2191')
                                    when nvl(p_val3_prev,p_val3_curr) > p_val3_curr then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when p_val3_prev is not null then '('||p_val3_prev||')' else '-' end;
    end;
    --**************************************************************************
    procedure get_stat_msg2(p_msg in out nocopy varchar2, p_name varchar2, p_val1_curr number, p_val2_curr number, p_val1_prev number, p_val2_prev number)
    is
    begin
        p_msg :=p_msg || nvl2(p_msg,'<br>',null) || '<b>'||
                p_name||':</b> '||case when p_val1_curr is not null then p_val1_curr ||
                                       case when nvl(p_val1_prev,p_val1_curr) < p_val1_curr then UNISTR('\2191')
                                            when nvl(p_val1_prev,p_val1_curr) > p_val1_curr then UNISTR('\2193')
                                       else null end
                                  else '-'
                                  end || case when p_val1_prev is not null then '('||p_val1_prev||')' else null end
                                  ||' / '||
                                  case when p_val2_curr is not null then p_val2_curr ||
                                       case when nvl(p_val2_prev,p_val2_curr) < p_val2_curr then UNISTR('\2191')
                                            when nvl(p_val2_prev,p_val2_curr) > p_val2_curr then UNISTR('\2193')
                                       else null end
                                  else '-'
                                  end || case when p_val2_prev is not null then '('||p_val2_prev||')' else null end;
    end;
    --**************************************************************************
    procedure get_stat_msg(p_msg in out nocopy varchar2, p_name varchar2, p_val_curr number, p_val_prev number, p_delim varchar2 default ' ')
    is
    begin
        p_msg := p_msg || nvl2(p_msg,p_delim,null) ||
                         '<b>'||p_name||':</b> '||
                          case when p_val_curr is not null then p_val_curr ||
                               case when nvl(p_val_prev,p_val_curr) < p_val_curr then UNISTR('\2191')
                                    when nvl(p_val_prev,p_val_curr) > p_val_curr then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when p_val_prev is not null then '('||p_val_prev||')' else null end;
    end;
    --**************************************************************************
    procedure get_target_msg2(p_msg in out nocopy varchar2, p_name varchar2, p_val1 number, p_val2 number, p_par_min1 varchar2, p_par_max1 varchar2, p_par_min2 varchar2, p_par_max2 varchar2)
    is
    begin
        if REHAB_CONFIG_PKG.get_config_par('DBTRG_SHOW') = REHAB_CONFIG_PKG.cnstY
        then
          p_msg := p_msg || nvl2(p_msg,' ',null) || p_name||': '||
                                    REHAB_CONFIG_PKG.get_config_par(p_par_min1)||'/'||REHAB_CONFIG_PKG.get_config_par(p_par_min2) || UNISTR('\00F7') ||
                                    REHAB_CONFIG_PKG.get_config_par(p_par_max1)||'/'||REHAB_CONFIG_PKG.get_config_par(p_par_max2)
                                    ||' '
                           || case when p_val1 between REHAB_CONFIG_PKG.get_config_par(p_par_min1) and REHAB_CONFIG_PKG.get_config_par(p_par_max1)
                                    and p_val2 between REHAB_CONFIG_PKG.get_config_par(p_par_min2) and REHAB_CONFIG_PKG.get_config_par(p_par_max2)
                                   then '<span style="color: lime;">'||UNISTR('\2714')||'</span>' else '<span style="color: yellow;">'||UNISTR('\2718')||'</span>' end;
        end if;
    end;
    --**************************************************************************
    procedure get_target_msg(p_msg in out nocopy varchar2, p_name varchar2, p_val number, p_par_min varchar2, p_par_max varchar2)
    is
    begin
        if REHAB_CONFIG_PKG.get_config_par('DBTRG_SHOW') = REHAB_CONFIG_PKG.cnstY then
          p_msg := p_msg || nvl2(p_msg,' ',null) || p_name||': '||REHAB_CONFIG_PKG.get_config_par(p_par_min)||UNISTR('\00F7')|| REHAB_CONFIG_PKG.get_config_par(p_par_max) || ' ' ||
                              case when p_val between REHAB_CONFIG_PKG.get_config_par(p_par_min) and REHAB_CONFIG_PKG.get_config_par(p_par_max)
                              then '<span style="color: lime;">'||UNISTR('\2714')||'</span>' else '<span style="color: yellow;">'||UNISTR('\2718')||'</span>' end;
        end if;
    end;
    --**************************************************************************
    procedure get_target_msg0(p_msg in out nocopy varchar2, p_name varchar2, p_val number, p_par_trg varchar2, p_measure varchar2)
    is
    begin
        if REHAB_CONFIG_PKG.get_config_par('DBTRG_SHOW') = REHAB_CONFIG_PKG.cnstY
        then
          p_msg := p_msg || nvl2(p_msg,' ',null) ||REHAB_CONFIG_PKG.get_config_par(p_par_trg)||' ' || p_measure || ' '||
                    case when p_val >= REHAB_CONFIG_PKG.get_config_par(p_par_trg)
                         then '<span style="color: lime;">'||UNISTR('\2714')||'</span>' else '<span style="color: yellow;">'||UNISTR('\2718')||'</span>' end;
        end if;
    end;
  BEGIN
    l_msg := null; l_msg2 := l_target_char; l_badge := null;
    for i in (
    select
            round(max(c_cnt)) c_cnt,
            round(avg(c_pr_sys)) c_pr_sys,
            round(avg(c_pr_dia)) c_pr_dia,
            round(avg(c_pulse)) c_pulse,
            round(avg(c_wei),2) c_wei,
            round(avg(c_temp),2) c_temp,
            round(avg(c_sug),2) c_sug,
            round(avg(c_oxi),2) c_oxi,
            round(avg(p_pr_sys)) p_pr_sys,
            round(avg(p_pr_dia)) p_pr_dia,
            round(avg(p_pulse)) p_pulse,
            round(avg(p_wei),2) p_wei,
            round(avg(p_temp),2) p_temp,
            round(avg(p_sug),2) p_sug,
            round(avg(p_oxi),2) p_oxi
    from (
        select
               count(*) FILTER (WHERE trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_cnt,
               avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_pr_sys,
               avg(MT_PRESSURE_DIA) FILTER (WHERE MT_PRESSURE_DIA is not null and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_pr_dia,
               avg(MT_PULSE)        FILTER (WHERE MT_PULSE is not null        and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_pulse,
               avg(MT_WEIGHT)       FILTER (WHERE MT_WEIGHT is not null       and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_wei,
               avg(MT_TEMPERATURE)  FILTER (WHERE MT_TEMPERATURE is not null  and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_temp,
               avg(MT_SUGAR)        FILTER (WHERE MT_SUGAR is not null        and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_sug,
               avg(MT_OXIGENATION)  FILTER (WHERE MT_OXIGENATION is not null  and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_oxi,
               avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_pr_sys,
               avg(MT_PRESSURE_DIA) FILTER (WHERE MT_PRESSURE_DIA is not null and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_pr_dia,
               avg(MT_PULSE)        FILTER (WHERE MT_PULSE is not null        and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_pulse,
               avg(MT_WEIGHT)       FILTER (WHERE MT_WEIGHT is not null       and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_wei,
               avg(MT_TEMPERATURE)  FILTER (WHERE MT_TEMPERATURE is not null  and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_temp,
               avg(MT_SUGAR)        FILTER (WHERE MT_SUGAR is not null        and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_sug,
               avg(MT_OXIGENATION)  FILTER (WHERE MT_OXIGENATION is not null  and trunc(MT_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_oxi
          from REHAB_MEASUREMENTS
         where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
           and trunc(MT_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_MEAS') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()
         group by trunc(MT_TAKEN))
    ) loop
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PRESSURE') = REHAB_CONFIG_PKG.cnstY and (i.c_pr_sys is not null or i.c_pr_dia is not null) then
        get_stat_msg2(p_msg => l_msg, p_name => 'Тиск', p_val1_curr => i.c_pr_sys, p_val2_curr => i.c_pr_dia, p_val1_prev => i.p_pr_sys, p_val2_prev => i.p_pr_dia);
        get_target_msg2(p_msg => l_msg2, p_name => 'Тиск', p_val1 => i.c_pr_sys, p_val2 => i.c_pr_dia, p_par_min1 => 'DBTRG_PSYS_MIN', p_par_max1 => 'DBTRG_PSYS_MAX', p_par_min2 => 'DBTRG_PDIA_MIN', p_par_max2 => 'DBTRG_PDIA_MAX');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PULSE') = REHAB_CONFIG_PKG.cnstY and i.c_pulse is not null then
        get_stat_msg(p_msg => l_msg, p_name => 'Пульс', p_val_curr => i.c_pulse, p_val_prev => i.p_pulse);
        get_target_msg(p_msg => l_msg2, p_name => 'Пульс', p_val => i.c_pulse, p_par_min => 'DBTRG_PULSE_MIN', p_par_max => 'DBTRG_PULSE_MAX');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_WEIGHT') = REHAB_CONFIG_PKG.cnstY and i.c_wei is not null then
        get_stat_msg(p_msg => l_msg, p_name => 'Вага', p_val_curr => i.c_wei, p_val_prev => i.p_wei, p_delim => '<br>');
        get_target_msg(p_msg => l_msg2, p_name => 'Вага', p_val => i.c_wei, p_par_min => 'DBTRG_WEIGHT_MIN', p_par_max => 'DBTRG_WEIGHT_MAX');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_TEMPR') = REHAB_CONFIG_PKG.cnstY and i.c_temp is not null then
        get_stat_msg(p_msg => l_msg, p_name => 'Температура', p_val_curr => i.c_temp, p_val_prev => i.p_temp, p_delim => '<br>');
        get_target_msg(p_msg => l_msg2, p_name => 'Температура', p_val => i.c_temp, p_par_min => 'DBTRG_TEMPR_MIN', p_par_max => 'DBTRG_TEMPR_MAX');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_SUGAR') = REHAB_CONFIG_PKG.cnstY and i.c_sug is not null then
        get_stat_msg(p_msg => l_msg, p_name => 'Цукор', p_val_curr => i.c_sug, p_val_prev => i.p_sug, p_delim => ' ');
        get_target_msg(p_msg => l_msg2, p_name => 'Цукор', p_val => i.c_sug, p_par_min => 'DBTRG_SUGAR_MIN', p_par_max => 'DBTRG_SUGAR_MAX');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_OXY') = REHAB_CONFIG_PKG.cnstY and i.c_oxi is not null then
        get_stat_msg(p_msg => l_msg, p_name => 'Кисень', p_val_curr => i.c_oxi, p_val_prev => i.p_oxi, p_delim => ' ');
        get_target_msg(p_msg => l_msg2, p_name => 'Кисень', p_val => i.c_oxi, p_par_min => 'DBTRG_OXI_MIN', p_par_max => 'DBTRG_OXI_MAX');
      end if;
      l_badge := nvl(i.c_cnt||'',l_badge);
    end loop;
    pipe row (rehab_dashboard_rec
                           (id        => 1,
                            mainlabel => 'Вимірювання',
                            sublabel  => l_msg2,
                            data1     => nvl(l_msg, 'Немає даних'),
                            data2     => 'Попередній період: '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_MEAS') - 1,'YYYY-MON-DD')||' -- '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1,'YYYY-MON-DD'),
                            iconfile  => 'fa-ruler-combination',
                            bagecol   => l_badge,
                            bagelabel => null,
                            app_page  => 201));
    --**************************************************************************
    l_msg := null; l_msg2 := l_target_char; l_badge := null;
    for i in (
    select
            round(max(c_cnt)) c_cnt,
            round(avg(c_dist),3) c_dist,
            round(avg(c_steps)) c_steps,
            round(avg(c_min)) c_min,
            round(avg(c_max)) c_max,
            round(avg(c_avg)) c_avg,
            round(avg(p_dist),3) p_dist,
            round(avg(p_steps)) p_steps,
            round(avg(p_min)) p_min,
            round(avg(p_max)) p_max,
            round(avg(p_avg)) p_avg
    from (
    select
           count(*) FILTER (WHERE trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_cnt,
           sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null and trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_dist,
           sum(TR_STEPS)           FILTER (WHERE TR_STEPS is not null           and trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_steps,
           avg(TR_PULSE_AVG)       FILTER (WHERE TR_PULSE_AVG is not null       and trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_avg,
           avg(TR_PULSE_MIN)       FILTER (WHERE TR_PULSE_MIN is not null       and trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_min,
           avg(TR_PULSE_MAX)       FILTER (WHERE TR_PULSE_MAX is not null       and trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_max,
           sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null and trunc(TR_START)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_dist,
           sum(TR_STEPS)           FILTER (WHERE TR_STEPS is not null           and trunc(TR_START)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_steps,
           avg(TR_PULSE_AVG)       FILTER (WHERE TR_PULSE_AVG is not null       and trunc(TR_START)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_avg,
           avg(TR_PULSE_MIN)       FILTER (WHERE TR_PULSE_MIN is not null       and trunc(TR_START)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_min,
           avg(TR_PULSE_MAX)       FILTER (WHERE TR_PULSE_MAX is not null       and trunc(TR_START)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_max
          from REHAB_TRAININGS
     where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
       and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAI') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()
     group by trunc(TR_START))
    ) loop
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_DISTANCE') = REHAB_CONFIG_PKG.cnstY --and i.c_dist is not null
      then
        get_stat_msg(p_msg => l_msg, p_name => 'Дистанція', p_val_curr => i.c_dist, p_val_prev => i.p_dist, p_delim => ' ');
        get_target_msg0(p_msg => l_msg2, p_name => null, p_val => i.c_dist, p_par_trg => 'DBTRG_TRAINDIST', p_measure => 'км');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_STEPS') = REHAB_CONFIG_PKG.cnstY --and i.c_steps is not null
      then
        get_stat_msg(p_msg => l_msg, p_name => 'Кроки', p_val_curr => i.c_steps, p_val_prev => i.p_steps, p_delim => ' ');
        get_target_msg0(p_msg => l_msg2, p_name => null, p_val => i.c_steps, p_par_trg => 'DBTRG_TRAINSTEPS', p_measure => 'кроків');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.c_avg is not null or i.c_min is not null or i.c_max is not null) then
        get_stat_msg3(p_msg => l_msg, p_name => 'Пульс', p_val1_curr => i.c_avg, p_val2_curr => i.c_min, p_val3_curr => i.c_max,
                                                         p_val1_prev => i.p_avg, p_val2_prev => i.p_min, p_val3_prev => i.p_max);
      end if;
      l_badge := nvl(i.c_cnt||'',l_badge);
    end loop;
    --**************************************************************************
    pipe row (rehab_dashboard_rec
                           (id        => 2,
                            mainlabel => 'Тренування',
                            sublabel  => l_msg2,
                            data1     => nvl(l_msg, 'Немає даних'),
                            data2     => 'Попередній період: '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAI') - 1,'YYYY-MON-DD')||' -- '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1,'YYYY-MON-DD'),
                            iconfile  => 'fa-person-running-fast',
                            bagecol   => l_badge,
                            bagelabel => '',
                            app_page  => 211));
    --**************************************************************************
    l_msg := null; l_msg2 := l_target_char; l_badge := null;
    for i in (
     select round(avg(c_steps)) c_steps,
            round(avg(c_min)) c_min,
            round(avg(c_max)) c_max,
            round(avg(c_avg)) c_avg,
            round(avg(p_steps)) p_steps,
            round(avg(p_min)) p_min,
            round(avg(p_max)) p_max,
            round(avg(p_avg)) p_avg
      from (
        select sum(WL_STEPS)           FILTER (WHERE WL_STEPS is not null           and trunc(WL_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_steps,
               avg(WL_NIGHT_MIN_PULSE) FILTER (WHERE WL_NIGHT_MIN_PULSE is not null and trunc(WL_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_min,
               avg(WL_NIGHT_MAX_PULSE) FILTER (WHERE WL_NIGHT_MAX_PULSE is not null and trunc(WL_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_max,
               avg(WL_NIGHT_AVG_PULSE) FILTER (WHERE WL_NIGHT_AVG_PULSE is not null and trunc(WL_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_avg,
               sum(WL_STEPS)           FILTER (WHERE WL_STEPS is not null           and trunc(WL_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_steps,
               avg(WL_NIGHT_MIN_PULSE) FILTER (WHERE WL_NIGHT_MIN_PULSE is not null and trunc(WL_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_min,
               avg(WL_NIGHT_MAX_PULSE) FILTER (WHERE WL_NIGHT_MAX_PULSE is not null and trunc(WL_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_max,
               avg(WL_NIGHT_AVG_PULSE) FILTER (WHERE WL_NIGHT_AVG_PULSE is not null and trunc(WL_TAKEN)<REHAB_CONTEXT_PKG.getGLOBAL_DATE()) p_avg
          from REHAB_WATCH_LOGS
     where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
       and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAK') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()
       group by trunc(WL_TAKEN))
    ) loop
      if REHAB_CONFIG_PKG.get_config_par('DBWAT_STEPS') = REHAB_CONFIG_PKG.cnstY and not(i.c_steps is null and i.p_steps is null) then
        get_stat_msg(p_msg => l_msg, p_name => 'Кроки', p_val_curr => i.c_steps, p_val_prev => i.p_steps, p_delim => ' ');
        get_target_msg0(p_msg => l_msg2, p_name => null, p_val => i.c_steps, p_par_trg => 'DBTRG_ALLSTEPS', p_measure => 'кроків');
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBWAT_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.c_avg is not null or i.c_min is not null or i.c_max is not null) then
        get_stat_msg3(p_msg => l_msg, p_name => 'Пульс', p_val1_curr => i.c_avg, p_val2_curr => i.c_min, p_val3_curr => i.c_max,
                                                         p_val1_prev => i.p_avg, p_val2_prev => i.p_min, p_val3_prev => i.p_max);
      end if;
    end loop;
    --**************************************************************************
    pipe row (rehab_dashboard_rec
                           (id        => 3,
                            mainlabel => 'Трекери',
                            sublabel  => l_msg2,
                            data1     => nvl(l_msg, 'Немає даних'),
                            --'За: ' || to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1)||
                            data2     => 'Попередній період: '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAK') - 1,'YYYY-MON-DD')||' -- '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1,'YYYY-MON-DD'),
                            iconfile  => 'fa-calendar-heart',
                            bagecol   => '',
                            bagelabel => '''',
                            app_page  => 221));
    --**************************************************************************
    l_msg := null; l_badge := null;
    for i in (
        select
          stor.PAT_ID, stor.DR_ID,
          DA_STORED_AMOUNT, DRU_CONSUMED,
          DA_STORED_AMOUNT - DRU_CONSUMED BALANCE,
          days_planned,PRD_DOSAGE_PLANNED,
          daily_dose,
          round((DA_STORED_AMOUNT - DRU_CONSUMED)/daily_dose,1) days_remain,
          DR_NAME
        from
            (select P2S_PAT_ID PAT_ID, DA_DR_ID DR_ID,sum(DA_QUANTITY*DA_ENTIRY_WEIGHT) DA_STORED_AMOUNT, min(DA_CHECK_POINT_DT) DA_CHECK_POINT_DT
               from REHAB_DRUG_ACCOUNTINGS A, REHAB_PATIENT2STORAGES P2S
              where A.DA_DS_ID = P2S.P2S_DS_ID and P2S.P2S_IS_OWNER
                and DA_CHECK_POINT_DT <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
              group by P2S_PAT_ID, DA_DR_ID) stor,
            lateral
            (select DRU_PAT_ID PAT_ID, DRU_DR_ID DR_ID, sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT) DRU_CONSUMED
               from REHAB_DRUG_USES c
              where stor.PAT_ID=c.DRU_PAT_ID and stor.DR_ID=c.DRU_DR_ID
                and DRU_CONSUMED <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                and DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
              group by DRU_PAT_ID, DRU_DR_ID) cons,
             (select PR_PAT_ID PAT_ID, PR_DR_ID DR_ID, sum(days_planned) days_planned,
                       sum(PRD_DOSAGE * days_planned ) PRD_DOSAGE_PLANNED,
                       sum(PRD_DOSAGE) daily_dose
                from (select * from REHAB_PRESCRIPTIONS
                       where (PR_PLANNED_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PR_PLANNED_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE())>=REHAB_CONTEXT_PKG.getGLOBAL_DATE()
                          or PR_PLANNED_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE())
                         and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()) PR,
                     (select A.*,
                             case when PRATR_ACTUAL_END is null then 30
                                  else case when PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() then (PRATR_ACTUAL_END+0) - REHAB_CONTEXT_PKG.getGLOBAL_DATE() + 1
                                            else (PRATR_ACTUAL_END+0) - (PRATR_ACTUAL_START+0) + 1
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
          and stor.PAT_ID=planned.PAT_ID and stor.DR_ID=planned.DR_ID
          and (DA_STORED_AMOUNT - DRU_CONSUMED)/daily_dose < to_number(REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT'))
        order by days_remain desc
    )
    loop
      l_msg := l_msg || '<b>' || i.DR_NAME || '</b> запасів на ' || i.days_remain || ' дні(в)<br>';
    end loop;
    --**************************************************************************
    l_msg := rtrim(l_msg,'<br>');
    pipe row (rehab_dashboard_rec
                           (id        => 4,
                            mainlabel => 'Залишки',
                            sublabel  => '',
                            data1     => nvl(l_msg, 'Всі ліки в достатній кількості'),
                            data2     => 'На період ' ||REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')|| ' дні(в)',
                            iconfile  => 'fa-medication-pill-bottle',
                            bagecol   => '',
                            bagelabel => '',
                            app_page  => 301));
    --**************************************************************************
    RETURN;
  END dashboard_ref;

END REHAB_UI_REPORTS_PKG;
/


