prompt --application/pages/page_00211
begin
--   Manifest
--     PAGE: 00211
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
 p_id=>211
,p_name=>'Trainings'
,p_alias=>'TRAININGS'
,p_step_title=>unistr('\0422\0440\0435\043D\0443\0432\0430\043D\043D\044F')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29852324921571869)
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
 p_id=>wwv_flow_imp.id(54685120764388101)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3224648155363603145
,p_plug_display_sequence=>5
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
 p_id=>wwv_flow_imp.id(51854984649079128)
,p_plug_name=>'SmallChart1'
,p_static_id=>'new'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_parent_plug_id=>wwv_flow_imp.id(54685120764388101)
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
 p_id=>wwv_flow_imp.id(51856847569079147)
,p_region_id=>wwv_flow_imp.id(51854984649079128)
,p_chart_type=>'line'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'200'
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
 p_id=>wwv_flow_imp.id(51856978209079148)
,p_chart_id=>wwv_flow_imp.id(51856847569079147)
,p_static_id=>'steps'
,p_seq=>10
,p_name=>'Steps'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- tr_id,',
'    -- tr_type,',
'    -- tr_pat_id,',
'     trunc(tr_start, ''dd'') tr_start,',
'    -- tr_end,',
'    -- tr_distance_length,',
'     sum(tr_steps) tr_steps,',
'    -- tr_pulse_avg,',
'    -- tr_pulse_min,',
'    -- tr_pulse_max,',
'    -- tr_descr,',
'    -- tr_img1,',
'    -- tr_img2,',
'    -- real_distance,',
'    -- real_step_length,',
'    -- real_speed',
unistr('    ''\041A\0440\043E\043A\0438'' series_name'),
'FROM',
'    rehab_trainings',
'where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAI'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(tr_start, ''dd'')',
'order by tr_start'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'TR_STEPS'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(51857069560079149)
,p_chart_id=>wwv_flow_imp.id(51856847569079147)
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
 p_id=>wwv_flow_imp.id(51857198466079150)
,p_chart_id=>wwv_flow_imp.id(51856847569079147)
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
 p_id=>wwv_flow_imp.id(51855047526079129)
,p_plug_name=>'Trainings'
,p_static_id=>'new_1'
,p_title=>unistr('\0414\0430\043D\0456')
,p_parent_plug_id=>wwv_flow_imp.id(54685120764388101)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    tr_id,',
'    tr_type,',
'    tr_pat_id,',
'    tr_start,',
'    tr_end,',
'    tr_distance_length,',
'    tr_steps,',
'    tr_pulse_avg,',
'    tr_pulse_min,',
'    tr_pulse_max,',
'    tr_descr,',
'    tr_img1,',
'    tr_img2,',
'    real_distance,',
'    real_step_length,',
'    real_speed',
'FROM',
'    rehab_trainings',
'where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT();'))
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
 p_id=>wwv_flow_imp.id(51855125522079130)
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>51855125522079130
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856528837079144)
,p_db_column_name=>'REAL_DISTANCE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('\0420\0435\0430\043B\044C\043D\0430 \0434\0456\0441\0442\0430\043D\0446\0456\044F, \043A\043C')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856768021079146)
,p_db_column_name=>'REAL_SPEED'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('\0420\0435\0430\043B\044C\043D\0430 \0448\0432\0438\0434\043A\0456\0441\0442\044C')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856674524079145)
,p_db_column_name=>'REAL_STEP_LENGTH'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('\0420\0435\0430\043B\044C\043D\0430 \0434\043E\0432\0436\0438\043D\0430 \043A\0440\043E\043A\0443')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856298768079141)
,p_db_column_name=>'TR_DESCR'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\041E\043F\0438\0441')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855738444079136)
,p_db_column_name=>'TR_DISTANCE_LENGTH'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\0414\0438\0441\0442\0430\043D\0446\0456\044F, \043A\043C')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855673778079135)
,p_db_column_name=>'TR_END'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\0417\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855299258079131)
,p_db_column_name=>'TR_ID'
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
 p_id=>wwv_flow_imp.id(51856379599079142)
