prompt --application/pages/page_00303
begin
--   Manifest
--     PAGE: 00303
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
 p_id=>303
,p_name=>'Storage'
,p_alias=>'STORAGE'
,p_step_title=>unistr('\0421\043A\0440\0438\043D\044F \0434\043B\044F \043B\0456\043A\0456\0432')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70921089710611440)
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
 p_id=>wwv_flow_imp.id(70921853696611609)
,p_plug_name=>'Storage'
,p_static_id=>'storage'
,p_title=>unistr('\0421\043A\0440\0438\043D\044F \0434\043B\044F \043B\0456\043A\0456\0432')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DS_ID,',
'       DS_TE_ID,',
'       DS_NAME,',
'       DS_DESCRIPTION,',
'       DS_CREATED,',
'       DS_UPDATED',
'  from REHAB_DRUG_STORAGES'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70927119246611649)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-person-running-fast'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70928410649611654)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0435\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P303_DS_ID is null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70927683387611652)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>':P303_DS_ID is not null and :P303_P2S_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-minus-square-o'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70928061271611653)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0435\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P303_DS_ID is not null and :P303_P2S_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(70928871959611656)
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.::P302_DS_ID_CURR:&P303_DS_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70894044236852026)
,p_name=>'P303_CANVIEW'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_prompt=>unistr('\0425\0442\043E \043C\043E\0436\0435 \0431\0430\0447\0438\0442\0438')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  PAT_NAME||'' ''||PAT_SURNAME||'' (''||PAT_EMAIL||'')'' d, PAT_ID r from REHAB_PATIENTS where PAT_TE_ID = REHAB_CONTEXT_PKG.getTENANT()',
'and PAT_ID <> REHAB_CONTEXT_PKG.getPATIENT() '))
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70923779055611635)
,p_name=>'P303_DS_CREATED'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_item_source_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_prompt=>unistr('\0421\0442\0432\043E\0440\0435\043D\043E')
,p_format_mask=>'&APP_DTFMT_FULL_T.'
,p_source=>'DS_CREATED'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
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
  'time_increment', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70923327814611633)
,p_name=>'P303_DS_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_item_source_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_prompt=>unistr('\041E\043F\0438\0441')
,p_source=>'DS_DESCRIPTION'
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
 p_id=>wwv_flow_imp.id(70922139931611613)
,p_name=>'P303_DS_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_item_source_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_source=>'DS_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70922939364611631)
,p_name=>'P303_DS_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_item_source_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_prompt=>unistr('\041D\0430\0437\0432\0430')
,p_source=>'DS_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>128
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70922558212611624)
,p_name=>'P303_DS_TE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_item_source_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_prompt=>unistr('\041E\0440\0435\043D\0434\0430\0440')
,p_source=>'DS_TE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_TENANTS.TE_NAME'
,p_lov_display_null=>'YES'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70924563473611639)
,p_name=>'P303_DS_UPDATED'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_item_source_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_prompt=>unistr('\0417\043C\0456\043D\0435\043D\043E')
,p_format_mask=>'&APP_DTFMT_FULL_T.'
,p_source=>'DS_UPDATED'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
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
  'time_increment', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70893628186852022)
,p_name=>'P303_P2S_IS_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70921853696611609)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70893349000852019)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AfterInsert'
,p_static_id=>'afterinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    INSERT INTO rehab_patient2storages (p2s_ds_id, p2s_pat_id, p2s_is_owner) ',
'    VALUES (:P303_DS_ID,REHAB_CONTEXT_PKG.getPATIENT(),true);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70928410649611654)
,p_internal_uid=>70893349000852019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70893986524852025)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeDelete'
,p_static_id=>'beforedelete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    delete from REHAB_PATIENT2STORAGES',
'    where P2S_DS_ID = :P303_DS_ID and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70927683387611652)
,p_internal_uid=>70893986524852025
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70893126527852017)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeInsert'
,p_static_id=>'beforeinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P303_DS_ID := SQ_REHAB_DRUG_STORAGES.nextval;',
'  :P303_DS_TE_ID := REHAB_CONTEXT_PKG.getTENANT();',
'  :P303_DS_CREATED := to_char(systimestamp at time zone SESSIONTIMEZONE,''&APP_DTFMT_FULL_T.'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70928410649611654)
,p_process_when=>'P303_DS_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>70893126527852017
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70893085177852016)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeUpdate'
,p_static_id=>'beforeupdate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P303_DS_UPDATED := to_char(systimestamp at time zone SESSIONTIMEZONE,''&APP_DTFMT_FULL_T.'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70928061271611653)
,p_process_when=>'P303_DS_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>70893085177852016
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70929246153611659)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(70921853696611609)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Storage'
,p_static_id=>'initialize-form-storage'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>70929246153611659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70893856598852024)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P303_DS_ID is not null then',
'        select P2S_IS_OWNER into :P303_P2S_IS_OWNER',
'        from REHAB_PATIENT2STORAGES',
'        where P2S_DS_ID = :P303_DS_ID and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT();',
'',
'        select listagg(f.P2S_PAT_ID, '':'') within group (order by f.P2S_PAT_ID)',
'        into :P303_CANVIEW',
'        from REHAB_PATIENT2STORAGES f',
'        where P2S_DS_ID = :P303_DS_ID and not P2S_IS_OWNER;',
'    end if;    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>70893856598852024
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70929602792611661)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(70921853696611609)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Storage'
,p_static_id=>'process-form-storage'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\0421\043A\0440\0438\043D\044E \043E\043D\043E\0432\043B\0435\043D\043E')
,p_internal_uid=>70929602792611661
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70894149964852027)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveAccCreate'
,p_static_id=>'saveacccreate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  delete from REHAB_PATIENT2STORAGES where P2S_DS_ID = :P303_DS_ID and not P2S_IS_OWNER;',
'  insert into REHAB_PATIENT2STORAGES (P2S_DS_ID, P2S_PAT_ID, P2S_IS_OWNER)',
'    select :P303_DS_ID, column_value, false from apex_string.split(p_str => :P303_CANVIEW, p_sep => '':'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70928410649611654)
,p_internal_uid=>70894149964852027
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(70894204027852028)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveAccSave'
,p_static_id=>'saveaccsave'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  delete from REHAB_PATIENT2STORAGES where P2S_DS_ID = :P303_DS_ID and not P2S_IS_OWNER;',
'  insert into REHAB_PATIENT2STORAGES (P2S_DS_ID, P2S_PAT_ID, P2S_IS_OWNER)',
'    select :P303_DS_ID, column_value, false from apex_string.split(p_str => :P303_CANVIEW, p_sep => '':'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(70928061271611653)
,p_internal_uid=>70894204027852028
);
wwv_flow_imp.component_end;
end;
/
