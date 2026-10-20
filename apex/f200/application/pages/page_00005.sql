prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Gantt'
,p_alias=>'GANTT'
,p_step_title=>'Gantt'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1443301836384268320)
,p_plug_name=>'About this page'
,p_static_id=>'about-this-page'
,p_icon_css_classes=>'fa-gantt-chart'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--customIcons:t-Alert--info'
,p_plug_template=>2042159785845301134
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<p>&PRODUCT_NAME. native Gantt charts, using Oracle JET, are showcased on this page.  Explore the wide range of attributes declaratively available with our native JavaScript-based solution, to format and customize your gantt charts.</p><br/>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1443296631142238501)
,p_plug_name=>'Gantt Chart'
,p_static_id=>'gantt-chart'
,p_parent_plug_id=>wwv_flow_imp.id(563367908951731805)
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
 p_id=>wwv_flow_imp.id(69865909422322001)
,p_region_id=>wwv_flow_imp.id(1443296631142238501)
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
 p_id=>wwv_flow_imp.id(69867532182322010)
,p_chart_id=>wwv_flow_imp.id(69865909422322001)
,p_static_id=>'tasks'
,p_seq=>10
,p_name=>'Tasks'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id                            task_id,',
'       task_name                     task_name,',
'       parent_task                   parent_task_id,',
'       start_date                    task_start_date,',
'       end_date                      task_end_date,',
'       decode(status,''Closed'',1,',
'                     ''Open'',0.6,',
'                     ''On-Hold'',0.1,',
'                     ''Pending'',0)    status,',
'       start_date-2                  baseline_start,',
'       end_date+3                    baseline_end,',
'       SYSDATE-200                   GANTT_START,',
'       SYSDATE+10                    GANTT_END',
'from eba_demo_chart_tasks',
'start with parent_task is null',
'connect by prior id = parent_task',
'order siblings by task_name',
''))
,p_ajax_items_to_submit=>'P5_START_DATE,P5_END_DATE'
,p_series_type=>'gantt'
,p_items_label_rendered=>true
,p_items_label_display_as=>'PERCENT'
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
,p_gantt_viewport_start_item=>'P5_START_DATE'
,p_gantt_viewport_end_source=>'ITEM'
,p_gantt_viewport_end_item=>'P5_END_DATE'
,p_task_label_position=>'innerStart'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(69866409121322004)
,p_chart_id=>wwv_flow_imp.id(69865909422322001)
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
 p_id=>wwv_flow_imp.id(69866997788322007)
,p_chart_id=>wwv_flow_imp.id(69865909422322001)
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
 p_id=>wwv_flow_imp.id(1768780810750491294)
,p_plug_name=>'Gantt Controls'
,p_static_id=>'gantt-controls'
,p_parent_plug_id=>wwv_flow_imp.id(563367908951731805)
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
 p_id=>wwv_flow_imp.id(4511572232591527624)
,p_plug_name=>'Multiple Tasks Information'
,p_static_id=>'multiple-tasks-information'
,p_parent_plug_id=>wwv_flow_imp.id(563367908951731805)
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
 p_id=>wwv_flow_imp.id(563367908951731805)
