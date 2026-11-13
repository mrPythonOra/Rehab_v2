

  CREATE OR REPLACE EDITIONABLE FUNCTION "REHUB_GET_PLANNED_CONSUMPTION" (P_PRATR_ID REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%TYPE,
                                                         P_PRD_DR_ID REHAB_PRESCRIPTIONS_DETAILS.PRD_DR_ID%TYPE,
                                                         P_MAX_DRU_CONSUMED_DATE timestamp with time zone,
                                                         P_DAYS_AHEAD number) return number
is
  l_alert_ts timestamp with time zone;
  l_days number := 0;
begin
  l_alert_ts := REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(P_DAYS_AHEAD, 'DAY');
  for i in (select PRD_DR_ID, sum(PRD_DOSAGE) PRD_DOSAGE, PRATR_ACTUAL_START, nvl(PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_MAX_DATE_TSTZ) PRATR_ACTUAL_END
              from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS
             where PRD_PRATR_ID = PRATR_ID and PRATR_ID = P_PRATR_ID and PRD_DR_ID = P_PRD_DR_ID
             group by PRD_DR_ID, PRATR_ACTUAL_START, nvl(PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_MAX_DATE_TSTZ))
  loop
    if not(l_alert_ts < i.PRATR_ACTUAL_START or P_MAX_DRU_CONSUMED_DATE > i.PRATR_ACTUAL_END)
       and
       (P_MAX_DRU_CONSUMED_DATE < l_alert_ts)
    then
      l_days := EXTRACT(DAY FROM (least(i.PRATR_ACTUAL_END, l_alert_ts) - greatest(i.PRATR_ACTUAL_START,P_MAX_DRU_CONSUMED_DATE)));
    end if;
  end loop;
  return l_days;
end;
/

