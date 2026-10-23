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
    trunc(tr_start, 'IW') tr_start,
    round(avg(tr_distance_length*0.8944/( (tr_end+0) -  (tr_start+0))/24),3) calc_speed
FROM
    rehab_trainings
where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()
group by trunc(tr_start, 'IW')
order by tr_start;
select * from rehab_trending_data;

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