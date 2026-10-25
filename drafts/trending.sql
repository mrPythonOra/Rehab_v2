-- Create the settings table
CREATE TABLE rehab_glm_linear_settings (
    setting_name  VARCHAR2(30),
    setting_value VARCHAR2(4000)
);

truncate table rehab_glm_linear_settings;
BEGIN
    -- 1. Specify Exponential Smoothing algorithm
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.algo_name, 
        dbms_data_mining.algo_exponential_smoothing
    );
    
    -- 2. Specify the model type: Holt Linear model for trend tracking
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.exsm_model, 
        dbms_data_mining.exsm_holt
    );
    
    -- 3. Define the time interval of your date series (e.g., 'EXSM_INTERVAL_DAY' or 'EXSM_INTERVAL_MONTH')
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.exsm_interval, 
        dbms_data_mining.exsm_interval_week
    );
    
--    -- 4. Define how to accumulate values if there are multiple records per day
--    INSERT INTO rehab_glm_linear_settings VALUES (
--        dbms_data_mining.exsm_accumulate, 
--        dbms_data_mining.exsm_accu_sum
--    );
    
    -- 5. Specify how many steps ahead to forecast (optional, default is 1)
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.exsm_prediction_step, 
        '5'
    );

INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.glms_ftr_generation, 
        'GLMS_FTR_GENERATION_DISABLE'
    );
    
    COMMIT;
END;
/

BEGIN
    -- 1. Specify the Exponential Smoothing algorithm
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.algo_name, 
        dbms_data_mining.algo_exponential_smoothing
    );
    
    -- 2. Specify Holt's Linear model for a straight-line trend
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.exsm_model, 
        dbms_data_mining.exsm_holt
    );
    
    -- 3. Define the time interval spacing (e.g., daily)[cite: 2]
    INSERT INTO rehab_glm_linear_settings VALUES (
        dbms_data_mining.exsm_interval, 
        dbms_data_mining.exsm_interval_day
    );
    
    -- 4. Define accumulation method if multiple records exist per date[cite: 2]
--    INSERT INTO rehab_glm_linear_settings VALUES (
--        dbms_data_mining.exsm_accumulate, 
--        dbms_data_mining.exsm_accu_sum
--    );
    
    COMMIT;
END;
/

begin
    REHAB_CONTEXT_PKG.set_current_user('YURI');
    REHAB_CONTEXT_PKG.set_specific_context('YURI');
    REHAB_CONTEXT_PKG.set_current_date(sysdate);
end;
/
alter session set nls_territory='Ukraine';
drop table rehab_trending_data;
create table rehab_trending_data as
SELECT
    to_number(to_char(trunc(tr_start, 'IW'),'IW')) case_id,
    round(avg(tr_distance_length*0.8944/( (tr_end+0) -  (tr_start+0))/24),3) target_value
FROM
    rehab_trainings
where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()
group by to_number(to_char(trunc(tr_start, 'IW'),'IW'))
order by 1;
set pages 1000
select * from rehab_trending_data order by 1;

WITH cleaned_data AS (
    SELECT 
        CASE_ID,
        -- Cleans commas if TARGET_VALUE is stored as a string, and converts to NUMBER
        TARGET_VALUE AS y_val
    FROM rehab_trending_data
)
SELECT 
    CASE_ID,
    Y_VAL AS TARGET_VALUE,
    -- Calculate the trend line equation: (Slope * X) + Intercept
    ROUND(
        REGR_SLOPE(Y_VAL, CASE_ID) OVER () * CASE_ID + 
        REGR_INTERCEPT(Y_VAL, CASE_ID) OVER (), 
        2
    ) AS TREND_VALUE,
    -- Optional: Display the regression statistics for reference
    ROUND(REGR_SLOPE(Y_VAL, CASE_ID) OVER (), 4) AS CALCULATED_SLOPE,
    ROUND(REGR_INTERCEPT(Y_VAL, CASE_ID) OVER (), 4) AS CALCULATED_INTERCEPT
FROM cleaned_data
ORDER BY CASE_ID;

SELECT
    tr_start,
    ROUND(
        REGR_SLOPE(calc_speed, case_id) OVER () * case_id + 
        REGR_INTERCEPT(calc_speed, case_id) OVER (), 
        2
    ) AS TREND_VALUE,
    'Трендова швидкість, км/год' series_name,
    to_char(tr_start,'YYYY-MM-DD "Тиждень" IW') || ' ' || round(calc_speed,3) || ' км/год' ct
FROM
(select tr_start, case_id, avg(calc_speed) calc_speed
   from
    (select trunc(tr_start, 'IW') tr_start,
            to_number(to_char(trunc(tr_start, 'IW'),'IW')) case_id,
            tr_distance_length*0.8944/( (tr_end+0) -  (tr_start+0))/24 calc_speed
       from rehab_trainings
      where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT())
group by tr_start, case_id)
order by tr_start;

BEGIN
    dbms_data_mining.create_model(
        model_name          => 'REHAB_CALC_SPEED_TREND',
        mining_function     => dbms_data_mining.time_series,
        data_table_name     => 'rehab_trending_data',     -- Replace with your training table name
        case_id_column_name => 'tr_start',                     -- Unique identifier column
        target_column_name  => 'calc_speed',               -- The continuous target variable you want to approximate
        settings_table_name => 'rehab_glm_linear_settings'
    );
END;
/
BEGIN
    dbms_data_mining.drop_model(model_name          => 'REHAB_CALC_SPEED_TREND');
end;
/
    
SELECT
     trunc(tr_start, 'IW') tr_start,
    round(avg(tr_distance_length*0.8944/( (tr_end+0) -  (tr_start+0))/24),3) calc_speed,
    PREDICTION(REHAB_CALC_SPEED_TREND USING *) AS approximated_value
FROM
    rehab_trainings
where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()
group by trunc(tr_start, 'IW')
order by tr_start;

select x.*, PREDICTION(REHAB_CALC_SPEED_TREND USING *) AS approximated_value
from rehab_trending_data x;

SELECT 
    *
FROM 
    DM$VPREHAB_CALC_SPEED_TREND
ORDER BY 
    CASE_ID;

with dt as 
    (SELECT
         trunc(tr_start, 'IW') tr_start
    FROM
        rehab_trainings
    where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()
    group by trunc(tr_start, 'IW')),
pr as (select avg(LOWER) LOWER, avg(UPPER) UPPER from DM$VPREHAB_CALC_SPEED_TREND where LOWER is not null and UPPER is not null),
p1 as (select count(1) cnt from dt),
p2 as (select (UPPER - LOWER)/cnt w1 from pr, p1)
select
  x.*, rownum, LOWER, UPPER, round(LOWER + (rownum-1) * w1,3) trend
from
(select
  dt.*
from dt
order by tr_start) x, p2, pr;

desc all_objects

select * from BACKUP_REHAB_V2_LOG;