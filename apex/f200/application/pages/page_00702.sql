prompt --application/pages/page_00702
begin
--   Manifest
--     PAGE: 00702
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
 p_id=>702
,p_name=>'ConfigParam'
,p_alias=>'CONFIGPARAM'
,p_step_title=>unistr('\041F\0430\0440\0430\043C\0435\0442\0440')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(82701758507762301)
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
 p_id=>wwv_flow_imp.id(82702478379762455)
,p_plug_name=>'ConfigParam'
,p_static_id=>'configparam'
,p_title=>'&P702_PAR_CATEGOTY.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_CONFIGS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82707681497762484)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:701:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-person-running-fast'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82675470016848013)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P702_PAR_NAME not like ''ADM%'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-eraser'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82708556250762489)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P702_PAR_NAME not like ''ADM%'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82675084075848009)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_button_name=>'SAVE_ADM'
,p_static_id=>'save-adm'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438 (ADM)')
,p_button_position=>'CLOSE'
,p_button_condition=>':P702_PAR_NAME like ''ADM%'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(83253952160372292)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(82709317995762491)
,p_branch_action=>'f?p=&APP_ID.:701:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82703933140762465)
,p_name=>'P702_PAR_CATEGOTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82705132420762474)
,p_name=>'P702_PAR_DESCRIPTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\041E\043F\0438\0441')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82703559248762464)
,p_name=>'P702_PAR_HUMAN_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\041D\0430\0437\0432\0430 \043F\0430\0440\0430\043C\0435\0442\0440\0443')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>128
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82702776681762458)
,p_name=>'P702_PAR_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\0412\043D\0443\0442\0440\0456\0448\043D\044F \043D\0430\0437\0432\0430 \043F\0430\0440\0430\043C\0435\0442\0440\0443')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82704321391762467)
,p_name=>'P702_PAR_PAT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442 (\0434\043B\044F \0432\0441\0456\0445 \044F\043A\0449\043E \043F\0443\0441\0442\043E)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PATIENTS.PAT_NAME'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'not REHAB_CONTEXT_PKG.AccessLevelADM'
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82703131190762462)
,p_name=>'P702_PAR_TE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\041E\0440\0435\043D\0434\0430\0440 (\0434\043B\044F \0432\0441\0456\0445 \044F\043A\0449\043E \043F\0443\0441\0442\043E)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_TENANTS.TE_NAME'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>'not REHAB_CONTEXT_PKG.AccessLevelADM'
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82674949591848008)
,p_name=>'P702_PAR_VALUE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\0411\0430\0437\043E\0432\0435 \0437\043D\0430\0447\0435\043D\043D\044F')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82704721617762473)
,p_name=>'P702_PAR_VALUE_NUM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_item_source_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\0417\043D\0430\0447\0435\043D\043D\044F (\0447\0438\0441\043B\043E\0432\0435)')
,p_source=>'PAR_VALUE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>60
,p_cMaxlength=>512
,p_display_when=>'P702_PAR_VALUE_NUM'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82674637585848005)
,p_name=>'P702_PAR_VALUE_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_item_source_plug_id=>wwv_flow_imp.id(82702478379762455)
,p_prompt=>unistr('\0417\043D\0430\0447\0435\043D\043D\044F (\043B\043E\0433\0456\0447\043D\0435)')
,p_source=>'PAR_VALUE'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'Y_N_VALUES'
,p_display_when=>'P702_PAR_VALUE_YN'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82674832458848007)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select PAR_HUMAN_NAME, PAR_CATEGOTY, PAR_TE_ID, PAR_PAT_ID, PAR_VALUE, PAR_DESCRIPTION',
'  into :P702_PAR_HUMAN_NAME, :P702_PAR_CATEGOTY, :P702_PAR_TE_ID, :P702_PAR_PAT_ID, :P702_PAR_VALUE, :P702_PAR_DESCRIPTION',
'  from V$REHAB_CONFIGS_AVAILABLE where PAR_NAME = :P702_PAR_NAME;',
'  if :P702_PAR_VALUE in (''Y'', ''N'') then',
'    :P702_PAR_VALUE_YN := :P702_PAR_VALUE;',
'    :P702_PAR_VALUE_NUM := null;',
'  else',
'    :P702_PAR_VALUE_NUM := :P702_PAR_VALUE;',
'    :P702_PAR_VALUE_YN := null;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>82674832458848007
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82709720397762494)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(82702478379762455)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form ConfigParam'
,p_static_id=>'initialize-form-configparam'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>82709720397762494
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82710123921762496)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(82702478379762455)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form ConfigParam'
,p_static_id=>'process-form-configparam'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
,p_internal_uid=>82710123921762496
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82675375336848012)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset'
,p_static_id=>'reset'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_CONFIG_PKG.reset_config_par (',
'    P_PAR_NAME => :P702_PAR_NAME,',
'    P_TE_ID => :P702_PAR_TE_ID,',
'    P_PAT_ID => :P702_PAR_PAT_ID) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(82675470016848013)
,p_process_success_message=>unistr('\041F\0430\0440\0430\043C\0442\0440 \0437\043C\0456\043D\0435\043D\043E')
,p_internal_uid=>82675375336848012
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82675178214848010)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save'
,p_static_id=>'save'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_CONFIG_PKG.set_config_par (',
'    P_PAR_NAME => :P702_PAR_NAME,',
'    P_TE_ID => :P702_PAR_TE_ID,',
'    P_PAT_ID => :P702_PAR_PAT_ID,',
'    P_VALUE => case when :P702_PAR_VALUE_NUM is not null then :P702_PAR_VALUE_NUM',
'                    when :P702_PAR_VALUE_YN is not null then :P702_PAR_VALUE_YN',
'                    end) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(82708556250762489)
,p_process_success_message=>unistr('\041F\0430\0440\0430\043C\0442\0440 \0437\043C\0456\043D\0435\043D\043E')
,p_internal_uid=>82675178214848010
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82675224549848011)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveAdm'
,p_static_id=>'saveadm'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_CONFIG_PKG.set_config_par (',
'    P_PAR_NAME => :P702_PAR_NAME,',
'    P_TE_ID => :P702_PAR_TE_ID,',
'    P_PAT_ID => :P702_PAR_PAT_ID,',
'    P_VALUE => case when :P702_PAR_VALUE_NUM is not null then :P702_PAR_VALUE_NUM',
'                    when :P702_PAR_VALUE_YN is not null then :P702_PAR_VALUE_YN',
'                    end) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(82675084075848009)
,p_process_success_message=>unistr('\041F\0430\0440\0430\043C\0442\0440 \0437\043C\0456\043D\0435\043D\043E')
,p_internal_uid=>82675224549848011
);
wwv_flow_imp.component_end;
end;
/
