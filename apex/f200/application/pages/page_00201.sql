prompt --application/pages/page_00201
begin
--   Manifest
--     PAGE: 00201
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
 p_id=>201
,p_name=>'Measurements'
,p_alias=>'MEASUREMENTS'
,p_step_title=>unistr('\0412\0438\043C\0456\0440\044E\0432\0430\043D\043D\044F')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29459036441248125)
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
 p_id=>wwv_flow_imp.id(109387487319870668)
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
 p_id=>wwv_flow_imp.id(54686406553388114)
,p_plug_name=>'Measurements'
,p_static_id=>'measurements'
,p_title=>unistr('\0414\0430\043D\0456')
,p_parent_plug_id=>wwv_flow_imp.id(109387487319870668)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    mt_id,',
'    mt_pat_id,',
'    mt_taken, trunc(mt_taken,''dd'') mt_taken_d,',
unistr('    decode(mt_pressure_lr, ''L'', ''\041B\0456\0432\0430'', ''R'', ''\041F\0440\0430\0432\0430'') mt_pressure_lr,'),
'    mt_pressure_sys,',
'    mt_pressure_dia,',
'    mt_pulse,',
'    mt_temperature,',
'    mt_sugar,',
'    mt_oxigenation,',
'    mt_weight,',
'    mt_descr',
'  FROM',
'    rehab_measurements',
' where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'   and trunc(MT_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_MEAS'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()'))
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
 p_id=>wwv_flow_imp.id(54686567724388115)
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>54686567724388115
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687739941388127)
,p_db_column_name=>'MT_DESCR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('\041E\043F\0438\0441')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54686616332388116)
,p_db_column_name=>'MT_ID'
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
 p_id=>wwv_flow_imp.id(54687548104388125)
,p_db_column_name=>'MT_OXIGENATION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\0420\0456\0432\0435\043D\044C \043A\0438\0441\043D\044E')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54686756970388117)
,p_db_column_name=>'MT_PAT_ID'
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
 p_id=>wwv_flow_imp.id(54687199087388121)
,p_db_column_name=>'MT_PRESSURE_DIA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\0422\0438\0441\043A Dia')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54686986183388119)
,p_db_column_name=>'MT_PRESSURE_LR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\0420\0443\043A\0430 \0432\0438\043C\0456\0440\0443 \0442\0438\0441\043A\0443')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687028425388120)
,p_db_column_name=>'MT_PRESSURE_SYS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\0422\0438\0441\043A Sys')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687281241388122)
,p_db_column_name=>'MT_PULSE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\041F\0443\043B\044C\0441')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687420151388124)
,p_db_column_name=>'MT_SUGAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\0420\0456\0432\0435\043D\044C \0446\0443\043A\0440\0443')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54686806201388118)
,p_db_column_name=>'MT_TAKEN'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\0412\0438\043C\0456\0440\044F\043D\043E')
,p_column_link=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::P202_MT_ID:#MT_ID#'
,p_column_linktext=>'#MT_TAKEN#'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687898519388128)
,p_db_column_name=>'MT_TAKEN_D'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('\0414\0435\043D\044C \0432\0438\043C\0456\0440\0443')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687354531388123)
,p_db_column_name=>'MT_TEMPERATURE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\0422\0435\043C\043F\0435\0440\0430\0442\0443\0440\0430')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54687645178388126)
,p_db_column_name=>'MT_WEIGHT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\0412\0430\0433\0430, \043A\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(54720066091518388)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'MT_TAKEN_D:MT_TAKEN:MT_PRESSURE_LR:MT_PRESSURE_SYS:MT_PRESSURE_DIA:MT_PULSE:MT_WEIGHT'
,p_sort_column_1=>'MT_TAKEN_D'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'MT_TAKEN'
,p_sort_direction_2=>'DESC'
,p_break_on=>'MT_TAKEN_D'
,p_break_enabled_on=>'MT_TAKEN_D'
,p_avg_columns_on_break=>'MT_PRESSURE_SYS:MT_PRESSURE_DIA:MT_PULSE'
,p_count_columns_on_break=>'MT_TAKEN'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(106557351204561695)
,p_plug_name=>'SmallChart1'
,p_static_id=>'smallchart1'
,p_title=>unistr('\0422\0438\0441\043A')
,p_parent_plug_id=>wwv_flow_imp.id(109387487319870668)
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
 p_id=>wwv_flow_imp.id(54709206434482624)
