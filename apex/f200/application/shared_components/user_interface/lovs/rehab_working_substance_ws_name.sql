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
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WS_ID'
,p_display_column_name=>'WS_NAME'
,p_version_scn=>'SH256:94QRL8fCdvysndZpYsei0jXGysmsypwm0KHtYOnbQ98'
);
wwv_flow_imp.component_end;
end;
/
