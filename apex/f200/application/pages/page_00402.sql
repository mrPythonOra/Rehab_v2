prompt --application/pages/page_00402
begin
--   Manifest
--     PAGE: 00402
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
 p_id=>402
,p_name=>'Prescriptor'
,p_alias=>'PRESCRIPTOR1'
,p_step_title=>'&P402_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56493646728899680)
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
 p_id=>wwv_flow_imp.id(56470562677627427)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(61095538974189522)
,p_plug_name=>'Details'
,p_static_id=>'details'
,p_title=>unistr('\0414\0435\0442\0430\043B\0456 \043F\0440\0438\0439\043E\043C\0443')
,p_parent_plug_id=>wwv_flow_imp.id(61096464024189531)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTIONS_DETAILS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P402_PRD_ID_CURR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56470421749627426)
,p_plug_name=>'Prescription'
,p_static_id=>'meds'
,p_title=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438')
,p_parent_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTIONS'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
''))
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P402_PR_ID_CURR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56472053796627442)
,p_plug_name=>'Prescriptions'
,p_static_id=>'new'
,p_title=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438')
,p_parent_plug_id=>wwv_flow_imp.id(56470562677627427)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PR_ID,',
'       (select WS_NAME from REHAB_WORKING_SUBSTANCE where WS_ID = PR_WS_ID) WS_NAME,',
'       PR_DR_ID,',
'       PR_PAT_ID,',
'       PR_PRR_ID,',
'       PR_PLANNED_START,',
'       PR_PLANNED_END,',
'       PR_NOTES,',
'       decode(PR_ID,:P402_PR_ID_CURR,1,0) PR_ID_CURR',
'  from REHAB_PRESCRIPTIONS',
' where PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and PR_PRR_ID = :P402_PRR_ID',
'order by WS_NAME,PR_PLANNED_START'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438')
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
 p_id=>wwv_flow_imp.id(61134913501437915)
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:402:&SESSION.::&DEBUG.::P402_PR_ID,P402_PRR_ID,P402_PR_ID_CURR,P402_PRATR_ID_CURR,P402_PRD_ID_CURR:#PR_ID#,#PR_PRR_ID#,#PR_ID#,,'
,p_internal_uid=>61134913501437915
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135222109437918)
,p_db_column_name=>'PR_DR_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(56486046497734841)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135055042437916)
,p_db_column_name=>'PR_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Pr Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61136072909437926)
,p_db_column_name=>'PR_ID_CURR'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('\041F\043E\0442\043E\0447\043D\0438\0439 \0440\044F\0434\043E\043A')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135736338437923)
,p_db_column_name=>'PR_NOTES'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\041D\043E\0442\0430\0442\043A\0438')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135376375437919)
,p_db_column_name=>'PR_PAT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Pr Pat Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135609610437922)
,p_db_column_name=>'PR_PLANNED_END'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135509801437921)
,p_db_column_name=>'PR_PLANNED_START'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135412236437920)
,p_db_column_name=>'PR_PRR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pr Prr Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61135152899437917)
,p_db_column_name=>'WS_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(61176410313683504)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PR_ID:WS_NAME:PR_DR_ID:PR_PAT_ID:PR_PRR_ID:PR_PLANNED_START:PR_PLANNED_END:PR_NOTES'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(61194400888838908)
,p_report_id=>wwv_flow_imp.id(61176410313683504)
,p_static_id=>'ir-condition'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'PR_ID_CURR'
,p_operator=>'='
,p_expr=>'1'
,p_condition_sql=>' (case when ("PR_ID_CURR" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_font_color=>'#27ea00'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56494378122899829)
,p_plug_name=>'Prescriptor'
,p_static_id=>'prescriptor'
,p_title=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_parent_plug_id=>wwv_flow_imp.id(56470562677627427)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTORS'
,p_query_where=>'PRR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61094799122189514)
,p_plug_name=>'TimeRange'
,p_static_id=>'timerange'
,p_title=>unistr('\0424\0430\043A\0442\0438\0447\043D\0438\0439 \043F\0435\0440\0456\043E\0434 ')
,p_parent_plug_id=>wwv_flow_imp.id(61096464024189531)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P402_PRATR_ID_CURR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61096464024189531)
,p_plug_name=>'TimeRanges1'
,p_static_id=>'timeranges_1'
,p_title=>unistr('\041F\0435\0440\0456\043E\0434\0438 \043F\0440\0438\0439\043E\043C\0443')
,p_parent_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRATR_ACTUAL_START,',
'       PRATR_ACTUAL_END,',
'       PRATR_NOTES,',
'       PRATR_ID,',
'       decode(PRATR_ID,:P402_PRATR_ID_CURR,1,0) PRATR_ID_CURR,',
'       PRATR_PR_ID, PR_PRR_ID,',
'       --PRATR_CP_ID,',
'       PRD_ID,',
'       decode(PRD_ID,:P402_PRD_ID_CURR,1,0) PRD_ID_CURR,',
'       --PRD_PRATR_ID,',
'       --PRD_CPTR_ID,',
'       PRD_DR_ID,',
'       PRD_DOSAGE,',
'       PRD_SORT_ORDER,',
'       PRD_NOTES,',
'       --CPTR_ID, ',
'       --CPTR_CP_ID, ',
'       CPTR_NAME, ',
'       CPTR_START_TIME_STR, ',
'       CPTR_END_TIME_STR--,',
'       --CP_NAME',
'  from REHAB_PRESCRIPTIONS,',
'       REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, ',
'       REHAB_PRESCRIPTIONS_DETAILS, ',
'       REHAB_CONSUME_TIME_RANGES--, ',
'       --REHAB_CONSUME_PATTERNS',
' where PRATR_PR_ID = :P402_PR_ID ',
'   and PR_ID = PRATR_PR_ID ',
'   and PRD_PRATR_ID = PRATR_ID ',
'   and PRD_CPTR_ID = CPTR_ID',
'   -- and PRATR_CP_ID = CP_ID '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P402_PR_ID_CURR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('\041F\0435\0440\0456\043E\0434\0438 \043F\0440\0438\0439\043E\043C\0443')
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
 p_id=>wwv_flow_imp.id(61097811857189545)
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:402:&SESSION.::&DEBUG.::P402_PRATR_ID_CURR,P402_PRD_ID_CURR,P402_PR_ID,P402_PRR_ID,P402_PRD_ID,P402_PRATR_ID:#PRATR_ID#,#PRD_ID#,#PRATR_PR_ID#,#PR_PRR_ID#,#PRD_ID#,#PRATR_ID#'
,p_internal_uid=>61097811857189545
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61134117712437907)
,p_db_column_name=>'CPTR_END_TIME_STR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('\0417\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61133934748437905)
,p_db_column_name=>'CPTR_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\0427\0430\0441 \043F\0440\0438\0439\043E\043C\0443')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61134060747437906)
,p_db_column_name=>'CPTR_START_TIME_STR'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\041F\043E\0447\0430\0442\043E\043A')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61098041545189547)
,p_db_column_name=>'PRATR_ACTUAL_END'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\0417\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61097936958189546)
,p_db_column_name=>'PRATR_ACTUAL_START'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('\0424\0430\043A\0442\0438\0447\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61098272555189549)
,p_db_column_name=>'PRATR_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Pratr Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61134579297437911)
,p_db_column_name=>'PRATR_ID_CURR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('\041F\043E\0442\043E\0447\043D\0438\0439 \0440\044F\0434\043E\043A')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61098193411189548)
,p_db_column_name=>'PRATR_NOTES'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\041D\043E\0442\0430\0442\043A\0438 \043F\0435\0440\0456\043E\0434\0443')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61134705496437913)
,p_db_column_name=>'PRATR_PR_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Pratr Pr Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61133678710437902)
,p_db_column_name=>'PRD_DOSAGE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\0414\043E\0437\0443\0432\0430\043D\043D\044F, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61133549146437901)
,p_db_column_name=>'PRD_DR_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(56486046497734841)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61098340637189550)
,p_db_column_name=>'PRD_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Prd Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61134678020437912)
,p_db_column_name=>'PRD_ID_CURR'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('\041F\043E\0442\043E\0447\043D\0438\0439 \0440\044F\0434\043E\043A 1')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61133839879437904)
,p_db_column_name=>'PRD_NOTES'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\041D\043E\0442\0430\0442\043A\0438 \043F\0440\0438\0439\043E\043C\0443')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61133750831437903)
,p_db_column_name=>'PRD_SORT_ORDER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\0421\043E\0440\0442\0443\0432\0430\043D\043D\044F')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61134872798437914)
,p_db_column_name=>'PR_PRR_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Pr Prr Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(61143541411438880)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRATR_ACTUAL_START:PRATR_ACTUAL_END:PRATR_NOTES:PRD_ID:PRD_DR_ID:PRD_DOSAGE:PRD_SORT_ORDER:PRD_NOTES:CPTR_NAME:CPTR_START_TIME_STR:CPTR_END_TIME_STR'
,p_break_on=>'PRATR_ACTUAL_START:PRATR_ACTUAL_END:PRD_DR_ID'
,p_break_enabled_on=>'PRATR_ACTUAL_START:PRATR_ACTUAL_END:PRD_DR_ID'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(61147147887524002)
,p_report_id=>wwv_flow_imp.id(61143541411438880)
,p_static_id=>'ir-condition'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'PRD_ID_CURR'
,p_operator=>'='
,p_expr=>'1'
,p_condition_sql=>' (case when ("PRD_ID_CURR" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_font_color=>'#27ea00'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56502751549899878)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'CANCEL1'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:401:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58055690472597005)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_button_name=>'CANCEL2'
,p_static_id=>'cancel_1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:401:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56504064663899884)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'CREATE1'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438')
,p_button_position=>'CREATE'
,p_button_condition=>'P402_PRR_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58056072562597009)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_button_name=>'CREATE2'
,p_static_id=>'create2'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56503221082899881)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'DELETE1'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_confirm_style=>'danger'
,p_button_condition=>'P402_PRR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58055948989597008)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_button_name=>'DELETE2'
,p_static_id=>'delete2'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_confirm_style=>'danger'
,p_button_condition=>'P402_PR_ID_CURR'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56513131401006190)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview1'
,p_static_id=>'preview1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 1')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE1,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE1 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56469828114627420)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview2'
,p_static_id=>'preview2'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 2')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE2,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE2 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56469926404627421)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview3'
,p_static_id=>'preview3'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 3')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE3,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE3 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56470085725627422)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview4'
,p_static_id=>'preview4'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 4')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE4,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE4 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56470167959627423)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview5'
,p_static_id=>'preview5'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 5')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE5,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE5 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56503602862899883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'SAVE1'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CHANGE'
,p_button_condition=>'P402_PRR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58055842230597007)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_button_name=>'SAVE2'
,p_static_id=>'save2'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P402_PR_ID_CURR'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(56504408598899885)
,p_branch_action=>'f?p=&APP_ID.:401:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(56503221082899881)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56470676335627428)
,p_name=>'P402_FILTERED_DRUGS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0412\0438\0431\0440\0430\043D\0456 \043B\0456\043A\0438')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.dr_name d, d.dr_id r',
'from REHAB_DRUGS d',
'order by 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'no_data_found_message', unistr('\0414\0430\043D\0456 \0432\0456\0434\0441\0443\0442\043D\0456'),
  'use_cache', 'Y',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095375633189520)
