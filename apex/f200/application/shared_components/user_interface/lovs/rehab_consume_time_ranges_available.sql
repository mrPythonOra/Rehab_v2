prompt --application/shared_components/user_interface/lovs/rehab_consume_time_ranges_available
begin
--   Manifest
--     REHAB_CONSUME_TIME_RANGES_AVAILABLE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(61198974162900726)
,p_lov_name=>'REHAB_CONSUME_TIME_RANGES_AVAILABLE'
,p_static_id=>'rehab-consume-time-ranges-available'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CPTR_ID, ',
'       CPTR_NAME || '' '' || CPTR_START_TIME_STR || ''-'' || CPTR_END_TIME_STR CPTR_NAME',
' from V$REHAB_CONSUME_TIME_RANGES_AVAILABLE',
' order by CPTR_START_TIME_STR, CPTR_NAME'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'CPTR_ID'
,p_display_column_name=>'CPTR_NAME'
,p_version_scn=>'SH256:JCdyVOfLhNBq5UWwBmHD6SobnjiolGSsz10SkJv3kzE'
);
wwv_flow_imp.component_end;
end;
/
