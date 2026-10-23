prompt --application/shared_components/user_interface/lovs/rehab_prescriptors_prr_prescripted_by_short
begin
--   Manifest
--     REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_SHORT
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
 p_id=>wwv_flow_imp.id(73130240550751905)
,p_lov_name=>'REHAB_PRESCRIPTORS.PRR_PRESCRIPTED_BY_SHORT'
,p_static_id=>'rehab-prescriptors-prr-prescripted-by-short'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'REHAB_PRESCRIPTORS'
,p_return_column_name=>'PRR_ID'
,p_display_column_name=>'PRR_PRESCRIPTED_BY_SHORT'
,p_default_sort_column_name=>'PRR_PRESCRIPTED_BY_SHORT'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:7ZHjcT3ZlN_QgAfqiPvyTwpjTHJCJXQZg7NbNgldteI'
);
wwv_flow_imp.component_end;
end;
/
