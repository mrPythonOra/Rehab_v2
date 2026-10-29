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
'select case when PR_WS_ID is not null then (select WS_NAME from REHAB_WORKING_SUBSTANCE where WS_ID = PR_WS_ID)',
'            when PR_DR_ID is not null then (select DR_NAME||''(''||DR_TYPE_SHORT||'')'' from REHAB_DRUGS where DR_ID = PR_DR_ID)',
'            else null end || ''; '' ||',
'       PRR_PRESCRIPTED_BY_SHORT || '' ('' ||to_char(PRR_PRESCRIPTED_WHEN, :APP_DTFMT_DATE)|| '') ''||',
'       to_char(PR_PLANNED_START,:APP_DTFMT_DATE) || '' - '' || ',
'       case when PR_PLANNED_END is not null ',
'          then to_char(PR_PLANNED_END,:APP_DTFMT_DATE)',
unistr('          else ''\0411\0435\0437 \043E\0431\043C\0435\0436\0435\043D\043D\044F \0434\0430\0442\0438'' '),
'       end d,',
'       PR_ID r',
'from REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTORS',
'where PRR_ID = PR_PRR_ID and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'order by PR_PLANNED_START'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'ADMIN'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'SH256:uEjWSjgcX0WvDu-xZ9EdAtk7oU3k7otiwasRguAEkeE'
);
wwv_flow_imp.component_end;
end;
/
