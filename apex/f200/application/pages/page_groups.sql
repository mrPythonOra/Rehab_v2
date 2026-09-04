prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 200
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.4'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(16878158405504415)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(17072974906505633)
,p_group_name=>'User Settings'
,p_static_id=>'user-settings'
);
wwv_flow_imp.component_end;
end;
/
