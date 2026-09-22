prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.4'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15483692011527644)
,p_button_sequence=>20
,p_button_name=>'SetDate'
,p_static_id=>'new'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0412\0441\0442\0430\043D\043E\0432\0438\0442\0438 \0434\0430\0442\0443')
,p_button_position=>'REGION_POSITION_05'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-pointer'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15483972822527647)
,p_button_sequence=>30
,p_button_name=>'Today'
,p_static_id=>'today'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0412\0441\0442\0430\043D\043E\0432\0438\0442\0438 \0441\044C\043E\0433\043E\0434\043D\0456')
,p_button_position=>'REGION_POSITION_05'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-calendar-today'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(15484079055527648)
,p_button_id=>wwv_flow_imp.id(15483972822527647)
,p_action_sequence=>10
,p_name=>'SetToday'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_static_id=>'native-execute-plsql-code'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'GLOBAL_DATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '  :GLOBAL_DATE := to_char(systimestamp at time zone SESSIONTIMEZONE,''YYYY-MM-DD'');',
    'end;')),
  'show_processing', 'N')).to_clob
,p_stop_execution_on_error=>true
,p_wait_for_result=>true
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(15484113736527649)
,p_button_id=>wwv_flow_imp.id(15483972822527647)
,p_action_sequence=>20
,p_name=>'Submit'
,p_action=>'NATIVE_REFRESH'
,p_static_id=>'submit'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'GLOBAL_DATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28458947400190935)
,p_name=>'GLOBAL_CONTEXT'
,p_item_sequence=>60
,p_item_display_point=>'REGION_POSITION_05'
,p_prompt=>'Context'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when=>':GLOBAL_SHOWCONTEXT=''Y'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15483539658527643)
,p_name=>'GLOBAL_DATE'
,p_item_sequence=>10
,p_item_display_point=>'REGION_POSITION_05'
,p_format_mask=>'YYYY-MM-DD'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>1
,p_grid_label_column_span=>0
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28459581258204104)
,p_name=>'GLOBAL_SHOWCONTEXT'
,p_item_sequence=>50
,p_item_display_point=>'REGION_POSITION_05'
,p_item_default=>'N'
,p_prompt=>'Show'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Show;Y,Hide;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_label_column_span=>0
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15479897477527606)
,p_name=>'P0_SUDO'
,p_item_sequence=>40
,p_item_display_point=>'REGION_POSITION_05'
,p_item_default=>'REHAB_CONTEXT_PKG.getCURR_APEX_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PAT_NAME d, PAT_APEX_USER r from REHAB_PATIENTS where (select PAT_IS_SUPERUSER from REHAB_PATIENTS where PAT_APEX_USER=REHAB_CONTEXT_PKG.getCURR_APEX_USER)',
'union ',
'select PAT_NAME d, PAT_APEX_USER r from REHAB_PATIENTS where PAT_TE_ID in (select PAT_TE_ID from REHAB_PATIENTS where PAT_APEX_USER=REHAB_CONTEXT_PKG.getCURR_APEX_USER and PAT_IS_TENANTADM)',
'union ',
'select PAT_NAME d, PAT_APEX_USER r from REHAB_PATIENTS where PAT_ID in (select P2PA_TRG_PAT_ID from REHAB_PATIENTS2P_ACCESS where P2PA_SUBJ_PAT_ID=REHAB_CONTEXT_PKG.getCURR_PATIENT)',
'union ',
'select PAT_NAME d, PAT_APEX_USER r from REHAB_PATIENTS where PAT_APEX_USER=REHAB_CONTEXT_PKG.getCURR_APEX_USER',
'order by d;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_label_column_span=>0
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp.component_end;
end;
/