,p_plug_name=>'Multiple Tasks per Row'
,p_static_id=>'multiple-tasks-per-row'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(563367810603731804)
,p_plug_name=>'Region Display Selector'
,p_static_id=>'region-display-selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(868832668616914177)
,p_plug_name=>'Single Task Information'
,p_static_id=>'single-task-information'
,p_parent_plug_id=>wwv_flow_imp.id(2712582215341878743)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This example demonstrates the rendering of a Gantt chart with a single task per row of the chart, and a JavaScript customization to apply a Reference Object.  The Reference Object is displayed as a thin red line, marking today''s date.  The chart sett'
||'ings in use are as follows:<p/><p/>',
'',
'<strong>Show Row Axis</strong> - set to <strong>Yes</strong>, to render the left section of the Gantt. For this example, the value of Task Name is displayed. The text rendered in this region is dependent upon the column mappings defined at series-lev'
||'el.  By default, the Task Name will be rendered.  However, if the Row Name column mapping is set, its associated text will be rendered for the given row of the chart.<p/>',
'<strong>Tooltip Settings</strong> - The new <strong>Show Row</strong> attribute has been set to No, to prevent a ''Row'' entry being displayed in a task tooltip.  By default, a tooltip displays an entry for ''Row'' and ''Label''.  The ''Label'' displays the '
||'value for the Task Name column.  When the Row Name column mapping is set, ''Row'' displays the value for the Row Name column.  However, when that column mapping is not set, ''Row'' will display the value for the Task Name column. <p/>',
'',
'<strong>Task Appearance</strong> - the Tasks rendered on this example differ in appearance, with some being displayed as blue lines with start/end dates, while others are displayed as gray diamond-shaped markers.  The difference in appearance is due '
||'to how JET interprets the Task ''type''. Normal tasks are rendered as the blue lines, while Milestones are rendered as gray diamond-shaped markers. As outlined in the <a href="https://docs.oracle.com/en/middleware/developer-tools/jet/7.2/reference-api/'
||'oj.ojGantt.html#RowTask" target="_blank">type</a> property of the RowTask type definition in the <a href="https://docs.oracle.com/en/middleware/developer-tools/jet/7.2/reference-api/oj.ojGantt.html" target="_blank">ojGantt</a> API, if Task Start Date'
||' and Task End Date values are specified and unequal, then the assumption is that the task type is "normal".  Otherwise, the type is assumed to be "milestone".<p/>',
'',
'<strong>JavaScript Code</strong> - Use this chart-level attribute to customize your chart attributes and data.  Any chart initialization changes, to attributes such as the chart y-axis, type, or orientation, can also be made.  The JavaScript Code sho'
||'uld follow a template similar to the following:<br/>',
'',
'<pre>',
'function( options ) {',
'',
'    var event = new Date();',
'    // Define Reference Object line on the chart',
'    var constantLine = [ { value: event.toISOString() } ];',
'    ',
'    // Set the referenceObjects option as part of the chart initialization',
'    options.referenceObjects = constantLine;',
'    ',
'    return options;',
'}',
'</pre><p/>',
'<strong>Tooltip Options</strong> - Use the chart-level Tooltip attributes to declaratively choose what information should be displayed in the Gantt chart tooltip. This chart only displays the Row, Label, and Progress information, by setting the <stro'
||'ng>Show Row</strong>, <strong>Show Label</strong> and <strong>Show Progress</strong> attributes.<br/> ',
'<p>',
'For more information on the JET Gantt chart options, refer to the Oracle JET <a href="https://www.oracle.com/webfolder/technetwork/jet-800/jsdocs/oj.ojGantt.html" target="_blank">ojGantt API</a>.',
'</p>',
'<p>',
'For more information on Reference Object settings, refer to the Oracle JET Cookbook <a href="https://www.oracle.com/webfolder/technetwork/jet-800/jetCookbook.html?component=gantt&demo=multipleTasks" target="_blank">Gantt Chart: Multiple Tasks Per Row'
||'</a> example.'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2712582215341878743)
,p_plug_name=>'Single Task per Row (Reference Object via JavaScript Code)'
,p_static_id=>'single-task-per-row-reference-object-via-javascript-code'
,p_region_name=>'gantt'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(69869126799322018)
,p_region_id=>wwv_flow_imp.id(2712582215341878743)
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
,p_horizontal_grid=>'visible'
,p_vertical_grid=>'visible'
,p_row_axis_rendered=>'on'
,p_gantt_axis_position=>'top'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'',
'    var event = new Date();',
'    // Define Reference Object line on the chart',
'    var constantLine = [ { value: event.toISOString() } ];',
'    ',
'    // Set the referenceObjects option as part of the chart initialization',
'    options.referenceObjects = constantLine;',
'    ',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(69870885636322025)
,p_chart_id=>wwv_flow_imp.id(69869126799322018)
,p_static_id=>'tasks'
,p_seq=>10
,p_name=>'Tasks'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_name    task_name,',
'       id           task_id,',
'       start_date   task_start_date,',
'       end_date     task_end_date,',
'       decode(status,''Closed'',1,''Open'',0.6,''On-Hold'',0.1,''Pending'',0) status,',
'       (select min(start_date) -5 from eba_demo_chart_tasks) gantt_start_date,',
'       (select max(end_date) from eba_demo_chart_tasks)  gantt_end_date',
'from eba_demo_chart_tasks',
'order by id asc'))
,p_series_type=>'gantt'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_gantt_start_date_source=>'DB_COLUMN'
,p_gantt_start_date_column=>'GANTT_START_DATE'
,p_gantt_end_date_source=>'DB_COLUMN'
,p_gantt_end_date_column=>'GANTT_END_DATE'
,p_gantt_task_id=>'TASK_ID'
,p_gantt_task_name=>'TASK_NAME'
,p_gantt_task_start_date=>'TASK_START_DATE'
,p_gantt_task_end_date=>'TASK_END_DATE'
,p_gantt_progress_column=>'STATUS'
,p_task_label_position=>'end'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(69869626468322020)
,p_chart_id=>wwv_flow_imp.id(69869126799322018)
,p_static_id=>'major'
,p_axis=>'major'
,p_is_rendered=>'off'
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
 p_id=>wwv_flow_imp.id(69870243539322022)
