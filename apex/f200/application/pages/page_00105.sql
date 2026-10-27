prompt --application/pages/page_00105
begin
--   Manifest
--     PAGE: 00105
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
 p_id=>105
,p_name=>'AssemblyMedications'
,p_alias=>'ASSEMBLYMEDICATIONS'
,p_step_title=>unistr('\0417\0431\0438\0440\0430\043D\043D\044F \0442\0430\0431\043B\0435\0442\043E\043A')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(103528393092688001)
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
 p_id=>wwv_flow_imp.id(118124816923888979)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(118123243703888963)
,p_plug_name=>'AssemblyDrugs'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(118124816923888979)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>'select da.* from table(REHAB_DRUGUSE_PKG.druguse_assembly_ref(:P105_TIME_PERIOD_ID, :P105_DAYS_AHEAD)) da'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>unistr('\041D\0435\043C\0430\0454 \043B\0456\043A\0456\0432 \0434\043B\044F \043F\0440\0438\0439\043E\043C\0443')
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(74073541341466124)
,p_region_id=>wwv_flow_imp.id(118123243703888963)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'MAINLABEL'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<h4 class="a-CardView-subTitle ">&SUBLABEL!RAW.</h4>'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<div class="a-CardView-mainContent ">&DATA1!RAW.</div>'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>'<h4 class="a-CardView-subTitle ">&DATA2!RAW.</h4>'
,p_icon_source_type=>'BLOB'
,p_icon_blob_column_name=>'DRUG_IMG'
,p_icon_position=>'START'
,p_badge_column_name=>'BAGECOL'
,p_badge_label=>'&BAGELABEL.'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(77065040788873112)
,p_card_id=>wwv_flow_imp.id(74073541341466124)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>unistr('\0414\043E \043F\0440\0438\0437\043D\0430\0447\0435\043D\044C')
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:402:&SESSION.::&DEBUG.::P402_PR_ID_CURR,P402_PRATR_ID_CURR,P402_PRD_ID_CURR,P402_PRR_ID_CURR:&PR_ID.,&PRATR_ID.,&PRD_ID.,&PRR_ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-prescription-sheet'
,p_is_hot=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(77065429764873116)
,p_card_id=>wwv_flow_imp.id(74073541341466124)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>20
,p_label=>unistr('\041C\0435\0434\0438\043A\0430\043C\0435\043D\0442')
,p_static_id=>'action_1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.::P121_DR_ID:&DR_ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-medication-pill'
,p_is_hot=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74064631216385803)
,p_name=>'P105_DAYS_AHEAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(118124816923888979)
,p_item_default=>'7'
,p_prompt=>unistr('\0417\0431\0438\0440\0430\0442\0438 \0434\043D\0456\0432')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(118126521985889036)
,p_name=>'P105_TIME_PERIOD_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(118124816923888979)
,p_prompt=>'Time Period Id'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'GD_CONSUMING_TIME_PERIODS'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '10',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75523012817989303)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P105_TIME_PERIOD_ID is null then',
'        select min(TP_ID) into :P105_TIME_PERIOD_ID',
'        from V$REHAB_TIME_PERIODS_AVAILABLE where systimestamp at time zone SESSIONTIMEZONE between TP_START_TIME_DT_CURR and TP_END_TIME_DT_CURR;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>75523012817989303
);
wwv_flow_imp.component_end;
end;
/
