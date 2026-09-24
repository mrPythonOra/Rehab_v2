prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>unistr('\0420\0435\0430\0431\0456\043B\0456\0442\0430\0446\0456\044F 2.0')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15480456892527612)
,p_plug_name=>'Charts'
,p_static_id=>'donepct'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(15480525861527613)
,p_region_id=>wwv_flow_imp.id(15480456892527612)
,p_chart_type=>'dial'
,p_width=>'300'
,p_height=>'100'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_value_text_type=>'percent'
,p_value_format_type=>'percent'
,p_value_decimal_places=>0
,p_value_format_scaling=>'auto'
,p_tooltip_rendered=>'Y'
,p_gauge_orientation=>'circular'
,p_gauge_indicator_size=>1
,p_gauge_inner_radius=>.7
,p_gauge_plot_area=>'on'
,p_gauge_start_angle=>180
,p_gauge_angle_extent=>180
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(15480655782527614)
,p_chart_id=>wwv_flow_imp.id(15480525861527613)
,p_static_id=>'new_1'
,p_seq=>10
,p_name=>'Serie1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) max_value, ',
'       count(DRU_CONSUMED) value,',
unistr('       count(DRU_CONSUMED) || '' \0437 ''|| count(*) ||'' \0434\043E\0431\043E\0432\0438\0445 \043C\0435\0434\0456\043A\0430\043C\0435\043D\0442\0456\0432 \0441\043F\043E\0436\0438\0442\043E'' tip1,'),
unistr('       ''\0421\043F\043E\0436\0438\0442\043E \0442\0430\0431\043B\0435\0442\043E\043A'' label'),
'from REHAB_PRESCRIPTIONS_DETAILS d, ',
'     REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES as of period for REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES_period sysdate tr,',
'     REHAB_PRESCRIPTIONS p,',
'     REHAB_DRUG_USES du',
'where d.PRD_PRATR_ID = tr.PRATR_ID and tr.PRATR_PR_ID = p.PR_ID',
'  and PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'  and du.DRU_PR_ID(+) = p.PR_ID and DRU_PAT_ID(+) = REHAB_CONTEXT_PKG.getPATIENT()',
'  and trunc(DRU_CONSUMED(+)) = REHAB_CONTEXT_PKG.getGLOBAL_DATE()'))
,p_items_value_column_name=>'VALUE'
,p_items_max_value=>'MAX_VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TIP1'
,p_color=>'#008cff'
,p_items_label_rendered=>true
,p_items_label_position=>'start'
,p_items_label_font_size=>'12'
,p_items_label_font_color=>'#008cff'
,p_threshold_display=>'onIndicator'
,p_reference_line_values=>'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15482726476527635)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>'select * from table(REHAB_UI_REPORTS_PKG.dashboard_ref)'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(15483421714527642)
,p_region_id=>wwv_flow_imp.id(15482726476527635)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'LABEL'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>'<h1 class="a-CardView-subTitle ">&DATA!RAW.</h1>'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>'<h4 class="a-CardView-subTitle ">&DATA2!RAW.</h4>'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'LABEL'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(15483862596527646)
,p_card_id=>wwv_flow_imp.id(15483421714527642)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:&APP_PAGE.:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16886194857504485)
,p_plug_name=>unistr('\0420\0435\0430\0431\0456\043B\0456\0442\0430\0446\0456\044F')
,p_static_id=>'rehab-v2-0'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15483757190527645)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15480456892527612)
,p_button_name=>'GotoPills'
,p_static_id=>'new'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\043D\0435\0441\0442\0438')
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-medication-pill'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44051886786422902)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(15480456892527612)
,p_button_name=>'RefreshData'
,p_static_id=>'refreshdata'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\041E\043D\043E\0432\0438\0442\0438 \0434\0430\043D\0456')
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44051712164422901)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RefrehData'
,p_static_id=>'refrehdata'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_MIGRATE_PKG.refresh_data();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44051886786422902)
,p_internal_uid=>44051712164422901
);
wwv_flow_imp.component_end;
end;
/
