prompt --application/pages/page_00121
begin
--   Manifest
--     PAGE: 00121
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
 p_id=>121
,p_name=>'EditDrug'
,p_alias=>'EDITDRUG'
,p_step_title=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(77109859174814426)
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
 p_id=>wwv_flow_imp.id(77110686929814581)
,p_plug_name=>'REHAB_DRUGS'
,p_static_id=>'rehab-drugs'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'REHAB_DRUGS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77120644351814636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0430\043A\0440\0438\0442\0438')
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:120:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-person-running-fast'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77121955759814643)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P121_DR_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77121159652814640)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('\041F\0456\0434\0442\0432\0435\0440\0434\0456\0442\044C \0432\0438\0434\0430\043B\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443')
,p_confirm_style=>'danger'
,p_button_condition=>'P121_DR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77065532231873117)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'PreviewItem1'
,p_static_id=>'previewitem1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0435\0440\0435\0433\043B\044F\0434 \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 1')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_DRUGS,DR_ITEM_IMAGE1,DR_ID,&P121_DR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_DRUGS where sys.dbms_lob.getlength( DR_ITEM_IMAGE1 )>0 and DR_ID = :P121_DR_ID'
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77065692151873118)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'PreviewItem2'
,p_static_id=>'previewitem2'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0435\0440\0435\0433\043B\044F\0434 \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 2')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_DRUGS,DR_ITEM_IMAGE2,DR_ID,&P121_DR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_DRUGS where sys.dbms_lob.getlength( DR_ITEM_IMAGE2 )>0 and DR_ID = :P121_DR_ID'
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77065781201873119)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'PreviewPack1'
,p_static_id=>'previewpack1'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0435\0440\0435\0433\043B\044F\0434 \043F\0430\043A\0443\0432\0430\043D\043D\044F 1')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_DRUGS,DR_PACK_IMAGE1,DR_ID,&P121_DR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_DRUGS where sys.dbms_lob.getlength( DR_PACK_IMAGE1 )>0 and DR_ID = :P121_DR_ID'
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77065816606873120)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'PreviewPack2'
,p_static_id=>'previewpack2'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>unistr('\041F\0435\0440\0435\0433\043B\044F\0434 \043F\0430\043A\0443\0432\0430\043D\043D\044F 1')
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::P81_TABLE_NAME,P81_COL_NAME,P81_PK_COL,P81_PK_VAL:REHAB_DRUGS,DR_PACK_IMAGE2,DR_ID,&P121_DR_ID.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from REHAB_DRUGS where sys.dbms_lob.getlength( DR_PACK_IMAGE2 )>0 and DR_ID = :P121_DR_ID'
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77121573282814642)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_button_position=>'CLOSE'
,p_button_condition=>'P121_DR_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_security_scheme=>wwv_flow_imp.id(17092171236131578)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(77122386257814644)
,p_branch_action=>'f?p=&APP_ID.:120:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77110906380814583)
,p_name=>'P121_DR_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_source=>'DR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77114046334814610)
,p_name=>'P121_DR_INSTRUCTION'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0406\043D\0441\0442\0440\0443\043A\0446\0456\044F')
,p_source=>'DR_INSTRUCTION'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'max_height', '500',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77114480041814612)
,p_name=>'P121_DR_INSTR_SRC_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\041F\043E\0441\0438\043B\0430\043D\043D\044F \043D\0430 \0456\043D\0441\0442\0440\0443\043A\0446\0456\044E')
,p_source=>'DR_INSTR_SRC_URL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>512
,p_cHeight=>2
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
 p_id=>wwv_flow_imp.id(77114844584814613)
,p_name=>'P121_DR_ITEM_IMAGE1'
,p_source_data_type=>'BLOB'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0417\043E\0431\0440\0430\0436\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 1')
,p_source=>'DR_ITEM_IMAGE1'
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
 p_id=>wwv_flow_imp.id(77115231793814615)
