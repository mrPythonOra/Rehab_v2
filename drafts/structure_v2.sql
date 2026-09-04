drop assertion rehub_check_pr_prr_pat;
drop assertion rehub_check_dru_pr_pat;
drop assertion check_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_overlap;
drop assertion check_REHAB_CONSUME_PATTERNS_TE_PAT;

drop view V$REHAB_CONSUME_TIME_RANGES;

drop table apex_stored_states purge;
drop table REHAB_CONFIGS purge;
drop table REHAB_DRUG_ACCOUNTINGS purge;
drop table REHAB_PATIENT2STORAGES purge;
drop table REHAB_DRUG_STORAGES purge;
drop table REHAB_DRUG_USES purge;
drop table REHAB_MEASUREMENTS purge;
drop TABLE REHAB_PRESCRIPTIONS_DETAILS purge;
drop TABLE REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES purge;
drop table REHAB_PRESCRIPTOR2DRUG_FLTS purge;
drop table REHAB_PRESCRIPTIONS purge;
drop table REHAB_PRESCRIPTORS purge;
drop table REHAB_TRAININGS purge;
drop table REHAB_WATCH_LOGS purge;
drop table REHAB_DRUGS purge;
drop TABLE REHAB_CONSUME_TIME_RANGES purge;
drop TABLE REHAB_CONSUME_PATTERNS purge;
drop TABLE REHAB_PATIENTS2P_ACCESS purge;
drop table REHAB_PATIENTS purge;
drop table REHAB_TENANTS purge;

