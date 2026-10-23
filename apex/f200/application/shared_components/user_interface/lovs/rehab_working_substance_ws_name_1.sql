prompt --application/shared_components/user_interface/lovs/rehab_working_substance_ws_name_1
begin
--   Manifest
--     REHAB_WORKING_SUBSTANCE.WS_NAME_1
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
 p_id=>wwv_flow_imp.id(73130748351751910)
,p_lov_name=>'REHAB_WORKING_SUBSTANCE.WS_NAME_1'
,p_static_id=>'rehab-working-substance-ws-name-1'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'REHAB_WORKING_SUBSTANCE'
,p_return_column_name=>'WS_ID'
,p_display_column_name=>'WS_NAME'
,p_default_sort_column_name=>'WS_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:bBvAnezor1xuy6Rdpz-ylcKG9t55DfSLQ50xN5T_v3s'
);
wwv_flow_imp.component_end;
end;
/
