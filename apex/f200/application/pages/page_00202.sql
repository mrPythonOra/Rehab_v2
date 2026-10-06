prompt --application/pages/page_00202
begin
--   Manifest
--     PAGE: 00202
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
 p_id=>202
,p_name=>'EditMeasurement'
,p_alias=>'EDITMEASUREMENT'
,p_step_title=>'&P202_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54762334062912816)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_title=>'&P202_TITLE.'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(16870387633504251)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54763137910912973)
,p_plug_name=>'EditMeasurement'
,p_static_id=>'editmeasurement'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_MEASUREMENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54772449535913087)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:201:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54773739126913093)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P202_MT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54772949069913090)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \0437\0430\043F\0438\0441\0443 \043F\0440\043E \0432\0438\043C\0456\0440')
,p_confirm_style=>'danger'
,p_button_condition=>'P202_MT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54690006234388150)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_button_name=>'Prev'
,p_static_id=>'new'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041F\043E\043F\0435\0440\0435\0434\043D\0456\0439')
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_button_condition=>'P202_MT_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54791115676080101)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_button_name=>'Next'
,p_static_id=>'new-1'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041D\0430\0441\0442\0443\043F\043D\0438\0439')
,p_button_position=>'NEXT'
,p_button_condition=>'P202_MT_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54773397698913092)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P202_MT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54774196079913094)
,p_branch_action=>'f?p=&APP_ID.:201:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54791696107080106)
,p_branch_name=>'Prev'
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::P202_MT_ID:&P202_MT_ID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(54690006234388150)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54791807343080108)
,p_branch_name=>'Next'
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::P202_MT_ID:&P202_MT_ID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(54791115676080101)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54768497155913072)
,p_name=>'P202_MT_DESCR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\041E\043F\0438\0441')
,p_source=>'MT_DESCR'
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
 p_id=>wwv_flow_imp.id(54763469173912975)
,p_name=>'P202_MT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_source=>'MT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54791343440080103)
,p_name=>'P202_MT_ID_NEXT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54791289476080102)
,p_name=>'P202_MT_ID_PREV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54767697041913070)
,p_name=>'P202_MT_OXIGENATION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0420\0456\0432\0435\043D\044C \043A\0438\0441\044C\043D\044E')
,p_source=>'MT_OXIGENATION'
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
 p_id=>wwv_flow_imp.id(54763887793912984)
,p_name=>'P202_MT_PAT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442')
,p_source=>'MT_PAT_ID'
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
 p_id=>wwv_flow_imp.id(54766032059913033)
,p_name=>'P202_MT_PRESSURE_DIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0422\0438\0441\043A Dia')
,p_source=>'MT_PRESSURE_DIA'
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
 p_id=>wwv_flow_imp.id(54765254866913030)
,p_name=>'P202_MT_PRESSURE_LR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0422\0438\0441\043A \043D\0430 \0440\0443\0446\0456')
,p_source=>'MT_PRESSURE_LR'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:\041B\0456\0432\0430;L,\041F\0440\0430\0432\0430;R')
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54765648197913031)
,p_name=>'P202_MT_PRESSURE_SYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0422\0438\0441\043A Sys')
,p_source=>'MT_PRESSURE_SYS'
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
 p_id=>wwv_flow_imp.id(54766451653913034)
,p_name=>'P202_MT_PULSE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\041F\0443\043B\044C\0441')
,p_source=>'MT_PULSE'
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
 p_id=>wwv_flow_imp.id(54767223558913068)
,p_name=>'P202_MT_SUGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0420\0456\0432\0435\043D\044C \0446\0443\043A\0440\0443')
,p_source=>'MT_SUGAR'
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
 p_id=>wwv_flow_imp.id(54764405992913025)
,p_name=>'P202_MT_TAKEN'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0412\0438\043C\0456\0440\044F\043D\043E')
,p_format_mask=>'&APP_DTFMT_SHORT_T.'
,p_source=>'MT_TAKEN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1610598484065263269
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
 p_id=>wwv_flow_imp.id(54766820832913036)
,p_name=>'P202_MT_TEMPERATURE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0422\0435\043C\043F\0435\0440\0430\0442\0443\0440\0430')
,p_source=>'MT_TEMPERATURE'
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
 p_id=>wwv_flow_imp.id(54768067593913071)
