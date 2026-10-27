prompt --application/pages/page_00120
begin
--   Manifest
--     PAGE: 00120
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
 p_id=>120
,p_name=>'Drugs'
,p_alias=>'DRUGS'
,p_step_title=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0438')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(77092215158748275)
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
 p_id=>wwv_flow_imp.id(77093061755748468)
,p_plug_name=>'Drugs'
,p_static_id=>'drugs'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DR_ID,',
'       DR_TE_ID,',
'       DR_NAME,',
'       DR_TYPE_SHORT,',
'       DR_WS_ID,',
'       DR_WS_FORMULA,',
'       DR_USE_CASE,',
'       DR_WHEN2CONSUME,',
'       DR_INSTRUCTION,',
'       DR_INSTR_SRC_URL',
'    --    sys.dbms_lob.getlength( DR_ITEM_IMAGE1 ) DR_ITEM_IMAGE1,',
'    --    sys.dbms_lob.getlength( DR_ITEM_IMAGE2 ) DR_ITEM_IMAGE2,',
'    --    sys.dbms_lob.getlength( DR_PACK_IMAGE1 ) DR_PACK_IMAGE1,',
'    --    sys.dbms_lob.getlength( DR_PACK_IMAGE2 ) DR_PACK_IMAGE2',
'  from REHAB_DRUGS'))
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
 p_id=>wwv_flow_imp.id(77093177505748468)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.::P121_DR_ID,P121_NEW_TYPE:#DR_ID#,'
,p_internal_uid=>77093177505748468
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77094397467748661)
,p_db_column_name=>'DR_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Dr ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77097413925748726)
,p_db_column_name=>'DR_INSTRUCTION'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Dr Instruction'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77097883372748729)
,p_db_column_name=>'DR_INSTR_SRC_URL'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('\041F\043E\0441\0438\043B\0430\043D\043D\044F \043D\0430 \0456\043D\0441\0442\0440\0443\043A\0446\0456\044E')
,p_column_link=>'#DR_INSTR_SRC_URL#'
,p_column_linktext=>'<img src="#APEX_FILES#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77095038033748713)
,p_db_column_name=>'DR_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('\041D\0430\0437\0432\0430')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77065176702873113)
,p_db_column_name=>'DR_TE_ID'
,p_display_order=>20
,p_column_identifier=>'O'
,p_column_label=>unistr('\041E\0440\0435\043D\0434\0430\0440')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(70077718526459727)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77095491694748715)
,p_db_column_name=>'DR_TYPE_SHORT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('\0422\0438\043F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77096620517748722)
,p_db_column_name=>'DR_USE_CASE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('\0417\0430\0441\0442\043E\0441\0443\0432\0430\043D\043D\044F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77097092665748724)
,p_db_column_name=>'DR_WHEN2CONSUME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>unistr('\042F\043A \0441\043F\043E\0436\0438\0432\0430\0442\0438')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77096296675748720)
,p_db_column_name=>'DR_WS_FORMULA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('\0424\043E\0440\043C\0443\043B\0430')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77065263832873114)
,p_db_column_name=>'DR_WS_ID'
,p_display_order=>30
,p_column_identifier=>'P'
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
 p_id=>wwv_flow_imp.id(77099835558753045)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DR_WS_ID:DR_NAME:DR_TYPE_SHORT:DR_WS_FORMULA:DR_USE_CASE:DR_WHEN2CONSUME:DR_INSTR_SRC_URL'
,p_break_on=>'DR_WS_ID'
,p_break_enabled_on=>'DR_WS_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77066093287873122)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(77093061755748468)
,p_button_name=>'AddDrug'
,p_static_id=>'adddrug'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0414\043E\0434\0430\0442\0438')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.::P121_DR_ID,P121_NEW_TYPE:,'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-new'
);
wwv_flow_imp.component_end;
end;
/
