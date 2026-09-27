prompt --workspace/credentials/app_200_push_notifications_credentials
begin
--   Manifest
--     CREDENTIAL: App 200 Push Notifications Credentials
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_imp_workspace.create_credential(
 p_id=>17080362072505681
,p_name=>'App 200 Push Notifications Credentials'
,p_static_id=>'app-200-push-notifications-credentials'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