,p_name=>'P202_MT_WEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_item_source_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_prompt=>unistr('\0412\0430\0433\0430')
,p_source=>'MT_WEIGHT'
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
 p_id=>wwv_flow_imp.id(54689805958388148)
,p_name=>'P202_TITLE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(54763137910912973)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(54764850534913027)
,p_validation_name=>'P202_MT_TAKEN must be timestamp'
,p_static_id=>'p202-mt-taken-must-be-timestamp'
,p_validation_sequence=>20
,p_validation=>'P202_MT_TAKEN'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(54764405992913025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54791971848080109)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P202_MT_ID := SQ_REHAB_MEASUREMENTS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54773739126913093)
,p_internal_uid=>54791971848080109
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54689919341388149)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetTitle'
,p_static_id=>'gettitle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('  if :P202_MT_ID is null then :P202_TITLE := ''\0421\0442\0432\043E\0440\0438\0442\0438 \0432\0438\043C\0456\0440''; else :P202_TITLE := ''\0420\0435\0434\0430\0433\0443\0432\0430\0442\0438 \0432\0438\043C\0456\0440''; end if;'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>54689919341388149
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54774586290913097)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(54763137910912973)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form EditMeasurement'
,p_static_id=>'initialize-form-editmeasurement'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'next_primary_key_items', 'P202_MT_ID_NEXT',
  'previous_primary_key_items', 'P202_MT_ID_PREV')).to_clob
,p_internal_uid=>54774586290913097
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54792052421080110)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitNew'
,p_static_id=>'initnew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P202_MT_TAKEN := to_char(systimestamp at time zone SESSIONTIMEZONE,:APP_DTFMT_SHORT_T);',
'  :P202_MT_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
'  :P202_MT_PRESSURE_LR := ''L'';',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P202_MT_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>54792052421080110
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54791422773080104)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitPrevNext'
,p_static_id=>'initprevnext'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_crcs sys_refcursor;',
'begin',
'    open l_crcs for ',
'      select /*+ noparallel index(a IDX_REHAB_MEASUREMENTS_PAT_TAKEN)*/ mt_id ',
'        from rehab_measurements a',
'       where mt_pat_id = REHAB_CONTEXT_PKG.getPATIENT() and mt_taken <= to_timestamp_tz(:P202_MT_TAKEN||'' ''||sessiontimezone,:APP_DTFMT_SHORT_T||'' TZR'') and mt_id <> :P202_MT_ID',
'       order by mt_taken desc;',
'    fetch l_crcs into :P202_MT_ID_PREV;',
'    if l_crcs%notfound then :P202_MT_ID_PREV := null; end if;',
'    close l_crcs;',
'',
'    open l_crcs for ',
'      select /*+ noparallel index(a IDX_REHAB_MEASUREMENTS_PAT_TAKEN)*/ mt_id ',
'        from rehab_measurements a',
'       where mt_pat_id = REHAB_CONTEXT_PKG.getPATIENT() and mt_taken >= to_timestamp_tz(:P202_MT_TAKEN||'' ''||sessiontimezone,:APP_DTFMT_SHORT_T||'' TZR'') and mt_id <> :P202_MT_ID',
'       order by mt_taken asc;',
'    fetch l_crcs into :P202_MT_ID_NEXT;',
'    if l_crcs%notfound then :P202_MT_ID_NEXT := null; end if;',
'    close l_crcs;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>54791422773080104
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54774977027913100)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54763137910912973)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditMeasurement'
,p_static_id=>'process-form-editmeasurement'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54773739126913093)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0432\0438\043C\0456\0440 \0441\0442\0432\043E\0440\0435\043D\043E')
,p_internal_uid=>54774977027913100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54792254801080112)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54763137910912973)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditMeasurement'
,p_static_id=>'process-form-editmeasurement_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54773397698913092)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0432\0438\043C\0456\0440 \0437\043C\0456\043D\0435\043D\043E')
,p_internal_uid=>54792254801080112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54792325077080113)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(54763137910912973)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EditMeasurement'
,p_static_id=>'process-form-editmeasurement_1_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(54772949069913090)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \0432\0438\043C\0456\0440 \0432\0438\0434\0430\043B\0435\043D\043E')
,p_internal_uid=>54792325077080113
);
wwv_flow_imp.component_end;
end;
/
