prompt --application/shared_components/logic/application_computations/global_date
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_DATE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(28560949055985056)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_DATE'
,p_static_id=>'global-date'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'return to_char(systimestamp at time zone SESSIONTIMEZONE, ''YYYY-MM-DD'')'
,p_version_scn=>'SH256:tOLP4xRUHEuZKKkLVhSOo_Bys4G_htdWEwS3MHy1nuk'
);
wwv_flow_imp.component_end;
end;
/
