prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
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
 p_id=>302
,p_name=>'EditInventory'
,p_alias=>'EDITINVENTORY'
,p_step_title=>unistr('\0412\0435\0441\0442\0438 \0437\0430\043F\0430\0441\0438')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70063213176283010)
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
 p_id=>wwv_flow_imp.id(72115880373258249)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72115922113258250)
,p_plug_name=>'Facet'
,p_static_id=>'facet'
,p_parent_plug_id=>wwv_flow_imp.id(72115880373258249)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(116160466964662839)
,p_plug_name=>'Inventory'
,p_static_id=>'inventory'
,p_title=>unistr('\0417\0430\043B\0438\0448\043A\0438')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT /* NO_RESULT_CACHE */',
'    pat_id,',
'    dr_id,',
'    da_stored_amount,',
'    dru_consumed,DRU_CONSUMED_BEFORE,--nvl(DRU_CONSUMED_TODAY,0)',
'    DRU_CONSUMED_TODAY,',
'    balance,',
'    round(days_planned) days_planned,',
'    round(prd_dosage_planned) prd_dosage_planned,',
'    daily_dose,',
'    round(days_remain) days_remain,',
'    round(days_remain_from_tomorrow) days_remain_from_tomorrow,',
'    dr_name,WS_NAME,',
'    pratr_actual_end,',
'    PR_PLANNED_START,pr_planned_end,',
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
,p_prn_page_header=>unistr('\0417\0430\043B\0438\0448\043A\0438')
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
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(116160544857662840)
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>116160544857662840
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123956583763318995)
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
 p_id=>wwv_flow_imp.id(123956931681318998)
,p_db_column_name=>'DAILY_DOSE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\0414\0435\043D\043D\0430 \0434\043E\0437\0430, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123956656399318996)
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
 p_id=>wwv_flow_imp.id(123956993602318999)
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
 p_id=>wwv_flow_imp.id(123957827329319007)
,p_db_column_name=>'DAYS_REMAIN_FROM_TOMORROW'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>unistr('\0417\0430\043B\0438\0448\0438\043B\043E\0441\044F \043D\0430 \0434\043D\0456\0432 \0456\0437 \0437\0430\0432\0442\0440\0430')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123956396612318993)
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
 p_id=>wwv_flow_imp.id(123956457377318994)
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
 p_id=>wwv_flow_imp.id(123957558115319005)
