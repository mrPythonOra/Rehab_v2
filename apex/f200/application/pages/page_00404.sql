prompt --application/pages/page_00404
begin
--   Manifest
--     PAGE: 00404
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
 p_id=>404
,p_name=>'PRCalendar2'
,p_alias=>'PRCALENDAR2'
,p_step_title=>unistr('\041A\0430\043B\0435\043D\0434\0430\0440 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044C 2')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(69880816021330022)
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
 p_id=>wwv_flow_imp.id(1513178307059572117)
,p_plug_name=>'Gantt Chart'
,p_static_id=>'gantt-chart'
,p_parent_plug_id=>wwv_flow_imp.id(633249584869065421)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(69885026063333637)
,p_region_id=>wwv_flow_imp.id(1513178307059572117)
,p_chart_type=>'gantt'
,p_height=>'400'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>false
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>false
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Select a start and end date, to render the gantt chart'
,p_horizontal_grid=>'visible'
,p_vertical_grid=>'visible'
,p_row_axis_rendered=>'on'
,p_gantt_axis_position=>'top'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options) {',
'    options.dataFilter = function( data ) {',
'      ',
'        // Change message during rendering when no data found i.e. data.series array is empty',
'        if ( $.isEmptyObject ( data ) ) {  ',
'            data = $.extend( data, {translations: {labelInvalidData: ''No data found'' } }) ;',
'        }',
'        return data;',
'    };',
'   return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(69886708928333642)
,p_chart_id=>wwv_flow_imp.id(69885026063333637)
,p_static_id=>'tasks'
,p_seq=>10
,p_name=>'Tasks'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prr_id                                                                           task_id, ',
'       null                                                                             parent_task_id,',
'       PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-Mon-DD'')||'')'' task_name,',
'       PRR_PRESCRIPTED_WHEN+0                                                           task_start_date,',
'       PRR_PRESCRIPTED_WHEN+0                                                           task_end_date,',
'       1                                                                                status,',
'       PRR_PRESCRIPTED_WHEN+0                                                           baseline_start,',
'       PRR_PRESCRIPTED_WHEN+0                                                           baseline_end,',
'       SYSDATE-30                                                                       GANTT_START,',
'       SYSDATE+10                                                                       GANTT_END       ',
'from REHAB_PRESCRIPTORS',
'where PRR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'union all',
'select PRATR_ID * 1e6                                                                   task_id, ',
'       PR_PRR_ID                                                                        parent_task_id,',
'       DR_NAME || nvl2(WS_NAME,'' (''||WS_NAME||'')'', null)                               task_name,',
'       PRATR_ACTUAL_START+0                                                             task_start_date,',
'       nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              task_end_date,',
'       1                                                                                status,',
'       PRATR_ACTUAL_START+0                                                             baseline_start,',
'       nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              baseline_end,',
'       SYSDATE-30                                                                       GANTT_START,',
'       SYSDATE+10                                                                       GANTT_END  ',
'from REHAB_PRESCRIPTIONS, ',
'     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, ',
'     lateral(select unique PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID),',
'    REHAB_DRUGS, REHAB_WORKING_SUBSTANCE',
'where PRATR_PR_ID = PR_ID',
'and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and PRD_DR_ID = DR_ID and WS_ID(+) = DR_WS_ID--and PR_WS_ID is null',
'-- union all',
'-- select PR_ID * 1e9                                                                      task_id, ',
'--        PR_PRR_ID                                                                        parent_task_id,',
'--        WS_NAME                                                                          task_name,',
'--        min(PRATR_ACTUAL_START+0) over (partition by PR_ID)                              task_start_date,',
'--        max(nvl(PRATR_ACTUAL_END+0,sysdate+365)) over (partition by PR_ID)               task_end_date,',
'--        1                                                                                status,',
'--        min(PRATR_ACTUAL_START+0) over (partition by PR_ID)                              baseline_start,',
'--        max(nvl(PRATR_ACTUAL_END+0,sysdate+365)) over (partition by PR_ID)               baseline_end,',
'--        SYSDATE-30                                                                       GANTT_START,',
'--        SYSDATE+10                                                                       GANTT_END  ',
'-- from REHAB_PRESCRIPTIONS, ',
'--      REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES,',
'--      REHAB_WORKING_SUBSTANCE',
'-- where PRATR_PR_ID = PR_ID',
'-- and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'-- and PR_WS_ID is not null',
'-- and WS_ID = PR_WS_ID',
'-- union all',
'-- select PRATR_ID * 1e6                                                                   task_id, ',
'--        PR_ID * 1e9                                                                      parent_task_id,',
'--        DR_NAME                                                                          task_name,',
'--        PRATR_ACTUAL_START+0                                                             task_start_date,',
'--        nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              task_end_date,',
'--        1                                                                                status,',
'--        PRATR_ACTUAL_START+0                                                             baseline_start,',
'--        nvl(PRATR_ACTUAL_END+0,sysdate+365)                                              baseline_end,',
'--        SYSDATE-30                                                                       GANTT_START,',
'--        SYSDATE+10                                                                       GANTT_END  ',
'-- from REHAB_PRESCRIPTIONS, ',
'--      REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, ',
'--      lateral(select unique PRD_DR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_PRATR_ID = PRATR_ID),',
'--     REHAB_DRUGS',
'-- where PRATR_PR_ID = PR_ID',
'-- and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'-- and PRD_DR_ID = DR_ID and PR_WS_ID is not null'))
,p_ajax_items_to_submit=>'P404_START_DATE,P404_END_DATE'
,p_items_label_rendered=>true
,p_gantt_start_date_source=>'DB_COLUMN'
,p_gantt_start_date_column=>'GANTT_START'
,p_gantt_end_date_source=>'DB_COLUMN'
,p_gantt_end_date_column=>'GANTT_END'
,p_gantt_row_id=>'PARENT_TASK_ID'
,p_gantt_row_name=>'TASK_NAME'
,p_gantt_task_id=>'TASK_ID'
,p_gantt_task_name=>'TASK_NAME'
,p_gantt_task_start_date=>'TASK_START_DATE'
,p_gantt_task_end_date=>'TASK_END_DATE'
,p_gantt_task_css_class=>'u-color-22'
,p_gantt_baseline_start_column=>'BASELINE_START'
,p_gantt_baseline_end_column=>'BASELINE_END'
,p_gantt_baseline_css_class=>'u-color-43'
,p_gantt_progress_column=>'STATUS'
,p_gantt_progress_css_class=>'u-color-11'
,p_gantt_viewport_start_source=>'ITEM'
,p_gantt_viewport_start_item=>'P404_START_DATE'
,p_gantt_viewport_end_source=>'ITEM'
,p_gantt_viewport_end_item=>'P404_END_DATE'
,p_task_label_position=>'innerStart'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(69885512448333639)
,p_chart_id=>wwv_flow_imp.id(69885026063333637)
,p_static_id=>'major'
,p_axis=>'major'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_axis_scale=>'months'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>true
,p_zoom_order_weeks=>true
,p_zoom_order_months=>true
,p_zoom_order_quarters=>true
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(69886171040333640)
,p_chart_id=>wwv_flow_imp.id(69885026063333637)
,p_static_id=>'minor'
,p_axis=>'minor'
,p_format_type=>'date-medium'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_axis_scale=>'weeks'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>true
,p_zoom_order_weeks=>true
,p_zoom_order_months=>true
,p_zoom_order_quarters=>true
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1838662486667824910)
,p_plug_name=>'Gantt Controls'
,p_static_id=>'gantt-controls'
,p_parent_plug_id=>wwv_flow_imp.id(633249584869065421)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_header=>'To render the gantt chart, select a start and end date.  Any tasks within the date range selected will be rendered on the chart.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4581453908508861240)
,p_plug_name=>'Multiple Tasks Information'
,p_static_id=>'multiple-tasks-information'
,p_parent_plug_id=>wwv_flow_imp.id(633249584869065421)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This example demonstrates how to customize a Gantt chart''s colors, using Universal Theme color css classes, and the setting of the chart start and end dates based upon page items.<p/><p/>',
'',
'<strong>Start Date Source Type</strong> - Set this series-level attribute to ''Item'', and select the page item to be used for setting the start date of the gantt chart.  This is a required setting in order to render the chart.<br/>',
'<strong>End Date Source Type</strong> - Set this series-level attribute to ''Item'', and select the page item to be used for setting the end date of the gantt chart. This is a required setting in order to render the chart.<p/>',
'',
'<strong>Task CSS Classes</strong> - Use this series-level attribute to customize the color of tasks bars<br/>',
'<strong>Progress CSS Classes</strong> - Use this series-level attribute to customize the color of progress bars<br/>',
'<strong>Baseline CSS Classes</strong> - Use this series-level attribute to customize the color of baseline bars<br/>',
'',
'<p>',
'For more information on the JET Gantt chart options, refer to the Oracle JET <a href="https://www.oracle.com/webfolder/technetwork/jet-800/jsdocs/oj.ojGantt.html" target="_blank">ojGantt API</a>.',
'</p>',
'<p>',
'For more information on Universal Theme Color css classes, refer to the Universal Theme Sample Application <a href="https://apex.oracle.com/pls/apex/f?p=42:6302:::NO:::" target="_blank">Color and Status Modifiers</a> page.'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(633249584869065421)
,p_plug_name=>'Multiple Tasks per Row'
,p_static_id=>'multiple-tasks-per-row'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69882572989333623)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1838662486667824910)
,p_button_name=>'P404_GO'
,p_static_id=>'p404-go'
,p_button_static_id=>'P3_GO'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Go'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="margin: 8px 0 0 8px;"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(68078605228157004)
,p_button_id=>wwv_flow_imp.id(69882572989333623)
,p_action_sequence=>10
,p_action=>'NATIVE_REFRESH'
,p_static_id=>'native-refresh'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1513178307059572117)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(837441047554978196)
,p_name=>'P404_END_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1838662486667824910)
,p_prompt=>'End Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>64
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4581457864584861314)
,p_name=>'P404_MAX_END_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1838662486667824910)
,p_source=>'select SYSDATE+10 from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4581457701662861313)
,p_name=>'P404_MIN_START_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1838662486667824910)
,p_source=>'select SYSDATE-125 from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1513181818183571066)
,p_name=>'P404_START_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1838662486667824910)
,p_prompt=>'Start Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>64
,p_cMaxlength=>4000
,p_colspan=>2
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
