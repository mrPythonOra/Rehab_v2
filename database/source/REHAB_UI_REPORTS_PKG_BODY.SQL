


  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_UI_REPORTS_PKG" AS

  function dashboard_ref return dashboard_tab pipelined AS
    l_msg varchar2(4000);
--    l_pr_sys number;
--    l_pr_dia number;
--    l_pulse number;
--    l_wei number;
--    l_temp number;
--    l_sug number;
--    l_oxi number;
--    l_dist number;
--    l_steps number;
--    l_p_avg number;
--    l_p_min number;
--    l_p_max number;
  BEGIN
    l_msg := null;
    for i in (
    select  round(avg(c_pr_sys)) c_pr_sys,
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
        select avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null and trunc(MT_TAKEN)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_pr_sys,
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
        l_msg :='<b>Тиск:</b> '||case when i.c_pr_sys is not null then i.c_pr_sys ||
                               case when nvl(i.p_pr_sys,i.c_pr_sys) < i.c_pr_sys then UNISTR('\2191')
                                    when nvl(i.p_pr_sys,i.c_pr_sys) > i.c_pr_sys then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_pr_sys is not null then '('||i.p_pr_sys||')' else null end
                          ||' / '||
                          case when i.c_pr_dia is not null then i.c_pr_dia ||
                               case when nvl(i.p_pr_dia,i.c_pr_dia) < i.c_pr_dia then UNISTR('\2191')
                                    when nvl(i.p_pr_dia,i.c_pr_dia) > i.c_pr_dia then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_pr_dia is not null then '('||i.p_pr_dia||')' else null end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PULSE') = REHAB_CONFIG_PKG.cnstY and i.c_pulse is not null then
        l_msg := l_msg || case when l_msg is not null then ', ' else null end ||
                         '<b>Пульс:</b> '||
                          case when i.c_pulse is not null then i.c_pulse ||
                               case when nvl(i.p_pulse,i.c_pulse) < i.c_pulse then UNISTR('\2191')
                                    when nvl(i.p_pulse,i.c_pulse) > i.c_pulse then UNISTR('\2193')
                               else null end
                          else '-'
                          end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_WEIGHT') = REHAB_CONFIG_PKG.cnstY and i.c_wei is not null then
        l_msg := l_msg || case when l_msg is not null then '<br>' else null end ||
                         '<b>Вага:</b> '||
                          case when i.c_wei is not null then i.c_wei ||
                               case when nvl(i.p_wei,i.c_wei) < i.c_wei then UNISTR('\2191')
                                    when nvl(i.p_wei,i.c_wei) > i.c_wei then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_wei is not null then '('||i.p_wei||')' else null end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_TEMPR') = REHAB_CONFIG_PKG.cnstY and i.c_temp is not null then
        l_msg := l_msg || case when l_msg is not null then '<br>' else null end ||
                          '<b>Температура:</b> '||
                          case when i.c_temp is not null then i.c_temp ||
                               case when nvl(i.p_temp,i.c_temp) < i.c_temp then UNISTR('\2191')
                                    when nvl(i.p_temp,i.c_temp) > i.c_temp then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_temp is not null then '('||i.p_temp||')' else null end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_SUGAR') = REHAB_CONFIG_PKG.cnstY and i.c_sug is not null then
        l_msg := l_msg || case when l_msg is not null then ' ' else null end || 'Цукор: '||
                          case when i.c_sug is not null then i.c_sug ||
                               case when nvl(i.p_sug,i.c_sug) < i.c_sug then UNISTR('\2191')
                                    when nvl(i.p_sug,i.c_sug) > i.c_sug then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_sug is not null then '('||i.p_sug||')' else null end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_OXY') = REHAB_CONFIG_PKG.cnstY and i.c_oxi is not null then
        l_msg := l_msg || case when l_msg is not null then ' ' else null end ||
                          '<b>Кисень:</b> '||
                          case when i.c_oxi is not null then i.c_oxi ||
                               case when nvl(i.p_oxi,i.c_oxi) < i.c_oxi then UNISTR('\2191')
                                    when nvl(i.p_oxi,i.c_oxi) > i.c_oxi then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_oxi is not null then '('||i.p_oxi||')' else null end;
      end if;
    end loop;
--    for i in (
--        select round(avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null)) pr_sys,
--               round(avg(MT_PRESSURE_DIA) FILTER (WHERE MT_PRESSURE_DIA is not null)) pr_dia,
--               round(avg(MT_PULSE) FILTER (WHERE MT_PULSE is not null)) pulse,
--               round(avg(MT_WEIGHT) FILTER (WHERE MT_WEIGHT is not null),1) wei,
--               round(avg(MT_TEMPERATURE) FILTER (WHERE MT_TEMPERATURE is not null),1) temp,
--               round(avg(MT_SUGAR) FILTER (WHERE MT_SUGAR is not null),2) sug,
--               round(avg(MT_OXIGENATION) FILTER (WHERE MT_OXIGENATION is not null),1) oxi
--          from REHAB_MEASUREMENTS
--         where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(MT_TAKEN) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--    ) loop
--        for j in (
--        select  round(avg(pr_sys)) pr_sys,
--                round(avg(pr_dia)) pr_dia,
--                round(avg(pulse)) pulse,
--                round(avg(wei)) wei,
--                round(avg(temp)) temp,
--                round(avg(sug)) sug,
--                round(avg(oxi)) oxi
--        from (
--            select round(avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null)) pr_sys,
--                   round(avg(MT_PRESSURE_DIA) FILTER (WHERE MT_PRESSURE_DIA is not null)) pr_dia,
--                   round(avg(MT_PULSE) FILTER (WHERE MT_PULSE is not null)) pulse,
--                   round(avg(MT_WEIGHT) FILTER (WHERE MT_WEIGHT is not null),1) wei,
--                   round(avg(MT_TEMPERATURE) FILTER (WHERE MT_TEMPERATURE is not null),1) temp,
--                   round(avg(MT_SUGAR) FILTER (WHERE MT_SUGAR is not null),2) sug,
--                   round(avg(MT_OXIGENATION) FILTER (WHERE MT_OXIGENATION is not null),1) oxi
--              from REHAB_MEASUREMENTS
--             where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
--               and trunc(MT_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_MEAS') and REHAB_CONTEXT_PKG.getGLOBAL_DATE() - 1
--             group by trunc(MT_TAKEN))
--        ) loop
--          l_pr_sys := j.pr_sys; l_pr_dia := j.pr_dia; l_pulse := j.pulse; l_wei := j.wei; l_temp := j.temp; l_sug := j.sug; l_oxi := j.oxi;
--        end loop;
--      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PRESSURE') = REHAB_CONFIG_PKG.cnstY and (i.pr_sys is not null or i.pr_dia is not null) then
--        l_msg :='Тиск: '||case when i.pr_sys is not null then
--                               case when nvl(l_pr_sys,i.pr_sys) < i.pr_sys then i.pr_sys||UNISTR('\2191')
--                                    when nvl(l_pr_sys,i.pr_sys) > i.pr_sys then i.pr_sys||UNISTR('\2193')
--                               else i.pr_sys||'' end
--                          else '-'
--                          end
--                ||'/'||
--                          case when i.pr_dia is not null then
--                               case when nvl(l_pr_dia,i.pr_dia) < i.pr_dia then i.pr_dia||UNISTR('\2191')
--                                    when nvl(l_pr_dia,i.pr_dia) > i.pr_dia then i.pr_dia||UNISTR('\2193')
--                               else i.pr_dia||'' end
--                          else '-'
--                          end ||'; ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PULSE') = REHAB_CONFIG_PKG.cnstY and i.pulse is not null then
--        l_msg := l_msg ||'Пульс: '||case when i.pulse is not null then
--                               case when nvl(l_pulse,i.pulse) < i.pulse then i.pulse||UNISTR('\2191')
--                                    when nvl(l_pulse,i.pulse) > i.pulse then i.pulse||UNISTR('\2193')
--                               else i.pulse||'' end
--                          else '-'
--                          end||'; ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBMEA_WEIGHT') = REHAB_CONFIG_PKG.cnstY and i.wei is not null then
--        l_msg := l_msg ||'Вага: '||case when i.wei is not null then
--                               case when nvl(l_wei,i.wei) < i.wei then i.wei||UNISTR('\2191')
--                                    when nvl(l_wei,i.wei) > i.wei then i.wei||UNISTR('\2193')
--                               else i.wei||'' end
--                          else '-'
--                          end||case when l_wei is not null then '('||l_wei||')' else '; ' end;
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBMEA_TEMPR') = REHAB_CONFIG_PKG.cnstY and i.temp is not null then
--        l_msg := l_msg ||'Температура: '||case when i.temp is not null then
--                               case when nvl(l_temp,i.temp) < i.temp then i.temp||UNISTR('\2191')
--                                    when nvl(l_temp,i.temp) > i.temp then i.temp||UNISTR('\2193')
--                               else i.temp||'' end
--                          else '-'
--                          end||'; ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBMEA_SUGAR') = REHAB_CONFIG_PKG.cnstY and i.sug is not null then
--        l_msg := l_msg ||'Цукор: '||case when i.sug is not null then
--                               case when nvl(l_sug,i.sug) < i.sug then i.sug||UNISTR('\2191')
--                                    when nvl(l_sug,i.sug) > i.sug then i.sug||UNISTR('\2193')
--                               else i.sug||'' end
--                          else '-'
--                          end||'; ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBMEA_OXY') = REHAB_CONFIG_PKG.cnstY and i.oxi is not null then
--        l_msg := l_msg ||'Кисень: '||case when i.oxi is not null then
--                               case when nvl(l_oxi,i.oxi) < i.oxi then i.oxi||UNISTR('\2191')
--                                    when nvl(l_oxi,i.oxi) > i.oxi then i.oxi||UNISTR('\2193')
--                               else i.oxi||'' end
--                          else '-'
--                          end||'; ';
--      end if;
--    end loop;
    pipe row (dashboard_rec('Вимірювання',
                             nvl(l_msg, 'Немає даних'),
                             'Попередній період: '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_MEAS') - 1,'YYYY-MON-DD')||' -- '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1,'YYYY-MON-DD'),
                             201));
    --**************************************************************************
    l_msg := null;
    for i in (
    select  round(avg(c_dist),3) c_dist,
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
    select sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null and trunc(TR_START)=REHAB_CONTEXT_PKG.getGLOBAL_DATE()) c_dist,
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
        l_msg :='<b>Дистанція:</b> '||
                          case when i.c_dist is not null then i.c_dist ||
                               case when nvl(i.p_dist,i.c_dist) < i.c_dist then UNISTR('\2191')
                                    when nvl(i.p_dist,i.c_dist) > i.c_dist then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_dist is not null then '('||i.p_dist||')' else null end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_STEPS') = REHAB_CONFIG_PKG.cnstY --and i.c_steps is not null
      then
        l_msg := l_msg || case when l_msg is not null then '<br>' else null end ||
                          '<b>Кроки:</b> '||
                          case when i.c_steps is not null then i.c_steps ||
                               case when nvl(i.p_steps,i.c_steps) < i.c_steps then UNISTR('\2191')
                                    when nvl(i.p_steps,i.c_steps) > i.c_steps then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_steps is not null then '('||i.p_steps||')' else null end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.c_avg is not null or i.c_min is not null or i.c_max is not null) then
        l_msg := l_msg || case when l_msg is not null then '<br>' else null end ||
                          '<b>Пульс</b> (awg/min/max): '||
                          case when i.p_avg is not null then i.p_avg||
                               case when nvl(i.p_avg,i.c_avg) < i.c_avg then UNISTR('\2191')
                                    when nvl(i.p_avg,i.c_avg) > i.c_avg then UNISTR('\2193')
                               else null end
                          else '-'
                          end ||'('||i.p_avg||') / '||
                          case when i.c_min is not null then i.c_min||
                               case when nvl(i.p_min,i.c_min) < i.c_min then UNISTR('\2191')
                                    when nvl(i.p_min,i.c_min) > i.c_min then UNISTR('\2193')
                               else null end
                          else '-'
                          end ||'('||i.p_min||') / '||
                          case when i.c_max is not null then i.c_max||
                               case when nvl(i.p_max,i.c_max) < i.c_max then UNISTR('\2191')
                                    when nvl(i.p_max,i.c_max) > i.c_max then UNISTR('\2193')
                               else null end
                          else '-'
                          end ||'('||i.p_max||')';
      end if;
    end loop;
    --**************************************************************************