,p_db_column_name=>'DRU_CONSUMED_BEFORE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('\0421\043F\043E\0436\0438\0442\043E \0434\043E \0441\044C\043E\0433\043E\0434\043D\0456, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123957717714319006)
,p_db_column_name=>'DRU_CONSUMED_TODAY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('\0421\043F\043E\0436\0438\0442\043E \0441\044C\043E\0433\0434\043D\0456, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(116160812804662842)
,p_db_column_name=>'DR_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dr Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123957088085319000)
,p_db_column_name=>'DR_NAME'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>unistr('\041D\0430\0437\0432\0430 \043C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0443')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123957416896319003)
,p_db_column_name=>'END_DATE'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>unistr('\0412 \043D\0430\044F\0432\043D\043E\0441\0442\0456 \0434\043E &P301_END_DATE_CAPT.')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(116160694477662841)
,p_db_column_name=>'PAT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Pat Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123957234140319001)
,p_db_column_name=>'PRATR_ACTUAL_END'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F \043F\0435\0440\0456\043E\0434\0443')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123956752790318997)
,p_db_column_name=>'PRD_DOSAGE_PLANNED'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\043E \0441\043F\043E\0436\0438\0442\0438, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123957327200319002)
,p_db_column_name=>'PR_PLANNED_END'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(140182878089396897)
,p_db_column_name=>'PR_PLANNED_START'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(133980454818161317)
,p_db_column_name=>'WS_NAME'
,p_display_order=>100
,p_column_identifier=>'R'
,p_column_label=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(124156042026480271)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WS_NAME:DR_NAME:DA_STORED_AMOUNT:DRU_CONSUMED:BALANCE:DAYS_PLANNED:PRD_DOSAGE_PLANNED:DAILY_DOSE:DAYS_REMAIN:PR_PLANNED_START:PR_PLANNED_END:PRATR_ACTUAL_END:END_DATE:DAYS_REMAIN_FROM_TOMORROW:DRU_CONSUMED_BEFORE:DRU_CONSUMED_TODAY'
,p_sort_column_1=>'WS_NAME'
,p_sort_direction_1=>'ASC NULLS FIRST'
,p_sort_column_2=>'PR_PLANNED_END'
,p_sort_direction_2=>'ASC NULLS FIRST'
,p_sort_column_3=>'PRATR_ACTUAL_END'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72111063434258201)
,p_plug_name=>'Remains'
,p_static_id=>'remains'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DA_ID,',
'       DA_DS_ID,',
'       DA_DR_ID,',
'       DA_PRR_ID,',
'       DA_PR_ID,',
'       DA_WS_ID,',
'       DA_PRATR_ID,',
'       DA_ORDER_TYPE,',
'       DA_QUANTITY,',
'       DA_ENTIRY_WEIGHT,',
'       DA_COST,',
'       DA_PURCHASED,',
'       DA_CHECK_POINT_DT,',
'       DA_BEST_BEFORE',
'  from REHAB_DRUG_ACCOUNTINGS',
' where (:P302_DS_ID_CURR is null or DA_DS_ID=:P302_DS_ID_CURR) ',
'  and DA_DS_ID in (select P2S_DS_ID from REHAB_PATIENT2STORAGES where P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())',
''))
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
,p_prn_border_width=>2
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(72111180076258202)
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:304:&SESSION.::&DEBUG.::P304_DA_ID,P304_MOVE_QUANTITY,P304_TARGET_STORAGE,P304_VALIDATE_MSG:#DA_ID#,,,'
,p_internal_uid=>72111180076258202
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72112574786258216)
,p_db_column_name=>'DA_BEST_BEFORE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('\041A\0456\043D\0446\0435\0432\0438\0439 \0442\0435\0440\043C\0456\043D')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72112463884258215)
,p_db_column_name=>'DA_CHECK_POINT_DT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('\0417\0430\043D\0435\0441\0435\043D\043E')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DTFMT_MON_T.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72112294533258213)
,p_db_column_name=>'DA_COST'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\0426\0456\043D\0430 \043F\0430\043A\0435\0442\0443')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72111434766258205)
,p_db_column_name=>'DA_DR_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
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
 p_id=>wwv_flow_imp.id(72111363819258204)
,p_db_column_name=>'DA_DS_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Da Ds Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72112128223258212)
,p_db_column_name=>'DA_ENTIRY_WEIGHT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\0412\0430\0433\0430 \043E\0434\043D\0456\0454\0457 \043E\0434\0438\043D\0438\0446\0456, \043C\0433')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72111255902258203)
,p_db_column_name=>'DA_ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73053724472651216)
,p_db_column_name=>'DA_ORDER_TYPE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('\0422\0438\043F \043F\0440\0438\0445\043E\0434\0443')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(73069402169783245)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72111823020258209)
,p_db_column_name=>'DA_PRATR_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Da Pratr Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72111560403258206)
,p_db_column_name=>'DA_PRR_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(72142687256359502)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72111615331258207)
,p_db_column_name=>'DA_PR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Da Pr Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72112321580258214)
,p_db_column_name=>'DA_PURCHASED'
,p_display_order=>120
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
 p_id=>wwv_flow_imp.id(72112022772258211)
