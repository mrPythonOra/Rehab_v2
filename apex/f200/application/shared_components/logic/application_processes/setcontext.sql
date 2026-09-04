prompt --application/shared_components/logic/application_processes/setcontext
begin
--   Manifest
--     APPLICATION PROCESS: SetContext
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.4'
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
'    REHAB_CONTEXT_PKG.set_specific_context(v(''APP_USER''));',
'    if REHAB_CONTEXT_PKG.getPATIENT is null then',
'        :P0_CONTEXT :=   ''Login: '' || v(''APP_USER'') ||',
'           ''; Working: '' || nvl(REHAB_CONTEXT_PKG.getAPEX_USER, ''N/A'') ||',
'           ''; Tenant: ''  || nvl(REHAB_CONTEXT_PKG.getTENANT||'''', ''N/A'') ||',
'           ''; Patient: '' || nvl(REHAB_CONTEXT_PKG.getPATIENT||'''', ''N/A'') ||',
'           ''; Access: ''  || nvl(REHAB_CONTEXT_PKG.getMODE, ''N/A'') ||''.'';',
'    else',
'        select',
'           ''Login: '' || v(''APP_USER'') ||',
'           ''; Working: '' || REHAB_CONTEXT_PKG.getAPEX_USER ||',
'           ''; Tenant: ''  || TE_NAME ||',
'           ''; Patient: '' || PAT_NAME||',
'           ''; Access: ''  || REHAB_CONTEXT_PKG.getMODE  ||''.''',
'        into :P0_CONTEXT',
'        from REHAB_TENANTS t, REHAB_PATIENTS p where t.TE_ID = p.PAT_TE_ID and p.PAT_ID = REHAB_CONTEXT_PKG.getPATIENT;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>'SH256:csnrBoyRpJSs-11nbS8zYHj7YrpAQadwKXXAKLEt538'
);
wwv_flow_imp.component_end;
end;
/