,p_db_column_name=>'TR_IMG1'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Tr Img1'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856494217079143)
,p_db_column_name=>'TR_IMG2'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Tr Img2'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855416729079133)
,p_db_column_name=>'TR_PAT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Patient ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855984901079138)
,p_db_column_name=>'TR_PULSE_AVG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\041F\0443\043B\044C\0441 \0441\0435\0440\0435\0434\043D\0456\0439')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856104700079140)
,p_db_column_name=>'TR_PULSE_MAX'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\041F\0443\043B\044C\0441 \043C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51856016343079139)
,p_db_column_name=>'TR_PULSE_MIN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\041F\0443\043B\044C\0441 \043C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855575199079134)
,p_db_column_name=>'TR_START'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\041F\043E\0447\0430\0442\043E\043A')
,p_column_link=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.::P212_TR_ID:#TR_ID#'
,p_column_linktext=>'#TR_START#'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855844961079137)
,p_db_column_name=>'TR_STEPS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\041A\0440\043E\043A\0438')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51855335963079132)
,p_db_column_name=>'TR_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\0422\0438\043F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(54672124009720299)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'TR_TYPE:TR_START:TR_END:TR_DISTANCE_LENGTH:TR_STEPS:TR_PULSE_AVG:TR_PULSE_MIN:TR_PULSE_MAX:TR_DESCR:REAL_DISTANCE:REAL_STEP_LENGTH:REAL_SPEED'
,p_sort_column_1=>'TR_START'
,p_sort_direction_1=>'DESC'
,p_break_on=>'TR_TYPE'
,p_break_enabled_on=>'TR_TYPE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54685244439388102)
,p_plug_name=>'SmallChart2'
,p_static_id=>'smallchart2'
,p_title=>unistr('\0414\0438\0441\0442\0430\043D\0446\0456\044F')
,p_parent_plug_id=>wwv_flow_imp.id(54685120764388101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(54685370112388103)
,p_region_id=>wwv_flow_imp.id(54685244439388102)
,p_chart_type=>'line'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'200'
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
 p_id=>wwv_flow_imp.id(54685489054388104)
,p_chart_id=>wwv_flow_imp.id(54685370112388103)
,p_static_id=>'disnatce'
,p_seq=>10
,p_name=>'Disnatce'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- tr_id,',
'    -- tr_type,',
'    -- tr_pat_id,',
'     trunc(tr_start, ''dd'') tr_start,',
'    -- tr_end,',
'     sum(tr_distance_length) tr_distance_length,',
'    -- sum(tr_steps) tr_steps,',
'    -- tr_pulse_avg,',
'    -- tr_pulse_min,',
'    -- tr_pulse_max,',
'    -- tr_descr,',
'    -- tr_img1,',
'    -- tr_img2,',
'    -- real_distance,',
'    -- real_step_length,',
'    -- real_speed',
unistr('    ''\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0433\0430\0434\0436\0435\0442\0443, \043A\043C'' series_name'),
'FROM',
'    rehab_trainings',
'where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAI'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(tr_start, ''dd'')',
'order by tr_start'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'TR_DISTANCE_LENGTH'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54685750469388107)
,p_chart_id=>wwv_flow_imp.id(54685370112388103)
,p_static_id=>'disnatcereal'
,p_seq=>20
,p_name=>'DisnatceReal'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- tr_id,',
'    -- tr_type,',
'    -- tr_pat_id,',
'     trunc(tr_start, ''dd'') tr_start,',
'    -- tr_end,',
'    -- sum(tr_distance_length) tr_distance_length,',
'    -- sum(tr_steps) tr_steps,',
'    -- tr_pulse_avg,',
'    -- tr_pulse_min,',
'    -- tr_pulse_max,',
'    -- tr_descr,',
'    -- tr_img1,',
'    -- tr_img2,',
'    sum(real_distance) real_distance,',
'    -- real_step_length,',
'    -- real_speed',
unistr('    ''\0414\0438\0441\0442\0430\043D\0446\0456\044F \0440\0435\0430\043B\044C\043D\0430, \043A\043C'' series_name'),
'FROM',
'    rehab_trainings',
'where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAI'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(tr_start, ''dd'')',
'order by tr_start'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'REAL_DISTANCE'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54685529471388105)
,p_chart_id=>wwv_flow_imp.id(54685370112388103)
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
 p_id=>wwv_flow_imp.id(54685678565388106)
