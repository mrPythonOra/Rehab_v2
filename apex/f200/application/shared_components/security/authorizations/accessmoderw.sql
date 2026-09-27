prompt --application/shared_components/security/authorizations/accessmoderw
begin
--   Manifest
--     SECURITY SCHEME: AccessModeRW
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(17092171236131578)
,p_name=>'AccessModeRW'
,p_static_id=>'accessmoderw'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return REHAB_CONTEXT_PKG.AccessLevelRW;')).to_clob
,p_error_message=>'Current user do not have RW access level to the data of the selected user.'
,p_version_scn=>'SH256:pkmpLf7bwSWGek75R3BaXRNOVNW9L_zEbxarxW7yn6M'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
