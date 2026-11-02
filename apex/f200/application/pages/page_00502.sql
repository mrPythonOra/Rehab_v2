prompt --application/pages/page_00502
begin
--   Manifest
--     PAGE: 00502
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
 p_id=>502
,p_name=>'Allergic'
,p_alias=>'ALLERGIC'
,p_step_title=>unistr('\0410\043B\0435\0440\0433\0456\044F')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(77159903180443870)
,p_plug_name=>'Allergic'
,p_static_id=>'allergic'
,p_title=>unistr('\0424\0430\043A\0442\0438')
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_ALLERGIC_TRIGGERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(77178028826444192)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77164735400443907)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:501:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-person-running-fast'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77166048590443913)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P502_AT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77165250624443910)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \0437\0430\043F\0438\0441\0443 \043F\0440\043E \0430\043B\043B\0435\0440\0433\0435\043D')
,p_confirm_style=>'danger'
,p_button_condition=>'P502_AT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77165640295443912)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P502_AT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(77166402955443914)
,p_branch_action=>'f?p=&APP_ID.:501:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(77166048590443913)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(78158458621597738)
,p_branch_action=>'f?p=&APP_ID.:501:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(77165250624443910)
,p_branch_sequence=>11
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(78158650449597740)
,p_branch_action=>'f?p=&APP_ID.:501:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(77165640295443912)
,p_branch_sequence=>21
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77162227613443897)
,p_name=>'P502_AT_AMOUNT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77162620866443899)
,p_name=>'P502_AT_DESCRIPTION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041E\043F\0438\0441')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77160298616443877)
,p_name=>'P502_AT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77161872915443896)
,p_name=>'P502_AT_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041D\0430\0437\0432\0430 (\0432\0441\0456)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select unique',
'  AT_NAME d,',
'  AT_NAME r',
'from REHAB_ALLERGIC_TRIGGERS',
'where at_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'order by 1'))
,p_cSize=>60
,p_cMaxlength=>512
,p_display_when=>'P502_USE_FLT'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78158367753597737)
,p_name=>'P502_AT_NAME_FLT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041D\0430\0437\0432\0430 (\0437\0430\043B\0435\0436\043D\0456)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select unique',
'  AT_NAME d,',
'  AT_NAME r',
'from REHAB_ALLERGIC_TRIGGERS',
'where at_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'  and AT_TYPE = :P502_AT_TYPE',
'order by 1'))
,p_lov_cascade_parent_items=>'P502_AT_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>60
,p_cMaxlength=>512
,p_display_when=>'P502_USE_FLT'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77067334009873135)
,p_name=>'P502_AT_PAT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PATIENTS.PAT_NAME'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77160608953443882)
,p_name=>'P502_AT_TS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\0417\0430\043F\0438\0441\0430\043D\043E')
,p_format_mask=>'&APP_DTFMT_MON_T.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
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
 p_id=>wwv_flow_imp.id(77161439877443891)
,p_name=>'P502_AT_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\0422\0438\043F')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select unique',
'  AT_TYPE d,',
'  AT_TYPE r',
'from REHAB_ALLERGIC_TRIGGERS',
'where at_pat_id = REHAB_CONTEXT_PKG.getPATIENT()',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77067103368873133)
,p_name=>'P502_NEW_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041D\043E\0432\0430 \043D\0430\0437\0432\0430 (\0432\0441\0456)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P502_USE_FLT'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78158724343597741)
,p_name=>'P502_NEW_NAME_FLT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041D\043E\0432\0430 \043D\0430\0437\0432\0430 (\0437\0430\043B\0435\0436\043D\0456)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P502_USE_FLT'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77066926246873131)
,p_name=>'P502_NEW_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_prompt=>unistr('\041D\043E\0432\0438\0439 \0442\0438\043F')
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
 p_id=>wwv_flow_imp.id(78158213034597736)
