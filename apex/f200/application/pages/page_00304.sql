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
 p_id=>wwv_flow_imp.id(75525378060989326)
,p_plug_name=>'AssignToPrescription'
,p_static_id=>'assigntoprescription'
,p_title=>unistr('\0414\043E\0434\0430\0442\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
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
,p_title=>unistr('\0417\0430\043D\0435\0441\0435\043D\043D\044F')
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75524031473989313)
,p_plug_name=>'Move'
,p_static_id=>'move'
,p_title=>unistr('\041F\0435\0440\0435\043C\0456\0449\0435\043D\043D\044F')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(76270070979410092)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0414\043E\0434\0430\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(75526645801989339)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(75525378060989326)
,p_button_name=>'AssignPR'
,p_static_id=>'assignpr'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\043E\0434\0430\0442\0438')
,p_button_position=>'CLOSE'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(75525663016989329)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'ShowAssignToPR'
,p_static_id=>'assigntoprr'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_button_position=>'HELP'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-prescription'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
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
,p_icon_css_classes=>'fa-file-check'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(76269640151408849)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'CREATE_N_ADD'
,p_static_id=>'create-n-add'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0434\043E\0434\0430\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-new'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(76269211933407741)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'CREATE_N_CLOSE'
,p_static_id=>'create-n-close'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-arrow-down'
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
 p_id=>wwv_flow_imp.id(75524366591989316)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'ShowMove'
