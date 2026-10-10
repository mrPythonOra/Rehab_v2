

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_MIGRATE_PKG" AS

  procedure fix_prescriptions(p_prr_id number, p_ws_id number)
  is
  begin
        update REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES set PRATR_PR_ID = (select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id)
        where PRATR_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id);

        update REHAB_DRUG_ACCOUNTINGS set DA_PR_ID = (select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id)
        where DA_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id);

        update REHAB_DRUG_USES set DRU_PR_ID = (select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id)
        where DRU_PR_ID in (select pr_id from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id);

        delete from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id and pr_id<>(select min(pr_id) from REHAB_PRESCRIPTIONS where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id);
        update REHAB_PRESCRIPTIONS set PR_PLANNED_END = case when PR_PLANNED_END > systimestamp then null else PR_PLANNED_END end, pr_dr_id=null where pr_ws_id=p_ws_id and pr_prr_id=p_prr_id;
  end;

  procedure refresh_data AS
  BEGIN
        --******************************************************************************
        --cleanup data------------------------------------------------------------------
        --******************************************************************************

        delete from REHAB_DRUG_ACCOUNTINGS;commit;
        delete from REHAB_PATIENT2STORAGES;commit;
        delete from REHAB_DRUG_STORAGES;commit;
        delete from REHAB_DRUG_USES;commit;
        delete from REHAB_MEASUREMENTS;commit;
        delete from REHAB_PRESCRIPTIONS_DETAILS;commit;
        delete from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;commit;
        delete from REHAB_PRESCRIPTOR2DRUG_FLTS;commit;
        delete from REHAB_PRESCRIPTIONS;commit;
        delete from REHAB_PRESCRIPTORS;commit;
        delete from REHAB_TRAININGS;commit;
        delete from REHAB_WATCH_LOGS;commit;
        delete from REHAB_DRUGS;commit;
        delete from REHAB_WORKING_SUBSTANCE;commit;
        delete from REHAB_CONSUME_TIME_RANGES;commit;
        delete from REHAB_CONSUME_PATTERNS;commit;
        delete from REHAB_PATIENTS2P_ACCESS;commit;
        delete from REHAB_PATIENTS;commit;
        delete from REHAB_TENANTS;commit;
        delete from REHAB_TIME_PERIODS;commit;
        --delete from apex_stored_states;commit;
        delete from REHAB_CONFIGS;commit;
        commit;

        --******************************************************************************
        --load data---------------------------------------------------------------------
        --******************************************************************************
        --prompt rehab_configs
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBAGG_MEAS','Вимірювання, днів','Дашборд Агрегація',null,null,'7',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBAGG_TRAI','Тренування, днів','Дашборд Агрегація',null,null,'7',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBAGG_TRAK','Трекери, днів','Дашборд Агрегація',null,null,'7',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_OXY','Кисень','Дашборд Виміри',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_PRESSURE','Кров''яний тиск','Дашборд Виміри',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_PULSE','Пульс','Дашборд Виміри',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_SUGAR','Цукор','Дашборд Виміри',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_TEMPR','Температура','Дашборд Виміри',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_WEIGHT','Вага','Дашборд Виміри',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBREM_DAYS2ALERT','Залишок, днів','Дашборд Залишки',null,null,'14',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_ALLSTEPS','Всі денні кроки','Дашборд Мета',null,null,'10000',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_OXI_MAX','Кисень max','Дашборд Мета',null,null,'100',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_OXI_MIN','Кисень min','Дашборд Мета',null,null,'94',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PDIA_MAX','Тиск DIA max','Дашборд Мета',null,null,'85',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PDIA_MIN','Тиск DIA min','Дашборд Мета',null,null,'70',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PSYS_MAX','Тиск SYS max','Дашборд Мета',null,null,'125',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PSYS_MIN','Тиск SYS min','Дашборд Мета',null,null,'115',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PULSE_MAX','Пульс max','Дашборд Мета',null,null,'65',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PULSE_MIN','Пульс min','Дашборд Мета',null,null,'55',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_SHOW','Показувати мету','Дашборд Мета',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_SUGAR_MAX','Цукор max','Дашборд Мета',null,null,'5',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_SUGAR_MIN','Цукор min','Дашборд Мета',null,null,'3.5',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TEMPR_MAX','Температура max','Дашборд Мета',null,null,'37',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TEMPR_MIN','Температура min','Дашборд Мета',null,null,'36',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TRAINDIST','Тренуальна дистанція','Дашборд Мета',null,null,'5',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TRAINSTEPS','Тренувальні кроки','Дашборд Мета',null,null,'8000',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_WEIGHT_MAX','Вага max','Дашборд Мета',null,null,'73',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_WEIGHT_MIN','Вага min','Дашборд Мета',null,null,'70',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBWAT_PULSE','Пульс','Дашборд Трекери',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBWAT_STEPS','Кроки','Дашборд Трекери',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRA_DISTANCE','Дистанція','Дашборд Тренування',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRA_PULSE','Пульс','Дашборд Тренування',null,null,'Y',null);
        Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRA_STEPS','Кроки','Дашборд Тренування',null,null,'Y',null);
        commit;
        --******************************************************************************
        --prompt rehab_tenants
        INSERT INTO rehab_tenants (te_id,te_name,te_descr) VALUES (1, 'My Family', 'First tenant');
        execute immediate 'ALTER SEQUENCE SQ_REHAB_TENANTS RESTART START WITH 2';
        --******************************************************************************
        --prompt rehab_patients
        INSERT INTO rehab_patients
           (pat_id,pat_te_id,pat_name,pat_surname,pat_email,pat_status,pat_created,pat_status_changed,pat_apex_user,pat_is_superuser)
        SELECT
            pat_id,1,        pat_name,pat_surname,pat_email,pat_status,pat_created,pat_status_changed,apex_user,    false
        FROM
            reabilitation.patients;
        commit;
        update rehab_patients set pat_apex_user = 'YURI', pat_is_superuser = true
        where pat_id = 5;
        commit;
        declare
          l_id_max number;
        begin
          select max(pat_id)+1 into l_id_max from rehab_patients;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_PATIENTS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_patients2p_access
        INSERT INTO rehab_patients2p_access (p2pa_subj_pat_id,p2pa_trg_pat_id,p2pa_can_manage) VALUES (21,5,false);
        commit;
        --******************************************************************************
        --prompt rehab_working_substance
