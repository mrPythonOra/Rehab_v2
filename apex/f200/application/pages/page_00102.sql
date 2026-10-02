prompt --application/pages/page_00102
begin
--   Manifest
--     PAGE: 00102
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
 p_id=>102
,p_name=>'ConsumeMed'
,p_alias=>'CONSUMEMED'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('\0421\043F\043E\0436\0438\0432\0430\043D\043D\044F \043B\0456\043A\0456\0432')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44054742797422931)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44055059040422934)
,p_button_sequence=>20
,p_button_name=>'Consume'
,p_static_id=>'add'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>unistr('\0421\043F\043E\0436\0438\0442\0438')
,p_button_condition=>'P102_DRU_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-plus-square-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44056024922422944)
,p_button_sequence=>30
,p_button_name=>'ConsumeNow'
,p_static_id=>'consumenow'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>unistr('\0421\043F\043E\0436\0438\0442\0438 \0437\0430\0440\0430\0437')
,p_button_condition=>'P102_DRU_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-plus-square-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44055274546422936)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_button_name=>'Remove'
,p_static_id=>'remove'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_confirm_message=>unistr('\0406\043D\0444\043E\0440\043C\0430\0446\0456\044F \043F\0440\043E \0441\043F\043E\0436\0438\0432\0430\043D\043D\044F \0431\0443\0434\0435 \0432\0438\0434\0430\043B\0435\043D\0430')
,p_confirm_style=>'warning'
,p_button_condition=>'P102_DRU_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44055175690422935)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_button_name=>'Modify'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>unistr('\0417\043C\0456\043D\0438\0442\0438')
,p_button_position=>'CHANGE'
,p_button_condition=>'P102_DRU_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-edit'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(44055951787422943)
,p_branch_name=>'BackToDrugUseDashb'
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44055593674422939)
,p_name=>'P102_CONSUMED_DOSE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_prompt=>unistr('\0414\043E\0437\0430, \043C\0433')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '10000',
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44055414307422938)
,p_name=>'P102_CONSUMED_DT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_prompt=>unistr('\0421\043F\043E\0436\0438\0442\043E')
,p_format_mask=>'&APP_DTFMT_SHORT_T.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(50418893992367239)
,p_name=>'P102_DRU_CPTR_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_prompt=>unistr('\0412\0456\043A\043D\043E \0441\043F\043E\0436\0438\0432\0430\043D\043D\044F')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'GD_TIME_RANGES_AVAILABLE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50419158072370076)
,p_name=>'P102_DRU_DR_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44054869056422932)
,p_name=>'P102_DRU_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50418281745363154)
,p_name=>'P102_DRU_PRD_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50418597571365542)
,p_name=>'P102_DRU_PR_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(44054742797422931)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50426655767451531)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consume'
,p_static_id=>'consumenow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P102_DRU_ID is null then',
'      REHAB_DRUGUSE_PKG.consume_drug (  ',
'            P_DRU_PRD_ID => :P102_DRU_PRD_ID,',
'            P_DRU_PR_ID => :P102_DRU_PR_ID,',
'            P_DRU_CPTR_ID => :P102_DRU_CPTR_ID,',
'            P_DRU_DR_ID => :P102_DRU_DR_ID,',
'            P_DRU_CONSUMED => to_date(:P102_CONSUMED_DT,:APP_DTFMT_SHORT_T),',
'            P_DRU_ACTUAL_DOSAGE => :P102_CONSUMED_DOSE) ; ',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44055059040422934)
,p_process_when=>'P102_DRU_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>unistr('\0406\043D\0444\043E\0440\043C\0430\0446\0456\044E \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_internal_uid=>50426655767451531
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44056187697422945)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsumeNow'
,p_static_id=>'consumenow_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P102_DRU_ID is null then',
'      :P102_CONSUMED_DT := to_char(systimestamp at time zone SESSIONTIMEZONE,:APP_DTFMT_SHORT_T);',
'      REHAB_DRUGUSE_PKG.consume_drug (  ',
'            P_DRU_PRD_ID => :P102_DRU_PRD_ID,',
'            P_DRU_PR_ID => :P102_DRU_PR_ID,',
'            P_DRU_CPTR_ID => :P102_DRU_CPTR_ID,',
'            P_DRU_DR_ID => :P102_DRU_DR_ID,',
'            P_DRU_CONSUMED => to_date(:P102_CONSUMED_DT,:APP_DTFMT_SHORT_T),',
'            P_DRU_ACTUAL_DOSAGE => :P102_CONSUMED_DOSE) ; ',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44056024922422944)
,p_process_when=>'P102_DRU_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>unistr('\0406\043D\0444\043E\0440\043C\0430\0446\0456\044E \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_internal_uid=>44056187697422945
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44055611552422940)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P102_DRU_ID is null then',
'    select PRD_DOSAGE into :P102_CONSUMED_DOSE',
'    from REHAB_PRESCRIPTIONS_DETAILS where PRD_ID = :P102_DRU_PRD_ID;',
'    :P102_CONSUMED_DT := nvl2(:P102_CONSUMED_DT, :P102_CONSUMED_DT, to_char(systimestamp at time zone SESSIONTIMEZONE,''&APP_DTFMT_SHORT_T.''));',
'  else',
'    select DRU_ACTUAL_DOSAGE, to_char(DRU_CONSUMED at time zone SESSIONTIMEZONE,''&APP_DTFMT_SHORT_T.'') into :P102_CONSUMED_DOSE, :P102_CONSUMED_DT',
'    from REHAB_DRUG_USES where DRU_ID = :P102_DRU_ID;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>44055611552422940
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44055733566422941)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Modify'
,p_static_id=>'modify'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P102_DRU_ID is not null then',
'      REHAB_DRUGUSE_PKG.modify_drug_use (  ',
'            P_DRU_ID => :P102_DRU_ID,',
'            P_DRU_CONSUMED => to_date(:P102_CONSUMED_DT,:APP_DTFMT_SHORT_T),',
'            P_DRU_ACTUAL_DOSAGE => :P102_CONSUMED_DOSE) ; ',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44055175690422935)
,p_process_when=>'P102_DRU_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\0417\043C\0456\043D\0443 \0456\043D\0444\043E\0440\043C\0430\0446\0456\0457 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_internal_uid=>44055733566422941
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44055866863422942)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove'
,p_static_id=>'remove'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P102_DRU_ID is not null then',
'      REHAB_DRUGUSE_PKG.remove_drug_use (  ',
'            P_DRU_ID => :P102_DRU_ID) ; ',
'    :P102_CONSUMED_DT := null;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44055274546422936)
,p_process_when=>'P102_DRU_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\0406\043D\0444\043E\0440\043C\0430\0446\0456\044E \0432\0438\0434\0430\043B\0435\043D\043E')
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_internal_uid=>44055866863422942
);
wwv_flow_imp.component_end;
end;
/