,p_static_id=>'move'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041F\0435\0440\0435\043C\0456\0449\0435\043D\043D\044F')
,p_button_position=>'HELP'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-truck-container'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(75525020886989323)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(75524031473989313)
,p_button_name=>'MoveDrug'
,p_static_id=>'movedrug'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0435\0440\0435\043C\0456\0441\0442\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77064792761873109)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(75525378060989326)
,p_button_name=>'RemoveAssPR'
,p_static_id=>'removeasspr'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0440\0438\0431\0440\0430\0442\0438')
,p_button_position=>'CLOSE'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
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
,p_icon_css_classes=>'fa-file-check'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(76268437284405535)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_button_name=>'SAVE_N_CLOSE'
,p_static_id=>'save-n-close'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438 \0456 \0437\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>':P304_DA_ID is not null and :P304_IS_OWNER = ''TRUE'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(75524969675989322)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(75524031473989313)
,p_button_name=>'ValidateMoveDrug'
,p_static_id=>'validatemovedrug'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0435\0440\0435\0432\0456\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(75523768107989310)
,p_branch_name=>'302'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(73116221282557362)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(75523818000989311)
,p_branch_name=>'302'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(76269211933407741)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(75523905997989312)
,p_branch_name=>'302'
,p_branch_action=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(76268437284405535)
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73053654533651215)
,p_name=>'P304_DA_BEST_BEFORE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
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
,p_item_sequence=>160
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
,p_item_sequence=>140
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
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'REHAB_DRUGS.DR_NAME'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P304_DA_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
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
,p_read_only_when=>'P304_DA_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
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
,p_item_sequence=>130
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
,p_item_sequence=>110
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
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041F\0435\0440\0456\043E\0434 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'DA_PRATR_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75526481657989337)
,p_name=>'P304_DA_PRATR_ID_ASS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(75525378060989326)
,p_prompt=>unistr('\041F\0435\0440\0456\043E\0434 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(PRATR_ACTUAL_START,:APP_DTFMT_DATE) || '' - '' || ',
'       case when PRATR_ACTUAL_END is not null ',
'          then to_char(PRATR_ACTUAL_END,:APP_DTFMT_DATE)',
unistr('          else ''\0411\0435\0437 \043E\0431\043C\0435\0436\0435\043D\043D\044F \0434\0430\0442\0438'' '),
'       end d,',
'       PRATR_ID r',
'from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES',
'where PRATR_PR_ID = :P304_DA_PR_ID_ASS'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P304_DA_PR_ID_ASS'
,p_ajax_items_to_submit=>'P304_DA_PRATR_ID_ASS'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
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
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PRESCRIPTORS'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75526291656989335)
,p_name=>'P304_DA_PRR_ID_ASS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(75525378060989326)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRR_PRESCRIPTED_BY_SHORT || '' (''||to_char(PRR_PRESCRIPTED_WHEN, :APP_DTFMT_DATE)||'')'' d,',
'       PRR_ID r',
'  from REHAB_PRESCRIPTORS',
'where PRR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'  and PRR_ID in (select PR_PRR_ID from REHAB_PRESCRIPTIONS ',
'                  where PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'                    and PR_ID in (select PRATR_PR_ID from REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES ',
'                                   where PRATR_ID in (select PRD_PRATR_ID from REHAB_PRESCRIPTIONS_DETAILS where PRD_DR_ID = :P304_DA_DR_ID)))',
'order by PRR_PRESCRIPTED_WHEN desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73052780943651206)
,p_name=>'P304_DA_PR_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_item_source_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443')
,p_source=>'DA_PR_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_PRESCRIPTIONS'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75526373106989336)
,p_name=>'P304_DA_PR_ID_ASS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(75525378060989326)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(PR_PLANNED_START,:APP_DTFMT_DATE) || '' - '' || ',
'       case when PR_PLANNED_END is not null ',
'          then to_char(PR_PLANNED_END,:APP_DTFMT_DATE)',
unistr('          else ''\0411\0435\0437 \043E\0431\043C\0435\0436\0435\043D\043D\044F \0434\0430\0442\0438'' '),
'       end d,',
'       PR_ID r',
' from REHAB_PRESCRIPTIONS',
'where PR_PRR_ID = :P304_DA_PRR_ID_ASS',
'  and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'  and PR_DR_ID = :P304_DA_DR_ID'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P304_DA_PRR_ID_ASS'
,p_ajax_items_to_submit=>'P304_DA_PR_ID_ASS'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73053498818651213)
,p_name=>'P304_DA_PURCHASED'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>150
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
,p_item_sequence=>120
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
,p_read_only_when_type=>'ALWAYS'
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
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(72112610582258217)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75524617836989319)
,p_name=>'P304_MOVE_QUANTITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(75524031473989313)
,p_prompt=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C, \043C\0433')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75524723497989320)
,p_name=>'P304_TARGET_STORAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(75524031473989313)
,p_prompt=>unistr('\0421\043A\0440\0438\043D\044F \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  DS_NAME d, DS_ID r',
'from REHAB_DRUG_STORAGES, REHAB_PATIENT2STORAGES',
'where P2S_DS_ID = DS_ID and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()-- and P2S_IS_OWNER',
'  and DS_ID != :P304_DA_DS_ID'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75524881745989321)
,p_name=>'P304_VALIDATE_MSG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(75524031473989313)
,p_prompt=>unistr('\0420\0435\0437\0443\043B\044C\0442\0430\0442 \043F\0435\0440\0435\0432\0456\0440\043A\0438')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(75526964584989342)
,p_validation_name=>'NotNull P304_DA_PR_ID_ASS'
,p_static_id=>'notnull-p304-da-pr-id-ass'
,p_validation_sequence=>20
,p_validation=>':P304_DA_PR_ID_ASS is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 \043C\0430\0454 \0431\0443\0442\0438 \0432\043A\0430\0437\0430\043D\0435')
,p_when_button_pressed=>wwv_flow_imp.id(75526645801989339)
,p_associated_item=>wwv_flow_imp.id(75526373106989336)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(75527110896989344)
,p_validation_name=>'NotNull P304_DA_PRATR_ID_ASS'
,p_static_id=>'notnull-p304-da-pratr-id-ass'
,p_validation_sequence=>30
,p_validation=>':P304_DA_PRATR_ID_ASS is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\041F\0435\0440\0456\043E\0434 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0430\0454 \0431\0443\0442\0438 \0432\043A\0430\0437\0430\043D\0438\043C')
,p_when_button_pressed=>wwv_flow_imp.id(75526645801989339)
,p_associated_item=>wwv_flow_imp.id(75526481657989337)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(75526853156989341)
,p_validation_name=>'NotNull P304_DA_PRR_ID_ASS'
,p_static_id=>'notnull-p304-da-prr-id-ass'
,p_validation_sequence=>10
,p_validation=>':P304_DA_PRR_ID_ASS is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0430\0454 \0431\0443\0442\0438 \0432\043A\0430\0437\0430\043D\0435')
,p_when_button_pressed=>wwv_flow_imp.id(75526645801989339)
,p_associated_item=>wwv_flow_imp.id(75526291656989335)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(75527207185989345)
,p_validation_name=>'NotNull P304_MOVE_QUANTITY'
,p_static_id=>'notnull-p304-move-quantity'
,p_validation_sequence=>40
,p_validation=>':P304_MOVE_QUANTITY is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\041A\0456\043B\044C\043A\0456\0441\0442\044C \043C\0430\0454 \0431\0443\0442\0438 \0432\043A\0430\0437\0430\043D\0430')
,p_when_button_pressed=>wwv_flow_imp.id(75525020886989323)
,p_associated_item=>wwv_flow_imp.id(75524617836989319)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(75527306791989346)
,p_validation_name=>'NotNull P304_TARGET_STORAGE'
,p_static_id=>'notnull-p304-target-storage'
,p_validation_sequence=>50
,p_validation=>':P304_TARGET_STORAGE is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\0421\043A\0440\0438\043D\044F \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \043C\0430\0454 \0431\0443\0442\0438 \0432\043A\0430\0437\0430\043D\0430')
,p_when_button_pressed=>wwv_flow_imp.id(75525020886989323)
,p_associated_item=>wwv_flow_imp.id(75524723497989320)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(75524151720989314)
,p_name=>'HideMyself1'
,p_static_id=>'hidemyself'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(75524031473989313)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75524252251989315)
,p_event_id=>wwv_flow_imp.id(75524151720989314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75524031473989313)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P304_MOVE_QUANTITY'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(75525429542989327)
,p_name=>'HideMyself2'
,p_static_id=>'hidemyself_1'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(75525378060989326)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75525545743989328)
,p_event_id=>wwv_flow_imp.id(75525429542989327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75525378060989326)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P304_DA_PRR_ID_ASS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(75524421824989317)
,p_name=>'ShowHide1'
,p_static_id=>'show'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(75524366591989316)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75526006693989333)
,p_event_id=>wwv_flow_imp.id(75524421824989317)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'HideAssign'
,p_static_id=>'hideassign'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75525378060989326)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75526510488989338)
,p_event_id=>wwv_flow_imp.id(75524421824989317)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P304_DA_PRR_ID_ASS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(16869691178504232)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(77064663690873108)
,p_event_id=>wwv_flow_imp.id(75524421824989317)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ShowMove'
,p_static_id=>'showmove'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75524031473989313)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(75525775699989330)
,p_name=>'ShowHide2'
,p_static_id=>'showhide'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(75525663016989329)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75525976806989332)
,p_event_id=>wwv_flow_imp.id(75525775699989330)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'HideMove'
,p_static_id=>'hidemove'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75524031473989313)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75526113654989334)
,p_event_id=>wwv_flow_imp.id(75525775699989330)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P304_MOVE_QUANTITY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(16869691178504232)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75525867867989331)
,p_event_id=>wwv_flow_imp.id(75525775699989330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ShowAssign'
,p_static_id=>'showmove'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75525378060989326)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75526764087989340)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AssignPR'
,p_static_id=>'assignpr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_DRUG_STORAGE_PKG.assign_pr (  ',
'    P_DA_ID => :P304_DA_ID,',
'    P_PRR_ID => :P304_DA_PRR_ID_ASS,',
'    P_PR_ID => :P304_DA_PR_ID_ASS,',
'    P_PRATR_ID => :P304_DA_PRATR_ID_ASS) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(75526645801989339)
,p_internal_uid=>75526764087989340
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
'  select DR_WS_ID into :P304_DA_WS_ID',
'  from REHAB_DRUGS where DR_ID = :P304_DA_DR_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P304_DA_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>73054819804651227
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(76270755836414690)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CleanForm1'
,p_static_id=>'cleanform'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(76269640151408849)
,p_internal_uid=>76270755836414690
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523302689989306)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CleanForm2'
,p_static_id=>'cleanform2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(76270070979410092)
,p_internal_uid=>75523302689989306
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523673439989309)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormDelete'
,p_static_id=>'formdelete'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(73114651652551853)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0432\0438\0434\0430\043B\0435\043D\043E')
,p_internal_uid=>75523673439989309
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(73054709828651226)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormInsert1'
,p_static_id=>'forminsert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(73115432431555068)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>73054709828651226
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523169274989304)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormInsert2'
,p_static_id=>'forminsert_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(76269640151408849)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>75523169274989304
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523271728989305)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormInsert3'
,p_static_id=>'forminsert_1_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(76269211933407741)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>75523271728989305
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523415251989307)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormUpdate1'
,p_static_id=>'formupdate1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(73115801147556339)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>75523415251989307
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523537970989308)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(72112610582258217)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'FormUpdate2'
,p_static_id=>'formupdate2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(76268437284405535)
,p_process_success_message=>unistr('\0417\0430\043F\0438\0441 \043F\0440\043E \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442 \0437\0431\0435\0440\0435\0436\0435\043D\043E')
,p_internal_uid=>75523537970989308
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
'    select ',
'        P2S_IS_OWNER into :P304_IS_OWNER',
'    FROM',
'        REHAB_PATIENT2STORAGES',
'    where P2S_DS_ID = :P302_DS_ID_CURR and P2S_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT();',
'    if :P304_DA_DS_ID is null then',
'        :P304_DA_DS_ID := :P302_DS_ID_CURR;',
'    end if;',
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75525266664989325)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'MoveDrug'
,p_static_id=>'movedrug'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_DRUG_STORAGE_PKG.move_drug_to_storage (  ',
'    P_DA_ID => :P304_DA_ID,',
'    P_DS_ID_TRG => :P304_TARGET_STORAGE,',
'    P_MOVE_QUANTITY => :P304_MOVE_QUANTITY) ; ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(75525020886989323)
,p_internal_uid=>75525266664989325
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77064815867873110)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RemoveAssPR'
,p_static_id=>'removeasspr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_DRUG_STORAGE_PKG.remove_assign_pr(:P304_DA_ID);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77064792761873109)
,p_internal_uid=>77064815867873110
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75525165733989324)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidateMove'
,p_static_id=>'validatemove'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_DRUG_STORAGE_PKG.validate_drug_movement (  ',
'    p_DA_ID => :P304_DA_ID,',
'    P_MOVE_QUANTITY => :P304_MOVE_QUANTITY,',
'    P_RESULT_MSG => :P304_VALIDATE_MSG) ;  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(75524969675989322)
,p_internal_uid=>75525165733989324
);
wwv_flow_imp.component_end;
end;
/
