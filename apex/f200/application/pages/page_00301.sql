prompt --application/pages/page_00301
begin
--   Manifest
--     PAGE: 00301
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
 p_id=>301
,p_name=>'Inventory'
,p_alias=>'INVENTORY'
,p_step_title=>unistr('\0417\0430\043F\0430\0441\0438')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29857675832894293)
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
 p_id=>wwv_flow_imp.id(44056290495422946)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44056329294422947)
,p_plug_name=>'Inventory'
,p_static_id=>'inventory'
,p_parent_plug_id=>wwv_flow_imp.id(44056290495422946)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT /*+ NO_RESULT_CACHE */',
'    pat_id,',
'    dr_id,',
'    da_stored_amount,',
'    dru_consumed,DRU_CONSUMED_BEFORE,--nvl(DRU_CONSUMED_TODAY,0)',
'    DRU_CONSUMED_TODAY,',
'    balance,',
'    round(days_planned) days_planned,',
'    round(prd_dosage_planned) prd_dosage_planned,',
'    daily_dose,',
'    days_remain,days_remain_from_tomorrow,',
'    dr_name,',
'    pratr_actual_end,',
'    pr_planned_end,',
'    end_date',
'FROM',
'    v$rehab_remains'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
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
 p_id=>wwv_flow_imp.id(44056407187422948)
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>44056407187422948
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852446093079103)
,p_db_column_name=>'BALANCE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\0411\0430\043B\0430\043D\0441, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852794011079106)
,p_db_column_name=>'DAILY_DOSE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\0414\0435\043D\043D\0430 \0434\043E\0437\0430')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852518729079104)
,p_db_column_name=>'DAYS_PLANNED'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\043E \0434\043D\0456\0432')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852855932079107)
,p_db_column_name=>'DAYS_REMAIN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\0417\0430\043B\0438\0448\0438\043B\043E\0441\044F \043D\0430 \0434\043D\0456\0432')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51853689659079115)
,p_db_column_name=>'DAYS_REMAIN_FROM_TOMORROW'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>unistr('\0417\0430\043B\0438\0448\0438\043B\043E\0441\044F \043D\0430 \0434\043D\0456\0432 \0456\0437 \0437\0430\0432\0442\0440\0430')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852258942079101)
,p_db_column_name=>'DA_STORED_AMOUNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\041D\0430 \0437\0431\0435\0440\0456\0433\0430\043D\043D\0456, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852319707079102)
,p_db_column_name=>'DRU_CONSUMED'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\0421\043F\043E\0436\0438\0442\043E, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51853420445079113)
,p_db_column_name=>'DRU_CONSUMED_BEFORE'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>unistr('\0421\043F\043E\0436\0438\0442\043E \0434\043E \0441\044C\043E\0433\043E\0434\043D\0456')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51853580044079114)
,p_db_column_name=>'DRU_CONSUMED_TODAY'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('\0421\043F\043E\0436\0438\0442\043E \0441\044C\043E\0433\0434\043D\0456')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44056675134422950)
,p_db_column_name=>'DR_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dr Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852950415079108)
,p_db_column_name=>'DR_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\041D\0430\0437\0432\0430 \043C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0443')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51853279226079111)
,p_db_column_name=>'END_DATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('\0412 \043D\0430\044F\0432\043D\043E\0441\0442\0456 \0434\043E')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'YYYY-MON-DD'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44056556807422949)
,p_db_column_name=>'PAT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Pat Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51853096470079109)
,p_db_column_name=>'PRATR_ACTUAL_END'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F \043F\0435\0440\0456\043E\0434\0443')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51852615120079105)
,p_db_column_name=>'PRD_DOSAGE_PLANNED'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\043E \0441\043F\043E\0436\0438\0442\0438')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51853189530079110)
,p_db_column_name=>'PR_PLANNED_END'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(52051904356240379)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DR_NAME:DA_STORED_AMOUNT:DRU_CONSUMED:BALANCE:DAYS_PLANNED:PRD_DOSAGE_PLANNED:DAILY_DOSE:DAYS_REMAIN:PRATR_ACTUAL_END:PR_PLANNED_END:END_DATE:DAYS_REMAIN_FROM_TOMORROW:DRU_CONSUMED_BEFORE:DRU_CONSUMED_TODAY'
,p_sort_column_1=>'DR_NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
