prompt --application/shared_components/security/authorizations/accessmodeadm
begin
--   Manifest
--     SECURITY SCHEME: AccessModeADM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.6'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(83253952160372292)
,p_name=>'AccessModeADM'
,p_static_id=>'accessmodeadm'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return REHAB_CONTEXT_PKG.AccessLevelADM;')).to_clob
,p_error_message=>'Current user do not have ADMIN access level to the data of the selected user.'
,p_version_scn=>'SH256:Fb-JbEThY_1hSbDmQ-Pdj6gEZ6AD-7Z4zEMH8lZ3a9w'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
