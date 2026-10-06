prompt --application/pages/page_00222
begin
--   Manifest
--     PAGE: 00222
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
 p_id=>222
,p_name=>'EditWatchLog'
,p_alias=>'EDITWATCHLOG'
,p_step_title=>'&P222_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56061852635263512)
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
 p_id=>wwv_flow_imp.id(56062620222263661)
,p_plug_name=>'EditWatchLog'
,p_static_id=>'editwatchlog'
,p_title=>'&P222_TITLE.'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_WATCH_LOGS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56071084865263702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:221:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56072251246263707)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P222_WL_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56071409608263705)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0432\0442\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \0437\0430\043F\0438\0441\0443 \0442\0440\0435\043A\0435\0440\0430')
,p_confirm_style=>'danger'
,p_button_condition=>'P222_WL_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56080989323335174)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_button_name=>'Next'
,p_static_id=>'next'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041D\0430\0441\0442\0443\043F\043D\0438\0439')
,p_button_position=>'NEXT'
,p_button_condition=>'P222_WL_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56080537964333717)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_button_name=>'Prev'
,p_static_id=>'prev'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041F\043E\043F\0435\0440\0435\0434\043D\0456\0439')
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_button_condition=>'P222_WL_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56071800946263706)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P222_WL_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54794253942080132)
,p_branch_name=>'Next'
,p_branch_action=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.::P222_WL_ID:&P222_WL_ID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(56080989323335174)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(56072660527263708)
,p_branch_action=>'f?p=&APP_ID.:221:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(56081649404340884)
,p_branch_name=>'Prev'
,p_branch_action=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.::P222_WL_ID:&P222_WL_ID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(56080537964333717)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54793963160080129)
,p_name=>'P222_TITLE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56066132895263686)
,p_name=>'P222_WL_CALM_AVG_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E')
,p_source=>'WL_CALM_AVG_PULSE'
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
 p_id=>wwv_flow_imp.id(56062917090263663)
,p_name=>'P222_WL_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_source=>'WL_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54794124447080131)
,p_name=>'P222_WL_ID_NEXT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54794088192080130)
,p_name=>'P222_WL_ID_PREV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56065795993263684)
,p_name=>'P222_WL_NIGHT_AVG_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\0421\0435\0440\0435\0434\043D\0456\0439 \043D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'WL_NIGHT_AVG_PULSE'
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
 p_id=>wwv_flow_imp.id(56065370342263683)
,p_name=>'P222_WL_NIGHT_MAX_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \043D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'WL_NIGHT_MAX_PULSE'
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
 p_id=>wwv_flow_imp.id(56064931272263682)
,p_name=>'P222_WL_NIGHT_MIN_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \043D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'WL_NIGHT_MIN_PULSE'
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
 p_id=>wwv_flow_imp.id(56063344036263671)
,p_name=>'P222_WL_PAT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442')
,p_source=>'WL_PAT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PATIENTS.PAT_NAME'
,p_lov_display_null=>'YES'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56064538284263680)
,p_name=>'P222_WL_STEPS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\041A\0440\043E\043A\0438')
,p_source=>'WL_STEPS'
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
 p_id=>wwv_flow_imp.id(56063758968263677)
,p_name=>'P222_WL_TAKEN'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\0421\0442\0432\043E\0440\0435\043D\043E')
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_source=>'WL_TAKEN'
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
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56066540414263687)
,p_name=>'P222_WL_TOTAL_AVG_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\0414\043E\0431\043E\0432\0438\0439 \0441\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441')
,p_source=>'WL_TOTAL_AVG_PULSE'
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
 p_id=>wwv_flow_imp.id(56067331083263690)
,p_name=>'P222_WL_TOTAL_MAX_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\0414\043E\0431\043E\0432\0438\0439 \043C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'WL_TOTAL_MAX_PULSE'
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
 p_id=>wwv_flow_imp.id(56066984477263689)
,p_name=>'P222_WL_TOTAL_MIN_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_item_source_plug_id=>wwv_flow_imp.id(56062620222263661)
,p_prompt=>unistr('\0414\043E\0431\043E\0432\0438\0439 \043C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441')
,p_source=>'WL_TOTAL_MIN_PULSE'
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(56064181563263679)
,p_validation_name=>'P222_WL_TAKEN must be timestamp'
,p_static_id=>'p222-wl-taken-must-be-timestamp'
,p_validation_sequence=>20
,p_validation=>'P222_WL_TAKEN'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(56063758968263677)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56081213413338342)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P222_WL_ID := SQ_REHAB_WATCH_LOGS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56072251246263707)
,p_internal_uid=>56081213413338342
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56079545271323307)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetTitle'
,p_static_id=>'gettitle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('  if :P222_WL_ID is null then :P222_TITLE := ''\0421\0442\0432\043E\0440\0438\0442\0438 \0442\0440\0435\043A\0435\0440''; else :P222_TITLE := ''\0420\0435\0434\0430\0433\0443\0432\0430\0442\0438 \0442\0440\0435\043A\0435\0440''; end if;'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>56079545271323307
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56073000105263711)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(56062620222263661)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form EditWatchLog'
,p_static_id=>'initialize-form-editwatchlog'
,p_internal_uid=>56073000105263711
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56079813900324317)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitNew'
,p_static_id=>'initnew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P222_WL_TAKEN := to_char(systimestamp at time zone SESSIONTIMEZONE,:APP_DTFMT_DATE);',
'  :P222_WL_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P222_WL_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>56079813900324317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56080185258325281)
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
'      select /*+ noparallel index(a IDX_REHAB_WATCH_LOGS_PAT_TAKEN)*/ WL_ID ',
'        from REHAB_WATCH_LOGS a',
'       where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and WL_TAKEN <= to_timestamp_tz(:P222_WL_TAKEN||'' ''||sessiontimezone,:APP_DTFMT_DATE||'' TZR'') and WL_ID <> :P222_WL_ID',
'       order by WL_TAKEN desc;',
'    fetch l_crcs into :P222_WL_ID_PREV;',
'    if l_crcs%notfound then :P222_WL_ID_PREV := null; end if;',
'    close l_crcs;',
'',
'    open l_crcs for ',
'      select /*+ noparallel index(a IDX_REHAB_WATCH_LOGS_PAT_TAKEN)*/ WL_ID ',
'        from REHAB_WATCH_LOGS a',
'       where WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() and WL_TAKEN >= to_timestamp_tz(:P222_WL_TAKEN||'' ''||sessiontimezone,:APP_DTFMT_DATE||'' TZR'') and WL_ID <> :P222_WL_ID',
'       order by WL_TAKEN asc;',
'    fetch l_crcs into :P222_WL_ID_NEXT;',
'    if l_crcs%notfound then :P222_WL_ID_NEXT := null; end if;',
'    close l_crcs;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>56080185258325281
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56073411660263713)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56062620222263661)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditWatchLog'
,p_static_id=>'process-form-editwatchlog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56072251246263707)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \0442\0440\0435\043A\0435\0440\0430 \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>56073411660263713
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54794337699080133)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56062620222263661)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditWatchLog'
,p_static_id=>'process-form-editwatchlog_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56071800946263706)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \0442\0440\0435\043A\0435\0440\0430 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>54794337699080133
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54794478983080134)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56062620222263661)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditWatchLog'
,p_static_id=>'process-form-editwatchlog_1_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56071409608263705)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \0442\0440\0435\043A\0435\0440\0430 \0432\0438\0434\0430\043B\0435\043D\043E')
,p_internal_uid=>54794478983080134
);
wwv_flow_imp.component_end;
end;
/