,p_region_id=>wwv_flow_imp.id(106557351204561695)
,p_chart_type=>'range'
,p_title=>unistr('\041A\0440\043E\043A\0438')
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54687942562388129)
,p_chart_id=>wwv_flow_imp.id(54709206434482624)
,p_static_id=>'pulse'
,p_seq=>20
,p_name=>'Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- mt_id,',
'    -- mt_pat_id,',
'    to_char(trunc(mt_taken, ''dd''),''YYYY-MM-DD'') mt_taken,',
unistr('    -- decode(mt_pressure_lr, ''L'', ''\041B\0456\0432\0430'', ''R'', ''\041F\0440\0430\0432\0430'') mt_pressure_lr,'),
'    --avg(mt_pressure_sys) mt_pressure_sys,',
'    --avg(mt_pressure_dia) mt_pressure_dia,',
'    min(mt_pulse) mt_pulse_min,',
'    max(mt_pulse) mt_pulse_max,',
'    -- mt_temperature,',
'    -- mt_sugar,',
'    -- mt_oxigenation,',
'    -- mt_weight,',
'    -- mt_descr',
unistr('    ''\041F\0443\043B\044C\0441'' series_name'),
'  FROM',
'    rehab_measurements',
' where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'   and trunc(MT_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_MEAS'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
' group by trunc(mt_taken, ''dd'')',
'order by mt_taken'))
,p_series_type=>'barRange'
,p_series_name_column_name=>'SERIES_NAME'
,p_items_low_column_name=>'MT_PULSE_MIN'
,p_items_high_column_name=>'MT_PULSE_MAX'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54710983980482628)
,p_chart_id=>wwv_flow_imp.id(54709206434482624)
,p_static_id=>'steps'
,p_seq=>10
,p_name=>'Pressure'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- mt_id,',
'    -- mt_pat_id,',
'    to_char(trunc(mt_taken, ''dd''),''YYYY-MM-DD'') mt_taken,',
unistr('    -- decode(mt_pressure_lr, ''L'', ''\041B\0456\0432\0430'', ''R'', ''\041F\0440\0430\0432\0430'') mt_pressure_lr,'),
'    avg(mt_pressure_sys) mt_pressure_sys,',
'    avg(mt_pressure_dia) mt_pressure_dia,',
'    --avg(mt_pulse) mt_pulse,',
'    -- mt_temperature,',
'    -- mt_sugar,',
'    -- mt_oxigenation,',
'    -- mt_weight,',
'    -- mt_descr',
unistr('    ''\0422\0438\0441\043A'' series_name'),
'  FROM',
'    rehab_measurements',
' where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'   and trunc(MT_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_MEAS'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
' group by trunc(mt_taken, ''dd'')',
'order by mt_taken'))
,p_series_type=>'areaRange'
,p_series_name_column_name=>'SERIES_NAME'
,p_items_low_column_name=>'MT_PRESSURE_DIA'
,p_items_high_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54709727076482626)
,p_chart_id=>wwv_flow_imp.id(54709206434482624)
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
 p_id=>wwv_flow_imp.id(54710332514482627)
,p_chart_id=>wwv_flow_imp.id(54709206434482624)
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
 p_id=>wwv_flow_imp.id(109387610994870669)
,p_plug_name=>'SmallChart2'
,p_static_id=>'smallchart2'
,p_title=>unistr('\0412\0430\0433\0430')
,p_parent_plug_id=>wwv_flow_imp.id(109387487319870668)
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
 p_id=>wwv_flow_imp.id(54702998859482597)
,p_region_id=>wwv_flow_imp.id(109387610994870669)
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
 p_id=>wwv_flow_imp.id(54704507499482606)
,p_chart_id=>wwv_flow_imp.id(54702998859482597)
,p_static_id=>'disnatce'
,p_seq=>10
,p_name=>'Disnatce'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    -- mt_id,',
'    -- mt_pat_id,',
'    trunc(mt_taken, ''dd'') mt_taken,',
unistr('    -- decode(mt_pressure_lr, ''L'', ''\041B\0456\0432\0430'', ''R'', ''\041F\0440\0430\0432\0430'') mt_pressure_lr,'),
'    --avg(mt_pressure_sys) mt_pressure_sys,',
'    --avg(mt_pressure_dia) mt_pressure_dia,',
'    --min(mt_pulse) mt_pulse_min,',
'   --max(mt_pulse) mt_pulse_max,',
'    -- mt_temperature,',
'    -- mt_sugar,',
'    -- mt_oxigenation,',
'    avg(mt_weight) mt_weight,',
'    -- mt_descr',
unistr('    ''\0412\0430\0433\0430'' series_name'),
'  FROM',
'    rehab_measurements',
' where MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'   and trunc(MT_TAKEN) between REHAB_CONTEXT_PKG.getGLOBAL_DATE() - REHAB_CONFIG_PKG.get_config_par(''DBAGG_MEAS'') - 1 and REHAB_CONTEXT_PKG.getGLOBAL_DATE()',
' group by trunc(mt_taken, ''dd'')',
'order by mt_taken'))
,p_series_name_column_name=>'SERIES_NAME'
,p_items_value_column_name=>'MT_WEIGHT'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(54703466377482600)
,p_chart_id=>wwv_flow_imp.id(54702998859482597)
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
 p_id=>wwv_flow_imp.id(54704016124482603)
,p_chart_id=>wwv_flow_imp.id(54702998859482597)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>1
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54792138283080111)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(54686406553388114)
,p_button_name=>'CreateNew'
,p_static_id=>'new'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438 \043D\043E\0432\0438\0439 \0437\0430\043F\0438\0441')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::P202_MT_ID:'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-clipboard-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp.component_end;
end;
/
