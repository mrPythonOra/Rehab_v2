prompt --application/shared_components/user_interface/lovs/rehab_prescriptions_activity_time_ranges
begin
--   Manifest
--     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES
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
 p_id=>wwv_flow_imp.id(76296160111156465)
,p_lov_name=>'REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES'
,p_static_id=>'rehab-prescriptions-activity-time-ranges'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(PRATR_ACTUAL_START,:APP_DTFMT_DATE) || '' - '' || ',
'       case when PRATR_ACTUAL_END is not null ',
'          then to_char(PRATR_ACTUAL_END,:APP_DTFMT_DATE)',
unistr('          else ''\0411\0435\0437 \043E\0431\043C\0435\0436\0435\043D\043D\044F \0434\0430\0442\0438'' '),
'       end d,',
'       PRATR_ID r',
'from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'ADMIN'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:eWtKXatLVims7yWBrskkoij-UaUWxDzmpBBMy03DiRw'
);
wwv_flow_imp.component_end;
end;
/
