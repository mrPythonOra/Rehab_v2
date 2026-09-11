


  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_UI_REPORTS_PKG" AS

  function dashboard_ref return dashboard_tab pipelined AS
    l_msg varchar2(4000);
    l_pr_sys number;
    l_pr_dia number;
    l_pulse number;
    l_wei number;
    l_temp number;
    l_sug number;
    l_oxi number;
    l_dist number;
    l_steps number;
    l_p_avg number;
    l_p_min number;
    l_p_max number;

  BEGIN
    l_msg := null;
    for i in (
        select round(avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null)) pr_sys,
               round(avg(MT_PRESSURE_DIA) FILTER (WHERE MT_PRESSURE_DIA is not null)) pr_dia,
               round(avg(MT_PULSE) FILTER (WHERE MT_PULSE is not null)) pulse,
               round(avg(MT_WEIGHT) FILTER (WHERE MT_WEIGHT is not null),1) wei,
               round(avg(MT_TEMPERATURE) FILTER (WHERE MT_TEMPERATURE is not null),1) temp,
               round(avg(MT_SUGAR) FILTER (WHERE MT_SUGAR is not null),2) sug,
               round(avg(MT_OXIGENATION) FILTER (WHERE MT_OXIGENATION is not null),1) oxi
          from REHAB_MEASUREMENTS
         where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(MT_TAKEN) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()
    ) loop
        for j in (
            select round(avg(MT_PRESSURE_SYS) FILTER (WHERE MT_PRESSURE_SYS is not null)) pr_sys,
                   round(avg(MT_PRESSURE_DIA) FILTER (WHERE MT_PRESSURE_DIA is not null)) pr_dia,
                   round(avg(MT_PULSE) FILTER (WHERE MT_PULSE is not null)) pulse,
                   round(avg(MT_WEIGHT) FILTER (WHERE MT_WEIGHT is not null),1) wei,
                   round(avg(MT_TEMPERATURE) FILTER (WHERE MT_TEMPERATURE is not null),1) temp,
                   round(avg(MT_SUGAR) FILTER (WHERE MT_SUGAR is not null),2) sug,
                   round(avg(MT_OXIGENATION) FILTER (WHERE MT_OXIGENATION is not null),1) oxi
              from REHAB_MEASUREMENTS
             where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(MT_TAKEN) = REHAB_CONTEXT_PKG.getGLOBAL_DATE() - 1
        ) loop
          l_pr_sys := j.pr_sys; l_pr_dia := j.pr_dia; l_pulse := j.pulse; l_wei := j.wei; l_temp := j.temp; l_sug := j.sug; l_oxi := j.oxi;
        end loop;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PRESSURE') = REHAB_CONFIG_PKG.cnstY and (i.pr_sys is not null or i.pr_dia is not null) then
        l_msg :='Тиск: '||case when i.pr_sys is not null then
                               case when nvl(l_pr_sys,i.pr_sys) < i.pr_sys then i.pr_sys||UNISTR('\2191')
                                    when nvl(l_pr_sys,i.pr_sys) > i.pr_sys then i.pr_sys||UNISTR('\2193')
                               else i.pr_sys||'' end
                          else '-'
                          end
                ||'/'||
                          case when i.pr_dia is not null then
                               case when nvl(l_pr_dia,i.pr_dia) < i.pr_dia then i.pr_dia||UNISTR('\2191')
                                    when nvl(l_pr_dia,i.pr_dia) > i.pr_dia then i.pr_dia||UNISTR('\2193')
                               else i.pr_dia||'' end
                          else '-'
                          end ||'; ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_PULSE') = REHAB_CONFIG_PKG.cnstY and i.pulse is not null then
        l_msg := l_msg ||'Пульс: '||case when i.pulse is not null then
                               case when nvl(l_pulse,i.pulse) < i.pulse then i.pulse||UNISTR('\2191')
                                    when nvl(l_pulse,i.pulse) > i.pulse then i.pulse||UNISTR('\2193')
                               else i.pulse||'' end
                          else '-'
                          end||'; ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_WEIGHT') = REHAB_CONFIG_PKG.cnstY and i.wei is not null then
        l_msg := l_msg ||'Вага: '||case when i.wei is not null then
                               case when nvl(l_wei,i.wei) < i.wei then i.wei||UNISTR('\2191')
                                    when nvl(l_wei,i.wei) > i.wei then i.wei||UNISTR('\2193')
                               else i.wei||'' end
                          else '-'
                          end||case when l_wei is not null then '('||l_wei||')' else '; ' end;
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_TEMPR') = REHAB_CONFIG_PKG.cnstY and i.temp is not null then
        l_msg := l_msg ||'Температура: '||case when i.temp is not null then
                               case when nvl(l_temp,i.temp) < i.temp then i.temp||UNISTR('\2191')
                                    when nvl(l_temp,i.temp) > i.temp then i.temp||UNISTR('\2193')
                               else i.temp||'' end
                          else '-'
                          end||'; ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_SUGAR') = REHAB_CONFIG_PKG.cnstY and i.sug is not null then
        l_msg := l_msg ||'Цукор: '||case when i.sug is not null then
                               case when nvl(l_sug,i.sug) < i.sug then i.sug||UNISTR('\2191')
                                    when nvl(l_sug,i.sug) > i.sug then i.sug||UNISTR('\2193')
                               else i.sug||'' end
                          else '-'
                          end||'; ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBMEA_OXY') = REHAB_CONFIG_PKG.cnstY and i.oxi is not null then
        l_msg := l_msg ||'Кисень: '||case when i.oxi is not null then
                               case when nvl(l_oxi,i.oxi) < i.oxi then i.oxi||UNISTR('\2191')
                                    when nvl(l_oxi,i.oxi) > i.oxi then i.oxi||UNISTR('\2193')
                               else i.oxi||'' end
                          else '-'
                          end||'; ';
      end if;
    end loop;
    pipe row (dashboard_rec('Вимірювання',nvl(l_msg,'Немає даних'),201));
    --**************************************************************************
    l_msg := null;
    for i in (
        select round(sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null),3) dist,
               round(sum(TR_STEPS) FILTER (WHERE TR_STEPS is not null)) steps,
               round(avg(TR_PULSE_AVG) FILTER (WHERE TR_PULSE_AVG is not null)) p_avg,
               round(avg(TR_PULSE_MIN) FILTER (WHERE TR_PULSE_MIN is not null),1) p_min,
               round(avg(TR_PULSE_MAX) FILTER (WHERE TR_PULSE_MAX is not null),1) p_max
          from REHAB_TRAININGS
         where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(TR_START) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()
    ) loop
        for j in (
        select round(sum(TR_DISTANCE_LENGTH) FILTER (WHERE TR_DISTANCE_LENGTH is not null),3) dist,
               round(sum(TR_STEPS) FILTER (WHERE TR_STEPS is not null)) steps,
               round(avg(TR_PULSE_AVG) FILTER (WHERE TR_PULSE_AVG is not null)) p_avg,
               round(avg(TR_PULSE_MIN) FILTER (WHERE TR_PULSE_MIN is not null),1) p_min,
               round(avg(TR_PULSE_MAX) FILTER (WHERE TR_PULSE_MAX is not null),1) p_max
              from REHAB_TRAININGS
         where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(TR_START) = (select max(trunc(TR_START)) from REHAB_TRAININGS where trunc(TR_START) <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() - 1)
        ) loop
          l_dist := j.dist; l_steps := j.steps; l_p_avg := j.p_avg; l_p_min := j.p_min; l_p_max := j.p_max;
        end loop;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_DISTANCE') = REHAB_CONFIG_PKG.cnstY and i.dist is not null then
        l_msg :='Дистанція: '||case when i.dist is not null then
                               case when nvl(l_dist,i.dist) < i.dist then i.dist||UNISTR('\2191')
                                    when nvl(l_dist,i.dist) > i.dist then i.dist||UNISTR('\2193')
                               else i.dist||'' end
                          else '-'
                          end||'('||l_dist||'); ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_STEPS') = REHAB_CONFIG_PKG.cnstY and i.steps is not null then
        l_msg := l_msg || 'Кроки: '||case when i.steps is not null then
                               case when nvl(l_steps,i.steps) < i.steps then i.steps||UNISTR('\2191')
                                    when nvl(l_steps,i.steps) > i.steps then i.steps||UNISTR('\2193')
                               else i.steps||'' end
                          else '-'
                          end||'('||l_steps||'); ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBTRA_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.p_avg is not null or i.p_min is not null or i.p_max is not null) then
        l_msg := l_msg || 'Пульс (awg/min/max): '||
                          case when i.p_avg is not null then
                               case when nvl(l_p_avg,i.p_avg) < i.p_avg then i.p_avg||UNISTR('\2191')
                                    when nvl(l_p_avg,i.p_avg) > i.p_avg then i.p_avg||UNISTR('\2193')
                               else i.p_avg||'' end
                          else '-'
                          end||'/'||
                          case when i.p_min is not null then
                               case when nvl(l_p_min,i.p_min) < i.p_min then i.p_min||UNISTR('\2191')
                                    when nvl(l_p_min,i.p_min) > i.p_min then i.p_min||UNISTR('\2193')
                               else i.p_min||'' end
                          else '-'
                          end||'/'||
                          case when i.p_max is not null then
                               case when nvl(l_p_max,i.p_max) < i.p_max then i.p_max||UNISTR('\2191')
                                    when nvl(l_p_max,i.p_max) > i.p_max then i.p_max||UNISTR('\2193')
                               else i.p_max||'' end
                          else '-'
                          end;
      end if;
    end loop;
    pipe row (dashboard_rec('Тренування',nvl(l_msg,'Немає даних'),211));
    --**************************************************************************
    l_msg := null;
    for i in (
            select round(sum(WL_STEPS) FILTER (WHERE WL_STEPS is not null)) steps,
                   round(avg(WL_NIGHT_MIN_PULSE) FILTER (WHERE WL_NIGHT_MIN_PULSE is not null)) p_min,
                   round(avg(WL_NIGHT_MAX_PULSE) FILTER (WHERE WL_NIGHT_MAX_PULSE is not null)) p_max,
                   round(avg(WL_NIGHT_AVG_PULSE) FILTER (WHERE WL_NIGHT_AVG_PULSE is not null),1) p_avg
          from REHAB_WATCH_LOGS
         where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(WL_TAKEN) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()
    ) loop
        for j in (
            select round(sum(WL_STEPS) FILTER (WHERE WL_STEPS is not null)) steps,
                   round(avg(WL_NIGHT_MIN_PULSE) FILTER (WHERE WL_NIGHT_MIN_PULSE is not null)) p_min,
                   round(avg(WL_NIGHT_MAX_PULSE) FILTER (WHERE WL_NIGHT_MAX_PULSE is not null)) p_max,
                   round(avg(WL_NIGHT_AVG_PULSE) FILTER (WHERE WL_NIGHT_AVG_PULSE is not null),1) p_avg
              from REHAB_WATCH_LOGS
         where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and trunc(WL_TAKEN) = REHAB_CONTEXT_PKG.getGLOBAL_DATE() - 1
        ) loop
          l_steps := j.steps; l_p_avg := j.p_avg; l_p_min := j.p_min; l_p_max := j.p_max;
        end loop;
      if REHAB_CONFIG_PKG.get_config_par('DBWAT_STEPS') = REHAB_CONFIG_PKG.cnstY and i.steps is not null then
        l_msg := l_msg || 'Кроки: '||case when i.steps is not null then
                               case when nvl(l_steps,i.steps) < i.steps then i.steps||UNISTR('\2191')
                                    when nvl(l_steps,i.steps) > i.steps then i.steps||UNISTR('\2193')
                               else i.steps||'' end
                          else '-'
                          end||'('||l_steps||'); ';
      end if;
      if REHAB_CONFIG_PKG.get_config_par('DBWAT_PULSE') = REHAB_CONFIG_PKG.cnstY and (i.p_avg is not null or i.p_min is not null or i.p_max is not null) then
        l_msg := l_msg || 'Пульс (awg/min/max): '||
                          case when i.p_avg is not null then
                               case when nvl(l_p_avg,i.p_avg) < i.p_avg then i.p_avg||UNISTR('\2191')
                                    when nvl(l_p_avg,i.p_avg) > i.p_avg then i.p_avg||UNISTR('\2193')
                               else i.p_avg||'' end
                          else '-'
                          end||'/'||
                          case when i.p_min is not null then
                               case when nvl(l_p_min,i.p_min) < i.p_min then i.p_min||UNISTR('\2191')
                                    when nvl(l_p_min,i.p_min) > i.p_min then i.p_min||UNISTR('\2193')
                               else i.p_min||'' end
                          else '-'
                          end||'/'||
                          case when i.p_max is not null then
                               case when nvl(l_p_max,i.p_max) < i.p_max then i.p_max||UNISTR('\2191')
                                    when nvl(l_p_max,i.p_max) > i.p_max then i.p_max||UNISTR('\2193')
                               else i.p_max||'' end
                          else '-'
                          end;
      end if;
    end loop;
    pipe row (dashboard_rec('Трекери',nvl(l_msg,'Немає даних'),221));
    RETURN;
  END dashboard_ref;

END REHAB_UI_REPORTS_PKG;
/


