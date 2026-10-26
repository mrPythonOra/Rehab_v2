prompt --application/pages/page_00212
begin
--   Manifest
--     PAGE: 00212
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
 p_id=>212
,p_name=>'EditTraining'
,p_alias=>'EDITTRAINING'
,p_step_title=>'&P212_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54821352687590901)
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
 p_id=>wwv_flow_imp.id(54822092958591088)
,p_plug_name=>'EditTraining'
,p_static_id=>'edittraining'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_TRAININGS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70871617233708416)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0414\043E\0434\0430\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54834285674591146)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:211:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-person-running-fast'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54835567474591151)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-file-check'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70871228154707202)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'CREATE_N_ADD'
,p_static_id=>'create-n-add'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0434\043E\0434\0430\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-file-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(68081676169157034)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'CREATE_N_CLOSE'
,p_static_id=>'create-n-close'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54834719245591149)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \0437\0430\043F\0438\0441\0443 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D')
,p_confirm_style=>'danger'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54847632119646633)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'Next'
,p_static_id=>'next'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041D\0430\0441\0442\0443\043F\043D\0438\0439')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54847273970645477)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'Prev'
,p_static_id=>'prev'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041F\043E\043F\0435\0440\0435\0434\043D\0456\0439')
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P212_TR_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54793387971080123)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'Preview1'
,p_static_id=>'preview1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 1')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_TRAININGS,TR_IMG1,TR_ID,&P212_TR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_TRAININGS where TR_IMG1 is not null and TR_ID = :P212_TR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54793446103080124)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'Preview2'
,p_static_id=>'preview2'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 2')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_TRAININGS,TR_IMG2,TR_ID,&P212_TR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_TRAININGS where TR_IMG2 is not null and TR_ID = :P212_TR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54835166499591150)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-check'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70870849216705936)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_button_name=>'SAVE_N_CLOSE'
,p_static_id=>'save-n-close'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P212_TR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54792705953080117)
,p_branch_name=>'Next'
,p_branch_action=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.::P212_TR_ID:&P212_TR_ID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(54847632119646633)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54835929195591152)
,p_branch_action=>'f?p=&APP_ID.:211:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(54834719245591149)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54838417742599342)
,p_branch_name=>'Prev'
,p_branch_action=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.::P212_TR_ID:&P212_TR_ID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(54847273970645477)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(68081119636157029)
,p_branch_action=>'f?p=&APP_ID.:211:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(70870849216705936)
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(68081933485157037)
,p_branch_action=>'f?p=&APP_ID.:211:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(68081676169157034)
,p_branch_sequence=>50
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70892179280852007)
,p_name=>'P212_DURATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>'Duration'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54792419924080114)
,p_name=>'P212_TITLE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54827021781591119)
,p_name=>'P212_TR_DESCR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\041E\043F\0438\0441')
,p_source=>'TR_DESCR'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
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
 p_id=>wwv_flow_imp.id(74065434566385811)
,p_name=>'P212_TR_DEV2_DISTANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0456\043D\0448\043E\043C\0443 \0434\0435\0432\0430\0439\0441\0443, \043A\043C')
,p_source=>'TR_DEV2_DISTANCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54825041852591111)
,p_name=>'P212_TR_DISTANCE_LENGTH'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0414\0456\0441\0442\0430\043D\0446\0456\044F, \043A\043C')
,p_source=>'TR_DISTANCE_LENGTH'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54824204465591108)
,p_name=>'P212_TR_END'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0417\0430\0432\0435\0440\0448\0435\043D\043D\044F')
,p_format_mask=>'&APP_DTFMT_SHORT_T.'
,p_source=>'TR_END'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
  'time_increment', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54822332753591090)
,p_name=>'P212_TR_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_source=>'TR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54792658837080116)
,p_name=>'P212_TR_ID_NEXT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54792537351080115)
,p_name=>'P212_TR_ID_PREV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54827424509591120)
,p_name=>'P212_TR_IMG1'
,p_source_data_type=>'BLOB'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0417\043E\0431\0440\0430\0436\0435\043D\043D\044F 1')
,p_source=>'TR_IMG1'
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
 p_id=>wwv_flow_imp.id(54827868558591122)
