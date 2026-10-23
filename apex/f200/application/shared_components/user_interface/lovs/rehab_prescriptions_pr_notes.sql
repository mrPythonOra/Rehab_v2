prompt --application/shared_components/user_interface/lovs/rehab_prescriptions_pr_notes
begin
--   Manifest
--     REHAB_PRESCRIPTIONS.PR_NOTES
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
 p_id=>wwv_flow_imp.id(73130472148751908)
,p_lov_name=>'REHAB_PRESCRIPTIONS.PR_NOTES'
,p_static_id=>'rehab-prescriptions-pr-notes'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'REHAB_PRESCRIPTIONS'
,p_return_column_name=>'PR_ID'
,p_display_column_name=>'PR_NOTES'
,p_default_sort_column_name=>'PR_NOTES'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:p71gX6MSo_ZxE4htsvwtEl_0GtSmN0RPjCATVS70uls'
);
wwv_flow_imp.component_end;
end;
/