,p_chart_id=>wwv_flow_imp.id(69869126799322018)
,p_static_id=>'minor'
,p_axis=>'minor'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_axis_scale=>'months'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(350071652228587141)
,p_plug_name=>'Tasks per Employee ( not hierarchical )'
,p_static_id=>'tasks-per-employee-not-hierarchical'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(69872459674322030)
,p_region_id=>wwv_flow_imp.id(350071652228587141)
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
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>false
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'visible'
,p_vertical_grid=>'visible'
,p_row_axis_rendered=>'on'
,p_gantt_axis_position=>'top'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'',
'    var event = new Date();',
'    // Define Reference Object line on the chart',
'    var constantLine = [ { value: event.toISOString() } ];',
'    ',
'    // Set the referenceObjects option as part of the chart initialization',
'    options.referenceObjects = constantLine;',
'    ',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(69874189454322035)
,p_chart_id=>wwv_flow_imp.id(69872459674322030)
,p_static_id=>'tasks'
,p_seq=>10
,p_name=>'Tasks'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select ASSIGNED_TO employee ,  ',
'           task_name    task_name,  ',
'           id           task_id,  ',
'           parent_task  parent_task,  ',
'           start_date   task_start_date,  ',
'           end_date     task_end_date,  ',
'           decode(status,''Closed'',1,''Open'',0.6,''On-Hold'',0.1,''Pending'',0) status,  ',
'           (select min(start_date) from eba_demo_chart_tasks) gantt_start_date,  ',
'           (select max(end_date) from eba_demo_chart_tasks)  gantt_end_date  ',
'    from eba_demo_chart_tasks  ',
'    start with parent_task is null  ',
'    connect by prior id = parent_task  ',
'    order siblings by task_name  '))
,p_series_type=>'gantt'
,p_items_label_rendered=>true
,p_items_label_display_as=>'PERCENT'
,p_gantt_start_date_source=>'DB_COLUMN'
,p_gantt_start_date_column=>'GANTT_START_DATE'
,p_gantt_end_date_source=>'DB_COLUMN'
,p_gantt_end_date_column=>'GANTT_END_DATE'
,p_gantt_row_name=>'EMPLOYEE'
,p_gantt_task_id=>'TASK_ID'
,p_gantt_task_name=>'TASK_NAME'
,p_gantt_task_start_date=>'TASK_START_DATE'
,p_gantt_task_end_date=>'TASK_END_DATE'
,p_gantt_progress_column=>'STATUS'
,p_task_label_position=>'start'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(69872988668322031)
,p_chart_id=>wwv_flow_imp.id(69872459674322030)
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
 p_id=>wwv_flow_imp.id(69873577913322033)
,p_chart_id=>wwv_flow_imp.id(69872459674322030)
,p_static_id=>'minor'
,p_axis=>'minor'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_axis_scale=>'days'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>true
,p_zoom_order_days=>true
,p_zoom_order_weeks=>true
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69863471607321979)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1768780810750491294)
,p_button_name=>'P5_GO'
,p_static_id=>'p3-go'
,p_button_static_id=>'P3_GO'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767558048922644569)
,p_name=>'P5_END_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1768780810750491294)
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
 p_id=>wwv_flow_imp.id(4511574865952527687)
,p_name=>'P5_MAX_END_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1768780810750491294)
,p_source=>'select SYSDATE+10 from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4511574703030527686)
,p_name=>'P5_MIN_START_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1768780810750491294)
,p_source=>'select SYSDATE-125 from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1443298819551237439)
,p_name=>'P5_START_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1768780810750491294)
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
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(69875314554322092)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_static_id=>'last-view'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69875754930322097)
,p_name=>'Refresh chart'
,p_static_id=>'refresh-chart'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(69863471607321979)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69876187191322102)
,p_event_id=>wwv_flow_imp.id(69875754930322097)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1443296631142238501)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
