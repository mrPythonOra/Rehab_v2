prompt --application/shared_components/user_interface/lovs/rehab_prescriptors
begin
--   Manifest
--     REHAB_PRESCRIPTORS
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
 p_id=>wwv_flow_imp.id(72142687256359502)
,p_lov_name=>'REHAB_PRESCRIPTORS'
,p_static_id=>'rehab-prescriptors'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRR_ID r, PRR_PRESCRIPTED_BY_SHORT || '' (''||to_char(PRR_PRESCRIPTED_WHEN, :APP_DTFMT_DATE)||'')'' d from REHAB_PRESCRIPTORS',
'where PRR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'order by PRR_PRESCRIPTED_WHEN desc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'REABILITATION'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'SH256:YXEo_TMMWOLru_R0h6a3QJ_BfgdVYUFAXeW7nLWDAEw'
);
wwv_flow_imp.component_end;
end;
/
