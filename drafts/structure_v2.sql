
drop assertion if exists rehub_check_dru_pr_pat;
drop assertion if exists REHAB_CHECK_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_overlap;
drop assertion if exists REHAB_CHECK_CONSUME_PATTERNS_TE_PAT;
drop assertion if exists REHAB_CHECK_TIME_PERIODS_TE_PAT;
drop assertion if exists rehub_check_pr_prr_pat;
--drop view V$REHAB_CONSUME_TIME_RANGES;

drop table if exists apex_stored_states purge;
drop table if exists REHAB_CONFIGS purge;
drop table if exists REHAB_DRUG_ACCOUNTINGS purge;
drop table if exists REHAB_PATIENT2STORAGES purge;
drop table if exists REHAB_DRUG_STORAGES purge;
drop table if exists REHAB_DRUG_USES purge;
drop table if exists REHAB_MEASUREMENTS purge;
drop TABLE if exists REHAB_PRESCRIPTIONS_DETAILS purge;
drop TABLE if exists REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES purge;
drop table if exists REHAB_PRESCRIPTOR2DRUG_FLTS purge;
drop table if exists REHAB_PRESCRIPTIONS purge;
drop table if exists REHAB_PRESCRIPTORS purge;
drop table if exists REHAB_TRAININGS purge;
drop table if exists REHAB_WATCH_LOGS purge;
drop table if exists REHAB_DRUGS purge;
drop TABLE if exists REHAB_WORKING_SUBSTANCE purge;
drop TABLE if exists REHAB_CONSUME_TIME_RANGES purge;
drop TABLE if exists REHAB_CONSUME_PATTERNS purge;
drop TABLE if exists REHAB_PATIENTS2P_ACCESS purge;
drop TABLE if exists REHAB_TIME_PERIODS purge;
drop table if exists REHAB_PATIENTS purge;
drop table if exists REHAB_TENANTS purge;