--    for i in (
--        select round(sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null),3) dist,
--               round(sum(TR_STEPS) FILTER (WHERE TR_STEPS is not null)) steps,
--               round(avg(TR_PULSE_AVG) FILTER (WHERE TR_PULSE_AVG is not null)) p_avg,
--               round(avg(TR_PULSE_MIN) FILTER (WHERE TR_PULSE_MIN is not null),1) p_min,
--               round(avg(TR_PULSE_MAX) FILTER (WHERE TR_PULSE_MAX is not null),1) p_max
--          from REHAB_TRAININGS
--         where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(TR_START) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--    ) loop
--        for j in (
--        select  round(avg(dist),3) dist,
--                round(avg(steps)) steps,
--                round(avg(p_min)) p_min,
--                round(avg(p_max)) p_max,
--                round(avg(p_avg)) p_avg
--        from (
--        select round(sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null),3) dist,
--               round(sum(TR_STEPS) FILTER (WHERE TR_STEPS is not null)) steps,
--               round(avg(TR_PULSE_AVG) FILTER (WHERE TR_PULSE_AVG is not null)) p_avg,
--               round(avg(TR_PULSE_MIN) FILTER (WHERE TR_PULSE_MIN is not null),1) p_min,
--               round(avg(TR_PULSE_MAX) FILTER (WHERE TR_PULSE_MAX is not null),1) p_max
--              from REHAB_TRAININGS
--         where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
--           and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAI') and REHAB_CONTEXT_PKG.getGLOBAL_DATE() - 1
--         group by trunc(TR_START))
--        ) loop
--          l_dist := j.dist; l_steps := j.steps; l_p_avg := j.p_avg; l_p_min := j.p_min; l_p_max := j.p_max;
--        end loop;
--      if REHAB_CONFIG_PKG.get_config_par('DBTRA_DISTANCE') = REHAB_CONFIG_PKG.cnstY and i.dist is not null then
--        l_msg :='Дистанція: '||case when i.dist is not null then
--                               case when nvl(l_dist,i.dist) < i.dist then i.dist||UNISTR('\2191')
--                                    when nvl(l_dist,i.dist) > i.dist then i.dist||UNISTR('\2193')
--                               else i.dist||'' end
--                          else '-'
--                          end||'('||l_dist||'); ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBTRA_STEPS') = REHAB_CONFIG_PKG.cnstY and i.steps is not null then
--        l_msg := l_msg || 'Кроки: '||case when i.steps is not null then
--                               case when nvl(l_steps,i.steps) < i.steps then i.steps||UNISTR('\2191')
--                                    when nvl(l_steps,i.steps) > i.steps then i.steps||UNISTR('\2193')
--                               else i.steps||'' end
--                          else '-'
--                          end||'('||l_steps||'); ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBTRA_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.p_avg is not null or i.p_min is not null or i.p_max is not null) then
--        l_msg := l_msg || '<br>Пульс (awg/min/max): '||
--                          case when i.p_avg is not null then i.p_avg||
--                               case when nvl(l_p_avg,i.p_avg) < i.p_avg then UNISTR('\2191')
--                                    when nvl(l_p_avg,i.p_avg) > i.p_avg then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_p_avg||')/'||
--                          case when i.p_min is not null then i.p_min||
--                               case when nvl(l_p_min,i.p_min) < i.p_min then UNISTR('\2191')
--                                    when nvl(l_p_min,i.p_min) > i.p_min then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_p_min||')/'||
--                          case when i.p_max is not null then i.p_max||
--                               case when nvl(l_p_max,i.p_max) < i.p_max then UNISTR('\2191')
--                                    when nvl(l_p_max,i.p_max) > i.p_max then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_p_max||')';
--      end if;
--    end loop;
    pipe row (dashboard_rec('Тренування',
                             nvl(l_msg, 'Немає даних'),
                             'Попередній період: '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAI') - 1,'YYYY-MON-DD')||' -- '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1,'YYYY-MON-DD'),
                             211));
    --**************************************************************************
    l_msg := null;
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
        l_msg := l_msg || '<b>Кроки:</b> '||
                          case when i.c_steps is not null then i.c_steps ||
                               case when nvl(i.p_steps,i.c_steps) < i.c_steps then UNISTR('\2191')
                                    when nvl(i.p_steps,i.c_steps) > i.c_steps then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_steps is not null then '('||i.p_steps||')' else '-' end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBWAT_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.c_avg is not null or i.c_min is not null or i.c_max is not null) then
        l_msg := l_msg || case when l_msg is not null then '<br>' else null end || --UNISTR('\2764')||
                         '<b>Пульс</b> (awg/min/max): '||
                          case when i.c_avg is not null then i.c_avg||
                               case when nvl(i.p_avg,i.c_avg) < i.c_avg then UNISTR('\2191')
                                    when nvl(i.p_avg,i.c_avg) > i.c_avg then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_steps is not null then '('||i.p_avg||') / ' else '- / ' end ||
                          case when i.c_min is not null then i.c_min||
                               case when nvl(i.p_min,i.c_min) < i.c_min then UNISTR('\2191')
                                    when nvl(i.p_min,i.c_min) > i.c_min then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_steps is not null then '('||i.p_min||') / ' else '- / ' end ||
                          case when i.c_max is not null then i.c_max||
                               case when nvl(i.p_max,i.c_max) < i.c_max then UNISTR('\2191')
                                    when nvl(i.p_max,i.c_max) > i.c_max then UNISTR('\2193')
                               else null end
                          else '-'
                          end || case when i.p_steps is not null then '('||i.p_max||')' else '-' end;
      end if;
    end loop;
    --**************************************************************************