--        INSERT INTO REHAB_WORKING_SUBSTANCE
--           (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)
--        select SQ_REHAB_WORKING_SUBSTANCE.nextval, x.*
--        from (
--        SELECT
--            unique 1, INITCAP(dr_working_subst), null
--        FROM
--            reabilitation.drugs) x;
        INSERT INTO REHAB_WORKING_SUBSTANCE
           (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)
        values
           (1,1,'Бісопролол','Бісопролол – високоселективний ß1-адреноблокатор.');
        INSERT INTO REHAB_WORKING_SUBSTANCE
           (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)
        values
           (2,1,'Розувастатин','Розувастатин − це селективний та конкурентний інгібітор ГМГ-КоА-редуктази, ферменту, що визначає швидкість реакції та перетворює 3-гідрокси-3-метилглутарил кофермент А у мевалонат, попередник холестерину. Основним місцем дії розувастатину є печінка: орган-мішень для зменшення рівня холестерину.');
        INSERT INTO REHAB_WORKING_SUBSTANCE
           (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)
        values
           (3,1,'Раміпріл','Раміприлат, активний метаболіт проліків − раміприлу, є інгібітором ферменту дипептидилкарбоксипептидази І (синоніми: ангіотензинперетворювальний фермент; кіназа ІІ).');
        INSERT INTO REHAB_WORKING_SUBSTANCE
           (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)
        values
           (4,1,'Ацетилсаліцилова кислота','Антитромботичний ефект ацетилсаліцилової кислоти обумовлений блокуванням синтезу тромбоксану А2 у тромбоцитах.');
        commit;
        declare
          l_id_max number;
        begin
          select max(ws_id)+1 into l_id_max from REHAB_WORKING_SUBSTANCE;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_WORKING_SUBSTANCE RESTART START WITH '||l_id_max;
        end;
        --******************************************************************************
        --prompt rehab_drugs
        INSERT INTO rehab_drugs
           (dr_id,dr_te_id,dr_name,/*dr_type,*/dr_type_short,DR_WS_ID,dr_use_case,dr_when2consume,
            dr_instruction,dr_instr_src_url,dr_item_image1,dr_item_image2,dr_pack_image1,dr_pack_image2)
        SELECT
            dr_id,1,       dr_name,/*dr_type*/type_short,   null /*dr_working_subst*/ ,use_case,   when2consume,
            dr_instruction,dr_nstr_src_url,dr_item_image1,dr_item_image2,dr_pack_image1,dr_pack_image2
        FROM
            reabilitation.drugs d;
