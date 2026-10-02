prompt --application/shared_components/user_interface/lovs/gd_consuming_time_periods
begin
--   Manifest
--     GD_CONSUMING_TIME_PERIODS
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
 p_id=>wwv_flow_imp.id(48663273667173003)
,p_lov_name=>'GD_CONSUMING_TIME_PERIODS'
,p_static_id=>'gd-consuming-time-periods'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from V$REHAB_TIME_PERIODS_AVAILABLE order by TP_START_TIME_DT_GDT',
'-- select pa.* from V$REHAB_TIME_PERIODS_AVAILABLE pa',
'-- where exists (select 1 from V$REHAB_CONSUME_DATA d where ',
'--                   CPTR_START_TIME_DT_GDT > TP_START_TIME_DT_GDT and CPTR_START_TIME_DT_GDT <= TP_END_TIME_DT_GDT or ',
'--                   CPTR_END_TIME_DT_GDT   > TP_START_TIME_DT_GDT and CPTR_END_TIME_DT_GDT   <= TP_END_TIME_DT_GDT);'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'REABILITATION'
,p_return_column_name=>'TP_ID'
,p_display_column_name=>'TP_NAME'
,p_version_scn=>'SH256:iXvYcyOCMcOHWEslmP-86zAgHCtHrav07bjgkS1JYcM'
);
wwv_flow_imp.component_end;
end;
/
