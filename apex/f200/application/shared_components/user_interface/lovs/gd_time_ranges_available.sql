prompt --application/shared_components/user_interface/lovs/gd_time_ranges_available
begin
--   Manifest
--     GD_TIME_RANGES_AVAILABLE
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
 p_id=>wwv_flow_imp.id(50431022744787525)
,p_lov_name=>'GD_TIME_RANGES_AVAILABLE'
,p_static_id=>'gd-time-ranges-available'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CPTR_ID r,',
'       CPTR_NAME ||'' (''||CPTR_START_TIME_STR||''-''||CPTR_END_TIME_STR||'')'' d',
'  from V$REHAB_CONSUME_TIME_RANGES_AVAILABLE',
' order by CPTR_START_TIME_STR, CPTR_ID'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'REABILITATION'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'SH256:bmj9WjaNrj7V_2eYYm3N9fJV9kcl0zq8YjS7D-Ovb1Y'
);
wwv_flow_imp.component_end;
end;
/
