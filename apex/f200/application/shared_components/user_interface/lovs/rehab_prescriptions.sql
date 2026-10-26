prompt --application/shared_components/user_interface/lovs/rehab_prescriptions
begin
--   Manifest
--     REHAB_PRESCRIPTIONS
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
 p_id=>wwv_flow_imp.id(76295603466132653)
,p_lov_name=>'REHAB_PRESCRIPTIONS'
,p_static_id=>'rehab-prescriptions'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(PR_PLANNED_START,:APP_DTFMT_DATE) || '' - '' || ',
'       case when PR_PLANNED_END is not null ',
'          then to_char(PR_PLANNED_END,:APP_DTFMT_DATE)',
unistr('          else ''\0411\0435\0437 \043E\0431\043C\0435\0436\0435\043D\043D\044F \0434\0430\0442\0438'' '),
'       end d,',
'       PR_ID r',
'from REHAB_PRESCRIPTIONS'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'ADMIN'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:jsh56S2tWz5gfaxp04FFZHDRfjCWS7ZTN45v_VXXF4E'
);
wwv_flow_imp.component_end;
end;
/