,p_name=>'P402_PRATR_ACTUAL_END'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_item_source_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_prompt=>unistr('\0424\0430\043A\0442\0438\0447\043D\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_source=>'PRATR_ACTUAL_END'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095296510189519)
,p_name=>'P402_PRATR_ACTUAL_START'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_item_source_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_prompt=>unistr('\0424\0430\043A\0442\0438\0447\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A')
,p_source=>'PRATR_ACTUAL_START'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095140725189518)
,p_name=>'P402_PRATR_CP_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_item_source_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_prompt=>unistr('\0421\043F\043E\0441\0456\0431 \0441\043F\043E\0436\0438\0432\0430\043D\043D\044F')
,p_source=>'PRATR_CP_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_CONSUME_PATTERNS_AVAILABLE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61094935708189516)
,p_name=>'P402_PRATR_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_item_source_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_source=>'PRATR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61134344590437909)
,p_name=>'P402_PRATR_ID_CURR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61096464024189531)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095413062189521)
,p_name=>'P402_PRATR_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_item_source_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_prompt=>unistr('\041D\043E\0442\0430\0442\043A\0438')
,p_source=>'PRATR_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>512
,p_cHeight=>2
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095005563189517)
,p_name=>'P402_PRATR_PR_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_item_source_plug_id=>wwv_flow_imp.id(61094799122189514)
,p_source=>'PRATR_PR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095929475189526)
,p_name=>'P402_PRD_CPTR_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_prompt=>unistr('\041F\0435\0440\0456\043E\0434 \043F\0440\0438\0439\043E\043C\0443')
,p_source=>'PRD_CPTR_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_CONSUME_TIME_RANGES_AVAILABLE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61096103474189528)
,p_name=>'P402_PRD_DOSAGE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_prompt=>unistr('\0414\043E\0437\0443\0432\0430\043D\043D\044F, \043C\0433')
,p_source=>'PRD_DOSAGE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61096021096189527)
,p_name=>'P402_PRD_DR_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_prompt=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442')
,p_source=>'PRD_DR_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_DRUGS.DR_NAME'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095724341189524)
,p_name=>'P402_PRD_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_source=>'PRD_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61134470185437910)
,p_name=>'P402_PRD_ID_CURR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61096464024189531)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61096340581189530)
,p_name=>'P402_PRD_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_prompt=>unistr('\041D\043E\0442\0430\0442\043A\0438')
,p_source=>'PRD_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>512
,p_cHeight=>2
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61095886579189525)
,p_name=>'P402_PRD_PRATR_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_source=>'PRD_PRATR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61096229059189529)
,p_name=>'P402_PRD_SORT_ORDER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_item_source_plug_id=>wwv_flow_imp.id(61095538974189522)
,p_prompt=>unistr('\0421\043E\0440\0442\0443\0432\0430\043D\043D\044F')
,p_source=>'PRD_SORT_ORDER'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56497065005899858)
,p_name=>'P402_PRR_FULL_TEXT'
,p_source_data_type=>'CLOB'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0422\0435\043A\0441\0442 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'PRR_FULL_TEXT'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56494633221899831)
,p_name=>'P402_PRR_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>'New'
,p_source=>'PRR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56497481559899859)
,p_name=>'P402_PRR_PAGE1'
,p_source_data_type=>'BLOB'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 1')
,p_source=>'PRR_PAGE1'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56497844230899861)
,p_name=>'P402_PRR_PAGE2'
,p_source_data_type=>'BLOB'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 2')
,p_source=>'PRR_PAGE2'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56498227425899862)
,p_name=>'P402_PRR_PAGE3'
,p_source_data_type=>'BLOB'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 3')
,p_source=>'PRR_PAGE3'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56498674796899864)
,p_name=>'P402_PRR_PAGE4'
,p_source_data_type=>'BLOB'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 4')
,p_source=>'PRR_PAGE4'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56499045220899865)
,p_name=>'P402_PRR_PAGE5'
,p_source_data_type=>'BLOB'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 5')
,p_source=>'PRR_PAGE5'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56496605417899856)
,p_name=>'P402_PRR_PAT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442')
,p_source=>'PRR_PAT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PATIENTS.PAT_NAME'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56496209986899851)
,p_name=>'P402_PRR_PRESCRIPTED_BY_FULL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041A\0438\043C \043F\0440\0438\0437\043D\0430\0447\0435\043D\043E, \043F\043E\0432\043D\0438\0439 \0442\0435\043A\0441\0442')
,p_source=>'PRR_PRESCRIPTED_BY_FULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>2
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56495042014899841)
,p_name=>'P402_PRR_PRESCRIPTED_BY_SHORT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041A\0438\043C \043F\0440\0438\0437\043D\0430\0447\0435\043D\043E')
,p_source=>'PRR_PRESCRIPTED_BY_SHORT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56495464154899846)
,p_name=>'P402_PRR_PRESCRIPTED_WHEN'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041A\043E\043B\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043E')
,p_format_mask=>'&APP_DTFMT_SHORT_T.'
,p_source=>'PRR_PRESCRIPTED_WHEN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'SELECTABLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'FOCUS',
  'show_time', 'Y',
  'time_increment', '5',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471445708627436)
