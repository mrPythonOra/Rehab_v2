prompt --application/pages/page_00401
begin
--   Manifest
--     PAGE: 00401
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
 p_id=>401
,p_name=>'Prescriptors'
,p_alias=>'PRESCRIPTORS'
,p_step_title=>'Prescriptors'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(180324662024809132)
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
 p_id=>wwv_flow_imp.id(180337818539976305)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(180336723635976294)
,p_plug_name=>'Details'
,p_static_id=>'details'
,p_title=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438 \0432 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\0456')
,p_parent_plug_id=>wwv_flow_imp.id(180337818539976305)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc:margin-top-lg'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PR_ID,',
'       nvl(PR_WS_ID,-1)PR_WS_ID,',
'       PR_DR_ID,',
'       PR_PAT_ID,',
'       PR_PRR_ID,',
'       PR_PLANNED_START,',
'       PR_PLANNED_END,',
'       PR_NOTES,',
'       case when PR_WS_ID is not null then',
unistr('       (select listagg(unique ''<b>''||DR_NAME || ''</b> \0437 '' || to_char(PRATR_ACTUAL_START,''YYYY-MM-DD'')|| nvl2(PRATR_ACTUAL_END,'' \043F\043E '' || to_char(PRATR_ACTUAL_END,''YYYY-MM-DD''),''''), ''; '') within group (order by PRATR_ACTUAL_START) '),
'          from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, ',
'               REHAB_PRESCRIPTIONS_DETAILS, ',
'               REHAB_DRUGS ',
'         where PRATR_PR_ID = PR_ID and PRD_PRATR_ID = PRATR_ID and PRD_DR_ID = DR_ID)',
'       else null',
'       end drug_list,',
unistr('       case when trunc(PR_PLANNED_END) < trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()) then ''\0417\0430\0432\0435\0440\0448\0435\043D\043E'' '),
unistr('            when PR_PLANNED_END is null or trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()) between trunc(PR_PLANNED_START) and trunc(PR_PLANNED_END) then ''\0410\043A\0442\0438\0432\043D\0435'''),
unistr('            when trunc(REHAB_CONTEXT_PKG.getGLOBAL_DATE()) < PR_PLANNED_START then ''\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\043E'''),
unistr('            else ''\041D\0435\0432\0438\0437\043D\0430\0447\0435\043D\043E'' end current_status'),
'  from REHAB_PRESCRIPTIONS',
' where PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and PR_PRR_ID = :P401_PRR_ID_CURR'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438 \0432 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\0456')
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
 p_id=>wwv_flow_imp.id(180336841503976295)
,p_no_data_found_message=>unistr('\0414\0430\043D\0456 \043F\0440\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\0456 \043C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438 \0432\0456\0434\0441\0443\0442\043D\0456 \0430\0431\043E \043D\0435 \0432\0438\0431\0440\0430\043D\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_RIGHT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>180336841503976295
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61876223925921424)
,p_db_column_name=>'CURRENT_STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\0421\0442\0430\0442\0443\0441')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(61876163860921423)
,p_db_column_name=>'DRUG_LIST'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0456 \043C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180337178357976298)
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
 p_id=>wwv_flow_imp.id(180336893397976296)
,p_db_column_name=>'PR_ID'
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
 p_id=>wwv_flow_imp.id(180337669552976303)
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
 p_id=>wwv_flow_imp.id(180337200027976299)
,p_db_column_name=>'PR_PAT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Patient ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180337494644976302)
,p_db_column_name=>'PR_PLANNED_END'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F \043F\0440\0438\0439\043E\043C\0443')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180337406946976301)
,p_db_column_name=>'PR_PLANNED_START'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A \043F\0440\0438\0439\043E\043C\0443')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180337337671976300)
,p_db_column_name=>'PR_PRR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pr Prr Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180337026021976297)
,p_db_column_name=>'PR_WS_ID'
,p_display_order=>20
,p_column_identifier=>'B'
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
 p_id=>wwv_flow_imp.id(180349983628031335)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PR_WS_ID:PR_DR_ID:DRUG_LIST:PR_PLANNED_START:PR_PLANNED_END:PR_NOTES'
,p_sort_column_1=>'PR_DR_ID'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PR_WS_ID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PR_PLANNED_START'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(178663107063429026)
,p_plug_name=>'Prescriptors'
,p_static_id=>'prescriptor'
,p_title=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_parent_plug_id=>wwv_flow_imp.id(180337818539976305)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRR_ID,--PRR_ID PRR_ID1,',
'       PRR_PRESCRIPTED_BY_SHORT,',
'       PRR_PRESCRIPTED_WHEN,',
'       --substr(PRR_PRESCRIPTED_BY_FULL,1,nvl(instr(PRR_PRESCRIPTED_BY_FULL,chr(10)),30)) ',
'       PRR_PRESCRIPTED_BY_FULL,',
'       PRR_PAT_ID,',
'       PRR_FULL_TEXT,',
unistr('       nvl2(PRR_PAGE1,''\041F\0435\0440\0435\0433\043B\044F\0434'',null) PRR_PAGE1,'),
unistr('       nvl2(PRR_PAGE2,''\041F\0435\0440\0435\0433\043B\044F\0434'',null) PRR_PAGE2,'),
unistr('       nvl2(PRR_PAGE3,''\041F\0435\0440\0435\0433\043B\044F\0434'',null) PRR_PAGE3,'),
unistr('       nvl2(PRR_PAGE4,''\041F\0435\0440\0435\0433\043B\044F\0434'',null) PRR_PAGE4,'),
unistr('       nvl2(PRR_PAGE5,''\041F\0435\0440\0435\0433\043B\044F\0434'',null) PRR_PAGE5,'),
'       decode(prr_id,:P401_PRR_ID_CURR,1,0) current_record,',
'       REHAB_PRESCRIPTIONS_PKG.get_prescriptor_status(PRR_ID) status',
'  from REHAB_PRESCRIPTORS',
' where PRR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
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
 p_id=>wwv_flow_imp.id(178663210019429027)
