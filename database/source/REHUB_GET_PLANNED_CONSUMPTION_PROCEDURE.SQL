

  CREATE OR REPLACE EDITIONABLE PROCEDURE "REHUB_GET_PLANNED_CONSUMPTION" (P_PRATR_ID REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%TYPE,
                                                         P_PRD_DR_ID REHAB_PRESCRIPTIONS_DETAILS.PRD_DR_ID%TYPE,
                                                         P_MAX_DRU_CONSUMED_DATE timestamp with time zone,
                                                         P_CONSUMED_SINCE_DT timestamp with time zone,
                                                         P_DAYS_AHEAD number,
                                                         p_days out number,
                                                         p_amount out number,
                                                         p_daily_doze out number)
is
  l_alert_ts timestamp with time zone;
  L_MAX_DRU_CONSUMED_DATE timestamp with time zone;
begin
  p_days := 0;
  p_amount := 0;
  p_daily_doze := 0;

  l_alert_ts := REHAB_CONTEXT_PKG.getGLOBAL_DATE_TSTZ_TRUNC() + NUMTODSINTERVAL(P_DAYS_AHEAD, 'DAY');

  --dbms_output.put_line('P_PRATR_ID: '||P_PRATR_ID||'; P_PRD_DR_ID: '||P_PRD_DR_ID||'; l_alert_ts: '||to_char(l_alert_ts,'YYYY-MM-DD HH24:MI TZH'));
  for i in (select PRD_DR_ID, sum(PRD_DOSAGE) PRD_DOSAGE, PRATR_ACTUAL_START, nvl(PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_MAX_DATE_TSTZ) PRATR_ACTUAL_END
              from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS
             where PRD_PRATR_ID = PRATR_ID and PRATR_ID = P_PRATR_ID and PRD_DR_ID = P_PRD_DR_ID
             group by PRD_DR_ID, PRATR_ACTUAL_START, nvl(PRATR_ACTUAL_END, REHAB_CONTEXT_PKG.getGLOBAL_MAX_DATE_TSTZ))
  loop
    if P_MAX_DRU_CONSUMED_DATE is null then
      L_MAX_DRU_CONSUMED_DATE := greatest(P_CONSUMED_SINCE_DT,i.PRATR_ACTUAL_START);
    else
      L_MAX_DRU_CONSUMED_DATE := P_MAX_DRU_CONSUMED_DATE;
    end if;
    if not(l_alert_ts < i.PRATR_ACTUAL_START or L_MAX_DRU_CONSUMED_DATE > i.PRATR_ACTUAL_END)
       and L_MAX_DRU_CONSUMED_DATE < l_alert_ts
       and L_MAX_DRU_CONSUMED_DATE < i.PRATR_ACTUAL_END
    then
      p_days := EXTRACT(DAY FROM (least(i.PRATR_ACTUAL_END, l_alert_ts) - greatest(i.PRATR_ACTUAL_START,L_MAX_DRU_CONSUMED_DATE)));
      if trunc(L_MAX_DRU_CONSUMED_DATE)=REHAB_CONTEXT_PKG.getGLOBAL_DATE_TRUNC()
         --trunc(L_MAX_DRU_CONSUMED_DATE)=REHAB_CONTEXT_PKG.getGLOBAL_DATE_TRUNC()-NUMTODSINTERVAL(1, 'DAY')
      then
        p_days := p_days + 1;
      end if;
      p_amount := p_amount + p_days * i.PRD_DOSAGE;
      p_daily_doze := i.PRD_DOSAGE;
      --dbms_output.put_line('l_days: '||l_days||'; l_amount: '||l_amount);
    end if;
  end loop;
end;
/

