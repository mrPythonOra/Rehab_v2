prompt --application/pages/page_00304
begin
--   Manifest
--     PAGE: 00304
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
 p_id=>304
,p_name=>'InventoryItem'
,p_alias=>'INVENTORYITEM'
,p_step_title=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0432 \0441\043A\0440\0438\043D\0456')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72145583968455904)
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
 p_id=>wwv_flow_imp.id(72112610582258217)
,p_plug_name=>'Data'
,p_static_id=>'data'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
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
'  where DA_DS_ID in (select P2S_DS_ID from REHAB_PATIENT2STORAGES where P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT())'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73116221282557362)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-person-running-fast'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73115432431555068)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73114651652551853)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \0437\0430\043F\0438\0441\0443 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0432 \0441\043A\0440\0438\043D\0456')
,p_confirm_style=>'danger'
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73115801147556339)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(73054964274651228)
,p_branch_name=>'302'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(73114651652551853)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73053654533651215)
,p_name=>'P304_DA_BEST_BEFORE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\0412\0436\0438\0442\0438 \0434\043E')
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_source=>'DA_BEST_BEFORE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(73053501576651214)
,p_name=>'P304_DA_CHECK_POINT_DT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\0417\0430\043D\0435\0441\0435\043D\043E')
,p_source=>'DA_CHECK_POINT_DT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(73053323675651212)
,p_name=>'P304_DA_COST'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\0426\0456\043D\0430 \043F\0430\043A\0435\0442\0443, \0433\0440\043D')
,p_source=>'DA_COST'
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
 p_id=>wwv_flow_imp.id(73052551547651204)
,p_name=>'P304_DA_DR_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_source=>'DA_DR_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_DRUGS.DR_NAME'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73052432301651203)
,p_name=>'P304_DA_DS_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\0421\043A\0440\0438\043D\044F \0437\0431\0435\0440\0456\0433\0430\043D\043D\044F')
,p_source=>'DA_DS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_DRUG_STORAGES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73053214412651211)
,p_name=>'P304_DA_ENTIRY_WEIGHT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C \0434\0456\044E\0447\043E\0457 \0440\0435\0447\043E\0432\0438\043D\0438, \043C\0433')
,p_source=>'DA_ENTIRY_WEIGHT'
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
 p_id=>wwv_flow_imp.id(73052364270651202)
,p_name=>'P304_DA_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_source=>'DA_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73053087309651209)
,p_name=>'P304_DA_ORDER_TYPE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\0422\0438\043F \043F\0440\0438\0445\043E\0434\0443')
,p_source=>'DA_ORDER_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_ORDER_TYPES'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73052995693651208)
,p_name=>'P304_DA_PRATR_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041F\0435\0440\0456\043E\0434 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'DA_PRATR_ID'
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
 p_id=>wwv_flow_imp.id(73052606955651205)
,p_name=>'P304_DA_PRR_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'DA_PRR_ID'
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
 p_id=>wwv_flow_imp.id(73052780943651206)
,p_name=>'P304_DA_PR_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443')
,p_source=>'DA_PR_ID'
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
 p_id=>wwv_flow_imp.id(73053498818651213)
,p_name=>'P304_DA_PURCHASED'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041F\0440\0438\0434\0431\0430\043D\043E')
,p_source=>'DA_PURCHASED'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(73053126507651210)
,p_name=>'P304_DA_QUANTITY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C \0442\0430\0431\043B\0435\0442\043E\043A')
,p_source=>'DA_QUANTITY'
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
 p_id=>wwv_flow_imp.id(73052895453651207)
,p_name=>'P304_DA_WS_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_source=>'DA_WS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_WORKING_SUBSTANCE.WS_NAME'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73057119600651250)
,p_name=>'P304_IS_OWNER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(73054819804651227)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeInsert'
,p_static_id=>'beforeinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P304_DA_ID := SQ_REHAB_DRUG_ACCOUNTINGS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P304_DA_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>73054819804651227
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(73054709828651226)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormInsert'
,p_static_id=>'forminsert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>73054709828651226
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(74064489082385801)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'null; ',
'    select ',
'        P2S_IS_OWNER into :P304_IS_OWNER',
'    FROM',
'        REHAB_PATIENT2STORAGES',
'    where P2S_DS_ID = :P304_DA_DS_ID and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>74064489082385801
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(73052293625651201)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form InventoryItem'
,p_static_id=>'initialize-form-inventoryitem'
,p_internal_uid=>73052293625651201
);
wwv_flow_imp.component_end;
end;
/
