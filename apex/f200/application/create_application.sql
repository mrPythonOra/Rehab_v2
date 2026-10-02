prompt --application/create_application
begin
--   Manifest
--     FLOW: 200
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'REHAB_V2')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Rehabilitation 2.0')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'REHAB-V2-0')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'F09689CFFE70087FAF129FB397DBDBE49ACEA61DB65AF5435D277F8CF8777183'
,p_bookmark_checksum_function=>'SH512'
,p_max_session_length_sec=>7200
,p_max_session_idle_sec=>7200
,p_compatibility_mode=>'26.1'
,p_flow_language=>'uk'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'YYYY-MON-DD'
,p_date_time_format=>'YYYY-MON-DD HH24:MI'
,p_timestamp_format=>'YYYY-MON-DD HH24:MI'
,p_timestamp_tz_format=>'YYYY-MON-DD HH24:MI TZR'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(16869964045504243)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'&GLOBAL_DATE_CAPT.'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 2.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_vpd=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    REHAB_CONTEXT_PKG.set_specific_context(:P0_SUDO);',
'end;'))
,p_vpd_teardown_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    REHAB_CONTEXT_PKG.reset_context;',
'end;'))
,p_runtime_api_usage=>'T'
,p_security_scheme=>wwv_flow_imp.id(16876760388504387)
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Rehab V2.0'
,p_substitution_string_02=>'APP_DTFMT_SHORT_T'
,p_substitution_value_02=>'YYYY-MM-DD HH24:MI'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461288113614
,p_version_scn=>'50675820075695'
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_display=>'standalone'
,p_pwa_manifest_orientation=>'any'
,p_pwa_is_push_enabled=>'Y'
,p_pwa_push_credential_id=>17080362072505681
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>true
,p_auto_dismiss_success_msg=>true
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(16870838765504258)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(16871619007504324)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
,p_translation_method=>'TEXT_MESSAGES'
);
wwv_flow_imp.component_end;
end;
/
