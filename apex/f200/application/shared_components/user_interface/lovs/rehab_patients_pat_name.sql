prompt --application/shared_components/user_interface/lovs/rehab_patients_pat_name
begin
--   Manifest
--     REHAB_PATIENTS.PAT_NAME
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
 p_id=>wwv_flow_imp.id(54763921648912986)
,p_lov_name=>'REHAB_PATIENTS.PAT_NAME'
,p_static_id=>'rehab-patients-pat-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'REHAB_PATIENTS'
,p_return_column_name=>'PAT_ID'
,p_display_column_name=>'PAT_NAME'
,p_default_sort_column_name=>'PAT_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:MU-58ckMSH3TqRC08QICS8ALqoFaMsI_3UJz9tyLYjg'
);
wwv_flow_imp.component_end;
end;
/