,p_db_column_name=>'DA_QUANTITY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C \0442\0430\0431\043B\0435\0442\043E\043A')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72111762720258208)
,p_db_column_name=>'DA_WS_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(56485897056731550)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(72138003698267288)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DA_PRR_ID:DA_WS_ID:DA_ORDER_TYPE:DA_DR_ID:DA_QUANTITY:DA_ENTIRY_WEIGHT:DA_COST:DA_PURCHASED:DA_CHECK_POINT_DT:DA_BEST_BEFORE'
,p_sort_column_1=>'DA_PURCHASED'
,p_sort_direction_1=>'DESC'
,p_break_on=>'DA_PRR_ID:DA_WS_ID'
,p_break_enabled_on=>'DA_PRR_ID:DA_WS_ID'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(72112868566258219)
,p_name=>'Remains2'
,p_static_id=>'remains2'
,p_parent_plug_id=>wwv_flow_imp.id(72115922113258250)
,p_template=>2102002977963900996
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DA_ID,',
'       DA_DS_ID,',
'       DA_DR_ID,',
'       DA_PRR_ID,',
'       DA_PR_ID,',
'       DA_WS_ID,',
'       DA_PRATR_ID,',
'       DA_ORDER_TYPE,',
'       DA_QUANTITY,',
'       DA_ENTIRY_WEIGHT,',
'       DA_COST,',
'       DA_PURCHASED,',
'       DA_CHECK_POINT_DT,',
'       DA_BEST_BEFORE',
'  from REHAB_DRUG_ACCOUNTINGS',
' where (:P302_DS_ID_CURR is null or DA_DS_ID=:P302_DS_ID_CURR) ',
'  and DA_DS_ID in (select P2S_DS_ID from REHAB_PATIENT2STORAGES where P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115780832258248)
,p_query_column_id=>14
,p_column_alias=>'DA_BEST_BEFORE'
,p_column_display_sequence=>140
,p_column_heading=>unistr('\041A\0456\043D\0446\0435\0432\0438\0439 \0442\0435\0440\043C\0456\043D')
,p_column_format=>'&APP_DTFMT_MON_T.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115666079258247)
,p_query_column_id=>13
,p_column_alias=>'DA_CHECK_POINT_DT'
,p_column_display_sequence=>130
,p_column_heading=>unistr('\0417\0430\043D\0435\0441\0435\043D\043E')
,p_column_format=>'&APP_DTFMT_MON_T.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115456057258245)
,p_query_column_id=>11
,p_column_alias=>'DA_COST'
,p_column_display_sequence=>110
,p_column_heading=>unistr('\0426\0456\043D\0430 \043F\0430\043A\0435\0442\0443')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72114611847258237)
,p_query_column_id=>3
,p_column_alias=>'DA_DR_ID'
,p_column_display_sequence=>30
,p_column_heading=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(56486046497734841)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72114578466258236)
,p_query_column_id=>2
,p_column_alias=>'DA_DS_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115397751258244)
,p_query_column_id=>10
,p_column_alias=>'DA_ENTIRY_WEIGHT'
,p_column_display_sequence=>100
,p_column_heading=>unistr('\0412\0430\0433\0430 \043E\0434\043D\0456\0454\0457 \043E\0434\0438\043D\0438\0446\0456, \043C\0433')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72114498071258235)
,p_query_column_id=>1
,p_column_alias=>'DA_ID'
,p_column_display_sequence=>10
,p_column_link=>'f?p=&APP_ID.:304:&SESSION.::&DEBUG.::P304_DA_ID:#DA_ID#'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115162607258242)
,p_query_column_id=>8
,p_column_alias=>'DA_ORDER_TYPE'
,p_column_display_sequence=>80
,p_column_heading=>unistr('\0422\0438\043F \043F\0440\0438\0445\043E\0434\0443')
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(73069402169783245)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115025948258241)
,p_query_column_id=>7
,p_column_alias=>'DA_PRATR_ID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72114736577258238)
,p_query_column_id=>4
,p_column_alias=>'DA_PRR_ID'
,p_column_display_sequence=>40
,p_column_heading=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(72142687256359502)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72114884415258239)
,p_query_column_id=>5
,p_column_alias=>'DA_PR_ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115546115258246)
,p_query_column_id=>12
,p_column_alias=>'DA_PURCHASED'
,p_column_display_sequence=>120
,p_column_heading=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E')
,p_column_format=>'&APP_DTFMT_MON_T.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72115267456258243)
,p_query_column_id=>9
,p_column_alias=>'DA_QUANTITY'
,p_column_display_sequence=>90
,p_column_heading=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C \0442\0430\0431\043B\0435\0442\043E\043A')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72114902603258240)
,p_query_column_id=>6
,p_column_alias=>'DA_WS_ID'
,p_column_display_sequence=>60
,p_column_heading=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(56485897056731550)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(958987734713069693)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>unistr('\0424\0456\043B\044C\0442\0440\0443\0432\0430\0442\0438')
,p_parent_plug_id=>wwv_flow_imp.id(72115922113258250)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(72112868566258219)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(958993033985069876)
,p_name=>'P302_DRUG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(958987734713069693)
,p_prompt=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_source=>'DA_DR_ID'
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
 p_id=>wwv_flow_imp.id(204513739251937893)
