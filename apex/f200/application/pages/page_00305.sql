prompt --application/pages/page_00305
begin
--   Manifest
--     PAGE: 00305
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
 p_id=>305
,p_name=>'Expences'
,p_alias=>'EXPENCES'
,p_step_title=>unistr('\0412\0438\0442\0440\0430\0442\0438')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(73129148366751497)
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
 p_id=>wwv_flow_imp.id(73129800077751737)
,p_plug_name=>'Expences'
,p_static_id=>'expences'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       DS_NAME,',
'       DA_PURCHASED,',
'       trunc(DA_PURCHASED,''dd'') DA_PURCHASED_DAY,',
'       trunc(DA_PURCHASED,''IW'') DA_PURCHASED_WEEK,',
'       trunc(DA_PURCHASED,''MM'') DA_PURCHASED_MONTH,',
'       trunc(DA_PURCHASED,''YYYY'') DA_PURCHASED_YEAR,',
'       DR_NAME || ''('' || DR_TYPE_SHORT || '')'' DR_NAME, WS_NAME, ',
'       PRR_PRESCRIPTED_BY_SHORT|| ''('' || to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'') || '')'' PRR_PRESCRIPTED_BY_SHORT,',
'       DA_COST',
'  from REHAB_DRUG_ACCOUNTINGS, REHAB_DRUG_STORAGES, REHAB_PATIENT2STORAGES, REHAB_DRUGS, REHAB_WORKING_SUBSTANCE, REHAB_PRESCRIPTORS',
'  where DA_DS_ID = DS_ID and DS_ID = P2S_DS_ID and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'    and DA_DR_ID = DR_ID and DR_WS_ID = WS_ID(+)',
'    and DA_PRR_ID = PRR_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(73129988424751737)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>73129988424751737
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73057005459651249)
,p_db_column_name=>'DA_COST'
,p_display_order=>122
,p_column_identifier=>'Z'
,p_column_label=>unistr('\0421\043F\043B\0430\0447\0435\043D\043E, \0433\0440\043D')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73136981664751962)
,p_db_column_name=>'DA_PURCHASED'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_MON_T.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056065575651239)
,p_db_column_name=>'DA_PURCHASED_DAY'
,p_display_order=>32
,p_column_identifier=>'P'
,p_column_label=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E \0434\0435\043D\044C')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056295306651241)
,p_db_column_name=>'DA_PURCHASED_MONTH'
,p_display_order=>52
,p_column_identifier=>'R'
,p_column_label=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E \043C\0456\0441\044F\0446\044C')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056171149651240)
,p_db_column_name=>'DA_PURCHASED_WEEK'
,p_display_order=>42
,p_column_identifier=>'Q'
,p_column_label=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E \0442\0438\0436\0434\0435\043D\044C')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056382719651242)
,p_db_column_name=>'DA_PURCHASED_YEAR'
,p_display_order=>62
,p_column_identifier=>'S'
,p_column_label=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E \0440\0456\043A')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056426859651243)
,p_db_column_name=>'DR_NAME'
,p_display_order=>72
,p_column_identifier=>'T'
,p_column_label=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73055915042651238)
,p_db_column_name=>'DS_NAME'
,p_display_order=>22
,p_column_identifier=>'O'
,p_column_label=>unistr('\0421\043A\0440\0438\043D\044F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056806168651247)
,p_db_column_name=>'PRR_PRESCRIPTED_BY_SHORT'
,p_display_order=>102
,p_column_identifier=>'X'
,p_column_label=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73056794113651246)
,p_db_column_name=>'WS_NAME'
,p_display_order=>92
,p_column_identifier=>'W'
,p_column_label=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(73144487174781906)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DA_PURCHASED:DS_NAME:DA_PURCHASED_DAY:DA_PURCHASED_WEEK:DA_PURCHASED_MONTH:DA_PURCHASED_YEAR:DR_NAME:DA_COST:PRR_PRESCRIPTED_BY_SHORT:WS_NAME'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(73154291492843238)
,p_report_id=>wwv_flow_imp.id(73144487174781906)
,p_group_by_columns=>'DA_PURCHASED_MONTH'
,p_function_01=>'SUM'
,p_function_column_01=>'DA_COST'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'N'
,p_sort_column_01=>'DA_PURCHASED_MONTH'
,p_sort_direction_01=>'DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(73154671629851609)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>unistr('\041F\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F\043C')
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>unistr('\043F\043E-\043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F\043C')
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DA_PURCHASED:DS_NAME:DA_PURCHASED_DAY:DA_PURCHASED_WEEK:DA_PURCHASED_MONTH:DA_PURCHASED_YEAR:DR_NAME:DA_COST:PRR_PRESCRIPTED_BY_SHORT:WS_NAME'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(73154969336851611)
,p_report_id=>wwv_flow_imp.id(73154671629851609)
,p_group_by_columns=>'PRR_PRESCRIPTED_BY_SHORT'
,p_function_01=>'SUM'
,p_function_column_01=>'DA_COST'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'N'
,p_sort_column_01=>'DA_PURCHASED_MONTH'
,p_sort_direction_01=>'DESC'
);
wwv_flow_imp.component_end;
end;
/