,p_name=>'P212_TR_IMG2'
,p_source_data_type=>'BLOB'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0417\043E\0431\0440\0430\0436\0435\043D\043D\044F 2')
,p_source=>'TR_IMG2'
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
 p_id=>wwv_flow_imp.id(54823113776591099)
,p_name=>'P212_TR_PAT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442')
,p_source=>'TR_PAT_ID'
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
 p_id=>wwv_flow_imp.id(54825849908591114)
,p_name=>'P212_TR_PULSE_AVG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441')
,p_source=>'TR_PULSE_AVG'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54826640217591117)
,p_name=>'P212_TR_PULSE_MAX'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'TR_PULSE_MAX'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54826251675591116)
,p_name=>'P212_TR_PULSE_MIN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'TR_PULSE_MIN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74065106232385808)
,p_name=>'P212_TR_REAL_DISTANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0420\0435\0430\043B\044C\043D\0430 \0434\0438\0441\0442\0430\043D\0446\0456\044F, \043A\043C')
,p_source=>'TR_REAL_DISTANCE'
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
 p_id=>wwv_flow_imp.id(74065346440385810)
,p_name=>'P212_TR_REAL_SPEED'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0420\0435\0430\043B\044C\043D\0430 \0448\0432\0438\0434\043A\0456\0441\0442\044C')
,p_source=>'TR_REAL_SPEED'
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
 p_id=>wwv_flow_imp.id(74065249458385809)
,p_name=>'P212_TR_REAL_STEP_LENGTH'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0420\0435\0430\043B\044C\043D\0430 \0434\043E\0432\0436\0438\043D\0430 \043A\0440\043E\043A\0443, \043C')
,p_source=>'TR_REAL_STEP_LENGTH'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54823507507591105)
,p_name=>'P212_TR_START'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\041F\043E\0447\0430\0442\043E\043A')
,p_format_mask=>'&APP_DTFMT_SHORT_T.'
,p_source=>'TR_START'
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
  'time_increment', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54825492925591113)
,p_name=>'P212_TR_STEPS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\041A\0440\043E\043A\0456\0432')
,p_source=>'TR_STEPS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54822758881591097)
,p_name=>'P212_TR_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_item_source_plug_id=>wwv_flow_imp.id(54822092958591088)
,p_prompt=>unistr('\0422\0438\043F')
,p_source=>'TR_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:\041F\0440\043E\0433\0443\043B\044F\043D\043A\0430;\041F\0440\043E\0433\0443\043B\044F\043D\043A\0430,\041F\0440\043E\0431\0456\0436\043A\0430;\041F\0440\043E\0431\0456\0436\043A\0430,\0412\0435\043B\043E\043F\0440\043E\0433\0443\043B\044F\043D\043A\0430;\0412\0435\043B\043E\043F\0440\043E\0433\0443\043B\044F\043D\043A\0430')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(54824651497591110)
,p_validation_name=>'P212_TR_END must be timestamp'
,p_static_id=>'p212-tr-end-must-be-timestamp'
,p_validation_sequence=>40
,p_validation=>'P212_TR_END'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(54824204465591108)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(54823848094591107)
,p_validation_name=>'P212_TR_START must be timestamp'
,p_static_id=>'p212-tr-start-must-be-timestamp'
,p_validation_sequence=>30
,p_validation=>'P212_TR_START'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(54823507507591105)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(70891715369852003)
,p_name=>'Change'
,p_static_id=>'change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P212_TR_STEPS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70891879014852004)
,p_event_id=>wwv_flow_imp.id(70891715369852003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SetStepLength'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P212_REAL_STEP_LENGTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P212_REAL_DISTANCE,P212_TR_STEPS,P212_REAL_STEP_LENGTH',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '  if :P212_REAL_DISTANCE is not null and :P212_TR_STEPS is not null then',
    '    return round(:P212_REAL_DISTANCE*1000/:P212_TR_STEPS,3);',
    '  else',
    '    return :P212_REAL_STEP_LENGTH;',
    '  end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P212_REAL_STEP_LENGTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(70891951043852005)
,p_name=>'Change'
,p_static_id=>'change_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P212_TR_END,P212_TR_START'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70892019088852006)
,p_event_id=>wwv_flow_imp.id(70891951043852005)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SetStepLength'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P212_REAL_SPEED'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P212_REAL_DISTANCE,P212_TR_END,P212_TR_START,P212_REAL_SPEED',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  l_time_int number;',
    'begin',
    '  if :P212_TR_END is not null and :P212_TR_START is not null and :P212_REAL_DISTANCE is not null then',
    '      l_time_int := (to_date(:P212_TR_END,''&APP_DTFMT_SHORT_T.'') - to_date(:P212_TR_START,''&APP_DTFMT_SHORT_T.''));',
    '      if l_time_int = 0 then l_time_int := null; end if;',
    '      return round(:P212_REAL_DISTANCE/(l_time_int*24),3);',
    '  else',
    '      return :P212_REAL_SPEED;',
    '  end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P212_REAL_SPEED'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(70892251227852008)