--    for i in (
--            select round(sum(WL_STEPS) FILTER (WHERE WL_STEPS is not null)) steps,
--                   round(avg(WL_NIGHT_MIN_PULSE) FILTER (WHERE WL_NIGHT_MIN_PULSE is not null)) p_min,
--                   round(avg(WL_NIGHT_MAX_PULSE) FILTER (WHERE WL_NIGHT_MAX_PULSE is not null)) p_max,
--                   round(avg(WL_NIGHT_AVG_PULSE) FILTER (WHERE WL_NIGHT_AVG_PULSE is not null),1) p_avg
--          from REHAB_WATCH_LOGS
--         where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(WL_TAKEN) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--    ) loop
--        for j in (
--         select round(avg(steps)) steps,
--                round(avg(p_min)) p_min,
--                round(avg(p_max)) p_max,
--                round(avg(p_avg)) p_avg
--          from (
--            select round(sum(WL_STEPS) FILTER (WHERE WL_STEPS is not null)) steps,
--                   round(avg(WL_NIGHT_MIN_PULSE) FILTER (WHERE WL_NIGHT_MIN_PULSE is not null)) p_min,
--                   round(avg(WL_NIGHT_MAX_PULSE) FILTER (WHERE WL_NIGHT_MAX_PULSE is not null)) p_max,
--                   round(avg(WL_NIGHT_AVG_PULSE) FILTER (WHERE WL_NIGHT_AVG_PULSE is not null),1) p_avg
--              from REHAB_WATCH_LOGS
--         where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
--           and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAI') and REHAB_CONTEXT_PKG.getGLOBAL_DATE() - 1
--           group by trunc(WL_TAKEN))
--        ) loop
--          l_steps := j.steps; l_p_avg := j.p_avg; l_p_min := j.p_min; l_p_max := j.p_max;
--        end loop;
--      if REHAB_CONFIG_PKG.get_config_par('DBWAT_STEPS') = REHAB_CONFIG_PKG.cnstY and i.steps is not null then
--        l_msg := l_msg || 'Кроки: '||case when i.steps is not null then i.steps ||
--                               case when nvl(l_steps,i.steps) < i.steps then UNISTR('\2191')
--                                    when nvl(l_steps,i.steps) > i.steps then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_steps||'); ';
--      end if;
--      if REHAB_CONFIG_PKG.get_config_par('DBWAT_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.p_avg is not null or i.p_min is not null or i.p_max is not null) then
--        l_msg := l_msg || 'Пульс (awg/min/max): '||
--                          case when i.p_avg is not null then i.p_avg||
--                               case when nvl(l_p_avg,i.p_avg) < i.p_avg then UNISTR('\2191')
--                                    when nvl(l_p_avg,i.p_avg) > i.p_avg then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_p_avg||')/'||
--                          case when i.p_min is not null then i.p_min||
--                               case when nvl(l_p_min,i.p_min) < i.p_min then UNISTR('\2191')
--                                    when nvl(l_p_min,i.p_min) > i.p_min then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_p_min||')/'||
--                          case when i.p_max is not null then i.p_max||
--                               case when nvl(l_p_max,i.p_max) < i.p_max then UNISTR('\2191')
--                                    when nvl(l_p_max,i.p_max) > i.p_max then UNISTR('\2193')
--                               else null end
--                          else '-'
--                          end ||'('||l_p_max||')';
--      end if;
--    end loop;
    pipe row (dashboard_rec('Трекери',
                             nvl(l_msg, 'Немає даних'),
                             'Попередній період: '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par('DBAGG_TRAK') - 1,'YYYY-MON-DD')||' -- '||to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE()-1,'YYYY-MON-DD'),
                             221));
    --**************************************************************************
    l_msg := null;
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
    l_msg := rtrim(l_msg,'<br>');
    pipe row (dashboard_rec('Залишки',
                             nvl(l_msg, 'Всі лікі в достатній кількості'),
                            'На період ' ||REHAB_CONFIG_PKG.get_config_par('DBREM_DAYS2ALERT')|| ' дні(в)',
                             301));
    RETURN;
  END dashboard_ref;

END REHAB_UI_REPORTS_PKG;
/


