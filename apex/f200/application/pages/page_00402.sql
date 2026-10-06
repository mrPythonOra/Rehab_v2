prompt --application/pages/page_00402
begin
--   Manifest
--     PAGE: 00402
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
 p_id=>402
,p_name=>'Prescriptor'
,p_alias=>'PRESCRIPTOR1'
,p_step_title=>'&P402_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56493646728899680)
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
 p_id=>wwv_flow_imp.id(56494378122899829)
,p_plug_name=>'Prescriptor'
,p_static_id=>'prescriptor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_PRESCRIPTORS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56502751549899878)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:401:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56504064663899884)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P402_PRR_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56503221082899881)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F \0456 \0432\0441\0456\0445 \0437\0430\043B\0435\0436\043D\0438\0445 \0434\0430\043D\0438\0445')
,p_confirm_style=>'danger'
,p_button_condition=>'P402_PRR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56513131401006190)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview1'
,p_static_id=>'preview1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 1')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE1,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE1 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56469828114627420)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview2'
,p_static_id=>'preview2'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 2')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE2,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE2 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56469926404627421)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview3'
,p_static_id=>'preview3'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 3')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE3,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE3 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56470085725627422)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview4'
,p_static_id=>'preview4'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 4')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE4,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE4 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56470167959627423)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'Preview5'
,p_static_id=>'preview5'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--noLeft'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\0414\0438\0432\0438\0442\0438\0441\044F \0437\043E\0431\0440\0430\0436\0435\043D\043D\044F 5')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_PRESCRIPTORS,PRR_PAGE5,PRR_ID,&P402_PRR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_PRESCRIPTORS where PRR_PAGE5 is not null and PRR_ID = :P402_PRR_ID'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56503602862899883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P402_PRR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(56504408598899885)
,p_branch_action=>'f?p=&APP_ID.:401:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56497065005899858)
,p_name=>'P402_PRR_FULL_TEXT'
,p_source_data_type=>'CLOB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0422\0435\043A\0441\0442 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F')
,p_source=>'PRR_FULL_TEXT'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56494633221899831)
,p_name=>'P402_PRR_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_source=>'PRR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56497481559899859)
,p_name=>'P402_PRR_PAGE1'
,p_source_data_type=>'BLOB'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 1')
,p_source=>'PRR_PAGE1'
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
 p_id=>wwv_flow_imp.id(56497844230899861)
,p_name=>'P402_PRR_PAGE2'
,p_source_data_type=>'BLOB'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 2')
,p_source=>'PRR_PAGE2'
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
 p_id=>wwv_flow_imp.id(56498227425899862)
,p_name=>'P402_PRR_PAGE3'
,p_source_data_type=>'BLOB'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 3')
,p_source=>'PRR_PAGE3'
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
 p_id=>wwv_flow_imp.id(56498674796899864)
,p_name=>'P402_PRR_PAGE4'
,p_source_data_type=>'BLOB'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 4')
,p_source=>'PRR_PAGE4'
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
 p_id=>wwv_flow_imp.id(56499045220899865)
,p_name=>'P402_PRR_PAGE5'
,p_source_data_type=>'BLOB'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\0421\0442\043E\0440\0456\043D\043A\0430 5')
,p_source=>'PRR_PAGE5'
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
 p_id=>wwv_flow_imp.id(56496605417899856)
,p_name=>'P402_PRR_PAT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041F\0430\0446\0456\0454\043D\0442')
,p_source=>'PRR_PAT_ID'
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
 p_id=>wwv_flow_imp.id(56496209986899851)
,p_name=>'P402_PRR_PRESCRIPTED_BY_FULL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E \043A\0438\043C, \043F\043E\0432\043D\0438\0439 \0442\0435\043A\0441\0442')
,p_source=>'PRR_PRESCRIPTED_BY_FULL'
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
 p_id=>wwv_flow_imp.id(56495042014899841)
,p_name=>'P402_PRR_PRESCRIPTED_BY_SHORT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E \043A\0438\043C')
,p_source=>'PRR_PRESCRIPTED_BY_SHORT'
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
 p_id=>wwv_flow_imp.id(56495464154899846)
,p_name=>'P402_PRR_PRESCRIPTED_WHEN'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_item_source_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_prompt=>unistr('\041F\0440\0438\0437\043D\0430\0447\0435\043D\043E \043A\043E\043B\0438')
,p_format_mask=>'&APP_DTFMT_SHORT_T.'
,p_source=>'PRR_PRESCRIPTED_WHEN'
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
  'time_increment', '5',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56469775818627419)
,p_name=>'P402_TITLE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(56494378122899829)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(56495855872899848)
,p_validation_name=>'P402_PRR_PRESCRIPTED_WHEN must be timestamp'
,p_static_id=>'p402-prr-prescripted-when-must-be-timestamp'
,p_validation_sequence=>20
,p_validation=>'P402_PRR_PRESCRIPTED_WHEN'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(56495464154899846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56519164580182019)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P402_PRR_ID := SQ_REHAB_PRESCRIPTORS.nextval;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(56504064663899884)
,p_internal_uid=>56519164580182019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56518576143178771)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetTitle'
,p_static_id=>'gettitle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('  if :P402_PRR_ID is null then :P402_TITLE := ''\0421\0442\0432\043E\0440\0438\0442\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F''; else :P402_TITLE := ''\0420\0435\0434\0430\0433\0443\0432\0430\0442\0438 \043F\0440\0438\0437\043D\0430\0447\0435\043D\043D\044F''; end if;'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>56518576143178771
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56504890026899887)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Prescriptor'
,p_static_id=>'initialize-form-prescriptor'
,p_internal_uid=>56504890026899887
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56518802064180130)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitNew'
,p_static_id=>'initnew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P402_PRR_PRESCRIPTED_WHEN := to_char(systimestamp at time zone SESSIONTIMEZONE,:APP_DTFMT_SHORT_T);',
'  :P402_PRR_PAT_ID := REHAB_CONTEXT_PKG.getPATIENT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P402_PRR_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>56518802064180130
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(56505220295899890)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(56494378122899829)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Prescriptor'
,p_static_id=>'process-form-prescriptor'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>56505220295899890
);
wwv_flow_imp.component_end;
end;
/
