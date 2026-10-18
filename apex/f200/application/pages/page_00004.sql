prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Faceted Search: Projects'
,p_alias=>'FACETED-SEARCH-PROJECTS'
,p_step_title=>'Faceted Search: Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3228662850822919413)
,p_plug_name=>'About this page'
,p_static_id=>'about-this-page'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<p>This is a standard Oracle APEX Calendar region component built using the create calendar region wizard. Additionally a Faceted Search region was added to enable rich search capabilities of the calendar region. Click on a calendar event to open a d'
||'ialog where you can edit the event''s details.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(752295135208445210)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(3228663982632919419)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(752296971139445279)
,p_name=>'P4_PROJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(752295135208445210)
,p_prompt=>'Project'
,p_source=>'PROJECT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_fc_show_label=>false
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(752296853464445278)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(752295135208445210)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3228663982632919419)
,p_plug_name=>'Tasks'
,p_static_id=>'tasks'
,p_region_name=>'task_due_dates'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   id,',
'   project,',
'   task_name,',
'   status,',
'   assigned_to,',
'   cost,',
'   start_date,',
'   end_date,',
'   case',
'      when status = ''Pending'' then ''apex-cal-blue''',
'      when status = ''Open'' then ''apex-cal-green''',
'      when status = ''Closed'' then ''apex-cal-gray''',
'      when status = ''On-Hold'' then ''apex-cal-orange''',
'   end as css_class',
'from eba_demo_cal_projects',
'order by end_date'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (p) {',
' p.endDateExclusive = false;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_views_and_navigation', 'month:week:day:list:navigation',
  'css_class', 'CSS_CLASS',
  'display_column', 'TASK_NAME',
  'drag_and_drop', 'N',
  'end_date_column', 'END_DATE',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '9',
  'maximum_events_day', '3',
  'multiple_line_event', 'N',
  'primary_key_column', 'ID',
  'responsive_list_view', 'Y',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'START_DATE',
  'time_format', '00',
  'view_edit_link', 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_ID,P3_LASTVIEW:&ID.,&APP_PAGE_ID.')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(67258158633199559)
,p_name=>'Change Project - Refresh Calendar'
,p_static_id=>'change-project-refresh-calendar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_PROJECTS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(67258590006199563)
,p_event_id=>wwv_flow_imp.id(67258158633199559)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3228663982632919419)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(67259037112199567)
,p_name=>'Dialog closed'
,p_static_id=>'dialog-closed'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(3228663982632919419)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(67259497957199568)
,p_event_id=>wwv_flow_imp.id(67259037112199567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3228663982632919419)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