,p_chart_id=>wwv_flow_imp.id(54685370112388103)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>3
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54685835637388108)
,p_plug_name=>'SmallChart3'
,p_static_id=>'smallchart3'
,p_title=>unistr('\0428\0432\0438\0434\043A\0456\0441\0442\044C')
,p_parent_plug_id=>wwv_flow_imp.id(54685120764388101)
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
 p_id=>wwv_flow_imp.id(54685932904388109)
,p_region_id=>wwv_flow_imp.id(54685835637388108)
,p_chart_type=>'line'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'200'
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
 p_id=>wwv_flow_imp.id(54686068237388110)
,p_chart_id=>wwv_flow_imp.id(54685932904388109)
,p_static_id=>'disnatce'
,p_seq=>10
,p_name=>'Disnatce'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- tr_id,',
'    -- tr_type,',
'    -- tr_pat_id,',
'     trunc(tr_start, ''dd'') tr_start,',
'    -- tr_end,',
'    -- sum(tr_distance_length) tr_distance_length,',
'    -- sum(tr_steps) tr_steps,',
'    -- tr_pulse_avg,',
'    -- tr_pulse_min,',
'    -- tr_pulse_max,',
'    -- tr_descr,',
'    -- tr_img1,',
'    -- tr_img2,',
'    -- real_distance,',
'    -- real_step_length,',
'    avg(real_speed) real_speed,',
unistr('    ''\0428\0432\0438\0434\043A\0456\0441\0442\044C, \043A\043C/\0433\043E\0434'' series_name'),
'FROM',
'    rehab_trainings',
'where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAI'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(tr_start, ''dd'')',
'order by tr_start'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'REAL_SPEED'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54686108031388111)
,p_chart_id=>wwv_flow_imp.id(54685932904388109)
,p_static_id=>'disnatcereal'
,p_seq=>20
,p_name=>'DisnatceReal'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- tr_id,',
'    -- tr_type,',
'    -- tr_pat_id,',
'     trunc(tr_start, ''dd'') tr_start,',
'    -- tr_end,',
'    -- sum(tr_distance_length) tr_distance_length,',
'    -- sum(tr_steps) tr_steps,',
'    -- tr_pulse_avg,',
'    -- tr_pulse_min,',
'    -- tr_pulse_max,',
'    -- tr_descr,',
'    -- tr_img1,',
'    -- tr_img2,',
'    -- sum(real_distance) real_distance,',
'    avg(real_step_length) real_step_length,',
'    -- real_speed',
unistr('    ''\0414\043E\0432\0436\0438\043D\0430 \043A\0440\043E\043A\0443, \043C'' series_name'),
'FROM',
'    rehab_trainings',
'where tr_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(TR_START) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_TRAI'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
'group by trunc(tr_start, ''dd'')',
'order by tr_start'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'REAL_STEP_LENGTH'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54686299481388112)
,p_chart_id=>wwv_flow_imp.id(54685932904388109)
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
 p_id=>wwv_flow_imp.id(54686341519388113)
,p_chart_id=>wwv_flow_imp.id(54685932904388109)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>3
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54856939458705611)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(51855047526079129)
,p_button_name=>'CreateNew'
,p_static_id=>'createnew'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438 \043D\043E\0432\0438\0439 \0437\0430\043F\0438\0441')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.::P212_TR_ID:'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-clipboard-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp.component_end;
end;
/