,p_name=>'P121_DR_ITEM_IMAGE2'
,p_source_data_type=>'BLOB'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0417\043E\0431\0440\0430\0436\0435\043D\043D\044F \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0443 2')
,p_source=>'DR_ITEM_IMAGE2'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(77111782316814600)
,p_name=>'P121_DR_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\041D\0430\0437\0432\0430')
,p_source=>'DR_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77115669491814617)
,p_name=>'P121_DR_PACK_IMAGE1'
,p_source_data_type=>'BLOB'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0417\043E\0431\0440\0430\0436\0435\043D\043D\044F \0443\043F\0430\043A\043E\0432\043A\0438 1')
,p_source=>'DR_PACK_IMAGE1'
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
 p_id=>wwv_flow_imp.id(77116089208814618)
,p_name=>'P121_DR_PACK_IMAGE2'
,p_source_data_type=>'BLOB'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0417\043E\0431\0440\0430\0436\0435\043D\043D\044F \0443\043F\0430\043A\043E\0432\043A\0438 2')
,p_source=>'DR_PACK_IMAGE2'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(77111309585814590)
,p_name=>'P121_DR_TE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\041E\0440\0435\043D\0434\0430\0440')
,p_source=>'DR_TE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_TENANTS.TE_NAME'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77112117176814602)
,p_name=>'P121_DR_TYPE_SHORT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0422\0438\043F')
,p_source=>'DR_TYPE_SHORT'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  unique DR_TYPE_SHORT d, DR_TYPE_SHORT r',
'from REHAB_DRUGS',
'where DR_TE_ID = REHAB_CONTEXT_PKG.getTENANT()'))
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(77113218719814607)
,p_name=>'P121_DR_USE_CASE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0412\0438\043A\043E\0440\0438\0441\0442\0430\043D\043D\044F')
,p_source=>'DR_USE_CASE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(77113691876814609)
,p_name=>'P121_DR_WHEN2CONSUME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0421\043F\043E\0441\0456\0431 \0441\043F\043E\0436\0438\0432\0430\043D\043D\044F')
,p_source=>'DR_WHEN2CONSUME'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>512
,p_cHeight=>2
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
 p_id=>wwv_flow_imp.id(77112890772814605)
,p_name=>'P121_DR_WS_FORMULA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0424\043E\0440\043C\0443\043B\0430')
,p_source=>'DR_WS_FORMULA'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>2
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
 p_id=>wwv_flow_imp.id(77112572148814604)
,p_name=>'P121_DR_WS_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_item_source_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_prompt=>unistr('\0414\0456\044E\0447\0430 \0440\0435\0447\043E\0432\0438\043D\0430')
,p_source=>'DR_WS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REHAB_WORKING_SUBSTANCE.WS_NAME_1'
,p_lov_display_null=>'YES'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(77065983958873121)
,p_name=>'P121_NEW_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
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
 p_id=>wwv_flow_imp.id(77066261568873124)
,p_name=>'P121_TITLE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(77110686929814581)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77066486135873126)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AddShortType'
,p_static_id=>'addshorttype'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P121_DR_TYPE_SHORT := :P121_NEW_TYPE;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P121_NEW_TYPE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>77066486135873126
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77066384175873125)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BeforeNew'
,p_static_id=>'beforenew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P121_DR_ID := SQ_REHAB_DRUGS.nextval;',
'  :P121_DR_TE_ID := REHAB_CONTEXT_PKG.getTENANT();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P121_DR_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>77066384175873125
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77066194166873123)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitCapt'
,p_static_id=>'initcapt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('  if :P121_DR_ID is null then :P121_TITLE := ''\0421\0442\0432\043E\0440\0438\0442\0438 \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442''; else :P121_TITLE := ''\0420\0435\0434\0430\0433\0443\0432\0430\0442\0438 \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442''; end if;'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>77066194166873123
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77122704325814648)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(77110686929814581)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form REHAB_DRUGS'
,p_static_id=>'initialize-form-rehab-drugs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>77122704325814648
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77123156870814652)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(77110686929814581)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form REHAB_DRUGS'
,p_static_id=>'process-form-rehab-drugs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>77123156870814652
);
wwv_flow_imp.component_end;
end;
/
