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
 p_id=>wwv_flow_imp.id(56470421749627426)
,p_plug_name=>'Prescription'
,p_static_id=>'meds'
,p_title=>unistr('\041C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0438')
,p_parent_plug_id=>wwv_flow_imp.id(56470562677627427)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTIONS'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
''))
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(56472053796627442)
,p_name=>'Prescriptions'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTIONS'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and PR_PRR_ID = :P402_PRR_ID'))
,p_include_rowid_column=>false
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
 p_id=>wwv_flow_imp.id(56472336521627445)
,p_query_column_id=>3
,p_column_alias=>'PR_DR_ID'
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
 p_id=>wwv_flow_imp.id(56472115584627443)
,p_query_column_id=>1
,p_column_alias=>'PR_ID'
,p_column_display_sequence=>10
,p_column_heading=>unistr('\0412\0438\0431\0440\0430\0442\0438')
,p_column_link=>'f?p=&APP_ID.:402:&SESSION.::&DEBUG.::P402_PR_ID,P402_PRR_ID:#PR_ID#,#PR_PRR_ID#'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56472822761627450)
,p_query_column_id=>8
,p_column_alias=>'PR_NOTES'
,p_column_display_sequence=>80
,p_column_heading=>unistr('\041D\043E\0442\0430\0442\043A\0438')
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56472469080627446)
,p_query_column_id=>4
,p_column_alias=>'PR_PAT_ID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56472754348627449)
,p_query_column_id=>7
,p_column_alias=>'PR_PLANNED_END'
,p_column_display_sequence=>70
,p_column_heading=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0435 \0437\0430\0432\0435\0440\0448\0435\043D\043D\044F \043F\0440\0438\0439\043E\043C\0443 ')
,p_column_format=>'&APP_DTFMT_DATE.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56472606415627448)
,p_query_column_id=>6
,p_column_alias=>'PR_PLANNED_START'
,p_column_display_sequence=>60
,p_column_heading=>unistr('\0417\0430\043F\043B\0430\043D\043E\0432\0430\043D\0438\0439 \043F\043E\0447\0430\0442\043E\043A \043F\0440\0438\0439\043E\043C\0443')
,p_column_format=>'&APP_DTFMT_DATE.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56472520246627447)
,p_query_column_id=>5
,p_column_alias=>'PR_PRR_ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56472285803627444)
,p_query_column_id=>2
,p_column_alias=>'PR_WS_ID'
,p_column_display_sequence=>20
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
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_button_name=>'CANCEL2'
,p_static_id=>'cancel_1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
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
,p_button_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_button_name=>'CREATE2'
,p_static_id=>'create2'
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
,p_button_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_button_name=>'DELETE2'
,p_static_id=>'delete2'
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
,p_button_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_button_name=>'SAVE2'
,p_static_id=>'save2'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CHANGE'
,p_button_condition=>'P402_PR_ID'
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
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E \043A\0438\043C, \043F\043E\0432\043D\0438\0439 \0442\0435\043A\0441\0442')
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
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E \043A\0438\043C')
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
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E \043A\043E\043B\0438')
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
,p_is_required=>true
,p_item_sequence=>20
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
,p_field_template=>1610598484065263269
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
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_item_source_plug_id=>wwv_flow_imp.id(56470421749627426)
,p_prompt=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_source=>'PR_WS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_WORKING_SUBSTANCE.WS_NAME'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P402_PR_DR_ID'
,p_ajax_items_to_submit=>'P402_PR_WS_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56471057075627432)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeDelete'
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
,p_process_name=>'BeforeNew'
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
 p_id=>wwv_flow_imp.id(58055795525597006)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process form PrescriptionSave'
,p_static_id=>'process-form-prescriptionsave'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_PRESCRIPTIONS_PKG.update_PRESCRIPTION ( ',
'    P_PR_ID => :P402_PR_ID,',
'    P_PR_DR_ID => :P402_PR_DR_ID,',
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
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form PrescriptorCreate'
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
,p_process_name=>'Process form PrescriptorDel'
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
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form PrescriptorSave'
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
,p_process_name=>'SaveFilteredDrugsCreate'
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
,p_process_name=>'SaveFilteredDrugsSave'
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
