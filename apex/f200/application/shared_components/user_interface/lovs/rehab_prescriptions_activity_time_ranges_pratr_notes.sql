prompt --application/shared_components/user_interface/lovs/rehab_prescriptions_activity_time_ranges_pratr_notes
begin
--   Manifest
--     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_NOTES
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
 p_id=>wwv_flow_imp.id(73131089228751911)
,p_lov_name=>'REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_NOTES'
,p_static_id=>'rehab-prescriptions-activity-time-ranges-pratr-notes'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES'
,p_return_column_name=>'PRATR_ID'
,p_display_column_name=>'PRATR_NOTES'
,p_default_sort_column_name=>'PRATR_NOTES'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:c2NOq37u_glMDGlhElhCIrbqE-5i-yjvCR66Z_9TT70'
);
wwv_flow_imp.component_end;
end;
/