,p_name=>'P502_USE_FLT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(77159903180443870)
,p_item_default=>'N'
,p_prompt=>unistr('\0412\0438\043A\043E\0440\0438\0441\0442\043E\0432\0443\0432\0430\0442\0438 \0444\0456\043B\044C\0442\0440')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:\041F\043E\043A\0430\0437\0443\0432\0430\0442\0438 \0432\0441\0456;N,\041F\043E\043A\0430\0437\0443\0432\0430\0442\0438 \0437\0430\043B\0435\0436\043D\0456;Y')
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'number_of_columns', '2',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(77161022743443889)
,p_validation_name=>'P502_AT_TS must be timestamp'
,p_static_id=>'p502-at-ts-must-be-timestamp'
,p_validation_sequence=>10
,p_validation=>'P502_AT_TS'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(77160608953443882)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77066852016873130)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P502_AT_ID := SQ_rehab_allergic_triggers.nextval;',
'  --:P502_AT_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77166048590443913)
,p_process_when=>'P502_AT_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>77066852016873130
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78159451296597748)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select',
'     AT_PAT_ID, to_char(AT_TS at time zone SESSIONTIMEZONE,''&APP_DTFMT_MON_T.''), AT_TYPE, AT_NAME, AT_AMOUNT, AT_DESCRIPTION',
'  into',
'     :P502_AT_PAT_ID, :P502_AT_TS, :P502_AT_TYPE, :P502_AT_NAME, :P502_AT_AMOUNT, :P502_AT_DESCRIPTION',
'  from REHAB_ALLERGIC_TRIGGERS',
'  where AT_ID = :P502_AT_ID;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P502_AT_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>78159451296597748
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77166823798443917)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(77159903180443870)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Allergic'
,p_static_id=>'initialize-form-allergic'
,p_process_when=>'P502_AT_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>77166823798443917
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77067535914873137)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitNew'
,p_static_id=>'initnew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P502_AT_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P502_AT_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>77067535914873137
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77067267807873134)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NewNameInsert'
,p_static_id=>'newname'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P502_USE_FLT = ''N'' then',
'      if :P502_NEW_NAME is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME;',
'          :P502_NEW_NAME := null;',
'      else',
'          null;',
'      end if;',
'  end if;',
'  if :P502_USE_FLT = ''Y'' then',
'      if :P502_NEW_NAME_FLT is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME_FLT;',
'          :P502_NEW_NAME_FLT := null;',
'      else',
'          :P502_AT_NAME := :P502_AT_NAME_FLT;',
'      end if;',
'  end if;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77166048590443913)
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>77067267807873134
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78158966031597743)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NewNameUpdate'
,p_static_id=>'newnameupdate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P502_USE_FLT = ''N'' then',
'      if :P502_NEW_NAME is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME;',
'          :P502_NEW_NAME := null;',
'      else',
'          null;',
'      end if;',
'  end if;',
'  if :P502_USE_FLT = ''Y'' then',
'      if :P502_NEW_NAME_FLT is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME_FLT;',
'          :P502_NEW_NAME_FLT := null;',
'      else',
'          :P502_AT_NAME := :P502_AT_NAME_FLT;',
'      end if;',
'  end if;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77165640295443912)
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>78158966031597743
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77067085798873132)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NewTypeInsert'
,p_static_id=>'newtype'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P502_AT_TYPE := :P502_NEW_TYPE;',
'  :P502_NEW_TYPE := null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77166048590443913)
,p_process_when=>'P502_NEW_TYPE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>77067085798873132
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78159092589597744)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NewTypeUpdate'
,p_static_id=>'newtypeupdate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P502_AT_TYPE := :P502_NEW_TYPE;',
'  :P502_NEW_TYPE := null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77165640295443912)
,p_process_when=>'P502_NEW_TYPE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>78159092589597744
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78159573814597749)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process DML Insert Button'
,p_static_id=>'process-dml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P502_NEW_TYPE is not null then',
'      :P502_AT_TYPE := :P502_NEW_TYPE;',
'      :P502_NEW_TYPE := null;',
'  end if;',
'  -----------------------------------------------------------',
'  if :P502_USE_FLT = ''N'' then',
'      if :P502_NEW_NAME is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME;',
'          :P502_NEW_NAME := null;',
'      else',
'          null;',
'      end if;',
'  end if;',
'  if :P502_USE_FLT = ''Y'' then',
'      if :P502_NEW_NAME_FLT is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME_FLT;',
'          :P502_NEW_NAME_FLT := null;',
'      else',
'          :P502_AT_NAME := :P502_AT_NAME_FLT;',
'      end if;',
'  end if;',
'  -----------------------------------------------------------',
'  if :P502_AT_ID is null then',
'    :P502_AT_ID := SQ_rehab_allergic_triggers.nextval;',
'        INSERT INTO rehab_allergic_triggers (',
'                       at_id,       at_pat_id,       at_ts,       at_type,       at_name,       at_amount,      at_description) ',
'        VALUES ( :P502_AT_ID, :P502_AT_PAT_ID, to_timestamp_tz(:P502_AT_TS||'' ''||sessiontimezone,''&APP_DTFMT_MON_T. TZR''), :P502_AT_TYPE, :P502_AT_NAME, :P502_AT_AMOUNT, :P502_AT_DESCRIPTION  );',
'  else',
'    UPDATE rehab_allergic_triggers',
'    SET',
'        AT_TS = to_timestamp_tz(:P502_AT_TS||'' ''||sessiontimezone,''&APP_DTFMT_MON_T. TZR''),',
'        AT_TYPE = :P502_AT_TYPE,',
'        AT_NAME = :P502_AT_NAME,',
'        AT_AMOUNT = :P502_AT_AMOUNT,',
'        AT_DESCRIPTION = :P502_AT_DESCRIPTION',
'    WHERE',
'            at_id = :P502_AT_ID;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77166048590443913)
,p_internal_uid=>78159573814597749
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82674217464848001)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process DML Delete Button'
,p_static_id=>'process-dml-delete-button'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    delete from rehab_allergic_triggers',
'    WHERE at_id = :P502_AT_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77165250624443910)
,p_internal_uid=>82674217464848001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78159600535597750)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process DML Update Button'
,p_static_id=>'process-dml_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P502_NEW_TYPE is not null then',
'      :P502_AT_TYPE := :P502_NEW_TYPE;',
'      :P502_NEW_TYPE := null;',
'  end if;',
'  -----------------------------------------------------------',
'  if :P502_USE_FLT = ''N'' then',
'      if :P502_NEW_NAME is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME;',
'          :P502_NEW_NAME := null;',
'      else',
'          null;',
'      end if;',
'  end if;',
'  if :P502_USE_FLT = ''Y'' then',
'      if :P502_NEW_NAME_FLT is not null then',
'          :P502_AT_NAME := :P502_NEW_NAME_FLT;',
'          :P502_NEW_NAME_FLT := null;',
'      else',
'          :P502_AT_NAME := :P502_AT_NAME_FLT;',
'      end if;',
'  end if;',
'  -----------------------------------------------------------',
'  if :P502_AT_ID is null then',
'    :P502_AT_ID := SQ_rehab_allergic_triggers.nextval;',
'        INSERT INTO rehab_allergic_triggers (',
'                       at_id,       at_pat_id,       at_ts,       at_type,       at_name,       at_amount,      at_description) ',
'        VALUES ( :P502_AT_ID, :P502_AT_PAT_ID, to_timestamp_tz(:P502_AT_TS||'' ''||sessiontimezone,''&APP_DTFMT_MON_T. TZR''), :P502_AT_TYPE, :P502_AT_NAME, :P502_AT_AMOUNT, :P502_AT_DESCRIPTION  );',
'  else',
'    UPDATE rehab_allergic_triggers',
'    SET',
'        AT_TS = to_timestamp_tz(:P502_AT_TS||'' ''||sessiontimezone,''&APP_DTFMT_MON_T. TZR''),',
'        AT_TYPE = :P502_AT_TYPE,',
'        AT_NAME = :P502_AT_NAME,',
'        AT_AMOUNT = :P502_AT_AMOUNT,',
'        AT_DESCRIPTION = :P502_AT_DESCRIPTION',
'    WHERE',
'            at_id = :P502_AT_ID;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77165640295443912)
,p_internal_uid=>78159600535597750
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77167201056443924)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(77159903180443870)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Allergic Insert'
,p_static_id=>'process-form-allergic'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>77167201056443924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78159202691597746)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(77159903180443870)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Allergic Delete'
,p_static_id=>'process-form-allergic-delete'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77165250624443910)
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>78159202691597746
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78159188206597745)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(77159903180443870)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Allergic Update'
,p_static_id=>'process-form-allergic-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77165640295443912)
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>78159188206597745
);
wwv_flow_imp.component_end;
end;
/