,p_no_data_found_message=>unistr('\0412\0456\0434\0441\0443\0442\043D\0456 \0434\0430\043D\0456 \043F\0440\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:402:&SESSION.::&DEBUG.:402:P402_PRR_ID_CURR,P401_PRR_ID_CURR:#PRR_ID#,#PRR_ID#'
,p_internal_uid=>178663210019429027
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180338039240976307)
,p_db_column_name=>'CURRENT_RECORD'
,p_display_order=>120
,p_column_identifier=>'Q'
,p_column_label=>unistr('\041F\043E\0442\043E\0447\043D\0438\0439 \0440\044F\0434\043E\043A')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178663801067429033)
,p_db_column_name=>'PRR_FULL_TEXT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\041F\043E\0432\043D\0438\0439 \0442\0435\043A\0441\0442 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'RICH_TEXT'
,p_heading_alignment=>'LEFT'
,p_rich_text_format=>'MARKDOWN'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178663308358429028)
,p_db_column_name=>'PRR_ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178664472724429039)
,p_db_column_name=>'PRR_PAGE1'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 1')
,p_column_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE1,PRR_ID,#PRR_ID#'
,p_column_linktext=>'#PRR_PAGE1#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178664561695429040)
,p_db_column_name=>'PRR_PAGE2'
,p_display_order=>80
,p_column_identifier=>'M'
,p_column_label=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 2')
,p_column_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE2,PRR_ID,#PRR_ID#'
,p_column_linktext=>'#PRR_PAGE2#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178664599612429041)
,p_db_column_name=>'PRR_PAGE3'
,p_display_order=>90
,p_column_identifier=>'N'
,p_column_label=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 3')
,p_column_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE3,PRR_ID,#PRR_ID#'
,p_column_linktext=>'#PRR_PAGE3#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180336519265976292)
,p_db_column_name=>'PRR_PAGE4'
,p_display_order=>100
,p_column_identifier=>'O'
,p_column_label=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 4')
,p_column_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE4,PRR_ID,#PRR_ID#'
,p_column_linktext=>'#PRR_PAGE4#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180336605047976293)
,p_db_column_name=>'PRR_PAGE5'
,p_display_order=>110
,p_column_identifier=>'P'
,p_column_label=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 5')
,p_column_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE5,PRR_ID,#PRR_ID#'
,p_column_linktext=>'#PRR_PAGE5#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178663700556429032)
,p_db_column_name=>'PRR_PAT_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Patient ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178663596651429031)
,p_db_column_name=>'PRR_PRESCRIPTED_BY_FULL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\041A\0438\043C \043F\0440\0438\0437\043D\0430\0447\0435\043D\043E (\043F\043E\0432\043D\0430 \043D\0430\0437\0432\0430)')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178663403313429029)
,p_db_column_name=>'PRR_PRESCRIPTED_BY_SHORT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\041A\0438\043C \043F\0440\0438\0437\043D\0430\0447\0435\043D\043E')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(178663555453429030)
,p_db_column_name=>'PRR_PRESCRIPTED_WHEN'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\041A\043E\043B\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043E')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(63853966086868106)
,p_db_column_name=>'STATUS'
,p_display_order=>130
,p_column_identifier=>'R'
,p_column_label=>unistr('\0421\0442\0430\0442\0443\0441')
,p_column_link=>'f?p=&APP_ID.:401:&SESSION.::&DEBUG.::P401_PRR_ID_CURR:#PRR_ID#'
,p_column_linktext=>'#STATUS#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(180330338774896074)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'STATUS:PRR_PRESCRIPTED_BY_SHORT:PRR_PRESCRIPTED_WHEN:PRR_PAGE1'
,p_sort_column_1=>'PRR_PRESCRIPTED_WHEN'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(63883755240482616)
,p_report_id=>wwv_flow_imp.id(180330338774896074)
,p_static_id=>'ir-condition'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_RECORD'
,p_operator=>'='
,p_expr=>'1'
,p_condition_sql=>' (case when ("CURRENT_RECORD" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_font_color=>'#4cff00'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(63883393520482614)
,p_report_id=>wwv_flow_imp.id(180330338774896074)
,p_static_id=>'ir-condition-2'
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'STATUS'
,p_operator=>'='
,p_expr=>unistr('\0410\043A\0442\0438\0432\043D\0435')
,p_condition_sql=>'"STATUS" = #APXWS_EXPR#'
,p_condition_display=>unistr('#APXWS_COL_NAME# = ''\0410\043A\0442\0438\0432\043D\0435''  ')
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(61949457332182842)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(178663107063429026)
,p_button_name=>'CreateNew'
,p_static_id=>'createnew'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0421\0442\0432\043E\0440\0438\0442\0438 \043D\043E\0432\0435 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:402:&SESSION.::&DEBUG.:402:P402_PRR_ID,P402_PRD_ID_CURR:,'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(180348249180976392)
,p_name=>'P401_PRR_ID_CURR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(178663107063429026)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