drop sequence if exists SQ_APEX_STORED_STATES;
drop sequence if exists SQ_REHAB_DRUG_ACCOUNTINGS;
drop sequence if exists SQ_REHAB_DRUG_STORAGES;
drop sequence if exists SQ_REHAB_DRUG_USES;
drop sequence if exists SQ_REHAB_DRUGS;
drop sequence if exists SQ_REHAB_MEASUREMENTS;
drop sequence if exists SQ_REHAB_PATIENTS;
drop sequence if exists SQ_REHAB_PRESCRIPTIONS;
drop sequence if exists SQ_REHAB_PRESCRIPTORS;
drop sequence if exists SQ_REHAB_TRAININGS;
drop sequence if exists SQ_REHAB_WATCH_LOGS;
drop sequence if exists SQ_REHAB_TENANTS;
drop sequence if exists SQ_REHAB_CONSUME_PATTERNS;
drop sequence if exists SQ_REHAB_CONSUME_TIME_RANGES;
drop sequence if exists SQ_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;
drop sequence if exists SQ_REHAB_PRESCRIPTIONS_DETAILS;
drop sequence if exists SQ_REHAB_WORKING_SUBSTANCE;
drop sequence if exists SQ_REHAB_TIME_PERIODS;
select * from user_objects;
--******************************************************************************
CREATE TABLE APEX_STORED_STATES
   (STORAGE_ID NUMBER,
    APP_USER VARCHAR2(128) NOT NULL ENABLE,
    APP_PAGE NUMBER NOT NULL ENABLE,
    STORAGE_TYPE VARCHAR2(30) NOT NULL ENABLE,
    STORAGE_NAME VARCHAR2(30) NOT NULL ENABLE,
    STORAGE_UPDATED TIMESTAMP (6) WITH TIME ZONE NOT NULL ENABLE,
    PARAMS JSON
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING
 JSON (PARAMS) STORE AS ( CHUNK 8192 RETENTION MIN 1800) ;

ALTER TABLE APEX_STORED_STATES ADD CHECK (storage_type in ('DEFAULT','USERDEFINED')) ENABLE;

ALTER TABLE APEX_STORED_STATES ADD CONSTRAINT APEX_STORED_STATES_PK PRIMARY KEY (STORAGE_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

CREATE UNIQUE INDEX IX_APEX_STORED_STATES_TYPES ON APEX_STORED_STATES (APP_USER, APP_PAGE, DECODE(STORAGE_TYPE,'DEFAULT',STORAGE_TYPE,STORAGE_NAME))
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
CREATE SEQUENCE  SQ_APEX_STORED_STATES;

--******************************************************************************
create table REHAB_TENANTS (
    TE_ID NUMBER NOT NULL ENABLE,
    TE_NAME varchar2(128),
    TE_DESCR varchar2(4000)
  );

ALTER TABLE REHAB_TENANTS ADD CONSTRAINT PK_REHAB_TENANTS PRIMARY KEY (TE_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

CREATE SEQUENCE  SQ_REHAB_TENANTS;

--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_tenants (te_id,te_name,te_descr) VALUES (1, 'My Family', 'First tenant');
-- ALTER SEQUENCE SQ_REHAB_TENANTS RESTART START WITH 2;
--******************************************************************************
CREATE TABLE REHAB_PATIENTS
   (PAT_ID NUMBER NOT NULL ENABLE,
    PAT_TE_ID NUMBER NOT NULL ENABLE,
    PAT_NAME VARCHAR2(128),
    PAT_SURNAME VARCHAR2(128),
    PAT_EMAIL VARCHAR2(128),
    PAT_STATUS VARCHAR2(32),
    PAT_CREATED TIMESTAMP (6) WITH TIME ZONE,
    PAT_STATUS_CHANGED TIMESTAMP (6) WITH TIME ZONE,
    PAT_APEX_USER VARCHAR2(128),
    PAT_IS_SUPERUSER boolean default false,
    PAT_IS_TENANTADM boolean default false
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;
--ALTER TABLE REHAB_PATIENTS ADD PAT_IS_TENANTADM boolean default false;
ALTER TABLE REHAB_PATIENTS ADD CONSTRAINT PK_REHAB_PATIENTS PRIMARY KEY (PAT_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_PATIENTS ADD CONSTRAINT FK_REHAB_PATIENTS_TE FOREIGN KEY (PAT_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;
      
CREATE INDEX IDX_REHAB_PATIENTS_APEX_USR ON REHAB_PATIENTS (PAT_APEX_USER)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
CREATE SEQUENCE  SQ_REHAB_PATIENTS;
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_patients 
--    (pat_id,pat_te_id,pat_name,pat_surname,pat_email,pat_status,pat_created,pat_status_changed,pat_apex_user,pat_is_superuser) 
-- SELECT
--     pat_id,1,        pat_name,pat_surname,pat_email,pat_status,pat_created,pat_status_changed,apex_user,    false
-- FROM
--     reabilitation.patients;
-- commit;
-- update rehab_patients set pat_apex_user = 'YURI', pat_is_superuser = true
-- where pat_id = 5;
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(pat_id)+1 into l_id_max from rehab_patients;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_PATIENTS RESTART START WITH '||l_id_max;
-- end;
-- /
--******************************************************************************
CREATE TABLE REHAB_PATIENTS2P_ACCESS
   (P2PA_SUBJ_PAT_ID NUMBER NOT NULL ENABLE,
    P2PA_TRG_PAT_ID NUMBER NOT NULL ENABLE,
    P2PA_CAN_MANAGE boolean default false); -- false - can view, true - can manage (work on behalf)
    
ALTER TABLE REHAB_PATIENTS2P_ACCESS ADD CONSTRAINT PK_REHAB_PATIENTS2P_ACCESS PRIMARY KEY (P2PA_SUBJ_PAT_ID, P2PA_TRG_PAT_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;    
  
ALTER TABLE REHAB_PATIENTS2P_ACCESS ADD CONSTRAINT FK_REHAB_PATIENTS2P_ACCESS_SUBJPAT FOREIGN KEY (P2PA_SUBJ_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;
      
ALTER TABLE REHAB_PATIENTS2P_ACCESS ADD CONSTRAINT FK_REHAB_PATIENTS2P_ACCESS_TRGPAT FOREIGN KEY (P2PA_TRG_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_patients2p_access (p2pa_subj_pat_id,p2pa_trg_pat_id,p2pa_can_manage) VALUES (21,5,false);
-- commit;
--******************************************************************************
CREATE TABLE REHAB_CONFIGS
   (PAR_NAME VARCHAR2(30) NOT NULL ENABLE,
    PAR_HUMAN_NAME VARCHAR2(128) NOT NULL ENABLE,
    PAR_CATEGOTY VARCHAR2(128) NOT NULL ENABLE,
    PAR_TE_ID NUMBER,
    PAR_PAT_ID NUMBER,
    PAR_VALUE VARCHAR2(512),
	  PAR_DESCRIPTION VARCHAR2(4000)
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;
 
ALTER TABLE REHAB_CONFIGS ADD CONSTRAINT UK_REHAB_CONFIGS UNIQUE (PAR_NAME, PAR_TE_ID, PAR_PAT_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_CONFIGS ADD CONSTRAINT FK_REHAB_CONFIGS_TE FOREIGN KEY (PAR_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;

ALTER TABLE REHAB_CONFIGS ADD CONSTRAINT FK_REHAB_CONFIGS_PAT FOREIGN KEY (PAR_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;
--//////////////////////////////////////////////////////////////////////////////    
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBAGG_MEAS','Вимірювання, днів','Дашборд Агрегація',null,null,'2',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBAGG_TRAI','Тренування, днів','Дашборд Агрегація',null,null,'7',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBAGG_TRAK','Трекери, днів','Дашборд Агрегація',null,null,'7',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_OXY','Кисень','Дашборд Виміри',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_PRESSURE','Кров''яний тиск','Дашборд Виміри',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_PULSE','Пульс','Дашборд Виміри',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_SUGAR','Цукор','Дашборд Виміри',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_TEMPR','Температура','Дашборд Виміри',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBMEA_WEIGHT','Вага','Дашборд Виміри',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBREM_DAYS2ALERT','Залишок, днів','Дашборд Залишки',null,null,'14',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_ALLSTEPS','Всі денні кроки','Дашборд Мета',null,null,'10000',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_OXI_MAX','Кисень max','Дашборд Мета',null,null,'100',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_OXI_MIN','Кисень min','Дашборд Мета',null,null,'94',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PDIA_MAX','Тиск DIA max','Дашборд Мета',null,null,'85',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PDIA_MIN','Тиск DIA min','Дашборд Мета',null,null,'70',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PSYS_MAX','Тиск SYS max','Дашборд Мета',null,null,'125',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PSYS_MIN','Тиск SYS min','Дашборд Мета',null,null,'115',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PULSE_MAX','Пульс max','Дашборд Мета',null,null,'65',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_PULSE_MIN','Пульс min','Дашборд Мета',null,null,'55',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_SHOW','Показувати мету','Дашборд Мета',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_SUGAR_MAX','Цукор max','Дашборд Мета',null,null,'5',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_SUGAR_MIN','Цукор min','Дашборд Мета',null,null,'3.5',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TEMPR_MAX','Температура max','Дашборд Мета',null,null,'37',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TEMPR_MIN','Температура min','Дашборд Мета',null,null,'36',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TRAINDIST','Тренуальна дистанція','Дашборд Мета',null,null,'5',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_TRAINSTEPS','Тренувальні кроки','Дашборд Мета',null,null,'8000',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_WEIGHT_MAX','Вага max','Дашборд Мета',null,null,'73',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRG_WEIGHT_MIN','Вага min','Дашборд Мета',null,null,'70',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBWAT_PULSE','Пульс','Дашборд Трекери',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBWAT_STEPS','Кроки','Дашборд Трекери',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRA_DISTANCE','Дистанція','Дашборд Тренування',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRA_PULSE','Пульс','Дашборд Тренування',null,null,'Y',null);
--         Insert into REHAB_CONFIGS (PAR_NAME,PAR_HUMAN_NAME,PAR_CATEGOTY,PAR_TE_ID,PAR_PAT_ID,PAR_VALUE,PAR_DESCRIPTION) values ('DBTRA_STEPS','Кроки','Дашборд Тренування',null,null,'Y',null);
-- commit; 
--******************************************************************************
CREATE TABLE REHAB_WORKING_SUBSTANCE (
  WS_ID NUMBER NOT NULL ENABLE,
  WS_TE_ID NUMBER,
  WS_NAME VARCHAR2(512),
  WS_DESCR VARCHAR2(4000)
);

ALTER TABLE REHAB_WORKING_SUBSTANCE ADD CONSTRAINT PK_REHAB_WORKING_SUBSTANCE PRIMARY KEY (WS_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_WORKING_SUBSTANCE ADD CONSTRAINT FK_REHAB_WORKING_SUBSTANCE_TE FOREIGN KEY (WS_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;
      
CREATE SEQUENCE SQ_REHAB_WORKING_SUBSTANCE;
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO REHAB_WORKING_SUBSTANCE 
--     (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)         
-- values
--     (1,1,'Бісопролол','Бісопролол – високоселективний ß1-адреноблокатор.');
-- INSERT INTO REHAB_WORKING_SUBSTANCE 
--     (ws_id, WS_TE_ID, WS_NAME, WS_DESCR)         
-- values
--     (2,1,'Розувастатин','Розувастатин − це селективний та конкурентний інгібітор ГМГ-КоА-редуктази, ферменту, що визначає швидкість реакції та перетворює 3-гідрокси-3-метилглутарил кофермент А у мевалонат, попередник холестерину. Основним місцем дії розувастатину є печінка: орган-мішень для зменшення рівня холестерину.');           
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(ws_id)+1 into l_id_max from REHAB_WORKING_SUBSTANCE;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_WORKING_SUBSTANCE RESTART START WITH '||l_id_max;
-- end;  
-- /
--******************************************************************************
--++TBD externalize working substance
CREATE TABLE REHAB_DRUGS
   (DR_ID NUMBER NOT NULL ENABLE,
    DR_TE_ID NUMBER,
    DR_NAME VARCHAR2(128),
    --DR_TYPE VARCHAR2(512),
    DR_TYPE_SHORT VARCHAR2(128),
    DR_WS_ID NUMBER,  -- not all drug has to have working substance, so it can be null
    DR_WS_FORMULA VARCHAR2(4000),
    DR_USE_CASE VARCHAR2(4000),
    DR_WHEN2CONSUME VARCHAR2(512),
    DR_INSTRUCTION CLOB,
    DR_INSTR_SRC_URL VARCHAR2(512),
    DR_ITEM_IMAGE1 BLOB,
    DR_ITEM_IMAGE2 BLOB,
    DR_PACK_IMAGE1 BLOB,
    DR_PACK_IMAGE2 BLOB	
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING
 LOB (DR_INSTRUCTION) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (DR_ITEM_IMAGE1) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  CACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (DR_ITEM_IMAGE2) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (DR_PACK_IMAGE1) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (DR_PACK_IMAGE2) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;

ALTER TABLE REHAB_DRUGS ADD CONSTRAINT PK_REHAB_DRUGS PRIMARY KEY (DR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_DRUGS ADD CONSTRAINT FK_REHAB_DRUGS_TE FOREIGN KEY (DR_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;

ALTER TABLE REHAB_DRUGS ADD CONSTRAINT FK_REHAB_DRUGS_WS FOREIGN KEY (DR_WS_ID)
	  REFERENCES REHAB_WORKING_SUBSTANCE (WS_ID) ENABLE;
      
CREATE SEQUENCE  SQ_REHAB_DRUGS;
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_drugs 
--     (dr_id,dr_te_id,dr_name,/*dr_type,*/dr_type_short,DR_WS_ID,dr_use_case,dr_when2consume,
--     dr_instruction,dr_instr_src_url,dr_item_image1,dr_item_image2,dr_pack_image1,dr_pack_image2) 
-- SELECT
--     dr_id,1,       dr_name,/*dr_type*/type_short,   null /*dr_working_subst*/ ,use_case,   when2consume,
--     dr_instruction,dr_nstr_src_url,dr_item_image1,dr_item_image2,dr_pack_image1,dr_pack_image2    
-- FROM
--     reabilitation.drugs d;
-- --            , REHAB_WORKING_SUBSTANCE w
-- --        where initcap(d.dr_working_subst) = w.WS_NAME;
-- update rehab_drugs
-- set DR_WS_ID = 1 where dr_id in (25, 61, 161);
-- update rehab_drugs
-- set DR_WS_ID = 2 where dr_id in (24, 62, 84);  
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(dr_id)+1 into l_id_max from rehab_drugs;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUGS RESTART START WITH '||l_id_max;
-- end;
-- /
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTORS
   (PRR_ID NUMBER NOT NULL ENABLE,
    PRR_PRESCRIPTED_BY_SHORT VARCHAR2(4000),
    PRR_PRESCRIPTED_WHEN TIMESTAMP (6) WITH TIME ZONE,
    PRR_PRESCRIPTED_BY_FULL VARCHAR2(4000),
    PRR_PAT_ID NUMBER NOT NULL ENABLE,
    PRR_FULL_TEXT CLOB,
    PRR_PAGE1 BLOB,
    PRR_PAGE2 BLOB,
    PRR_PAGE3 BLOB,
    PRR_PAGE4 BLOB,
    PRR_PAGE5 BLOB
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING
 LOB (PRR_FULL_TEXT) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (PRR_PAGE1) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (PRR_PAGE2) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (PRR_PAGE3) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES )
 LOB (PRR_PAGE4) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB (PRR_PAGE5) STORE AS SECUREFILE (ENABLE STORAGE IN ROW
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES );
ALTER TABLE REHAB_PRESCRIPTORS ADD CONSTRAINT PK_REHAB_PRESCRIPTORS PRIMARY KEY (PRR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_PRESCRIPTORS ADD CONSTRAINT FK_REHAB_PRR_PAT FOREIGN KEY (PRR_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;
      
CREATE SEQUENCE  SQ_REHAB_PRESCRIPTORS;
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_prescriptors (
--     prr_id,prr_prescripted_by_short,prr_prescripted_when,prr_prescripted_by_full,
--     prr_pat_id,prr_full_text,prr_page1,prr_page2,prr_page3,prr_page4,prr_page5
-- ) 
-- SELECT
--     prr_id,prr_prescripted_by,      prr_prescripted_when,prr_prescripted_by_full,
--     prr_pat_id,prr_full_text,prr_doc1,prr_doc2,prr_doc3,null, null 
-- FROM
--     reabilitation.prescriptor;
-- declare
--   l_id_max number;
-- begin
--   select max(prr_id)+1 into l_id_max from rehab_prescriptors;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTORS RESTART START WITH '||l_id_max;
-- end;
-- /    
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTOR2DRUG_FLTS
   (PRRF_PRR_ID NUMBER NOT NULL ENABLE,
    PRRF_DR_ID NUMBER,
	  PRRF_WS_ID NUMBER
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_PRESCRIPTOR2DRUG_FLTS ADD CONSTRAINT FK_REHAB_PRRFLT_PRR FOREIGN KEY (PRRF_PRR_ID)
	  REFERENCES REHAB_PRESCRIPTORS (PRR_ID) ENABLE;

ALTER TABLE REHAB_PRESCRIPTOR2DRUG_FLTS ADD CONSTRAINT FK_REHAB_PRRFLT_WS FOREIGN KEY (PRRF_WS_ID)
	  REFERENCES REHAB_WORKING_SUBSTANCE (WS_ID) ENABLE;

ALTER TABLE REHAB_PRESCRIPTOR2DRUG_FLTS ADD CONSTRAINT FK_REHAB_PRRFLT_DR FOREIGN KEY (PRRF_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;    
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_prescriptor2drug_flts (
--     prrf_prr_id,
--     PRRF_DR_ID,
--     PRRF_WS_ID
-- )
-- SELECT
--     prr_id,
--     f.dr_id,
--     d.DR_WS_ID
-- FROM
--     reabilitation.prescriptor2drug_flt f, REHAB_DRUGS d
--     where f.dr_id = d.dr_id;
-- commit;
--******************************************************************************
CREATE TABLE REHAB_TIME_PERIODS
   (TP_ID NUMBER NOT NULL ENABLE,
    TP_TE_ID NUMBER,
    TP_PAT_ID NUMBER,
    TP_NAME VARCHAR2(128),
    TP_DESCR VARCHAR2(4000),
    TP_START_TIME_STR varchar2(10) not null,
    TP_END_TIME_STR varchar2(10) not null  
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING
;

ALTER TABLE REHAB_TIME_PERIODS ADD CONSTRAINT PK_REHAB_TIME_PERIODS PRIMARY KEY (TP_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_TIME_PERIODS ADD CONSTRAINT FK_REHAB_TIME_PERIODS_TE FOREIGN KEY (TP_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;

ALTER TABLE REHAB_TIME_PERIODS ADD CONSTRAINT FK_REHAB_TIME_PERIODS_PAT FOREIGN KEY (TP_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;


create assertion REHAB_CHECK_TIME_PERIODS_TE_PAT check(
  all (
    select TP_TE_ID, TP_PAT_ID
    from   REHAB_TIME_PERIODS where TP_PAT_ID is not null
  ) tr1
  satisfy (
    exists (
      select 1
      from   REHAB_PATIENTS tr2
      where  tr1.TP_PAT_ID = tr2.PAT_ID and nvl(tr1.TP_TE_ID,0) = tr2.PAT_TE_ID
    )
  )
);

CREATE SEQUENCE  SQ_REHAB_TIME_PERIODS;
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR) 
--     VALUES (1,null,null,'Ніч-ранок','ПеріодРанній ранок','00:00','06:00');
-- INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR) 
--     VALUES (2,null,null,'Ранок','Ранковий період','06:00','12:00');
-- INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR) 
--     VALUES (3,null,null,'День','Денний період','12:00','18:00');
-- INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR) 
--     VALUES (4,null,null,'Вечір','Вечірній період','18:00','22:00');
-- INSERT INTO REHAB_TIME_PERIODS (TP_ID, TP_TE_ID, TP_PAT_ID, TP_NAME, TP_DESCR, TP_START_TIME_STR, TP_END_TIME_STR) 
--     VALUES (5,null,null,'Ніч','Період пізнього вечора','22:00','23:59');
-- commit;
-- ALTER SEQUENCE SQ_REHAB_TIME_PERIODS RESTART START WITH 6; 
--******************************************************************************
CREATE TABLE REHAB_CONSUME_PATTERNS
   (CP_ID NUMBER NOT NULL ENABLE,
    CP_PRNT_ID NUMBER,
    CP_TE_ID NUMBER,
    CP_PAT_ID NUMBER,
    CP_NAME VARCHAR2(128),
    CP_DESCR VARCHAR2(4000)
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING
;

ALTER TABLE REHAB_CONSUME_PATTERNS ADD CONSTRAINT PK_REHAB_CONSUME_PATTERNS PRIMARY KEY (CP_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_CONSUME_PATTERNS ADD CONSTRAINT FK_REHAB_CONSUME_PATTERNS_PRNT FOREIGN KEY (CP_PRNT_ID)
	  REFERENCES REHAB_CONSUME_PATTERNS (CP_ID) ENABLE;
      
ALTER TABLE REHAB_CONSUME_PATTERNS ADD CONSTRAINT FK_REHAB_CONSUME_PATTERNS_TE FOREIGN KEY (CP_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;

ALTER TABLE REHAB_CONSUME_PATTERNS ADD CONSTRAINT FK_REHAB_CONSUME_PATTERNS_PAT FOREIGN KEY (CP_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

create assertion REHAB_CHECK_CONSUME_PATTERNS_TE_PAT check(
  all (
    select CP_TE_ID, CP_PAT_ID
    from   REHAB_CONSUME_PATTERNS where CP_PAT_ID is not null
  ) tr1
  satisfy (
    exists (
      select 1
      from   REHAB_PATIENTS tr2
      where  tr1.CP_PAT_ID = tr2.PAT_ID and nvl(tr1.CP_TE_ID,0) = tr2.PAT_TE_ID
    )
  )
);

CREATE SEQUENCE  SQ_REHAB_CONSUME_PATTERNS;
--//////////////////////////////////////////////////////////////////////////////
--delete from rehab_consume_patterns;
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (1,null,null,null,'One Time Morning','Common "One Time in the Morning"');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (2,null,null,null,'One Time Noon','Common "One Time in the Noon"');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (3,null,null,null,'One Time Evening','Common "One Time in the Evening"');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (4,null,null,null,'Two Times Morning and Evening','Common "Two Times in the Morning and Evening"');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (5,null,null,null,'Three Times per day','Common "Three Times per day: in the Morning, Noon, and Evening"');
-- --Olya
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (21,1,1,21,q'[Olya's One Time Morning]',q'[Olya's Common "One Time in the Morning"]');
-- --INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (22,2,21,null,q'[Olya's One Time Noon]',q'[Olya's Common "One Time in the Noon"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (23,3,1,21,q'[Olya's One Time Evening]',q'[Olya's Common "One Time in the Evening"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (24,4,1,21,q'[Olya's Two Times Morning and Evening]',q'[Olya's Common "Two Times in the Morning and Evening"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (25,5,1,21,q'[Olya's Three Times per day]',q'[Olya's Common "Three Times per day: in the Morning, Noon, and Evening"]');
-- --Yuri
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (41,1,1,5,q'[Yuri's One Time Morning]',q'[Yuri's Common "One Time in the Morning"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (42,2,1,5,q'[Yuri's One Time Noon]',q'[Yuri's Common "One Time in the Noon"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (43,3,1,5,q'[Yuri's One Time Evening]',q'[Yuri's Common "One Time in the Evening"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (44,4,1,5,q'[Yuri's Two Times Morning and Evening]',q'[Yuri's Common "Two Times in the Morning and Evening"]');
-- INSERT INTO rehab_consume_patterns (cp_id,cp_prnt_id,cp_te_id,cp_pat_id,cp_name,cp_descr) VALUES (45,5,1,5,q'[Yuri's Three Times per day]',q'[Yuri's Common "Three Times per day: in the Morning, Noon, and Evening"]');
-- commit;
-- ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 61; 
--******************************************************************************
CREATE TABLE REHAB_CONSUME_TIME_RANGES
   (CPTR_ID NUMBER NOT NULL ENABLE,
    CPTR_CP_ID NUMBER NOT NULL ENABLE,
    CPTR_NAME VARCHAR2(128),
    CPTR_START_TIME_STR varchar2(10) not null,
    CPTR_END_TIME_STR varchar2(10) not null
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING
;

--select sessiontimezone ,
--       to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||'08:00'||' '||sessiontimezone,'YYYYMMDDHH24:MI TZH:TZM')
--from dual;
ALTER TABLE REHAB_CONSUME_TIME_RANGES ADD CONSTRAINT PK_REHAB_CONSUME_TIME_RANGES PRIMARY KEY (CPTR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_CONSUME_TIME_RANGES ADD CONSTRAINT FK_REHAB_CONSUME_TIME_RANGES_CP FOREIGN KEY (CPTR_CP_ID)
	  REFERENCES REHAB_CONSUME_PATTERNS (CP_ID) ENABLE;
      
CREATE SEQUENCE  SQ_REHAB_CONSUME_TIME_RANGES;

-- create or replace view V$REHAB_CONSUME_TIME_RANGES
-- as
-- select x.*,
--     (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZH:TZM')) CPTR_START_TIME_DT,
--     (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZH:TZM')) CPTR_END_TIME_DT
--   from REHAB_CONSUME_TIME_RANGES x;
--//////////////////////////////////////////////////////////////////////////////
--delete /*+ noparallel */ from rehab_consume_time_ranges;
--select * from REHAB_CONSUME_PATTERNS p, v$rehab_consume_time_ranges r
--where p.CP_ID=r.cptr_cp_id order by CP_ID, cptr_id;
-- INSERT ALL 
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (1,      1,         'Morning 1 time', START_TIM_1T1,      END_TIM_1T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (2,      2,         'Noon 1 time',    START_TIM_1T2,      END_TIM_1T2 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (3,      3,         'Evening 1 time', START_TIM_1T3,      END_TIM_1T3 )
-- --
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (4,      4,         'Morning 2 times', START_TIM_2T1,      END_TIM_2T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (5,      4,         'Evening 2 times', START_TIM_2T2,      END_TIM_2T2 )
-- --
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (6,      5,         'Morning 3 times', START_TIM_3T1,      END_TIM_3T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (7,      5,         'Noon 3 times',    START_TIM_3T2,      END_TIM_3T2 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (8,      5,         'Evening 3 times', START_TIM_3T3,      END_TIM_3T3 )
-- select * from (
-- select 
--   OWNER,
--   START_TIM_1T1,
--   END_TIM_1T1,
--   START_TIM_1T2,
--   END_TIM_1T2,
--   START_TIM_1T3,
--   END_TIM_1T3,
--   START_TIM_2T1,
--   END_TIM_2T1,
--   START_TIM_2T2,
--   END_TIM_2T2,
--   START_TIM_3T1,
--   END_TIM_3T1,
--   START_TIM_3T2,
--   END_TIM_3T2,
--   START_TIM_3T3,
--   END_TIM_3T3
-- from reabilitation.TIME_RANGE_CONFIG x where owner in (/*'OLYAPTAH',*/'DEFAULT'))
-- where owner = 'DEFAULT' /*'OLYAPTAH'*/;

-- INSERT ALL 
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (9,      21,         'Morning 1 time', START_TIM_1T1,      END_TIM_1T1 )
-- --  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
-- --                          VALUES (2,      22,         'Noon 1 time',    START_TIM_1T2,      END_TIM_1T2 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (10,      23,         'Evening 1 time', START_TIM_1T3,      END_TIM_1T3 )
-- --
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (11,      24,         'Morning 2 times', START_TIM_2T1,      END_TIM_2T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (12,      24,         'Evening 2 times', START_TIM_2T2,      END_TIM_2T2 )
-- --
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (13,      25,         'Morning 3 times', START_TIM_3T1,      END_TIM_3T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (14,      25,         'Noon 3 times',    START_TIM_3T2,      END_TIM_3T2 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (15,      25,         'Evening 3 times', START_TIM_3T3,      END_TIM_3T3 )
-- select * from (
-- select 
--   OWNER,
--   COALESCE(START_TIM_1T1, lead(START_TIM_1T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_1T1,
--   COALESCE(END_TIM_1T1,   lead(END_TIM_1T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_1T1,
--   COALESCE(START_TIM_1T2, lead(START_TIM_1T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_1T2,
--   COALESCE(END_TIM_1T2,   lead(END_TIM_1T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_1T2,
--   COALESCE(START_TIM_1T3, lead(START_TIM_1T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_1T3,
--   COALESCE(END_TIM_1T3,   lead(END_TIM_1T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_1T3,
--   COALESCE(START_TIM_2T1, lead(START_TIM_2T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_2T1,
--   COALESCE(END_TIM_2T1,   lead(END_TIM_2T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_2T1,
--   COALESCE(START_TIM_2T2, lead(START_TIM_2T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_2T2,
--   COALESCE(END_TIM_2T2,   lead(END_TIM_2T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_2T2,
--   COALESCE(START_TIM_3T1, lead(START_TIM_3T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_3T1,
--   COALESCE(END_TIM_3T1,   lead(END_TIM_3T1, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_3T1,
--   COALESCE(START_TIM_3T2, lead(START_TIM_3T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_3T2,
--   COALESCE(END_TIM_3T2,   lead(END_TIM_3T2, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_3T2,
--   COALESCE(START_TIM_3T3, lead(START_TIM_3T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) START_TIM_3T3,
--   COALESCE(END_TIM_3T3,   lead(END_TIM_3T3, 1) OVER (ORDER BY decode(owner,'OLYAPTAH',0,'DEFAULT',1,2))) END_TIM_3T3
-- from reabilitation.TIME_RANGE_CONFIG x where owner in ('OLYAPTAH','DEFAULT'))
-- where owner = 'OLYAPTAH';

-- INSERT ALL 
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (16,      41,         'Morning 1 time', START_TIM_1T1,      END_TIM_1T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (17,      42,         'Noon 1 time',    START_TIM_1T2,      END_TIM_1T2 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (18,      43,         'Evening 1 time', START_TIM_1T3,      END_TIM_1T3 )
-- --
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (19,      44,         'Morning 2 times', START_TIM_2T1,      END_TIM_2T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (20,      44,         'Evening 2 times', START_TIM_2T2,      END_TIM_2T2 )
-- --
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (21,      45,         'Morning 3 times', START_TIM_3T1,      END_TIM_3T1 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (22,      45,         'Noon 3 times',    START_TIM_3T2,      END_TIM_3T2 )
--   INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
--                           VALUES (23,      45,         'Evening 3 times', START_TIM_3T3,      END_TIM_3T3 )
-- select * from (
-- select 
--   OWNER,
--   COALESCE(START_TIM_1T1, lead(START_TIM_1T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_1T1,
--   COALESCE(END_TIM_1T1,   lead(END_TIM_1T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_1T1,
--   COALESCE(START_TIM_1T2, lead(START_TIM_1T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_1T2,
--   COALESCE(END_TIM_1T2,   lead(END_TIM_1T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_1T2,
--   COALESCE(START_TIM_1T3, lead(START_TIM_1T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_1T3,
--   COALESCE(END_TIM_1T3,   lead(END_TIM_1T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_1T3,
--   COALESCE(START_TIM_2T1, lead(START_TIM_2T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_2T1,
--   COALESCE(END_TIM_2T1,   lead(END_TIM_2T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_2T1,
--   COALESCE(START_TIM_2T2, lead(START_TIM_2T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_2T2,
--   COALESCE(END_TIM_2T2,   lead(END_TIM_2T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_2T2,
--   COALESCE(START_TIM_3T1, lead(START_TIM_3T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_3T1,
--   COALESCE(END_TIM_3T1,   lead(END_TIM_3T1, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_3T1,
--   COALESCE(START_TIM_3T2, lead(START_TIM_3T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_3T2,
--   COALESCE(END_TIM_3T2,   lead(END_TIM_3T2, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_3T2,
--   COALESCE(START_TIM_3T3, lead(START_TIM_3T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) START_TIM_3T3,
--   COALESCE(END_TIM_3T3,   lead(END_TIM_3T3, 1) OVER (ORDER BY decode(owner,'REABILITATIONADM',0,'DEFAULT',1,2))) END_TIM_3T3
-- from reabilitation.TIME_RANGE_CONFIG x where owner in ('REABILITATIONADM','DEFAULT'))
-- where owner = 'REABILITATIONADM';
-- ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 24; 
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTIONS
   (PR_ID NUMBER NOT NULL ENABLE,
	  PR_WS_ID NUMBER,
    PR_DR_ID NUMBER NOT NULL ENABLE,
    PR_PAT_ID NUMBER NOT NULL ENABLE,
    PR_PRR_ID NUMBER NOT NULL ENABLE,
    PR_PLANNED_START TIMESTAMP (6) WITH TIME ZONE,
    PR_PLANNED_END TIMESTAMP (6) WITH TIME ZONE,
    PR_NOTES VARCHAR2(512),
    period for REHAB_PRESCRIPTIONS_PLANNED_period (PR_PLANNED_START, PR_PLANNED_END)
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_PRESCRIPTIONS ADD CONSTRAINT PK_REHAB_PRESCRIPTIONS PRIMARY KEY (PR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_PRESCRIPTIONS ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_WS FOREIGN KEY (PR_WS_ID)
	  REFERENCES REHAB_WORKING_SUBSTANCE (WS_ID) ENABLE;
      
ALTER TABLE REHAB_PRESCRIPTIONS ADD CONSTRAINT FK_REHAB_PRESCRIPTION_DR FOREIGN KEY (PR_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;

ALTER TABLE REHAB_PRESCRIPTIONS ADD CONSTRAINT FK_REHAB_PRESCRIPTION_PR FOREIGN KEY (PR_PRR_ID)
	  REFERENCES REHAB_PRESCRIPTORS (PRR_ID) ENABLE;

ALTER TABLE REHAB_PRESCRIPTIONS ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_PAT FOREIGN KEY (PR_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;
      
CREATE INDEX IDX_REHAB_PRESCRIPTIONS_DR ON REHAB_PRESCRIPTIONS (PR_DR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_PRESCRIPTIONS_PAT ON REHAB_PRESCRIPTIONS (PR_PAT_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_PRESCRIPTIONS_PRR ON REHAB_PRESCRIPTIONS (PR_PRR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
create assertion rehub_check_pr_prr_pat check(
  all (
    select PR_PAT_ID, PR_PRR_ID
    from   REHAB_PRESCRIPTIONS
  ) pr1
  satisfy (
    exists (
      select 1
      from   REHAB_PRESCRIPTORS prr1
      where  pr1.PR_PAT_ID = prr1.PRR_PAT_ID and pr1.PR_PRR_ID = prr1.PRR_ID
    )
  )
);

CREATE SEQUENCE  SQ_REHAB_PRESCRIPTIONS;
--//////////////////////////////////////////////////////////////////////////////
-- INSERT INTO rehab_prescriptions 
--    (pr_id,pr_dr_id,pr_pat_id,pr_prr_id,pr_planned_start,pr_planned_end,pr_notes, PR_WS_ID) 
-- SELECT
--     pr_id,   p.dr_id,   pat_id,   prr_id,   planned_start,   planned_end,   notes,    DR_WS_ID
-- FROM
--     reabilitation.prescription p, REHAB_DRUGS d
--     where p.dr_id=d.dr_id and nvl(notes,'~')<>'--no_copy_data--';
-- declare
--   l_id_max number;
-- begin
--   select max(pr_id)+1 into l_id_max from rehab_prescriptions;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTIONS RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (
    PRATR_ID NUMBER NOT NULL ENABLE,
    PRATR_PR_ID NUMBER NOT NULL ENABLE,
    PRATR_CP_ID NUMBER NOT NULL ENABLE,
    PRATR_ACTUAL_START TIMESTAMP (6) WITH TIME ZONE,
    PRATR_ACTUAL_END TIMESTAMP (6) WITH TIME ZONE,
    PRATR_NOTES VARCHAR2(512),
    period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period (PRATR_ACTUAL_START, PRATR_ACTUAL_END)
);

ALTER TABLE REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES ADD CONSTRAINT PK_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES PRIMARY KEY (PRATR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_PR FOREIGN KEY (PRATR_PR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS (PR_ID) ENABLE;
      
ALTER TABLE REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_CP FOREIGN KEY (PRATR_CP_ID)
	  REFERENCES REHAB_CONSUME_PATTERNS (CP_ID) ENABLE;

create assertion REHAB_CHECK_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_overlap check(
  all (
    select PRATR_ID, PRATR_PR_ID, PRATR_ACTUAL_START, PRATR_ACTUAL_END
    from   REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES
  ) tr1
  satisfy (
    not exists (
      select 1
      from   REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES tr2
      where  tr1.PRATR_PR_ID = tr2.PRATR_PR_ID and tr1.PRATR_ID != tr2.PRATR_ID and (
        tr1.PRATR_ACTUAL_START between tr2.PRATR_ACTUAL_START and tr2.PRATR_ACTUAL_END
        or 
        tr1.PRATR_ACTUAL_END between tr2.PRATR_ACTUAL_START and tr2.PRATR_ACTUAL_END
      )
    )
  )
);
--drop sequence SQ_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;
create sequence SQ_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;
--//////////////////////////////////////////////////////////////////////////////
--delete from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;
-- INSERT INTO REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES 
--    (pratr_id, 
--     PRATR_PR_ID, 
--     PRATR_CP_ID, 
--     PRATR_ACTUAL_START, PRATR_ACTUAL_END, PRATR_NOTES) 
-- SELECT
--     SQ_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.nextval,
--     pr_id,                         
--     case 
--       when PAT_ID = 5 then
--         case when TIMES_PER_DAY = 1 then decode(TIME_SLOT,1,41,2,42,3,43)
--              when TIMES_PER_DAY = 2 then 44
--              when TIMES_PER_DAY = 3 then 45
--         else null end
--       when PAT_ID = 21 then
--         case when TIMES_PER_DAY = 1 then decode(TIME_SLOT,1,21,2,22,3,23)
--              when TIMES_PER_DAY = 2 then 24
--              when TIMES_PER_DAY = 3 then 25
--         else null end      
--     else null end cp_id,
--     planned_start,      
--     case when planned_end is not null and trunc(planned_end,'dd') <= trunc(systimestamp,'dd') then planned_end
--          when planned_end is not null and trunc(planned_end,'dd') > trunc(systimestamp,'dd') and SUSPENDED = 'N' then planned_end
--          when SUSPENDED = 'Y' and (planned_end is not null and trunc(planned_end,'dd') > trunc(systimestamp,'dd') or planned_end is null) then 
--            nvl((select trunc(max(CONSUMED),'DD') from reabilitation.DRUG_USE u where u.pr_id=p.pr_id and u.PAT_ID=p.PAT_ID),planned_start+0.1)
--     end planned_end,   
--     decode(SUSPENDED,'Y','Suspended')
-- FROM
--     reabilitation.prescription p where nvl(notes,'~')<>'--no_copy_data--'; --order by 1,2;
-- commit;
--select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES order by 2;
--select * from REHAB_CONSUME_PATTERNS p, v$rehab_consume_time_ranges r
--where p.CP_ID=r.cptr_cp_id order by CP_ID, cptr_id;
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTIONS_DETAILS (
    PRD_ID NUMBER NOT NULL ENABLE,
    PRD_PRATR_ID NUMBER NOT NULL ENABLE,
    PRD_CPTR_ID NUMBER NOT NULL ENABLE,
    PRD_DR_ID NUMBER NOT NULL ENABLE,
    PRD_DOSAGE NUMBER NOT NULL ENABLE,
    PRD_SORT_ORDER number default 0,
    PRD_NOTES VARCHAR2(512)
);

ALTER TABLE REHAB_PRESCRIPTIONS_DETAILS ADD CONSTRAINT PK_REHAB_PRESCRIPTIONS_DETAILS PRIMARY KEY (PRD_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;
  
ALTER TABLE REHAB_PRESCRIPTIONS_DETAILS ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_DETAILS_PRATR FOREIGN KEY (PRD_PRATR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (PRATR_ID) ENABLE;
      
ALTER TABLE REHAB_PRESCRIPTIONS_DETAILS ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_DETAILS_CPTR FOREIGN KEY (PRD_CPTR_ID)
	  REFERENCES REHAB_CONSUME_TIME_RANGES (CPTR_ID) ENABLE;

ALTER TABLE REHAB_PRESCRIPTIONS_DETAILS ADD CONSTRAINT FK_REHAB_PRESCRIPTIONS_DETAILS_DR FOREIGN KEY (PRD_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;
      
create sequence SQ_REHAB_PRESCRIPTIONS_DETAILS;
--//////////////////////////////////////////////////////////////////////////////
--select * from rehab_consume_time_ranges order by 1;
--select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES order by 1;
--select 
--    case 
--      when PAT_ID = 5 then
--        case when PRATR_CP_ID = 41 then 16
--             when PRATR_CP_ID = 42 then 17
--             when PRATR_CP_ID = 43 then 18
--             when PRATR_CP_ID = 44 then 18+l.l
--             when PRATR_CP_ID = 45 then 20+l.l
--        else null end
--      when PAT_ID = 21 then
--        case when PRATR_CP_ID = 21 then 9
--             when PRATR_CP_ID = 22 then -1
--             when PRATR_CP_ID = 23 then 10
--             when PRATR_CP_ID = 24 then 10+l.l
--             when PRATR_CP_ID = 25 then 12+l.l
--        else null end      
--    else null end cptr_id,  
--    l.l,p1.PRATR_CP_ID,
--p0.* , p1.*
--FROM
--    reabilitation.prescription p0, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES p1,
--    (select level l from dual connect by level <=3) l
--where p0.PR_ID = p1.PRATR_PR_ID and l.l <= TIMES_PER_DAY order by 6,4,2;
-- INSERT INTO REHAB_PRESCRIPTIONS_DETAILS 
--    (prd_id, 
--     PRD_PRATR_ID, 
--     PRD_CPTR_ID, 
--     PRD_DR_ID, PRD_DOSAGE, PRD_SORT_ORDER, PRD_NOTES) 
-- SELECT
--     SQ_REHAB_PRESCRIPTIONS_DETAILS.nextval,
--     pratr_id,   
--     case 
--       when PAT_ID = 5 then
--         case when PRATR_CP_ID = 41 then 16
--              when PRATR_CP_ID = 42 then 17
--              when PRATR_CP_ID = 43 then 18
--              when PRATR_CP_ID = 44 then 18+l.l
--              when PRATR_CP_ID = 45 then 20+l.l
--         else null end
--       when PAT_ID = 21 then
--         case when PRATR_CP_ID = 21 then 9
--              when PRATR_CP_ID = 22 then -1
--              when PRATR_CP_ID = 23 then 10
--              when PRATR_CP_ID = 24 then 10+l.l
--              when PRATR_CP_ID = 25 then 12+l.l
--         else null end      
--     else null end cptr_id,  
--     p0.DR_ID, DOSAGE,     PR_SORT_ORDER,   null
-- FROM
--     reabilitation.prescription p0, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES p1,
--     (select level l from dual connect by level <=3) l
-- where p0.PR_ID = p1.PRATR_PR_ID and l.l <= TIMES_PER_DAY and nvl(p0.notes,'~')<>'--no_copy_data--';
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(PRD_ID)+1 into l_id_max from REHAB_PRESCRIPTIONS_DETAILS;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTIONS_DETAILS RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
CREATE TABLE REHAB_DRUG_USES
   (DRU_ID NUMBER,
    DRU_PRD_ID NUMBER, -- NOT NULL ENABLE,
    DRU_PR_ID NUMBER NOT NULL ENABLE,
	  DRU_PAT_ID NUMBER NOT NULL ENABLE,
    DRU_CPTR_ID NUMBER NOT NULL ENABLE,
    DRU_DR_ID NUMBER , --NOT NULL ENABLE,
    DRU_WS_ID NUMBER,
	  DRU_CONSUMED TIMESTAMP (6) WITH TIME ZONE,
	  DRU_ACTUAL_DOSAGE NUMBER	
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT PK_REHAB_DRUG_USES PRIMARY KEY (DRU_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USES_WS FOREIGN KEY (DRU_WS_ID)
	  REFERENCES REHAB_WORKING_SUBSTANCE (WS_ID) ENABLE;
      
ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USE_PR_DETAILS FOREIGN KEY (DRU_PRD_ID)
	  REFERENCES REHAB_PRESCRIPTIONS_DETAILS (PRD_ID) ENABLE;
      
ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USE_PATIENT FOREIGN KEY (DRU_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USE_PRESCRIPTION FOREIGN KEY (DRU_PR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS (PR_ID) ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USES_CPTR FOREIGN KEY (DRU_CPTR_ID)
	  REFERENCES REHAB_CONSUME_TIME_RANGES (CPTR_ID) ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USES_DR FOREIGN KEY (DRU_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;
      
CREATE INDEX IDX_REHAB_DRUG_USES_PAT ON REHAB_DRUG_USES (DRU_PAT_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_DRUG_USES_PAT_PR ON REHAB_DRUG_USES (DRU_PAT_ID, DRU_PR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_DRUG_USES_PR ON REHAB_DRUG_USES (DRU_PR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
create assertion rehub_check_dru_pr_pat check(
  all (
    select DRU_PAT_ID, DRU_PR_ID
    from   REHAB_DRUG_USES
  ) dru
  satisfy (
    exists (
      select 1
      from   REHAB_PRESCRIPTIONS pr
      where  dru.DRU_PAT_ID = pr.PR_PAT_ID and dru.DRU_PR_ID = pr.PR_ID
    )
  )
);

CREATE SEQUENCE  SQ_REHAB_DRUG_USES;
--//////////////////////////////////////////////////////////////////////////////
--select * from REHAB_DRUG_USES;
-- insert into REHAB_DRUG_USES 
--       (dru_id, DRU_PRD_ID, DRU_PR_ID, DRU_PAT_ID, DRU_CPTR_ID, DRU_DR_ID, DRU_WS_ID, DRU_CONSUMED, DRU_ACTUAL_DOSAGE)
-- select DRU_ID, null /*PRD_ID*/,     u.pr_id,     PAT_ID,                  
--        --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') 
--        (select CPTR_ID from 
--        (select CPTR_ID --||' (1) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR 
--                CPTR_ID from REHAB_CONSUME_TIME_RANGES 
--          where CPTR_CP_ID=PRATR_CP_ID 
--            and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') between to_date(CPTR_START_TIME_STR,'HH24:MI') and to_date(CPTR_END_TIME_STR,'HH24:MI')
--         union all
--         select CPTR_ID from (
--         select CPTR_ID--||' (2) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID 
--           from REHAB_CONSUME_TIME_RANGES 
--          where CPTR_CP_ID=PRATR_CP_ID 
--            and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') < to_date(CPTR_END_TIME_STR,'HH24:MI')
--         order by to_date(CPTR_START_TIME_STR,'HH24:MI')
--         )
--         union all
--         select CPTR_ID from (
--         select CPTR_ID--||' (3) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID 
--           from REHAB_CONSUME_TIME_RANGES 
--          where CPTR_CP_ID=PRATR_CP_ID 
--            and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') > to_date(CPTR_END_TIME_STR,'HH24:MI')
--         order by to_date(CPTR_START_TIME_STR,'HH24:MI')
--         )        
--         ) where rownum=1) a,
--        null/*PRD_DR_ID*/, PR_WS_ID, CONSUMED,     ACTUAL_DOSAGE--,
--        --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') cc, PRATR_CP_ID
-- from reabilitation.DRUG_USE u, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES r, --REHAB_PRESCRIPTIONS_DETAILS d, 
--      REHAB_PRESCRIPTIONS p
-- where u.PR_ID=r.PRATR_PR_ID --and r.pratr_id=d.PRD_PRATR_ID 
--   and p.PR_ID = u.PR_ID
-- order by 1;
-- commit;
-- update REHAB_DRUG_USES u
-- set DRU_PRD_ID = (select PRD_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES a, REHAB_PRESCRIPTIONS_DETAILS d where a.PRATR_ID = d.PRD_PRATR_ID and d.PRD_CPTR_ID=u.DRU_CPTR_ID and u.DRU_PR_ID=a.PRATR_PR_ID);
-- commit;

-- update REHAB_DRUG_USES u
-- set DRU_DR_ID = (select PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS d where d.PRD_ID = u.DRU_PRD_ID);
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(DRU_ID)+1 into l_id_max from REHAB_DRUG_USES;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_USES RESTART START WITH '||l_id_max;
-- end;
-- / 

-- alter TABLE REHAB_DRUG_USES modify DRU_PRD_ID NUMBER NOT NULL ENABLE;
-- alter TABLE REHAB_DRUG_USES modify DRU_DR_ID NUMBER NOT NULL ENABLE;
--******************************************************************************
CREATE TABLE REHAB_DRUG_STORAGES
   (DS_ID NUMBER,
    DS_TE_ID NUMBER NOT NULL ENABLE,
    DS_NAME VARCHAR2(128) NOT NULL ENABLE,
    DS_DESCRIPTION VARCHAR2(4000),
    DS_CREATED TIMESTAMP (6) WITH TIME ZONE DEFAULT ON NULL systimestamp NOT NULL ENABLE,
    DS_UPDATED TIMESTAMP (6) WITH TIME ZONE
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_DRUG_STORAGES ADD CONSTRAINT PK_DRUG_STORAGES PRIMARY KEY (DS_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_DRUG_STORAGES ADD CONSTRAINT FK_REHAB_DRUG_STORAGES_TE FOREIGN KEY (DS_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;
      
CREATE SEQUENCE  SQ_REHAB_DRUG_STORAGES;
--//////////////////////////////////////////////////////////////////////////////
-- insert into REHAB_DRUG_STORAGES 
--       (ds_id, DS_TE_ID, DS_NAME, DS_DESCRIPTION, DS_CREATED, DS_UPDATED)
-- select ds_id, 1,        DS_NAME, DS_DESCRIPTION, DS_CREATED, DS_UPDATED
-- from reabilitation.drug_storage;
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(DS_ID)+1 into l_id_max from REHAB_DRUG_STORAGES;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_STORAGES RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
CREATE TABLE REHAB_PATIENT2STORAGES
   (P2S_DS_ID NUMBER,
    P2S_PAT_ID NUMBER,
    P2S_IS_OWNER BOOLEAN DEFAULT false -- owner can edit, not owner can see
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_PATIENT2STORAGES ADD CONSTRAINT FK_REHAB_PATIENT2STORAGES_STORAGE FOREIGN KEY (P2S_DS_ID)
	  REFERENCES REHAB_DRUG_STORAGES (DS_ID) ENABLE;

ALTER TABLE REHAB_PATIENT2STORAGES ADD CONSTRAINT FK_REHAB_PATIENT2STORAGES_PAT FOREIGN KEY (P2S_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

CREATE INDEX IDX_REHAB_PATIENT2STORAGES_PAT_DS ON REHAB_PATIENT2STORAGES (P2S_PAT_ID, P2S_DS_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
--//////////////////////////////////////////////////////////////////////////////
-- insert into REHAB_PATIENT2STORAGES (p2s_ds_id, P2S_PAT_ID, P2S_IS_OWNER)
-- select p2s_ds_id, P2S_PAT_ID, P2S_IS_OWNER
-- from reabilitation.patient2storage;
-- commit;
--******************************************************************************
--TBD link to timerange and working substance to track future usage
CREATE TABLE REHAB_DRUG_ACCOUNTINGS
   (DA_ID NUMBER,
    DA_DS_ID NUMBER NOT NULL ENABLE,
    DA_DR_ID NUMBER NOT NULL ENABLE,
    DA_PRR_ID NUMBER NOT NULL ENABLE,
    DA_PR_ID NUMBER NOT NULL ENABLE,
    DA_WS_ID NUMBER,
    DA_PRATR_ID NUMBER,
    DA_ORDER_TYPE VARCHAR2(128) NOT NULL ENABLE,
    DA_QUANTITY NUMBER NOT NULL ENABLE,
    DA_ENTIRY_WEIGHT NUMBER NOT NULL ENABLE,
    DA_COST NUMBER NOT NULL ENABLE,
    DA_PURCHASED TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp,
    DA_CHECK_POINT_DT TIMESTAMP (6) WITH TIME ZONE,
    DA_BEST_BEFORE DATE
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT PK_REHAB_DRUG_ACCOUNTINGS PRIMARY KEY (DA_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCOUNTINGS_WS FOREIGN KEY (DA_WS_ID)
	  REFERENCES REHAB_WORKING_SUBSTANCE (WS_ID) ENABLE;
      
ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_DS FOREIGN KEY (DA_DS_ID)
	  REFERENCES REHAB_DRUG_STORAGES (DS_ID) ENABLE;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_PRR FOREIGN KEY (DA_PRR_ID)
	  REFERENCES REHAB_PRESCRIPTORS (PRR_ID) ENABLE;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_PR FOREIGN KEY (DA_PR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS (PR_ID) ENABLE;
      
ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_DR FOREIGN KEY (DA_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCOUNTINGS_PRATR FOREIGN KEY (DA_PRATR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES (PRATR_ID) ENABLE;
      
CREATE INDEX IDX_REHAB_DRUG_ACCOUNTINGS_DRUG ON REHAB_DRUG_ACCOUNTINGS (DA_DR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_DRUG_ACCOUNTINGS_DS ON REHAB_DRUG_ACCOUNTINGS (DA_DS_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_DRUG_ACCOUNTINGS_PRR ON REHAB_DRUG_ACCOUNTINGS (DA_PRR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE SEQUENCE  SQ_REHAB_DRUG_ACCOUNTINGS;
--//////////////////////////////////////////////////////////////////////////////
--select * from reabilitation.drug_accounting order by 1;
--select * from REHAB_DRUG_ACCOUNTINGS order by 1;
-- insert into REHAB_DRUG_ACCOUNTINGS 
--  (da_id, DA_DS_ID, DA_DR_ID,   DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, DA_CHECK_POINT_DT, DA_PRR_ID, DA_PR_ID, DA_PRATR_ID, DA_WS_ID, DA_BEST_BEFORE)
-- select
--   da_id, DA_DS_ID, DA_DRUG_ID, DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, CHECK_POINT_DT,    DA_PRR_ID,    PR_ID,    PRATR_ID, PR_WS_ID, DA_BEST_BEFORE
-- from reabilitation.drug_accounting a, REHAB_PRESCRIPTIONS p, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES r
-- where a.DA_PRR_ID = p.PR_PRR_ID and a.DA_DRUG_ID=p.PR_DR_ID and p.PR_ID=r.PRATR_PR_ID order by 1;
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(da_id)+1 into l_id_max from REHAB_DRUG_ACCOUNTINGS;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_ACCOUNTINGS RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
CREATE TABLE REHAB_MEASUREMENTS
   (MT_ID NUMBER NOT NULL ENABLE,
	  MT_PAT_ID NUMBER NOT NULL ENABLE,
	  MT_TAKEN TIMESTAMP (6) WITH TIME ZONE,
	  MT_PRESSURE_LR VARCHAR2(1),
    MT_PRESSURE_SYS NUMBER,
    MT_PRESSURE_DIA NUMBER,
    MT_PULSE NUMBER,
    MT_TEMPERATURE NUMBER,
    MT_SUGAR NUMBER,
    MT_OXIGENATION NUMBER,
    MT_WEIGHT NUMBER,
    MT_DESCR VARCHAR2(4000)
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_MEASUREMENTS ADD CONSTRAINT PK_REHAB_MEASUREMENTS PRIMARY KEY (MT_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_MEASUREMENTS ADD CHECK (mt_pressure_lr in ('L','R')) ENABLE;

ALTER TABLE REHAB_MEASUREMENTS ADD CONSTRAINT FK_REHAB_MEASUREMENTS_PATIENT FOREIGN KEY (MT_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

CREATE INDEX IDX_REHAB_MEASUREMENTS_PAT ON REHAB_MEASUREMENTS (MT_PAT_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
CREATE SEQUENCE  SQ_REHAB_MEASUREMENTS;
--//////////////////////////////////////////////////////////////////////////////
-- insert into REHAB_MEASUREMENTS
--  (mt_id, MT_PAT_ID, MT_TAKEN, MT_PRESSURE_LR, MT_PRESSURE_SYS, MT_PRESSURE_DIA, MT_PULSE, MT_TEMPERATURE, MT_SUGAR, MT_OXIGENATION, MT_WEIGHT, MT_DESCR)
-- select
--   mt_id,    PAT_ID,    TAKEN,    PRESSURE_LR,    PRESSURE_SYS,    PRESSURE_DIA,    PULSE,    TEMPERATURE,    SUGAR,    OXIGENATION,    WEIGHT,    DESCR
-- from reabilitation.measurement;
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(mt_id)+1 into l_id_max from REHAB_MEASUREMENTS;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_MEASUREMENTS RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
CREATE TABLE REHAB_TRAININGS
   (TR_ID NUMBER,
    TR_TYPE VARCHAR2(128),
    TR_PAT_ID NUMBER,
    TR_START TIMESTAMP (6) WITH TIME ZONE,
    TR_END TIMESTAMP (6) WITH TIME ZONE,
    TR_DISTANCE_LENGTH NUMBER,
    TR_STEPS NUMBER,
    TR_PULSE_AVG NUMBER,
    TR_PULSE_MIN NUMBER,
    TR_PULSE_MAX NUMBER,
    TR_DESCR VARCHAR2(4000),
    TR_IMG1 BLOB,
    TR_IMG2 BLOB,
    real_distance number,
    real_step_length number,
    real_speed number
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_TRAININGS ADD CONSTRAINT PK_REHAB_TRAININGS PRIMARY KEY (TR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_TRAININGS ADD CONSTRAINT FK_REHAB_TRAININGS_PAT_ID FOREIGN KEY (TR_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

CREATE INDEX IDX_REHAB_TRAININGS_PAT ON REHAB_TRAININGS (TR_PAT_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
CREATE SEQUENCE  SQ_REHAB_TRAININGS;
--//////////////////////////////////////////////////////////////////////////////
-- insert into REHAB_TRAININGS
--  (tr_id, TR_TYPE, TR_PAT_ID, TR_START, TR_END, TR_DISTANCE_LENGTH, TR_STEPS, TR_PULSE_AVG, TR_PULSE_MIN, TR_PULSE_MAX, TR_DESCR, TR_IMG1, TR_IMG2,
--   real_distance, real_step_length, real_speed)
-- select
--   tr_id, TR_TYPE,    PAT_ID, TR_START, TR_END,    DISTANCE_LENGTH,    STEPS,    PULSE_AVG,    PULSE_MIN,    PULSE_MAX, TR_DESCR, TR_IMG1, TR_IMG2,
--   real_distance, real_step_length, real_speed
-- from reabilitation.trainings;
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(tr_id)+1 into l_id_max from REHAB_TRAININGS;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_TRAININGS RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
CREATE TABLE REHAB_WATCH_LOGS
   (WL_ID NUMBER NOT NULL ENABLE,
	  WL_PAT_ID NUMBER NOT NULL ENABLE,
	  WL_TAKEN TIMESTAMP (6) WITH TIME ZONE,
      --CASIO
	  WL_STEPS NUMBER,
	  WL_NIGHT_MIN_PULSE NUMBER,
	  WL_NIGHT_MAX_PULSE NUMBER,
      --MI
    WL_NIGHT_AVG_PULSE NUMBER,
    WL_CALM_AVG_PULSE  NUMBER,
    WL_TOTAL_AVG_PULSE NUMBER,
    WL_TOTAL_MIN_PULSE NUMBER,
    WL_TOTAL_MAX_PULSE NUMBER
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;
 
ALTER TABLE REHAB_WATCH_LOGS ADD CONSTRAINT PK_REHAB_WATCH_LOGS PRIMARY KEY (WL_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_WATCH_LOGS ADD CONSTRAINT FK_REHAB_WATCH_LOGS_PAT FOREIGN KEY (WL_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

CREATE INDEX IDX_REHAB_WATCH_LOGS_PAT ON REHAB_WATCH_LOGS (WL_PAT_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
CREATE SEQUENCE  SQ_REHAB_WATCH_LOGS;
--//////////////////////////////////////////////////////////////////////////////
-- insert into REHAB_WATCH_LOGS
--  (wl_id, WL_PAT_ID, WL_TAKEN, WL_STEPS, WL_NIGHT_MIN_PULSE, WL_NIGHT_MAX_PULSE, WL_NIGHT_AVG_PULSE, WL_CALM_AVG_PULSE, WL_TOTAL_AVG_PULSE, WL_TOTAL_MIN_PULSE, WL_TOTAL_MAX_PULSE)
-- select
--   wl_id,    PAT_ID,    TAKEN,    STEPS,    NIGHT_MIN_PULSE,    NIGHT_MAX_PULSE, WL_NIGHT_AVG_PULSE, WL_CALM_AVG_PULSE, WL_TOTAL_AVG_PULSE, WL_TOTAL_MIN_PULSE, WL_TOTAL_MAX_PULSE
-- from reabilitation.watch_log;
-- commit;
-- declare
--   l_id_max number;
-- begin
--   select max(wl_id)+1 into l_id_max from REHAB_WATCH_LOGS;
--   execute immediate 'ALTER SEQUENCE SQ_REHAB_WATCH_LOGS RESTART START WITH '||l_id_max;
-- end;
-- / 
--******************************************************************************
create index IDX_REHAB_MEASUREMENTS_PAT_TAKEN on rehab_measurements(mt_pat_id, SYS_EXTRACT_UTC(mt_taken), mt_id);
create index IDX_REHAB_TRAININGS_PAT_START on REHAB_TRAININGS(TR_PAT_ID, SYS_EXTRACT_UTC(TR_START), TR_ID);
create index IDX_REHAB_WATCH_LOGS_PAT_TAKEN  on REHAB_WATCH_LOGS(WL_PAT_ID, SYS_EXTRACT_UTC(WL_TAKEN), WL_ID);
--******************************************************************************
-- CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_TIME_PERIODS
-- AS 
-- select  x.*,
--         (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||TP_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_START_TIME_DT_CURR,
--         (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||TP_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_END_TIME_DT_CURR,
--         (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||TP_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_START_TIME_DT_GDT,
--         (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||TP_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) TP_END_TIME_DT_GDT    
-- from REHAB_TIME_PERIODS x;

-- CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_TIME_PERIODS_AVAILABLE
-- as
-- select * from V$REHAB_TIME_PERIODS
-- where TP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
-- union
-- select * from V$REHAB_TIME_PERIODS
-- where TP_TE_ID = REHAB_CONTEXT_PKG.getTENANT() and REHAB_CONTEXT_PKG.getPATIENT() is not null and TP_PAT_ID is null and not exists (select 1 from V$REHAB_TIME_PERIODS where TP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())
-- union
-- select * from V$REHAB_TIME_PERIODS
-- where TP_TE_ID is null and TP_PAT_ID is null and REHAB_CONTEXT_PKG.getTENANT() is not null and REHAB_CONTEXT_PKG.getPATIENT() is not null and not exists (select 1 from V$REHAB_TIME_PERIODS where TP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() or TP_TE_ID = REHAB_CONTEXT_PKG.getTENANT());

-- CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_CONSUME_TIME_RANGES 
-- AS 
-- select  x.*,
--         (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_START_TIME_DT_CURR,
--         (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_END_TIME_DT_CURR,
--         (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||CPTR_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_START_TIME_DT_GDT,
--         (to_timestamp_tz(to_char(REHAB_CONTEXT_PKG.getGLOBAL_DATE(),'YYYYMMDD')||CPTR_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZR')) CPTR_END_TIME_DT_GDT    
-- from REHAB_CONSUME_TIME_RANGES x;

-- CREATE OR REPLACE FORCE EDITIONABLE VIEW V$REHAB_CONSUME_TIME_RANGES_AVAILABLE 
-- AS 
-- select  x.*
-- from V$REHAB_CONSUME_TIME_RANGES x, 
--      (select * from REHAB_CONSUME_PATTERNS where CP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
--       union
--       select * from REHAB_CONSUME_PATTERNS
--       where CP_TE_ID = REHAB_CONTEXT_PKG.getTENANT() and REHAB_CONTEXT_PKG.getPATIENT() is not null and CP_PAT_ID is null 
--         and not exists (select 1 from REHAB_CONSUME_PATTERNS where CP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())
--       union
--       select * from REHAB_CONSUME_PATTERNS
--       where CP_TE_ID is null and CP_PAT_ID is null and REHAB_CONTEXT_PKG.getTENANT() is not null and REHAB_CONTEXT_PKG.getPATIENT() is not null 
--         and not exists (select 1 from REHAB_CONSUME_PATTERNS where CP_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() or CP_TE_ID = REHAB_CONTEXT_PKG.getTENANT())
--     ) y
-- where x.CPTR_CP_ID = y.CP_ID;

-- create or replace view V$REHAB_CONSUME_DATA as
-- select *
-- from REHAB_PRESCRIPTIONS_DETAILS d, 
--      REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period REHAB_CONTEXT_PKG.getGLOBAL_DATE() 
--      tr,
--      REHAB_PRESCRIPTIONS p,
--      REHAB_DRUG_USES du,
--      V$REHAB_CONSUME_TIME_RANGES CPTR,
--      REHAB_CONSUME_PATTERNS CP,
--      REHAB_DRUGS DR
-- where d.PRD_PRATR_ID = tr.PRATR_ID and tr.PRATR_PR_ID = p.PR_ID
--   and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()
--   and du.DRU_PR_ID(+) = p.PR_ID and du.DRU_CPTR_ID(+) = d.PRD_CPTR_ID and DRU_PAT_ID(+) = REHAB_CONTEXT_PKG.getPATIENT()
--   and trunc(DRU_CONSUMED(+)) = trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())
--   and d.PRD_CPTR_ID = CPTR.CPTR_ID
--   and CPTR.CPTR_CP_ID = CP.CP_ID
--   and d.PRD_DR_ID = DR.DR_ID;

-- create or replace view V$REHAB_REMAINS
-- as
--         select
--           stor.PAT_ID, stor.DR_ID,
--           DA_STORED_AMOUNT, DRU_CONSUMED,DRU_CONSUMED_BEFORE,DRU_CONSUMED_TODAY,
--           DA_STORED_AMOUNT - DRU_CONSUMED BALANCE, 
--           days_planned,PRD_DOSAGE_PLANNED,
--           daily_dose, 
--           (DA_STORED_AMOUNT - DRU_CONSUMED)/daily_dose days_remain,
--           (DA_STORED_AMOUNT - DRU_CONSUMED_BEFORE - daily_dose)/daily_dose days_remain_from_tomorrow,
--           DR_NAME,
--           PRATR_ACTUAL_END, PR_PLANNED_END,
--           trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()+(DA_STORED_AMOUNT - DRU_CONSUMED_BEFORE - daily_dose)/daily_dose) end_date
--         from
--             (select P2S_PAT_ID PAT_ID, DA_DR_ID DR_ID,sum(DA_QUANTITY*DA_ENTIRY_WEIGHT) DA_STORED_AMOUNT, min(DA_CHECK_POINT_DT) DA_CHECK_POINT_DT 
--                from REHAB_DRUG_ACCOUNTINGS A, REHAB_PATIENT2STORAGES P2S 
--               where A.DA_DS_ID = P2S.P2S_DS_ID and P2S.P2S_IS_OWNER
--                 and DA_CHECK_POINT_DT <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--                 and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
--               group by P2S_PAT_ID, DA_DR_ID) stor,
--             lateral
--             (select DRU_PAT_ID PAT_ID, DRU_DR_ID DR_ID,
--                     sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT) DRU_CONSUMED,
--                     sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT and DRU_CONSUMED < trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())) DRU_CONSUMED_BEFORE,
--                     sum(DRU_ACTUAL_DOSAGE) FILTER (WHERE DRU_CONSUMED > stor.DA_CHECK_POINT_DT and trunc(DRU_CONSUMED) = trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE())) DRU_CONSUMED_TODAY
--                from REHAB_DRUG_USES c 
--               where stor.PAT_ID=c.DRU_PAT_ID and stor.DR_ID=c.DRU_DR_ID
--                 and DRU_CONSUMED <= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--                 and DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() 
--               group by DRU_PAT_ID, DRU_DR_ID) cons,
--              (select PR_PAT_ID PAT_ID, PR_DR_ID DR_ID, sum(days_planned) days_planned,
--                      sum(PRD_DOSAGE * days_planned ) PRD_DOSAGE_PLANNED,
--                      sum(PRD_DOSAGE) daily_dose,
--                      max(PRATR_ACTUAL_END) PRATR_ACTUAL_END,
--                      max(PR_PLANNED_END) PR_PLANNED_END
--                 from (select * from REHAB_PRESCRIPTIONS 
--                        where (PR_PLANNED_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PR_PLANNED_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE())>=REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--                           or PR_PLANNED_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE())
--                          and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()) PR,
--                      (select A.*,
--                              case when PRATR_ACTUAL_END is null then null 
--                                   else case when PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and PRATR_ACTUAL_END >= REHAB_CONTEXT_PKG.getGLOBAL_DATE() 
--                                             then (PRATR_ACTUAL_END+0) - REHAB_CONTEXT_PKG.getGLOBAL_DATE()--+ 1
--                                             else (PRATR_ACTUAL_END+0) - (PRATR_ACTUAL_START+0)--+ 1
--                                        end
--                              end days_planned
--                         from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES A
--                        where PRATR_ACTUAL_START <= REHAB_CONTEXT_PKG.getGLOBAL_DATE() and nvl(PRATR_ACTUAL_END,REHAB_CONTEXT_PKG.getGLOBAL_DATE()) >= REHAB_CONTEXT_PKG.getGLOBAL_DATE()
--                           or PRATR_ACTUAL_START >  REHAB_CONTEXT_PKG.getGLOBAL_DATE())
--                         PRATR,
--                      REHAB_PRESCRIPTIONS_DETAILS PRD
--                 where PR.PR_ID=PRATR_PR_ID and PRATR.PRATR_ID=PRD.PRD_PRATR_ID
--                 group by PR_PAT_ID, PR_DR_ID) planned,
--              REHAB_DRUGS d
--         where stor.PAT_ID=cons.PAT_ID and stor.DR_ID=cons.DR_ID and stor.DR_ID=d.DR_ID
--           and stor.PAT_ID=planned.PAT_ID and stor.DR_ID=planned.DR_ID;
--******************************************************************************
select (select count(1) from reabilitation.drug_accounting) drug_accounting,(select count(1) from REHAB_DRUG_ACCOUNTINGS) RB_DRUG_ACCOUNTINGS from dual;
select (select count(1) from REABILITATION.DRUG_STORAGE) DRUG_STORAGE,(select count(1) from REHAB_DRUG_STORAGES) RB_DRUG_STORAGES from dual;
select (select count(1) from REABILITATION.DRUG_USE) DRUG_USE,(select count(1) from REHAB_DRUG_USES) RB_DRUG_USES from dual;
select (select count(1) from REABILITATION.DRUGS) DRUGS,(select count(1) from REHAB_DRUGS) RB_DRUGS from dual;
select (select count(1) from REABILITATION.MEASUREMENT) MEASUREMENT,(select count(1) from REHAB_MEASUREMENTS) RB_MEASUREMENTS from dual;
select (select count(1) from REABILITATION.PATIENTS) PATIENTS,(select count(1) from REHAB_PATIENTS) RB_PATIENTS from dual;
select (select count(1) from REABILITATION.PRESCRIPTION where nvl(notes,'~')<>'--no_copy_data--') PRESCRIPTION,(select count(1) from REHAB_PRESCRIPTIONS) RB_PRESCRIPTIONS,(select count(1) from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES)RB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES,(select count(1) from REHAB_PRESCRIPTIONS_DETAILS) RB_PRESCRIPTIONS_DETAILS from dual;
select (select count(1) from REABILITATION.PRESCRIPTOR) PRESCRIPTOR,(select count(1) from REHAB_PRESCRIPTORS) RB_PRESCRIPTORS from dual;
select (select count(1) from REABILITATION.PRESCRIPTOR2DRUG_FLT) PRESCRIPTOR2DRUG_FLT,(select count(1) from REHAB_PRESCRIPTOR2DRUG_FLTS) RB_PRESCRIPTOR2DRUG_FLTS from dual;
select (select count(1) from REABILITATION.TRAININGS) TRAININGS,(select count(1) from REHAB_TRAININGS) RB_TRAININGS from dual;
select (select count(1) from REABILITATION.WATCH_LOG) WATCH_LOG,(select count(1) from REHAB_WATCH_LOGS) RB_WATCH_LOGS from dual;


--test data

--select /*insert*/ * from REHAB_TENANTS;
Insert into REHAB_TENANTS (TE_ID,TE_NAME,TE_DESCR) values (2,'Test 2','Second tenant');
--select /*insert*/ * from REHAB_PATIENTS;
Insert into REHAB_PATIENTS (PAT_ID,PAT_TE_ID,PAT_NAME,PAT_SURNAME,PAT_EMAIL,PAT_STATUS,PAT_CREATED,PAT_STATUS_CHANGED,PAT_APEX_USER,PAT_IS_SUPERUSER,PAT_IS_TENANTADM) values (1,2,'Test1','T','t@a.com','ACTIVE',to_timestamp_tz('2026-09-08 11.40.04.886793000 +03:00','YYYY-MM-DD HH24.MI.SSXFF TZR'),to_timestamp_tz('2026-09-08 11.40.10.490316000 +03:00','YYYY-MM-DD HH24.MI.SSXFF TZR'),'TEST1','false','true');
Insert into REHAB_PATIENTS (PAT_ID,PAT_TE_ID,PAT_NAME,PAT_SURNAME,PAT_EMAIL,PAT_STATUS,PAT_CREATED,PAT_STATUS_CHANGED,PAT_APEX_USER,PAT_IS_SUPERUSER,PAT_IS_TENANTADM) values (2,2,'Test2','T2','t2@a.com','ACTIVE',to_timestamp_tz('2026-09-08 11.40.52.251703000 +03:00','YYYY-MM-DD HH24.MI.SSXFF TZR'),to_timestamp_tz('2026-09-08 11.40.57.301212000 +03:00','YYYY-MM-DD HH24.MI.SSXFF TZR'),'TEST2','false','false');
commit;



