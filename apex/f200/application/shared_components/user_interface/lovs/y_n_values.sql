prompt --application/shared_components/user_interface/lovs/y_n_values
begin
--   Manifest
--     Y_N_VALUES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.6'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(82717607418827219)
,p_lov_name=>'Y_N_VALUES'
,p_static_id=>'y-n-values'
,p_lov_query=>'.'||wwv_flow_imp.id(82717607418827219)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:wQfXpruroS_gneN-1Msp8dp5RegRc2a_VKJoXTZZznw'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(82718298111827235)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('\041D\0456')
,p_lov_return_value=>'N'
,p_static_id=>'n'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(82717812932827231)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('\0422\0430\043A')
,p_lov_return_value=>'Y'
,p_static_id=>'y'
);
wwv_flow_imp.component_end;
end;
/