,p_name=>'Change'
,p_static_id=>'change_2'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P212_DURATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70892337833852009)
,p_event_id=>wwv_flow_imp.id(70892251227852008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P212_TR_END'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P212_DURATION,P212_TR_START',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '  if :P212_DURATION is not null and regexp_like(:P212_DURATION,''^([0-1][0-9]|2[0-3]):([0-5][0-9])$'') then',
    '    return to_char(to_date(:P212_TR_START,''&APP_DTFMT_SHORT_T.'')',
    '                 + (60*to_number(substr(:P212_DURATION,1,instr(:P212_DURATION,'':'')-1)) + to_number(substr(:P212_DURATION,instr(:P212_DURATION,'':'')+1)))/24/60',
    '           ,''&APP_DTFMT_SHORT_T.'');',
    '  end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P212_TR_END'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(74065549936385812)
,p_name=>'Change'
,p_static_id=>'change_3'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P212_TR_REAL_DISTANCE,P212_TR_STEPS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74065666869385813)
,p_event_id=>wwv_flow_imp.id(74065549936385812)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SetStepLength'
,p_static_id=>'setsteplength'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P212_TR_REAL_STEP_LENGTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P212_TR_REAL_DISTANCE,P212_TR_STEPS,P212_TR_REAL_STEP_LENGTH',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '  if :P212_TR_REAL_DISTANCE is not null and :P212_TR_STEPS is not null then',
    '    return round(:P212_TR_REAL_DISTANCE*1000/:P212_TR_STEPS,3);',
    '  else',
    '    return :P212_TR_REAL_STEP_LENGTH;',
    '  end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(74065714941385814)