--            , REHAB_WORKING_SUBSTANCE w
--        where initcap(d.dr_working_subst) = w.WS_NAME;
        update rehab_drugs
        set DR_WS_ID = 1 where dr_id in (25, 61, 161);
        update rehab_drugs
        set DR_WS_ID = 2 where dr_id in (24, 62, 84, 281, 301, 302);
        update rehab_drugs
        set DR_WS_ID = 3 where dr_id in (27, 221);
        update rehab_drugs
        set DR_WS_ID = 4 where dr_id in (9, 23);
        commit;
        declare
          l_id_max number;
        begin
          select max(dr_id)+1 into l_id_max from rehab_drugs;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUGS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_prescriptors
        INSERT INTO rehab_prescriptors (
            prr_id,prr_prescripted_by_short,prr_prescripted_when,prr_prescripted_by_full,
            prr_pat_id,prr_full_text,prr_page1,prr_page2,prr_page3,prr_page4,prr_page5
        )
        SELECT
            prr_id,prr_prescripted_by,      prr_prescripted_when,prr_prescripted_by_full,
            prr_pat_id,prr_full_text,prr_doc1,prr_doc2,prr_doc3,null, null
        FROM
            reabilitation.prescriptor;
        declare
          l_id_max number;
        begin
          select max(prr_id)+1 into l_id_max from rehab_prescriptors;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTORS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_prescriptor2drug_flts
        INSERT INTO rehab_prescriptor2drug_flts (
            prrf_prr_id,
            PRRF_DR_ID,
            PRRF_WS_ID
        )
        SELECT
            prr_id,
            d.dr_id,
            DR_WS_ID
        FROM
            reabilitation.prescriptor2drug_flt f, REHAB_DRUGS d
            where f.dr_id = d.dr_id;
        commit;
        --******************************************************************************
        INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR)
            VALUES (1,null,null,'Ніч-ранок','ПеріодРанній ранок','00:00','06:00');
        INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR)
            VALUES (2,null,null,'Ранок','Ранковий період','06:00','12:00');
        INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR)
            VALUES (3,null,null,'День','Денний період','12:00','17:00');
        INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR)
            VALUES (4,null,null,'Вечір','Вечірній період','17:00','22:00');
        INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR)
            VALUES (5,null,null,'Вечір-ніч','Період пізнього вечора','22:00','23:59');
        commit;
        execute immediate 'ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 6';
        --******************************************************************************
        --prompt rehab_consume_patterns
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (1,null,null,null,'One Time Morning','Common "One Time in the Morning"');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (2,null,null,null,'One Time Noon','Common "One Time in the Noon"');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (3,null,null,null,'One Time Evening','Common "One Time in the Evening"');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (4,null,null,null,'Two Times Morning and Evening','Common "Two Times in the Morning and Evening"');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (5,null,null,null,'Three Times per day','Common "Three Times per day: in the Morning, Noon, and Evening"');
        --Olya
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (21,1,1,21,q'[Olya's One Time Morning]',q'[Olya's Common "One Time in the Morning"]');
        --INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (22,2,21,null,q'[Olya's One Time Noon]',q'[Olya's Common "One Time in the Noon"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (23,3,1,21,q'[Olya's One Time Evening]',q'[Olya's Common "One Time in the Evening"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (24,4,1,21,q'[Olya's Two Times Morning and Evening]',q'[Olya's Common "Two Times in the Morning and Evening"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (25,5,1,21,q'[Olya's Three Times per day]',q'[Olya's Common "Three Times per day: in the Morning, Noon, and Evening"]');
        --Yuri
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (41,1,1,5,q'[Yuri's One Time Morning]',q'[Yuri's Common "One Time in the Morning"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (42,2,1,5,q'[Yuri's One Time Noon]',q'[Yuri's Common "One Time in the Noon"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (43,3,1,5,q'[Yuri's One Time Evening]',q'[Yuri's Common "One Time in the Evening"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (44,4,1,5,q'[Yuri's Two Times Morning and Evening]',q'[Yuri's Common "Two Times in the Morning and Evening"]');
        INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (45,5,1,5,q'[Yuri's Three Times per day]',q'[Yuri's Common "Three Times per day: in the Morning, Noon, and Evening"]');
        commit;
        execute immediate 'ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 61';
        --******************************************************************************
        INSERT ALL
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (1,      1,         '1 р/д зранку', START_TIM_1T1,      END_TIM_1T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (2,      2,         '1 р/д вдень',    START_TIM_1T2,      END_TIM_1T2 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (3,      3,         '1 р/д увечорі', START_TIM_1T3,      END_TIM_1T3 )
        --
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (4,      4,         '2 р/д вранці', START_TIM_2T1,      END_TIM_2T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (5,      4,         '2 р/д увечорі', START_TIM_2T2,      END_TIM_2T2 )
        --
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (6,      5,         '3 р/д вранці', START_TIM_3T1,      END_TIM_3T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (7,      5,         '3 р/д вдень',    START_TIM_3T2,      END_TIM_3T2 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (8,      5,         '3 р/д увечорі', START_TIM_3T3,      END_TIM_3T3 )
        select * from (
        select
          OWNER,
          START_TIM_1T1,
          END_TIM_1T1,
          START_TIM_1T2,
          END_TIM_1T2,
          START_TIM_1T3,
          END_TIM_1T3,
          START_TIM_2T1,
          END_TIM_2T1,
          START_TIM_2T2,
          END_TIM_2T2,
          START_TIM_3T1,
          END_TIM_3T1,
          START_TIM_3T2,
          END_TIM_3T2,
          START_TIM_3T3,
          END_TIM_3T3
        from reabilitation.TIME_RANGE_CONFIG x where owner in (/*'OLYAPTAH',*/'DEFAULT'))
        where owner = 'DEFAULT' /*'OLYAPTAH'*/;

        INSERT ALL
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (9,      21,         '1 р/д зранку', START_TIM_1T1,      END_TIM_1T1 )
        --  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
        --                          VALUES (2,      22,         '1 р/д вдень',    START_TIM_1T2,      END_TIM_1T2 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (10,      23,         '1 р/д увечорі', START_TIM_1T3,      END_TIM_1T3 )
        --
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (11,      24,         '2 р/д вранці', START_TIM_2T1,      END_TIM_2T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (12,      24,         '2 р/д увечорі', START_TIM_2T2,      END_TIM_2T2 )
        --
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (13,      25,         '3 р/д вранці', START_TIM_3T1,      END_TIM_3T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (14,      25,         '3 р/д вдень',    START_TIM_3T2,      END_TIM_3T2 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (15,      25,         '3 р/д увечорі', START_TIM_3T3,      END_TIM_3T3 )
        select * from (
        select
          OWNER,
          COALESCE(START_TIM_1T1, lead(START_TIM_1T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_1T1,
          COALESCE(END_TIM_1T1,   lead(END_TIM_1T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_1T1,
          COALESCE(START_TIM_1T2, lead(START_TIM_1T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_1T2,
          COALESCE(END_TIM_1T2,   lead(END_TIM_1T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_1T2,
          COALESCE(START_TIM_1T3, lead(START_TIM_1T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_1T3,
          COALESCE(END_TIM_1T3,   lead(END_TIM_1T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_1T3,
          COALESCE(START_TIM_2T1, lead(START_TIM_2T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_2T1,
          COALESCE(END_TIM_2T1,   lead(END_TIM_2T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_2T1,
          COALESCE(START_TIM_2T2, lead(START_TIM_2T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_2T2,
          COALESCE(END_TIM_2T2,   lead(END_TIM_2T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_2T2,
          COALESCE(START_TIM_3T1, lead(START_TIM_3T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_3T1,
          COALESCE(END_TIM_3T1,   lead(END_TIM_3T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_3T1,
          COALESCE(START_TIM_3T2, lead(START_TIM_3T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_3T2,
          COALESCE(END_TIM_3T2,   lead(END_TIM_3T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_3T2,
          COALESCE(START_TIM_3T3, lead(START_TIM_3T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_3T3,
          COALESCE(END_TIM_3T3,   lead(END_TIM_3T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_3T3
        from reabilitation.TIME_RANGE_CONFIG x where owner in ('OLYAPTAH','DEFAULT'))
        where owner = 'OLYAPTAH';

        INSERT ALL
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (16,      41,         '1 р/д зранку', START_TIM_1T1,      END_TIM_1T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (17,      42,         '1 р/д вдень',    START_TIM_1T2,      END_TIM_1T2 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str)
                                  VALUES (18,      43,         '1 р/д увечорі', START_TIM_1T3,      END_TIM_1T3 )
        --
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (19,      44,         '2 р/д вранці', START_TIM_2T1,      END_TIM_2T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (20,      44,         '2 р/д увечорі', START_TIM_2T2,      END_TIM_2T2 )
        --
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (21,      45,         '3 р/д вранці', START_TIM_3T1,      END_TIM_3T1 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (22,      45,         '3 р/д вдень',    START_TIM_3T2,      END_TIM_3T2 )
          INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str)
                                  VALUES (23,      45,         '3 р/д увечорі', START_TIM_3T3,      END_TIM_3T3 )
        select * from (
        select
          OWNER,
          COALESCE(START_TIM_1T1, lead(START_TIM_1T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_1T1,
          COALESCE(END_TIM_1T1,   lead(END_TIM_1T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_1T1,
          COALESCE(START_TIM_1T2, lead(START_TIM_1T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_1T2,
          COALESCE(END_TIM_1T2,   lead(END_TIM_1T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_1T2,
          COALESCE(START_TIM_1T3, lead(START_TIM_1T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_1T3,
          COALESCE(END_TIM_1T3,   lead(END_TIM_1T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_1T3,
          COALESCE(START_TIM_2T1, lead(START_TIM_2T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_2T1,
          COALESCE(END_TIM_2T1,   lead(END_TIM_2T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_2T1,
          COALESCE(START_TIM_2T2, lead(START_TIM_2T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_2T2,
          COALESCE(END_TIM_2T2,   lead(END_TIM_2T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_2T2,
          COALESCE(START_TIM_3T1, lead(START_TIM_3T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_3T1,
          COALESCE(END_TIM_3T1,   lead(END_TIM_3T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_3T1,
          COALESCE(START_TIM_3T2, lead(START_TIM_3T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_3T2,
          COALESCE(END_TIM_3T2,   lead(END_TIM_3T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_3T2,
          COALESCE(START_TIM_3T3, lead(START_TIM_3T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_3T3,
          COALESCE(END_TIM_3T3,   lead(END_TIM_3T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_3T3
        from reabilitation.TIME_RANGE_CONFIG x where owner in ('REABILITATIONADM','DEFAULT'))
        where owner = 'REABILITATIONADM';
        execute immediate 'ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 24';
        --******************************************************************************
        --prompt rehab_prescriptions
        INSERT INTO rehab_prescriptions
           (pr_id,pr_dr_id,pr_pat_id,pr_prr_id,pr_planned_start,pr_planned_end,pr_notes, PR_WS_ID)
        SELECT
            pr_id,   p.dr_id,   pat_id,   prr_id,   planned_start,   planned_end + 1 - 1/24/60/60,   case when notes like '%http%' then notes else null end,    DR_WS_ID
        FROM
            reabilitation.prescription p, REHAB_DRUGS d
            where p.dr_id=d.dr_id and nvl(notes,'~')<>'--no_copy_data--';
        declare
          l_id_max number;
        begin
          select max(pr_id)+1 into l_id_max from rehab_prescriptions;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTIONS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_prescriptions_activity_time_ranges
        INSERT INTO REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES
           (pratr_id,
            PRATR_PR_ID,
            PRATR_CP_ID,
            PRATR_ACTUAL_START, PRATR_ACTUAL_END, PRATR_NOTES)
        SELECT
            SQ_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.nextval,
            pr_id,
            case
              when PAT_ID = 5 then
                case when TIMES_PER_DAY = 1 then decode(TIME_SLOT,1,41,2,42,3,43)
                     when TIMES_PER_DAY = 2 then 44
                     when TIMES_PER_DAY = 3 then 45
                else null end
              when PAT_ID = 21 then
                case when TIMES_PER_DAY = 1 then decode(TIME_SLOT,1,21,2,22,3,23)
                     when TIMES_PER_DAY = 2 then 24
                     when TIMES_PER_DAY = 3 then 25
                else null end
            else null end cp_id,
            planned_start,
            case when planned_end is not null and trunc(planned_end,'dd') <= trunc(systimestamp,'dd') then planned_end + 1 - 1/24/60/60
                 when planned_end is not null and trunc(planned_end,'dd') > trunc(systimestamp,'dd') and SUSPENDED = 'N' then planned_end + 1 - 1/24/60/60
                 when SUSPENDED = 'Y' and (planned_end is not null and trunc(planned_end,'dd') > trunc(systimestamp,'dd') or planned_end is null) then
                   nvl((select trunc(max(CONSUMED),'DD') from reabilitation.DRUG_USE u where u.pr_id=p.pr_id and u.PAT_ID=p.PAT_ID),planned_start+0.1)
            end planned_end,
            decode(SUSPENDED,'Y','Suspended')
        FROM
            reabilitation.prescription p where nvl(notes,'~')<>'--no_copy_data--'; --order by 1,2;
        commit;
        --******************************************************************************
        --prompt rehab_prescriptions_details
        INSERT INTO REHAB_PRESCRIPTIONS_DETAILS
           (prd_id,
           PRD_PRATR_ID,
           PRD_CPTR_ID,
           PRD_DR_ID, PRD_DOSAGE, PRD_SORT_ORDER, PRD_NOTES)
        SELECT
            SQ_REHAB_PRESCRIPTIONS_DETAILS.nextval,
            pratr_id,
            case
              when PAT_ID = 5 then
                case when PRATR_CP_ID = 41 then 16
                     when PRATR_CP_ID = 42 then 17
                     when PRATR_CP_ID = 43 then 18
                     when PRATR_CP_ID = 44 then 18+l.l
                     when PRATR_CP_ID = 45 then 20+l.l
                else null end
              when PAT_ID = 21 then
                case when PRATR_CP_ID = 21 then 9
                     when PRATR_CP_ID = 22 then -1
                     when PRATR_CP_ID = 23 then 10
                     when PRATR_CP_ID = 24 then 10+l.l
                     when PRATR_CP_ID = 25 then 12+l.l
                else null end
            else null end cptr_id,
            p0.DR_ID, DOSAGE,     PR_SORT_ORDER,   case when notes not like '%http%' then notes else null end
        FROM
            reabilitation.prescription p0, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES p1,
            (select level l from dual connect by level <=3) l
        where p0.PR_ID = p1.PRATR_PR_ID and l.l <= TIMES_PER_DAY and nvl(p0.notes,'~')<>'--no_copy_data--';
        commit;
        declare
          l_id_max number;
        begin
          select max(PRD_ID)+1 into l_id_max from REHAB_PRESCRIPTIONS_DETAILS;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTIONS_DETAILS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_drug_uses
        execute immediate 'alter TABLE REHAB_DRUG_USES modify DRU_PRD_ID NUMBER NULL';
        execute immediate 'alter TABLE REHAB_DRUG_USES modify DRU_DR_ID NUMBER NULL';

        insert into REHAB_DRUG_USES
              (dru_id, DRU_PRD_ID, DRU_PR_ID, DRU_PAT_ID, DRU_CPTR_ID, DRU_DR_ID, DRU_WS_ID, DRU_CONSUMED, DRU_ACTUAL_DOSAGE)
        select DRU_ID, null /*PRD_ID*/,     u.pr_id,     PAT_ID,
               --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI')
               (select CPTR_ID from
               (select CPTR_ID --||' (1) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR
                       CPTR_ID from REHAB_CONSUME_TIME_RANGES
                 where CPTR_CP_ID=PRATR_CP_ID
                   and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') between to_date(CPTR_START_TIME_STR,'HH24:MI') and to_date(CPTR_END_TIME_STR,'HH24:MI')+1/24
                union all
                select CPTR_ID from (
                select CPTR_ID--||' (2) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID
                  from REHAB_CONSUME_TIME_RANGES
                 where CPTR_CP_ID=PRATR_CP_ID
                   and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') < to_date(CPTR_END_TIME_STR,'HH24:MI')+2/24
                order by to_date(CPTR_START_TIME_STR,'HH24:MI')
                )
                union all
                select CPTR_ID from (
                select CPTR_ID--||' (3) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID
                  from REHAB_CONSUME_TIME_RANGES
                 where CPTR_CP_ID=PRATR_CP_ID
                   and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') > to_date(CPTR_END_TIME_STR,'HH24:MI')
                order by to_date(CPTR_START_TIME_STR,'HH24:MI')
                )
                ) where rownum=1) a,
               null/*PRD_DR_ID*/, PR_WS_ID, CONSUMED,     ACTUAL_DOSAGE--,
               --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') cc, PRATR_CP_ID
        from reabilitation.DRUG_USE u, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES r, --REHAB_PRESCRIPTIONS_DETAILS d,
             REHAB_PRESCRIPTIONS p
        where u.PR_ID=r.PRATR_PR_ID --and r.pratr_id=d.PRD_PRATR_ID
          and p.PR_ID = u.PR_ID
        order by 1;
        commit;
        update REHAB_DRUG_USES u
        set DRU_PRD_ID = (select PRD_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES a, REHAB_PRESCRIPTIONS_DETAILS d where a.PRATR_ID = d.PRD_PRATR_ID and d.PRD_CPTR_ID=u.DRU_CPTR_ID and u.DRU_PR_ID=a.PRATR_PR_ID);
        commit;

        update REHAB_DRUG_USES u
        set DRU_DR_ID = (select PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS d where d.PRD_ID = u.DRU_PRD_ID);
        commit;
        declare
          l_id_max number;
        begin
          select max(DRU_ID)+1 into l_id_max from REHAB_DRUG_USES;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_USES RESTART START WITH '||l_id_max;
        end;


        execute immediate 'alter TABLE REHAB_DRUG_USES modify DRU_PRD_ID NUMBER NOT NULL ENABLE';
        execute immediate 'alter TABLE REHAB_DRUG_USES modify DRU_DR_ID NUMBER NOT NULL ENABLE';
        --******************************************************************************
        --prompt rehab_drug_storages
        insert into REHAB_DRUG_STORAGES
              (ds_id, DS_TE_ID, DS_NAME, DS_DESCRIPTION, DS_CREATED, DS_UPDATED)
        select ds_id, 1,        DS_NAME, DS_DESCRIPTION, DS_CREATED, DS_UPDATED
        from reabilitation.drug_storage;
        commit;
        declare
          l_id_max number;
        begin
          select max(DS_ID)+1 into l_id_max from REHAB_DRUG_STORAGES;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_STORAGES RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_patient2storages
        insert into REHAB_PATIENT2STORAGES (p2s_ds_id, P2S_PAT_ID, P2S_IS_OWNER)
        select p2s_ds_id, P2S_PAT_ID, P2S_IS_OWNER
        from reabilitation.patient2storage;
        commit;
        --******************************************************************************
        --prompt rehab_drug_accountings
        insert into REHAB_DRUG_ACCOUNTINGS
         (da_id, DA_DS_ID, DA_DR_ID,   DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, DA_CHECK_POINT_DT, DA_PRR_ID, DA_PR_ID, DA_PRATR_ID, DA_WS_ID, DA_BEST_BEFORE)
        select
          da_id, DA_DS_ID, DA_DRUG_ID, DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, CHECK_POINT_DT,    DA_PRR_ID,    PR_ID,    PRATR_ID, PR_WS_ID, DA_BEST_BEFORE
        from reabilitation.drug_accounting a, REHAB_PRESCRIPTIONS p, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES r
        where a.DA_PRR_ID = p.PR_PRR_ID and a.DA_DRUG_ID=p.PR_DR_ID and p.PR_ID=r.PRATR_PR_ID order by 1;
        commit;
        declare
          l_id_max number;
        begin
          select max(da_id)+1 into l_id_max from REHAB_DRUG_ACCOUNTINGS;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_ACCOUNTINGS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_measurements
        insert into REHAB_MEASUREMENTS
         (mt_id, MT_PAT_ID, MT_TAKEN, MT_PRESSURE_LR, MT_PRESSURE_SYS, MT_PRESSURE_DIA, MT_PULSE, MT_TEMPERATURE, MT_SUGAR, MT_OXIGENATION, MT_WEIGHT, MT_DESCR)
        select
          mt_id,    PAT_ID,    TAKEN,    PRESSURE_LR,    PRESSURE_SYS,    PRESSURE_DIA,    PULSE,    TEMPERATURE,    SUGAR,    OXIGENATION,    WEIGHT,    DESCR
        from reabilitation.measurement;
        commit;
        declare
          l_id_max number;
        begin
          select max(mt_id)+1 into l_id_max from REHAB_MEASUREMENTS;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_MEASUREMENTS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_trainings
        insert into REHAB_TRAININGS
         (tr_id, TR_TYPE, TR_PAT_ID, TR_START, TR_END, TR_DISTANCE_LENGTH, TR_STEPS, TR_PULSE_AVG, TR_PULSE_MIN, TR_PULSE_MAX, TR_DESCR, TR_IMG1, TR_IMG2,
          real_distance, real_step_length, real_speed)
        select
          tr_id, TR_TYPE,    PAT_ID, TR_START, TR_END,    DISTANCE_LENGTH,    STEPS,    PULSE_AVG,    PULSE_MIN,    PULSE_MAX, TR_DESCR, TR_IMG1, TR_IMG2,
          real_distance, real_step_length, real_speed
        from reabilitation.trainings;
        commit;
        declare
          l_id_max number;
        begin
          select max(tr_id)+1 into l_id_max from REHAB_TRAININGS;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_TRAININGS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --prompt rehab_watch_logs
        insert into REHAB_WATCH_LOGS
         (wl_id, WL_PAT_ID, WL_TAKEN, WL_STEPS, WL_NIGHT_MIN_PULSE, WL_NIGHT_MAX_PULSE, WL_NIGHT_AVG_PULSE, WL_CALM_AVG_PULSE, WL_TOTAL_AVG_PULSE, WL_TOTAL_MIN_PULSE, WL_TOTAL_MAX_PULSE)
        select
          wl_id,    PAT_ID,    TAKEN,    STEPS,    NIGHT_MIN_PULSE,    NIGHT_MAX_PULSE, WL_NIGHT_AVG_PULSE, WL_CALM_AVG_PULSE, WL_TOTAL_AVG_PULSE, WL_TOTAL_MIN_PULSE, WL_TOTAL_MAX_PULSE
        from reabilitation.watch_log;
        commit;
        declare
          l_id_max number;
        begin
          select max(wl_id)+1 into l_id_max from REHAB_WATCH_LOGS;
          execute immediate 'ALTER SEQUENCE SQ_REHAB_WATCH_LOGS RESTART START WITH '||l_id_max;
        end;

        --******************************************************************************
        --validate data-----------------------------------------------------------------
        --******************************************************************************
--        select (select count(1) from reabilitation.drug_accounting) drug_accounting,(select count(1) from REHAB_DRUG_ACCOUNTINGS) RB_DRUG_ACCOUNTINGS from dual;
--        select (select count(1) from REABILITATION.DRUG_STORAGE) DRUG_STORAGE,(select count(1) from REHAB_DRUG_STORAGES) RB_DRUG_STORAGES from dual;
--        select (select count(1) from REABILITATION.DRUG_USE) DRUG_USE,(select count(1) from REHAB_DRUG_USES) RB_DRUG_USES from dual;
--        select (select count(1) from REABILITATION.DRUGS) DRUGS,(select count(1) from REHAB_DRUGS) RB_DRUGS from dual;
--        select (select count(1) from REABILITATION.MEASUREMENT) MEASUREMENT,(select count(1) from REHAB_MEASUREMENTS) RB_MEASUREMENTS from dual;
--        select (select count(1) from REABILITATION.PATIENTS) PATIENTS,(select count(1) from REHAB_PATIENTS) RB_PATIENTS from dual;
--        select (select count(1) from REABILITATION.PRESCRIPTION where nvl(notes,'~')<>'--no_copy_data--') PRESCRIPTION,(select count(1) from REHAB_PRESCRIPTIONS) RB_PRESCRIPTIONS,(select count(1) from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES)RB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES,(select count(1) from REHAB_PRESCRIPTIONS_DETAILS) RB_PRESCRIPTIONS_DETAILS from dual;
--        select (select count(1) from REABILITATION.PRESCRIPTOR) PRESCRIPTOR,(select count(1) from REHAB_PRESCRIPTORS) RB_PRESCRIPTORS from dual;
--        select (select count(1) from REABILITATION.PRESCRIPTOR2DRUG_FLT) PRESCRIPTOR2DRUG_FLT,(select count(1) from REHAB_PRESCRIPTOR2DRUG_FLTS) RB_PRESCRIPTOR2DRUG_FLTS from dual;
--        select (select count(1) from REABILITATION.TRAININGS) TRAININGS,(select count(1) from REHAB_TRAININGS) RB_TRAININGS from dual;
--        select (select count(1) from REABILITATION.WATCH_LOG) WATCH_LOG,(select count(1) from REHAB_WATCH_LOGS) RB_WATCH_LOGS from dual;

        --******************************************************************************
        --Fix data----------------------------------------------------------------------
        --******************************************************************************

        for i in (
            select pr_prr_id, pr_ws_id from REHAB_PRESCRIPTIONS
            where pr_ws_id is not null
            group by pr_prr_id, pr_ws_id
            --having count(1) > 1
            )
        loop
          REHAB_MIGRATE_PKG.fix_prescriptions (  P_PRR_ID => i.pr_prr_id,
                                                 P_WS_ID => i.pr_ws_id) ;
        end loop;
        --******************************************************************************
        --test data---------------------------------------------------------------------
        --******************************************************************************
        --select /*insert*/ * from REHAB_TENANTS;
        Insert into REHAB_TENANTS (TE_ID,TE_NAME,TE_DESCR) values (2,'Test 2','Second tenant');
        execute immediate 'ALTER SEQUENCE SQ_REHAB_TENANTS RESTART START WITH 3';
        --select /*insert*/ * from REHAB_PATIENTS;
        Insert into REHAB_PATIENTS (PAT_ID,PAT_TE_ID,PAT_NAME,PAT_SURNAME,PAT_EMAIL,PAT_STATUS,PAT_CREATED,PAT_STATUS_CHANGED,PAT_APEX_USER,PAT_IS_SUPERUSER,PAT_IS_TENANTADM) values (1,2,'Test1','T','t@a.com','ACTIVE',to_timestamp_tz('2026-09-08 11.40.04 +03:00','YYYY-MM-DD HH24.MI.SS TZH:TZM'),to_timestamp_tz('2026-09-08 11.40.10 +03:00','YYYY-MM-DD HH24.MI.SS TZH:TZM'),'TEST1','false','true');
        Insert into REHAB_PATIENTS (PAT_ID,PAT_TE_ID,PAT_NAME,PAT_SURNAME,PAT_EMAIL,PAT_STATUS,PAT_CREATED,PAT_STATUS_CHANGED,PAT_APEX_USER,PAT_IS_SUPERUSER,PAT_IS_TENANTADM) values (2,2,'Test2','T2','t2@a.com','ACTIVE',to_timestamp_tz('2026-09-08 11.40.52 +03:00','YYYY-MM-DD HH24.MI.SS TZH:TZM'),to_timestamp_tz('2026-09-08 11.40.57 +03:00','YYYY-MM-DD HH24.MI.SS TZH:TZM'),'TEST2','false','false');
        commit;
  END refresh_data;

END REHAB_MIGRATE_PKG;
/

