prompt --application/shared_components/user_interface/lovs/rehab_working_substance_ws_name
begin
--   Manifest
--     REHAB_WORKING_SUBSTANCE.WS_NAME
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
 p_id=>wwv_flow_imp.id(56485897056731550)
,p_lov_name=>'REHAB_WORKING_SUBSTANCE.WS_NAME'
,p_static_id=>'rehab-working-substance-ws-name'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ws_id, ws_name from REHAB_WORKING_SUBSTANCE',
'union all',
unistr('select -1, ''\041D\0435 \0432\0441\0442\0430\043D\043E\0432\043B\0435\043D\043E'' from dual')))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WS_ID'
,p_display_column_name=>'WS_NAME'
,p_default_sort_column_name=>'WS_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:aTMmDq1Jrw1zF3LARGZlAgWP0EBZk1O5p_C7UIShsEE'
);
wwv_flow_imp.component_end;
end;
/
