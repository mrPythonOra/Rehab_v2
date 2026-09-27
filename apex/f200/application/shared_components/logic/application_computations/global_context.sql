prompt --application/shared_components/logic/application_computations/global_context
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_CONTEXT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(28508830845439467)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_CONTEXT'
,p_static_id=>'global-context'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' declare',
'   l_out varchar2(32765);',
' begin',
'   if REHAB_CONTEXT_PKG.getPATIENT is null then',
'        l_out := ''<font size="1">  C: '' || v(''APP_USER'') ||',
'           ''; W: '' || nvl(REHAB_CONTEXT_PKG.getAPEX_USER, ''N/A'') ||',
'           ''; T: ''  || nvl(REHAB_CONTEXT_PKG.getTENANT||'''', ''N/A'') ||',
'           ''; P: '' || nvl(REHAB_CONTEXT_PKG.getPATIENT||'''', ''N/A'') ||',
'           ''; A: ''  || nvl(REHAB_CONTEXT_PKG.getMODE, ''N/A'') ||''.</font>'';',
'    else',
'        select',
'           ''<font size="1">  C: '' || v(''APP_USER'') ||',
'           ''; W: '' || REHAB_CONTEXT_PKG.getAPEX_USER ||',
'           ''; T: ''  || TE_NAME ||',
'           ''; P: '' || PAT_NAME||',
'           ''; A: ''  || REHAB_CONTEXT_PKG.getMODE  ||''.</font>''',
'        into l_out',
'        from REHAB_TENANTS t, REHAB_PATIENTS p where t.TE_ID = p.PAT_TE_ID and p.PAT_ID = REHAB_CONTEXT_PKG.getPATIENT;',
'    end if;',
'    return l_out;',
'end;'))
,p_version_scn=>'SH256:rPWINfNs2oQE2OnAN0JmtaTgSgsb3LsCCGmDF1YOhPE'
);
wwv_flow_imp.component_end;
end;
/