,p_name=>'P302_PRESCRIPTOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(958987734713069693)
,p_prompt=>unistr('\0414\0436\0435\0440\0435\043B\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'DA_PRR_ID'
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
 p_id=>wwv_flow_imp.id(958992916310069875)
,p_name=>'P302_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(958987734713069693)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204513839435937894)
,p_name=>'P302_WS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(958987734713069693)
,p_prompt=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_source=>'DA_WS_ID'
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
 p_id=>wwv_flow_imp.id(68078926659157007)
,p_plug_name=>'Storage'
,p_static_id=>'storage'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ds_id,',
'    ds_te_id,',
'    ds_name,',
'    ds_description,',
'    ds_created,',
'    ds_updated,',
unistr('    case when P2S_IS_OWNER then ''\0422\0430\043A'' when not P2S_IS_OWNER then ''\041D\0456''  else ''\041D\0435\0432\0438\0437\043D\0430\0447\0435\043D\043E'' end P2S_IS_OWNER,'),
'    P2S_IS_OWNER P2S_IS_OWNER_RAW,',
'    decode(ds_id,:P302_DS_ID_CURR,1,0) curr_ds',
'FROM',
'    REHAB_DRUG_STORAGES, REHAB_PATIENT2STORAGES',
'where P2S_DS_ID = ds_id and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()'))
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
,p_prn_border_width=>1
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(68079058931157008)
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.::P303_DS_ID,P302_DS_ID_CURR:#DS_ID#,#DS_ID#'
,p_internal_uid=>68079058931157008
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68079966533157017)
,p_db_column_name=>'CURR_DS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\0412\0438\0431\0440\0430\043D\0438\0439 \0441\043A\043B\0430\0434')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68079541164157013)
,p_db_column_name=>'DS_CREATED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\0421\0442\0432\043E\0440\0435\043D\043E')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68079404644157012)
,p_db_column_name=>'DS_DESCRIPTION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\041E\043F\0438\0441')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68079154802157009)
,p_db_column_name=>'DS_ID'
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
 p_id=>wwv_flow_imp.id(68079338772157011)
,p_db_column_name=>'DS_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\041D\0430\0437\0432\0430')
,p_column_link=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.::P302_DS_ID_CURR,P302_IS_OWNER:#DS_ID#,#P2S_IS_OWNER_RAW#'
,p_column_linktext=>'#DS_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68079247594157010)
,p_db_column_name=>'DS_TE_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tenant ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68079616715157014)
,p_db_column_name=>'DS_UPDATED'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\041E\043D\043E\0432\043B\0435\043D\043E')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70893510235852021)
,p_db_column_name=>'P2S_IS_OWNER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\0412\043B\0430\0441\043D\0438\043A')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(73055104453651230)
,p_db_column_name=>'P2S_IS_OWNER_RAW'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'P2s Is Owner Raw'
,p_column_type=>'BOOLEAN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(70071379625394521)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DS_NAME:DS_DESCRIPTION:DS_CREATED:DS_UPDATED:P2S_IS_OWNER'
,p_sort_column_1=>'DS_NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(72090667296206539)
,p_report_id=>wwv_flow_imp.id(70071379625394521)
,p_static_id=>'ir-condition'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURR_DS'
,p_operator=>'='
,p_expr=>'1'
,p_condition_sql=>' (case when ("CURR_DS" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_font_color=>'#4cff00'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70893437883852020)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(68078926659157007)
,p_button_name=>'AddStorage'
,p_static_id=>'addstorage'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0414\043E\0434\0430\0442\0438 \0441\043A\0440\0438\043D\044E \0434\043B\044F \043B\0456\043A\0456\0432')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:303::'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73118422040591451)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(72111063434258201)
,p_button_name=>'CreateNew'
,p_static_id=>'createnew'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438 \043D\043E\0432\0438\0439 \0437\0430\043F\0438\0441')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:304:&SESSION.::&DEBUG.::P304_DA_ID,P304_DA_DS_ID:,&P302_DS_ID_CURR.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P302_DS_ID_CURR is not null and :P302_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68079828090157016)
,p_name=>'P302_DS_ID_CURR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(68078926659157007)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(133986825592161391)
,p_name=>'P302_END_DATE_CAPT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(116160466964662839)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73055060328651229)
,p_name=>'P302_IS_OWNER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(68078926659157007)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(68080003992157018)
,p_name=>'RefreshAfterClose'
,p_static_id=>'refreshafterclose'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(68078926659157007)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(68080119811157019)
,p_event_id=>wwv_flow_imp.id(68080003992157018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(68078926659157007)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
