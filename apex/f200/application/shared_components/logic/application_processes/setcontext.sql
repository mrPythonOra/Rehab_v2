prompt --application/shared_components/logic/application_processes/setcontext
begin
--   Manifest
--     APPLICATION PROCESS: SetContext
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(17093429362163980)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_name=>'SetContext'
,p_static_id=>'setcontext'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    null; --REHAB_CONTEXT_PKG.set_specific_context(:P0_SUDO); --nvl(:P0_SUDO, v(''APP_USER''))',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>'SH256:Cv45D1Xkc3Hc3qtt7FKYCHgURsSiU3SRstBoAcrqYj0'
);
wwv_flow_imp.component_end;
end;
/