,p_name=>'Change'
,p_static_id=>'change_4'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P212_TR_REAL_DISTANCE,P212_TR_END,P212_TR_START'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74065832917385815)
,p_event_id=>wwv_flow_imp.id(74065714941385814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SetStepLength'
,p_static_id=>'setsteplength'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P212_TR_REAL_SPEED'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P212_TR_REAL_DISTANCE,P212_TR_END,P212_TR_START,P212_TR_REAL_SPEED',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  l_time_int number;',
    'begin',
    '  if :P212_TR_END is not null and :P212_TR_START is not null and :P212_TR_REAL_DISTANCE is not null then',
    '      l_time_int := (to_date(:P212_TR_END,''&APP_DTFMT_SHORT_T.'') - to_date(:P212_TR_START,''&APP_DTFMT_SHORT_T.''));',
    '      if l_time_int = 0 then l_time_int := null; end if;',
    '      return round(:P212_TR_REAL_DISTANCE/(l_time_int*24),3);',
    '  else',
    '      return :P212_TR_REAL_SPEED;',
    '  end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54838038241598021)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P212_TR_ID := SQ_REHAB_TRAININGS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54835567474591151)
,p_internal_uid=>54838038241598021
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68081306837157031)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P212_TR_ID := SQ_REHAB_TRAININGS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70871228154707202)
,p_internal_uid=>68081306837157031
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68081772190157035)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew_1_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P212_TR_ID := SQ_REHAB_TRAININGS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(68081676169157034)
,p_internal_uid=>68081772190157035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68081407691157032)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CleanForm'
,p_static_id=>'cleanform'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70871228154707202)
,p_internal_uid=>68081407691157032
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68081518185157033)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CleanForm'
,p_static_id=>'cleanform_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70871617233708416)
,p_internal_uid=>68081518185157033
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54837190887594293)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetTitle'
,p_static_id=>'gettitle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('  if :P212_TR_ID is null then :P212_TITLE := ''\0421\0442\0432\043E\0440\0438\0442\0438 \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F''; else :P212_TITLE := ''\0420\0435\0434\0430\0433\0443\0432\0430\0442\0438 \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F''; end if;'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>54837190887594293
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54836348412591154)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form EditTraining'
,p_static_id=>'initialize-form-edittraining'
,p_internal_uid=>54836348412591154
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54837493079595384)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitNew'
,p_static_id=>'initnew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P212_TR_START := to_char(systimestamp at time zone SESSIONTIMEZONE,:APP_DTFMT_SHORT_T);',
'  :P212_TR_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
unistr('  :P212_TR_TYPE := ''\041F\0440\043E\0433\0443\043B\044F\043D\043A\0430'';'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P212_TR_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>54837493079595384
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54837775842596666)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitPrevNext'
,p_static_id=>'initprevnext'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_crcs sys_refcursor;',
'begin',
'    open l_crcs for ',
'      select /*+ noparallel index(a IDX_REHAB_TRAININGS_PAT_START)*/ TR_ID ',
'        from REHAB_TRAININGS a',
'       where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and TR_START <= to_timestamp_tz(:P212_TR_START||'' ''||sessiontimezone,:APP_DTFMT_SHORT_T||'' TZR'') and TR_ID <> :P212_TR_ID',
'       order by TR_START desc;',
'    fetch l_crcs into :P212_TR_ID_PREV;',
'    if l_crcs%notfound then :P212_TR_ID_PREV := null; end if;',
'    close l_crcs;',
'',
'    open l_crcs for ',
'      select /*+ noparallel index(a IDX_REHAB_TRAININGS_PAT_START)*/ TR_ID ',
'        from REHAB_TRAININGS a',
'       where TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and TR_START >= to_timestamp_tz(:P212_TR_START||'' ''||sessiontimezone,:APP_DTFMT_SHORT_T||'' TZR'') and TR_ID <> :P212_TR_ID',
'       order by TR_START asc;',
'    fetch l_crcs into :P212_TR_ID_NEXT;',
'    if l_crcs%notfound then :P212_TR_ID_NEXT := null; end if;',
'    close l_crcs;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>54837775842596666
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54836794482591156)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditTrainingCreate'
,p_static_id=>'process-form-edittraining'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54835567474591151)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>54836794482591156
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54792826611080118)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditTrainingSave'
,p_static_id=>'process-form-edittraining_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54835166499591150)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F \0437\043C\0456\043D\0435\043D\043E')
,p_internal_uid=>54792826611080118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54792988872080119)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditTrainingDel'
,p_static_id=>'process-form-edittraining_1_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54834719245591149)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F \0432\0438\0434\0430\043B\0435\043D\043E')
,p_internal_uid=>54792988872080119
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70891593315852001)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditTrainingSave'
,p_static_id=>'process-form-edittraining_1_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70870849216705936)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F \0437\043C\0456\043D\0435\043D\043E')
,p_internal_uid=>70891593315852001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68081228061157030)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditTrainingCreate'
,p_static_id=>'process-form-edittraining_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70871228154707202)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>68081228061157030
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(68081899209157036)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54822092958591088)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditTrainingCreate'
,p_static_id=>'process-form-edittraining_2_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(68081676169157034)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0442\0440\0435\043D\0443\0432\0430\043D\043D\044F \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>68081899209157036
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70892459329852010)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetDurationNull'
,p_static_id=>'setdurationnull'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P212_DURATION := null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>70892459329852010
);
wwv_flow_imp.component_end;
end;
/
