prompt --application/pages/page_00701
begin
--   Manifest
--     PAGE: 00701
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.6'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_page.create_page(
 p_id=>701
,p_name=>'Configuration'
,p_alias=>'CONFIGS'
,p_step_title=>unistr('\041F\0430\0440\0430\043C\0435\0442\0440\0438')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(77203505327766948)
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
 p_id=>wwv_flow_imp.id(77204380584767118)
,p_plug_name=>'REHAB_CONFIGS'
,p_static_id=>'rehab-configs'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PAR_NAME,',
'       PAR_HUMAN_NAME,',
'       PAR_CATEGOTY,',
'       PAR_TE_ID,',
'       PAR_PAT_ID,',
unistr('       case when PAR_VALUE in (''Y'',''N'') then decode(PAR_VALUE,''Y'',''\0422\0430\043A'',''N'',''\041D\0456'') else PAR_VALUE end PAR_VALUE,'),
'       PAR_DESCRIPTION',
'  from V$REHAB_CONFIGS_AVAILABLE'))
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
 p_id=>wwv_flow_imp.id(77204488800767118)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:702:&SESSION.::&DEBUG.:702:P702_PAR_NAME:#PAR_NAME#'
,p_internal_uid=>77204488800767118
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77206496803767303)
,p_db_column_name=>'PAR_CATEGOTY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('\041A\0430\0442\0435\0433\043E\0440\0456\044F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77207932276767312)
,p_db_column_name=>'PAR_DESCRIPTION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('\041E\043F\0438\0441')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77206085981767300)
,p_db_column_name=>'PAR_HUMAN_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('\041D\0430\0437\0432\0430 \043F\0430\0440\0430\043C\0435\0442\0440\0430')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77205667443767293)
,p_db_column_name=>'PAR_NAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Par Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82674465391848003)
,p_db_column_name=>'PAR_PAT_ID'
,p_display_order=>27
,p_column_identifier=>'I'
,p_column_label=>'Par Pat Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82674365554848002)
,p_db_column_name=>'PAR_TE_ID'
,p_display_order=>17
,p_column_identifier=>'H'
,p_column_label=>'Par Te Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77207542085767310)
,p_db_column_name=>'PAR_VALUE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('\0417\043D\0430\0447\0435\043D\043D\044F')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(77208324736768023)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAR_NAME:PAR_HUMAN_NAME:PAR_CATEGOTY:PAR_VALUE:PAR_DESCRIPTION'
,p_sort_column_1=>'PAR_CATEGOTY'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PAR_HUMAN_NAME'
,p_sort_direction_2=>'ASC'
,p_break_on=>'PAR_CATEGOTY'
,p_break_enabled_on=>'PAR_CATEGOTY'
);
wwv_flow_imp.component_end;
end;
/
