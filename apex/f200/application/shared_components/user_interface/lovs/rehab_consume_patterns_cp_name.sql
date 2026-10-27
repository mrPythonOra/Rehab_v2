prompt --application/shared_components/user_interface/lovs/rehab_consume_patterns_cp_name
begin
--   Manifest
--     REHAB_CONSUME_PATTERNS.CP_NAME
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
 p_id=>wwv_flow_imp.id(77210688656777461)
,p_lov_name=>'REHAB_CONSUME_PATTERNS.CP_NAME'
,p_static_id=>'rehab-consume-patterns-cp-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'REHAB_CONSUME_PATTERNS'
,p_return_column_name=>'CP_ID'
,p_display_column_name=>'CP_NAME'
,p_default_sort_column_name=>'CP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:lRNFsOFEnE2uu_2C-9PAjwCv6Luc62lYCTqKBZpPYzI'
);
wwv_flow_imp.component_end;
end;
/
