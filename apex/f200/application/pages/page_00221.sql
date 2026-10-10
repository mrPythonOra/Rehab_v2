prompt --application/pages/page_00221
begin
--   Manifest
--     PAGE: 00221
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
 p_id=>221
,p_name=>'WatchLogs'
,p_alias=>'WATCHLOGS'
,p_step_title=>unistr('\0422\0440\0435\043A\0435\0440\0438')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29853746349574537)
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
 p_id=>wwv_flow_imp.id(109419350141117779)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3224648155363603145
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54688089723388130)
,p_plug_name=>'WatchLog'
,p_static_id=>'new'
,p_title=>unistr('\0414\0430\043D\0456')
,p_parent_plug_id=>wwv_flow_imp.id(109419350141117779)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    wl_id,',
'    wl_pat_id,',
'    wl_taken,',
'    wl_steps,',
'    wl_night_min_pulse,',
'    wl_night_max_pulse,',
'    wl_night_avg_pulse,',
'    wl_calm_avg_pulse,',
'    wl_total_avg_pulse,',
'    wl_total_min_pulse,',
'    wl_total_max_pulse',
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('\0414\0430\043D\0456')
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(54688114703388131)
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>54688114703388131
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688966691388139)
,p_db_column_name=>'WL_CALM_AVG_PULSE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688228653388132)
,p_db_column_name=>'WL_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688843373388138)
,p_db_column_name=>'WL_NIGHT_AVG_PULSE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\0421\0435\0440\0435\0434\043D\0456\0439 \043D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688745378388137)
,p_db_column_name=>'WL_NIGHT_MAX_PULSE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \043D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441\0442')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688649783388136)
,p_db_column_name=>'WL_NIGHT_MIN_PULSE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \043D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688340201388133)
,p_db_column_name=>'WL_PAT_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Patient ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688534111388135)
,p_db_column_name=>'WL_STEPS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\041A\0440\043E\043A\0456\0432')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54688437453388134)
,p_db_column_name=>'WL_TAKEN'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\0412\0438\043C\0456\0440\044F\043D\043E')
,p_column_link=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.::P222_WL_ID:#WL_ID#'
,p_column_linktext=>'#WL_TAKEN#'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54689086870388140)
,p_db_column_name=>'WL_TOTAL_AVG_PULSE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\0421\0435\0440\0435\0434\043D\0456\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54689297227388142)
,p_db_column_name=>'WL_TOTAL_MAX_PULSE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54689132803388141)
,p_db_column_name=>'WL_TOTAL_MIN_PULSE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(54751181784756151)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WL_TAKEN:WL_STEPS:WL_NIGHT_MIN_PULSE:WL_NIGHT_MAX_PULSE:WL_NIGHT_AVG_PULSE:WL_CALM_AVG_PULSE:WL_TOTAL_AVG_PULSE:WL_TOTAL_MIN_PULSE:WL_TOTAL_MAX_PULSE'
,p_sort_column_1=>'WL_TAKEN'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(106589214025808806)
,p_plug_name=>'SmallChart1'
,p_static_id=>'smallchart1'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_parent_plug_id=>wwv_flow_imp.id(109419350141117779)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(54741137994729725)
,p_region_id=>wwv_flow_imp.id(106589214025808806)
,p_chart_type=>'line'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54742888137729730)
,p_chart_id=>wwv_flow_imp.id(54741137994729725)
,p_static_id=>'steps'
,p_seq=>10
,p_name=>'Steps'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    sum(wl_steps) wl_steps,',
'    -- wl_night_min_pulse,',
'    -- wl_night_max_pulse,',
'    -- wl_night_avg_pulse,',
'    -- wl_calm_avg_pulse,',
'    -- wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\041A\0440\043E\043A\0438'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_STEPS'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(58057484591597023)
,p_chart_id=>wwv_flow_imp.id(54741137994729725)
,p_static_id=>'steps-trg'
,p_seq=>20
,p_name=>'Steps_TRG'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    --sum(wl_steps) wl_steps,',
'    -- wl_night_min_pulse,',
'    -- wl_night_max_pulse,',
'    -- wl_night_avg_pulse,',
'    -- wl_calm_avg_pulse,',
'    -- wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
'    to_number(REHAB_CONFIG_PKG.get_config_par(''DBTRG_ALLSTEPS'')) distance_trg,',
unistr('    ''\041C\0435\0442\0430'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'DISTANCE_TRG'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54741674107729726)
,p_chart_id=>wwv_flow_imp.id(54741137994729725)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54742279612729728)
,p_chart_id=>wwv_flow_imp.id(54741137994729725)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(109419473816117780)
,p_plug_name=>'SmallChart2'
,p_static_id=>'smallchart2'
,p_title=>unistr('\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439')
,p_parent_plug_id=>wwv_flow_imp.id(109419350141117779)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(54734828795729699)
,p_region_id=>wwv_flow_imp.id(109419473816117780)
,p_chart_type=>'line'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54736454436729706)
,p_chart_id=>wwv_flow_imp.id(54734828795729699)
,p_static_id=>'disnatce'
,p_seq=>10
,p_name=>'NightPulseAvg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    --sum(wl_steps) wl_steps,',
'    round(avg(wl_night_avg_pulse)) wl_night_avg_pulse,',
'    -- wl_night_min_pulse',
'    -- wl_night_max_pulse,',
'    -- wl_night_avg_pulse,',
'    -- wl_calm_avg_pulse,',
'    -- wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\0421\0435\0440\0435\0434\043D\0456\0439'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_NIGHT_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54689446619388144)
,p_chart_id=>wwv_flow_imp.id(54734828795729699)
,p_static_id=>'nightpulsemax'
,p_seq=>30
,p_name=>'NightPulseMax'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    --sum(wl_steps) wl_steps,',
'    -- wl_night_min_pulse,',
'    max(wl_night_max_pulse) wl_night_max_pulse,',
'    -- wl_night_avg_pulse,',
'    -- wl_calm_avg_pulse,',
'    -- wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_NIGHT_MAX_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54689357571388143)
,p_chart_id=>wwv_flow_imp.id(54734828795729699)
,p_static_id=>'nightpulsemin'
,p_seq=>20
,p_name=>'NightPulseMin'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    --sum(wl_steps) wl_steps,',
'    --wl_night_min_pulse,',
'    --wl_night_max_pulse,',
'    -- wl_night_avg_pulse,',
'    min(wl_night_min_pulse) wl_night_min_pulse,',
'    -- wl_calm_avg_pulse,',
'    -- wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_NIGHT_MIN_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54735380191729701)
,p_chart_id=>wwv_flow_imp.id(54734828795729699)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54735925222729703)
,p_chart_id=>wwv_flow_imp.id(54734828795729699)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(109420065014117786)
,p_plug_name=>'SmallChart3'
,p_static_id=>'smallchart3'
,p_title=>unistr('\041F\0443\043B\044C\0441 \0434\043E\0431\043E\0432\0438\0439')
,p_parent_plug_id=>wwv_flow_imp.id(109419350141117779)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(54737992254729714)
,p_region_id=>wwv_flow_imp.id(109420065014117786)
,p_chart_type=>'line'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54689506947388145)
,p_chart_id=>wwv_flow_imp.id(54737992254729714)
,p_static_id=>'avg24'
,p_seq=>20
,p_name=>'Avg24'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    -- sum(wl_steps) wl_steps,',
'    -- wl_night_avg_pulse,',
'    -- wl_night_min_pulse',
'    -- wl_night_max_pulse,',
'    --round(avg(wl_calm_avg_pulse)) wl_calm_avg_pulse,',
'    round(avg(wl_total_avg_pulse)) wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\0421\0435\0440\0435\0434\043D\0456\0439'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_TOTAL_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54739694063729720)
,p_chart_id=>wwv_flow_imp.id(54737992254729714)
,p_static_id=>'disnatce'
,p_seq=>10
,p_name=>'AvgCalm'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    -- sum(wl_steps) wl_steps,',
'    -- wl_night_avg_pulse,',
'    -- wl_night_min_pulse',
'    -- wl_night_max_pulse,',
'    round(avg(wl_calm_avg_pulse)) wl_calm_avg_pulse,',
'    -- wl_total_avg_pulse,',
'    -- wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\0423 \0441\043F\043E\043A\043E\0457'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_CALM_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54689795657388147)
,p_chart_id=>wwv_flow_imp.id(54737992254729714)
,p_static_id=>'max24'
,p_seq=>40
,p_name=>'Max24'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    -- sum(wl_steps) wl_steps,',
'    -- wl_night_avg_pulse,',
'    -- wl_night_min_pulse',
'    -- wl_night_max_pulse,',
'    --round(avg(wl_calm_avg_pulse)) wl_calm_avg_pulse,',
'    --round(avg(wl_total_avg_pulse)) wl_total_avg_pulse,',
'    --min(wl_total_min_pulse) wl_total_min_pulse,',
'    max(wl_total_max_pulse) wl_total_max_pulse,',
unistr('    ''\041C\0430\043A\0441'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_TOTAL_MAX_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54689616860388146)
,p_chart_id=>wwv_flow_imp.id(54737992254729714)
,p_static_id=>'min24'
,p_seq=>30
,p_name=>'Min24'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- wl_id,',
'    -- wl_pat_id,',
'    trunc(wl_taken, ''dd'') wl_taken,',
'    -- sum(wl_steps) wl_steps,',
'    -- wl_night_avg_pulse,',
'    -- wl_night_min_pulse',
'    -- wl_night_max_pulse,',
'    --round(avg(wl_calm_avg_pulse)) wl_calm_avg_pulse,',
'    --round(avg(wl_total_avg_pulse)) wl_total_avg_pulse,',
'    min(wl_total_min_pulse) wl_total_min_pulse,',
'    -- wl_total_max_pulse',
unistr('    ''\041C\0456\043D'' series_name'),
'FROM',
'    rehab_watch_logs',
'where wl_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(WL_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAK'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(wl_taken, ''dd'')',
'order by wl_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'WL_TOTAL_MIN_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54738455331729716)
,p_chart_id=>wwv_flow_imp.id(54737992254729714)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54739044427729718)
,p_chart_id=>wwv_flow_imp.id(54737992254729714)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56077431510298534)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(54688089723388130)
,p_button_name=>'CreateNew'
,p_static_id=>'createnew'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438 \043D\043E\0432\0438\0439 \0437\0430\043F\0438\0441')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.::P222_WL_ID:'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-clipboard-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp.component_end;
end;
/
