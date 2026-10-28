prompt --application/shared_components/user_interface/lovs/app_state_storage_list
begin
--   Manifest
--     APP_STATE_STORAGE_LIST
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(78058943199603871)
,p_lov_name=>'APP_STATE_STORAGE_LIST'
,p_static_id=>'app-state-storage-list'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  STORAGE_NAME || '' ('' || to_char(STORAGE_UPDATED at time zone SESSIONTIMEZONE,''YYYY-MON-DD HH24:MI TZH:TZM'') ||'')'' d,',
'  STORAGE_ID r',
'from APEX_STORED_STATES',
'where APP_USER = REHAB_CONTEXT_PKG.getCURR_APEX_USER() and APP_PAGE = v(''APP_PAGE_ID'')',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'ADMIN'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'SH256:v4L9Ek58fQ2j-OL3-32DXw69sDVfFXSgOBbHbGj90kA'
);
wwv_flow_imp.component_end;
end;
/
