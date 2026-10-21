prompt --application/pages/page_00103
begin
--   Manifest
--     PAGE: 00103
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_page.create_page(
 p_id=>103
,p_name=>'ConsumationCalendar'
,p_alias=>'CONSUMATIONCALENDAR'
,p_step_title=>unistr('\041A\0430\043B\0435\043D\0434\0430\0440 \0441\043F\043E\0436\0438\0432\0430\043D\043D\044F')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124932273227990970)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(16870387633504251)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(886836087492535059)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>unistr('\0424\0456\043B\044C\0442\0440\0443\0432\0430\0442\0438')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(3363204934917009268)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(886840736691535221)
,p_name=>'P103_DRUG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(886836087492535059)
,p_prompt=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442')
,p_source=>'DR_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select unique DR_NAME||'' (''||DR_TYPE_SHORT||'')'' d, DR_ID r',
'from rehab_drugs, REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS',
'where PRD_DR_ID = DR_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID',
'and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'order by 1'))
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>true
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132361441958403238)
,p_name=>'P103_PRESCRIPTOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(886836087492535059)
,p_prompt=>unistr('\0414\0436\0435\0440\0435\043B\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'PRR_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d,r from(',
'select PRR_PRESCRIPTED_BY_SHORT ||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-Mon-DD'')||'')'' d, ',
'       PRR_ID r, ',
'       PRR_PRESCRIPTED_WHEN',
'from rehab_drugs, REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS, REHAB_PRESCRIPTORS',
'where PRD_DR_ID = DR_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID',
'and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and PRR_ID = PR_PRR_ID',
'group by PRR_ID,PRR_PRESCRIPTED_BY_SHORT, PRR_PRESCRIPTED_WHEN',
'order by PRR_PRESCRIPTED_WHEN desc)'))
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>true
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(886840619016535220)
,p_name=>'P103_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(886836087492535059)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132361542142403239)
,p_name=>'P103_WS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(886836087492535059)
,p_prompt=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_source=>'WS_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WS_NAME d, WS_ID r',
'from REHAB_WORKING_SUBSTANCE',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('\041D\0435 \0432\043A\0430\0437\0430\043D\043E')
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3363204934917009268)
,p_plug_name=>'Tasks'
,p_static_id=>'tasks'
,p_region_name=>'task_due_dates'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--hiddenOverflow:t-Form--xlarge'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH ',
'unique_dates AS (',
'    -- 1. Ensure unique dates in case your source table has multiple records per day',
'select',
'     DRU_ID, PR_PRR_ID prr_id, DRU_DR_ID DR_ID, trunc(DRU_CONSUMED,''dd'') dt, DRU_ACTUAL_DOSAGE',
'from REHAB_DRUG_USES, ',
'     REHAB_PRESCRIPTIONS_DETAILS, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS',
'where DRU_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'  and DRU_PRD_ID = PRD_ID and PRD_PRATR_ID = PRATR_ID and PRATR_PR_ID = PR_ID',
'),',
'numbered_dates AS (',
'    -- 2. Assign a sequential row number ordered by the date',
'    SELECT ',
'        prr_id,dr_id,dt,DRU_ID,',
'        ROW_NUMBER() OVER (partition by prr_id,dr_id ORDER BY dt) AS rn',
'    FROM (select prr_id,dr_id, dt, min(DRU_ID) DRU_ID from unique_dates group by prr_id,dr_id, dt)',
'),--select * from numbered_dates order by 1,2,3;--,',
'grouped_islands AS (',
'    -- 3. Subtract the row number from the date. ',
'    -- For consecutive dates, this difference will always yield the exact same constant date.',
'    SELECT ',
'        prr_id,dr_id,DRU_ID,',
'        dt,',
'        dt - rn AS grp',
'    FROM numbered_dates',
'),--select * from grouped_islands order by 1,2,4,3;--',
'-- 4. Aggregate to find the start and end of each consecutive interval',
'ints as (',
'SELECT ',
'    prr_id p_prr_id,dr_id p_dr_id,min(DRU_ID) DRU_ID,',
'    MIN(dt) AS interval_start,',
'    MAX(dt) AS interval_end,',
'    COUNT(*) AS total_consecutive_days',
'FROM grouped_islands',
'GROUP BY prr_id,dr_id,grp)',
'select',
'  DRU_ID ID,',
'  interval_start start_date, interval_end end_date, total_consecutive_days,',
'  DR_NAME||'' (''||DR_TYPE_SHORT||'')'' drug,',
'  PRR_PRESCRIPTED_BY_SHORT ||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-Mon-DD'')||'') ''||',
unistr('  nvl2(WS_NAME,''\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430: ''||WS_NAME||'' '',null)||'),
unistr('  ''\0422\0440\0438\0432\0430\043B\043E: ''||total_consecutive_days||'' \0434\043D\0456(\0432).''--||CP_NAME '),
'  add_info,',
'  case ora_hash(dr_id,16) ',
'             when 0 then ''apex-cal-red''',
'             when 1 then ''apex-cal-green''',
'             when 2 then ''apex-cal-blue''',
'             when 3 then ''apex-cal-yellow''',
'             when 4 then ''apex-cal-orange''',
'             when 5 then ''apex-cal-cyan''',
'             when 6 then ''apex-cal-purple''',
'             when 7 then ''apex-cal-pink''',
'             when 8 then ''apex-cal-brown''',
'             when 9 then ''apex-cal-magenta''',
'             when 10 then ''apex-cal-lime''',
'             when 11 then ''apex-cal-maroon''',
'             when 12 then ''apex-cal-navy''',
'             when 13 then ''apex-cal-olive''',
'             when 14 then ''apex-cal-teal''',
'             when 15 then ''apex-cal-Fuchsia''',
'             when 16 then ''apex-cal-Salmon''',
'           end  css_class,',
'    prr_id,dr_id,ws_id',
'from REHAB_PRESCRIPTORS, REHAB_WORKING_SUBSTANCE, rehab_drugs, ints',
'where prr_id = ints.p_prr_id and dr_id=ints.p_dr_id and dr_ws_id=ws_id(+)',
'ORDER BY start_date;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_required_role=>wwv_flow_imp.id(17092736246142129)
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (p) {',
' p.endDateExclusive = false;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'navigation',
  'calendar_export', 'ICAL',
  'css_class', 'CSS_CLASS',
  'display_column', 'DRUG',
  'end_date_column', 'END_DATE',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '8',
  'multiple_line_event', 'N',
  'responsive_list_view', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'START_DATE',
  'supplemental_information', '&ADD_INFO.',
  'view_edit_link', 'f?p=&APP_ID.:402:&SESSION.::&DEBUG.:RP,402:P402_PRR_ID_CURR,P402_PR_ID_CURR,P402_PRATR_ID_CURR:&PRR_ID.,&PR_ID.,&PRATR_ID.')).to_clob
);
wwv_flow_imp.component_end;
end;
/
