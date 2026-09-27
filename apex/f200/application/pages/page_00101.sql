prompt --application/pages/page_00101
begin
--   Manifest
--     PAGE: 00101
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
 p_id=>101
,p_name=>'ConsumeMedications'
,p_alias=>'CONSMED'
,p_step_title=>unistr('\041F\0440\0438\0439\043E\043C \0442\0430\0431\043B\0435\0442\043E\043A')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17092736246142129)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29457094276221941)
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
 p_id=>wwv_flow_imp.id(44051944887422903)
,p_plug_name=>'ConsumeDrugs'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--select da.*, dr.DR_ITEM_IMAGE1 from table(REHAB_DRUGUSE_PKG.druguse_dashboard_ref) da, REHAB_DRUGS dr where da.dr_id = dr.dr_id',
'select da.* from table(REHAB_DRUGUSE_PKG.druguse_dashboard_ref) da'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(44052063181422904)
,p_region_id=>wwv_flow_imp.id(44051944887422903)
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
wwv_flow_imp.component_end;
end;
/