,p_name=>'P402_PR_DR_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_prompt=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_source=>'PR_DR_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dr_name||'' (''||DR_TYPE_SHORT||'')'' d, dr_id r ',
'from REHAB_DRUGS',
'where ',
'dr_id in (select PRRF_DR_ID from REHAB_PRESCRIPTOR2DRUG_FLTS where PRRF_PRR_ID = :P402_PRR_ID)',
'or       (select count(PRRF_DR_ID) from REHAB_PRESCRIPTOR2DRUG_FLTS where PRRF_PRR_ID = :P402_PRR_ID)=0'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471213700627434)
,p_name=>'P402_PR_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_source=>'PR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61135845570437924)
,p_name=>'P402_PR_ID_CURR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(56472053796627442)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471947055627441)
,p_name=>'P402_PR_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_prompt=>unistr('\041D\043E\0442\0430\0442\043A\0438')
,p_source=>'PR_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>512
,p_cHeight=>2
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471535670627437)
,p_name=>'P402_PR_PAT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_source=>'PR_PAT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471833997627440)
,p_name=>'P402_PR_PLANNED_END'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_prompt=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F \043F\0440\0438\0439\043E\043C\0443 (\043C\043E\0436\0435 \0431\0443\0442\0438 \043F\0443\0441\0442\0438\043C)')
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_source=>'PR_PLANNED_END'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471710499627439)
,p_name=>'P402_PR_PLANNED_START'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_prompt=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A \043F\0440\0438\0439\043E\043C\0443')
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_source=>'PR_PLANNED_START'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471638937627438)
,p_name=>'P402_PR_PRR_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_source=>'PR_PRR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56471311067627435)
,p_name=>'P402_PR_WS_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_prompt=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_source=>'PR_WS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_WORKING_SUBSTANCE.WS_NAME'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56469775818627419)
,p_name=>'P402_TITLE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(58058700632597036)
,p_validation_name=>'P402_PR_PLANNED_START not null 1'
,p_static_id=>'new'
,p_validation_sequence=>40
,p_validation=>':P402_PR_PLANNED_START is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A \043F\0440\0438\0439\043E\043C\0443 \043C\0430\0454 \0431\0443\0442\0438 \0437\0430\043F\043E\0432\043D\0435\043D\0438\0439')
,p_when_button_pressed=>wwv_flow_imp.id(58056072562597009)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(58058858949597037)
,p_validation_name=>'P402_PR_PLANNED_START not null 2'
,p_static_id=>'p402-pr-planned-start-not-null-2'
,p_validation_sequence=>50
,p_validation=>':P402_PR_PLANNED_START is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A \043F\0440\0438\0439\043E\043C\0443 \043C\0430\0454 \0431\0443\0442\0438 \0437\0430\043F\043E\0432\043D\0435\043D\0438\0439')
,p_when_button_pressed=>wwv_flow_imp.id(58055842230597007)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(56495855872899848)
,p_validation_name=>'P402_PRR_PRESCRIPTED_WHEN must be timestamp'
,p_static_id=>'p402-prr-prescripted-when-must-be-timestamp'
,p_validation_sequence=>20
,p_validation=>'P402_PRR_PRESCRIPTED_WHEN'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(56495464154899846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(58058383250597032)
,p_validation_name=>'WS and DR one most be not null but not both'
,p_static_id=>'ws-and-dr-one-most-be-not-null-but-not-both'
,p_validation_sequence=>30
,p_validation=>'((:P402_PR_WS_ID is null and :P402_PR_DR_ID is not null) or (:P402_PR_WS_ID is not null and :P402_PR_DR_ID is null)) and not (:P402_PR_WS_ID is not null and :P402_PR_DR_ID is not null)'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\041C\0430\0454 \0431\0443\0442\0438 \0437\0430\043F\043E\0432\043D\0435\043D\0438\043C \0442\0456\043B\044C\043A\0438 \043E\0434\0438\043D: \0434\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430 \0430\0431\043E \043C\0435\0434\0456\043A\0430\043C\0435\043D\0442')
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58058632694597035)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Before New Prescription'
,p_static_id=>'before-new-prescription'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P402_PR_ID := SQ_REHAB_PRESCRIPTIONS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(58056072562597009)
,p_internal_uid=>58058632694597035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56471057075627432)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Before Delete Prescriptor'
,p_static_id=>'beforedelete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_PRESCRIPTIONS_PKG.delete_prescriptor(:P402_PRR_ID);',
'  :P402_FILTERED_DRUGS := null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56503221082899881)
,p_internal_uid=>56471057075627432
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56519164580182019)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Before New Prescriptor'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P402_PRR_ID := SQ_REHAB_PRESCRIPTORS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56504064663899884)
,p_internal_uid=>56519164580182019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56518576143178771)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetTitle'
,p_static_id=>'gettitle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('  if :P402_PRR_ID is null then :P402_TITLE := ''\0421\0442\0432\043E\0440\0438\0442\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F''; else :P402_TITLE := ''\0420\0435\0434\0430\0433\0443\0432\0430\0442\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F''; end if;'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>56518576143178771
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56470786248627429)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P402_FILTERED_DRUGS := null;',
'  if :P402_PRR_ID is not null then',
'    select listagg(f.PRRF_DR_ID, '':'') within group (order by f.PRRF_DR_ID)',
'    into :P402_FILTERED_DRUGS',
'    from REHAB_PRESCRIPTOR2DRUG_FLTS f',
'    where PRRF_PRR_ID = :P402_PRR_ID;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>56470786248627429
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56504890026899887)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Prescriptor'
,p_static_id=>'initialize-form-prescriptor'
,p_internal_uid=>56504890026899887
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56471172751627433)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(56470421749627426)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Prescription'
,p_static_id=>'initialize-form-prescriptor_1'
,p_internal_uid=>56471172751627433
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(61094805033189515)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(61094799122189514)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Prescriptor'
,p_static_id=>'initialize-form-prescriptor_2'
,p_internal_uid=>61094805033189515
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(61095649745189523)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(61095538974189522)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Prescriptor'
,p_static_id=>'initialize-form-prescriptor_3'
,p_internal_uid=>61095649745189523
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56518802064180130)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitNew'
,p_static_id=>'initnew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P402_PRR_PRESCRIPTED_WHEN := to_char(systimestamp at time zone SESSIONTIMEZONE,:APP_DTFMT_SHORT_T);',
'  :P402_PRR_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P402_PRR_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>56518802064180130
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58058418862597033)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Prescription Create'
,p_static_id=>'prescription-create'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_PRESCRIPTIONS_PKG.insert_PRESCRIPTION ( ',
'    P_PR_ID => :P402_PR_ID,',
'    P_PR_DR_ID => :P402_PR_DR_ID,',
'    p_PR_WS_ID => :P402_PR_WS_ID,',
'    p_PR_PAT_ID => REHAB_CONTEXT_PKG.getPATIENT(), -- :P402_PR_PAT_ID',
'    p_PR_PRR_ID => :P402_PRR_ID,',
'    P_PR_NOTES => :P402_PR_NOTES,',
'    P_PR_PLANNED_START => :P402_PR_PLANNED_START,',
'    P_PR_PLANNED_END => :P402_PR_PLANNED_END,',
'    p_ts_format => :APP_DTFMT_DATE) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(58056072562597009)
,p_process_success_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>58058418862597033
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58058547754597034)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Prescription Delete'
,p_static_id=>'prescription-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_PRESCRIPTIONS_PKG.delete_PRESCRIPTION ( ',
'    P_PR_ID => :P402_PR_ID) ; ',
'  :P402_PR_ID := null; ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(58055948989597008)
,p_process_success_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 \0432\0438\0434\0430\043B\0435\043D\043E')
,p_internal_uid=>58058547754597034
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58055795525597006)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Prescription Save'
,p_static_id=>'process-form-prescriptionsave'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_PRESCRIPTIONS_PKG.update_PRESCRIPTION ( ',
'    P_PR_ID => :P402_PR_ID,',
'    P_PR_DR_ID => :P402_PR_DR_ID,',
'    p_PR_WS_ID => :P402_PR_WS_ID,',
'    P_PR_NOTES => :P402_PR_NOTES,',
'    P_PR_PLANNED_START => :P402_PR_PLANNED_START,',
'    P_PR_PLANNED_END => :P402_PR_PLANNED_END,',
'    p_ts_format => :APP_DTFMT_DATE) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(58055842230597007)
,p_process_success_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>58055795525597006
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56505220295899890)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Prescriptor Create'
,p_static_id=>'process-form-prescriptor'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56504064663899884)
,p_process_success_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>56505220295899890
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58055459432597003)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Prescriptor Del'
,p_static_id=>'process-form-prescriptordel'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56503221082899881)
,p_process_success_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \0432\0438\0434\0430\043B\0435\043D\043E')
,p_internal_uid=>58055459432597003
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58055397450597002)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Prescriptor Save'
,p_static_id=>'process-form-prescriptorsave'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56503602862899883)
,p_process_success_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>58055397450597002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56470810473627430)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Filtered Drugs Create'
,p_static_id=>'savefiltereddrugs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  delete from REHAB_PRESCRIPTOR2DRUG_FLTS where PRRF_PRR_ID = :P402_PRR_ID;',
'  insert into REHAB_PRESCRIPTOR2DRUG_FLTS (PRRF_PRR_ID, PRRF_DR_ID, PRRF_WS_ID)',
'    select :P402_PRR_ID, column_value, DR_WS_ID from apex_string.split(p_str => :P402_FILTERED_DRUGS, p_sep => '':''), REHAB_DRUGS d',
'    where column_value = d.DR_ID;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56504064663899884)
,p_internal_uid=>56470810473627430
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58055581069597004)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Filtered Drugs Save'
,p_static_id=>'savefiltereddrugssave'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  delete from REHAB_PRESCRIPTOR2DRUG_FLTS where PRRF_PRR_ID = :P402_PRR_ID;',
'  insert into REHAB_PRESCRIPTOR2DRUG_FLTS (PRRF_PRR_ID, PRRF_DR_ID, PRRF_WS_ID)',
'    select :P402_PRR_ID, column_value, DR_WS_ID from apex_string.split(p_str => :P402_FILTERED_DRUGS, p_sep => '':''), REHAB_DRUGS d',
'    where column_value = d.DR_ID;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56503602862899883)
,p_internal_uid=>58055581069597004
);
wwv_flow_imp.component_end;
end;
/