drop sequence SQ_APEX_STORED_STATES;
drop sequence SQ_REHAB_DRUG_ACCOUNTINGS;
drop sequence SQ_REHAB_DRUG_STORAGES;
drop sequence SQ_REHAB_DRUG_USES;
drop sequence SQ_REHAB_DRUGS;
drop sequence SQ_REHAB_MEASUREMENTS;
drop sequence SQ_REHAB_PATIENTS;
drop sequence SQ_REHAB_PRESCRIPTIONS;
drop sequence SQ_REHAB_PRESCRIPTORS;
drop sequence SQ_REHAB_TRAININGS;
drop sequence SQ_REHAB_WATCH_LOGS;
drop sequence SQ_REHAB_TENANTS;
drop sequence SQ_REHAB_CONSUME_PATTERNS;
drop sequence SQ_REHAB_CONSUME_TIME_RANGES;
drop sequence SQ_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES;
drop sequence SQ_REHAB_PRESCRIPTIONS_DETAILS;
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
INSERT INTO rehab_tenants (te_id,te_name,te_descr) VALUES (1, 'My Family', 'First tenant');
ALTER SEQUENCE SQ_REHAB_TENANTS RESTART START WITH 2;
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
    PAT_IS_SUPERUSER boolean default false
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_PATIENTS ADD CONSTRAINT PK_REHAB_PATIENTS PRIMARY KEY (PAT_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_PATIENTS ADD CONSTRAINT FK_REHAB_PATIENTS_TE FOREIGN KEY (PAT_TE_ID)
	  REFERENCES REHAB_TENANTS (TE_ID) ENABLE;
      
CREATE INDEX IDX_REHAB_PATIENTS_APEX_USR ON REHAB_PATIENTS (PAT_APEX_USER)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;
  
CREATE SEQUENCE  SQ_REHAB_PATIENTS;
--//////////////////////////////////////////////////////////////////////////////
INSERT INTO rehab_patients 
   (pat_id,pat_te_id,pat_name,pat_surname,pat_email,pat_status,pat_created,pat_status_changed,pat_apex_user,pat_is_superuser) 
SELECT
    pat_id,1,        pat_name,pat_surname,pat_email,pat_status,pat_created,pat_status_changed,apex_user,    false
FROM
    reabilitation.patients;
commit;
update rehab_patients set pat_apex_user = 'YURI'
where pat_id = 5;
commit;
declare
  l_id_max number;
begin
  select max(pat_id)+1 into l_id_max from rehab_patients;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_PATIENTS RESTART START WITH '||l_id_max;
end;
/
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
INSERT INTO rehab_patients2p_access (p2pa_subj_pat_id,p2pa_trg_pat_id,p2pa_can_manage) VALUES (21,5,false);
commit;
--******************************************************************************
CREATE TABLE REHAB_CONFIGS
   (PAR_NAME VARCHAR2(30) NOT NULL ENABLE,
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
      
--******************************************************************************  
CREATE TABLE REHAB_DRUGS
   (DR_ID NUMBER NOT NULL ENABLE,
    DR_TE_ID NUMBER,
	DR_NAME VARCHAR2(128),
	DR_TYPE VARCHAR2(512),
	DR_TYPE_SHORT VARCHAR2(128),
    DR_WORKING_SUBST VARCHAR2(1024),
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
      
CREATE SEQUENCE  SQ_REHAB_DRUGS;
--//////////////////////////////////////////////////////////////////////////////
INSERT INTO rehab_drugs 
   (dr_id,dr_te_id,dr_name,dr_type,dr_type_short,dr_working_subst,dr_use_case,dr_when2consume,
    dr_instruction,dr_instr_src_url,dr_item_image1,dr_item_image2,dr_pack_image1,dr_pack_image2) 
SELECT
    dr_id,1,       dr_name,dr_type,type_short,   dr_working_subst,use_case,   when2consume,
    dr_instruction,dr_nstr_src_url,dr_item_image1,dr_item_image2,dr_pack_image1,dr_pack_image2    
FROM
    reabilitation.drugs;
declare
  l_id_max number;
begin
  select max(dr_id)+1 into l_id_max from rehab_drugs;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUGS RESTART START WITH '||l_id_max;
end;
/
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
/    
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTOR2DRUG_FLTS
   (PRRF_PRR_ID NUMBER NOT NULL ENABLE,
	PRRF_DR_ID NUMBER NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_PRESCRIPTOR2DRUG_FLTS ADD CONSTRAINT FK_REHAB_PRRFLT_PRR FOREIGN KEY (PRRF_PRR_ID)
	  REFERENCES REHAB_PRESCRIPTORS (PRR_ID) ENABLE;

ALTER TABLE REHAB_PRESCRIPTOR2DRUG_FLTS ADD CONSTRAINT FK_REHAB_PRRFLT_DRUG FOREIGN KEY (PRRF_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;

--//////////////////////////////////////////////////////////////////////////////
INSERT INTO rehab_prescriptor2drug_flts (
    prrf_prr_id,
    prrf_dr_id
)
SELECT
    prr_id,
    dr_id
FROM
    reabilitation.prescriptor2drug_flt;
commit;
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

create assertion check_REHAB_CONSUME_PATTERNS_TE_PAT check(
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
ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 61; 
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

create or replace view V$REHAB_CONSUME_TIME_RANGES
as
select x.*,
    (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_START_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZH:TZM')) CPTR_START_TIME_DT,
    (to_timestamp_tz(to_char(systimestamp at time zone SESSIONTIMEZONE,'YYYYMMDD')||CPTR_END_TIME_STR||' '||sessiontimezone,'YYYYMMDDHH24:MI TZH:TZM')) CPTR_END_TIME_DT
  from REHAB_CONSUME_TIME_RANGES x;
--//////////////////////////////////////////////////////////////////////////////
--delete /*+ noparallel */ from rehab_consume_time_ranges;
--select * from REHAB_CONSUME_PATTERNS p, v$rehab_consume_time_ranges r
--where p.CP_ID=r.cptr_cp_id order by CP_ID, cptr_id;
INSERT ALL 
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
                          VALUES (1,      1,         'Morning 1 time', START_TIM_1T1,      END_TIM_1T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
                          VALUES (2,      2,         'Noon 1 time',    START_TIM_1T2,      END_TIM_1T2 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
                          VALUES (3,      3,         'Evening 1 time', START_TIM_1T3,      END_TIM_1T3 )
--
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (4,      4,         'Morning 2 times', START_TIM_2T1,      END_TIM_2T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (5,      4,         'Evening 2 times', START_TIM_2T2,      END_TIM_2T2 )
--
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (6,      5,         'Morning 3 times', START_TIM_3T1,      END_TIM_3T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (7,      5,         'Noon 3 times',    START_TIM_3T2,      END_TIM_3T2 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (8,      5,         'Evening 3 times', START_TIM_3T3,      END_TIM_3T3 )
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
                          VALUES (9,      21,         'Morning 1 time', START_TIM_1T1,      END_TIM_1T1 )
--  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
--                          VALUES (2,      22,         'Noon 1 time',    START_TIM_1T2,      END_TIM_1T2 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
                          VALUES (10,      23,         'Evening 1 time', START_TIM_1T3,      END_TIM_1T3 )
--
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (11,      24,         'Morning 2 times', START_TIM_2T1,      END_TIM_2T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (12,      24,         'Evening 2 times', START_TIM_2T2,      END_TIM_2T2 )
--
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (13,      25,         'Morning 3 times', START_TIM_3T1,      END_TIM_3T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (14,      25,         'Noon 3 times',    START_TIM_3T2,      END_TIM_3T2 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (15,      25,         'Evening 3 times', START_TIM_3T3,      END_TIM_3T3 )
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
                          VALUES (16,      41,         'Morning 1 time', START_TIM_1T1,      END_TIM_1T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
                          VALUES (17,      42,         'Noon 1 time',    START_TIM_1T2,      END_TIM_1T2 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,        cptr_start_time_str,cptr_end_time_str) 
                          VALUES (18,      43,         'Evening 1 time', START_TIM_1T3,      END_TIM_1T3 )
--
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (19,      44,         'Morning 2 times', START_TIM_2T1,      END_TIM_2T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (20,      44,         'Evening 2 times', START_TIM_2T2,      END_TIM_2T2 )
--
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (21,      45,         'Morning 3 times', START_TIM_3T1,      END_TIM_3T1 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (22,      45,         'Noon 3 times',    START_TIM_3T2,      END_TIM_3T2 )
  INTO rehab_consume_time_ranges (cptr_id,cptr_cp_id,cptr_name,         cptr_start_time_str,cptr_end_time_str) 
                          VALUES (23,      45,         'Evening 3 times', START_TIM_3T3,      END_TIM_3T3 )
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
ALTER SEQUENCE SQ_REHAB_CONSUME_PATTERNS RESTART START WITH 24; 
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTIONS
   (PR_ID NUMBER NOT NULL ENABLE,
	PR_DR_ID NUMBER NOT NULL ENABLE,
	PR_PAT_ID NUMBER NOT NULL ENABLE,
	PR_PRR_ID NUMBER NOT NULL ENABLE,
	PR_PLANNED_START TIMESTAMP (6) WITH TIME ZONE,
	PR_PLANNED_END TIMESTAMP (6) WITH TIME ZONE,
	PR_NOTES VARCHAR2(512)
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_PRESCRIPTIONS ADD CONSTRAINT PK_REHAB_PRESCRIPTIONS PRIMARY KEY (PR_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

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
INSERT INTO rehab_prescriptions 
   (pr_id,pr_dr_id,pr_pat_id,pr_prr_id,pr_planned_start,pr_planned_end,pr_notes) 
SELECT
    pr_id,   dr_id,   pat_id,   prr_id,   planned_start,   planned_end,   notes
FROM
    reabilitation.prescription;
declare
  l_id_max number;
begin
  select max(pr_id)+1 into l_id_max from rehab_prescriptions;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTIONS RESTART START WITH '||l_id_max;
end;
/ 
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

create assertion check_REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_overlap check(
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
    case when planned_end is not null and trunc(planned_end,'dd') <= trunc(systimestamp,'dd') then planned_end
         when planned_end is not null and trunc(planned_end,'dd') > trunc(systimestamp,'dd') and SUSPENDED = 'N' then null
         when SUSPENDED = 'Y' and (planned_end is not null and trunc(planned_end,'dd') > trunc(systimestamp,'dd') or planned_end is null) then 
           nvl((select trunc(max(CONSUMED),'DD') from reabilitation.DRUG_USE u where u.pr_id=p.pr_id and u.PAT_ID=p.PAT_ID),planned_start+0.1)
    end planned_end,   
    decode(SUSPENDED,'Y','Suspended')
FROM
    reabilitation.prescription p; --order by 1,2;
commit;
--select * from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES order by 2;
--select * from REHAB_CONSUME_PATTERNS p, v$rehab_consume_time_ranges r
--where p.CP_ID=r.cptr_cp_id order by CP_ID, cptr_id;
--******************************************************************************
CREATE TABLE REHAB_PRESCRIPTIONS_DETAILS (
    PRD_ID NUMBER NOT NULL ENABLE,
    PRD_PRATR_ID NUMBER NOT NULL ENABLE,
    PRD_CPTR_ID NUMBER NOT NULL ENABLE,
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
INSERT INTO REHAB_PRESCRIPTIONS_DETAILS 
   (prd_id, 
   PRD_PRATR_ID, 
   PRD_CPTR_ID, 
   PRD_DOSAGE, PRD_SORT_ORDER, PRD_NOTES) 
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
    DOSAGE,     PR_SORT_ORDER,   null
FROM
    reabilitation.prescription p0, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES p1,
    (select level l from dual connect by level <=3) l
where p0.PR_ID = p1.PRATR_PR_ID and l.l <= TIMES_PER_DAY;
commit;
declare
  l_id_max number;
begin
  select max(PRD_ID)+1 into l_id_max from REHAB_PRESCRIPTIONS_DETAILS;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_PRESCRIPTIONS_DETAILS RESTART START WITH '||l_id_max;
end;
/ 
--******************************************************************************
CREATE TABLE REHAB_DRUG_USES
   (DRU_ID NUMBER,
    DRU_PR_ID NUMBER NOT NULL ENABLE,
	DRU_PAT_ID NUMBER NOT NULL ENABLE,
    DRU_CPTR_ID NUMBER NOT NULL ENABLE,
	DRU_CONSUMED TIMESTAMP (6) WITH TIME ZONE,
	DRU_ACTUAL_DOSAGE NUMBER	
   ) SEGMENT CREATION IMMEDIATE
   PCTUSED 40 INITRANS 10 MAXTRANS 255
 NOCOMPRESS  LOGGING;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT PK_REHAB_DRUG_USES PRIMARY KEY (DRU_ID)
  USING INDEX  INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USE_PATIENT FOREIGN KEY (DRU_PAT_ID)
	  REFERENCES REHAB_PATIENTS (PAT_ID) ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USE_PRESCRIPTION FOREIGN KEY (DRU_PR_ID)
	  REFERENCES REHAB_PRESCRIPTIONS (PR_ID) ENABLE;

ALTER TABLE REHAB_DRUG_USES ADD CONSTRAINT FK_REHAB_DRUG_USES_CPTR FOREIGN KEY (DRU_CPTR_ID)
	  REFERENCES REHAB_CONSUME_TIME_RANGES (CPTR_ID) ENABLE;
      
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
insert into REHAB_DRUG_USES 
      (dru_id, DRU_PR_ID, DRU_PAT_ID, DRU_CPTR_ID, DRU_CONSUMED, DRU_ACTUAL_DOSAGE)
select DRU_ID, pr_id,     PAT_ID,                  
       --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') 
       (select CPTR_ID from 
       (select CPTR_ID --||' (1) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR 
               CPTR_ID from REHAB_CONSUME_TIME_RANGES 
         where CPTR_CP_ID=PRATR_CP_ID 
           and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') between to_date(CPTR_START_TIME_STR,'HH24:MI') and to_date(CPTR_END_TIME_STR,'HH24:MI')
        union all
        select CPTR_ID from (
        select CPTR_ID--||' (2) '||CPTR_START_TIME_STR ||'-'||CPTR_END_TIME_STR CPTR_ID 
          from REHAB_CONSUME_TIME_RANGES 
         where CPTR_CP_ID=PRATR_CP_ID 
           and to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') < to_date(CPTR_END_TIME_STR,'HH24:MI')
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
       CONSUMED,     ACTUAL_DOSAGE--,
       --to_date(to_char(CONSUMED,'HH24:MI'),'HH24:MI') cc, PRATR_CP_ID
from reabilitation.DRUG_USE d, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES r
where d.PR_ID=r.PRATR_PR_ID order by a nulls first, 3,1;
commit;
declare
  l_id_max number;
begin
  select max(DRU_ID)+1 into l_id_max from REHAB_DRUG_USES;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_USES RESTART START WITH '||l_id_max;
end;
/ 
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
/ 
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
insert into REHAB_PATIENT2STORAGES (p2s_ds_id, P2S_PAT_ID, P2S_IS_OWNER)
select p2s_ds_id, P2S_PAT_ID, P2S_IS_OWNER
from reabilitation.patient2storage;
commit;
--******************************************************************************
CREATE TABLE REHAB_DRUG_ACCOUNTINGS
   (DA_ID NUMBER,
	DA_DS_ID NUMBER,
	DA_DR_ID NUMBER,
    DA_PRR_ID NUMBER,
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

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_STORAGE FOREIGN KEY (DA_DS_ID)
	  REFERENCES REHAB_DRUG_STORAGES (DS_ID) ENABLE;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_PRESCRIPTOR FOREIGN KEY (DA_PRR_ID)
	  REFERENCES REHAB_PRESCRIPTORS (PRR_ID) ENABLE;

ALTER TABLE REHAB_DRUG_ACCOUNTINGS ADD CONSTRAINT FK_REHAB_DRUG_ACCS_DRUG FOREIGN KEY (DA_DR_ID)
	  REFERENCES REHAB_DRUGS (DR_ID) ENABLE;
   
CREATE INDEX IDX_REHAB_DRUG_ACCOUNTINGS_DRUG ON REHAB_DRUG_ACCOUNTINGS (DA_DR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_DRUG_ACCOUNTINGS_DS ON REHAB_DRUG_ACCOUNTINGS (DA_DS_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE INDEX IDX_REHAB_DRUG_ACCOUNTINGS_PRR ON REHAB_DRUG_ACCOUNTINGS (DA_PRR_ID)
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS ;

CREATE SEQUENCE  SQ_REHAB_DRUG_ACCOUNTINGS;
--//////////////////////////////////////////////////////////////////////////////
insert into REHAB_DRUG_ACCOUNTINGS 
 (da_id, DA_DS_ID, DA_DR_ID,   DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, DA_CHECK_POINT_DT, DA_PRR_ID, DA_BEST_BEFORE)
select
  da_id, DA_DS_ID, DA_DRUG_ID, DA_ORDER_TYPE, DA_QUANTITY, DA_ENTIRY_WEIGHT, DA_COST, DA_PURCHASED, CHECK_POINT_DT,    DA_PRR_ID, DA_BEST_BEFORE
from reabilitation.drug_accounting;
commit;
declare
  l_id_max number;
begin
  select max(da_id)+1 into l_id_max from REHAB_DRUG_ACCOUNTINGS;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_DRUG_ACCOUNTINGS RESTART START WITH '||l_id_max;
end;
/ 
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
/ 
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
	TR_PULSE_MAX NUMBER
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
insert into REHAB_TRAININGS
 (tr_id, TR_TYPE, TR_PAT_ID, TR_START, TR_END, TR_DISTANCE_LENGTH, TR_STEPS, TR_PULSE_AVG, TR_PULSE_MIN, TR_PULSE_MAX)
select
  tr_id, TR_TYPE,    PAT_ID, TR_START, TR_END,    DISTANCE_LENGTH,    STEPS,    PULSE_AVG,    PULSE_MIN,    PULSE_MAX
from reabilitation.trainings;
commit;
declare
  l_id_max number;
begin
  select max(tr_id)+1 into l_id_max from REHAB_TRAININGS;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_TRAININGS RESTART START WITH '||l_id_max;
end;
/ 
--******************************************************************************
CREATE TABLE REHAB_WATCH_LOGS
   (WL_ID NUMBER NOT NULL ENABLE,
	WL_PAT_ID NUMBER NOT NULL ENABLE,
	WL_TAKEN TIMESTAMP (6) WITH TIME ZONE,
	WL_STEPS NUMBER,
	WL_NIGHT_MIN_PULSE NUMBER,
	WL_NIGHT_MAX_PULSE NUMBER,
    WL_NIGHT_AVG_PULSE NUMBER
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
insert into REHAB_WATCH_LOGS
 (wl_id, WL_PAT_ID, WL_TAKEN, WL_STEPS, WL_NIGHT_MIN_PULSE, WL_NIGHT_MAX_PULSE, WL_NIGHT_AVG_PULSE)
select
  wl_id,    PAT_ID,    TAKEN,    STEPS,    NIGHT_MIN_PULSE,    NIGHT_MAX_PULSE, WL_NIGHT_AVG_PULSE
from reabilitation.watch_log;
commit;
declare
  l_id_max number;
begin
  select max(wl_id)+1 into l_id_max from REHAB_WATCH_LOGS;
  execute immediate 'ALTER SEQUENCE SQ_REHAB_WATCH_LOGS RESTART START WITH '||l_id_max;
end;
/ 
--******************************************************************************






























