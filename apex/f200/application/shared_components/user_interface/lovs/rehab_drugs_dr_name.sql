prompt --application/shared_components/user_interface/lovs/rehab_drugs_dr_name
begin
--   Manifest
--     REHAB_DRUGS.DR_NAME
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
 p_id=>wwv_flow_imp.id(56486046497734841)
,p_lov_name=>'REHAB_DRUGS.DR_NAME'
,p_static_id=>'rehab-drugs-dr-name'
,p_lov_query=>'select dr_id, dr_name||'' (''||DR_TYPE_SHORT||'')'' dr_name from REHAB_DRUGS'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'DR_ID'
,p_display_column_name=>'DR_NAME'
,p_default_sort_column_name=>'DR_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:CZlBAaLywLIF4F6J0jrt82nZ-1ywCXATPIfD9xULxsc'
);
wwv_flow_imp.component_end;
end;
/
