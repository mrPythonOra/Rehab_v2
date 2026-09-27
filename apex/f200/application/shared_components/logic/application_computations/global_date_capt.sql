prompt --application/shared_components/logic/application_computations/global_date_capt
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_DATE_CAPT
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
 p_id=>wwv_flow_imp.id(29656413614078018)
,p_computation_sequence=>30
,p_computation_item=>'GLOBAL_DATE_CAPT'
,p_static_id=>'global-date-capt'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if REHAB_CONTEXT_PKG.getGLOBAL_DATE = trunc(sysdate) then',
unistr('    return v(''GLOBAL_DATE'') || ''(\0441\044C\043E\0433\043E\0434\043D\0456)'';'),
'  else',
'    return v(''GLOBAL_DATE'');',
'  end if;',
'end;'))
,p_version_scn=>'SH256:0mLfhd41fDayTedeW4JM6sk6-CyKJOTnoCYsj_yUOUk'
);
wwv_flow_imp.component_end;
end;
/
