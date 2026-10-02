

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_CONTEXT_PKG" AS

  gNameSpace constant varchar2(128) := 'REHAB20_CONTEXT';
  gAPEX_USER constant varchar2(128) := 'APEX_USER';
  gTENANT    constant varchar2(128) := 'TENANT';
  gPATIENT   constant varchar2(128) := 'PATIENT';
  gCURR_PATIENT   constant varchar2(128) := 'CURR_PATIENT';
  gMODE      constant varchar2(128) := 'MODE';

  vCurrentApexUser    varchar2(128);

  procedure set_current_user(p_apex_user varchar2)
  is
  begin
    vCurrentApexUser := p_apex_user; --v('APP_USER');
  end;

  procedure set_default_context
  is
  begin
    set_specific_context(vCurrentApexUser);
  end;

  procedure reset_context
  is
  begin
    DBMS_SESSION.CLEAR_ALL_CONTEXT(namespace => gNameSpace);
  end;

  procedure set_specific_context(p_apex_user varchar2)
  is
    l_tenant       number;
    l_patient      number;
    l_can_manage   boolean;
    l_curr_tenant       number;
    l_curr_patient      number;
    l_curr_is_superuser boolean;
    l_curr_is_tenantadm boolean;
    l_cnt          number;
  begin

    reset_context;

    begin
      select PAT_ID, PAT_TE_ID, PAT_IS_SUPERUSER, PAT_IS_TENANTADM into l_curr_patient, l_curr_tenant, l_curr_is_superuser, l_curr_is_tenantadm
        from REHAB_PATIENTS where PAT_APEX_USER = vCurrentApexUser;
    exception
      when no_data_found then
          --reset_context;
          return;
    end;

    DBMS_SESSION.SET_CONTEXT (
        namespace => gNameSpace,
        attribute => gCURR_PATIENT,
        value     => l_curr_patient);

    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gAPEX_USER,
       value     => vCurrentApexUser);

    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gMODE,
       value     => 'RW');

    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gTENANT,
       value     => l_curr_tenant);
    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gPATIENT,
       value     => l_curr_patient);

    select count(1) into l_cnt from (
        select PAT_APEX_USER from REHAB_PATIENTS
         where (select PAT_IS_SUPERUSER from REHAB_PATIENTS where PAT_APEX_USER=vCurrentApexUser)
        union
        select PAT_APEX_USER from REHAB_PATIENTS
         where PAT_TE_ID in (select PAT_TE_ID from REHAB_PATIENTS where PAT_APEX_USER=vCurrentApexUser and PAT_IS_TENANTADM)
        union
        select PAT_APEX_USER from REHAB_PATIENTS
         where PAT_ID in (select P2PA_TRG_PAT_ID from REHAB_PATIENTS2P_ACCESS where P2PA_SUBJ_PAT_ID=l_curr_patient)
        union
        select PAT_APEX_USER from REHAB_PATIENTS
         where PAT_APEX_USER=vCurrentApexUser)
     where PAT_APEX_USER = p_apex_user;

    if l_cnt = 0 then
      --reset_context;
      return;
    end if;

    begin
      select PAT_ID, PAT_TE_ID into l_patient, l_tenant
        from REHAB_PATIENTS where PAT_APEX_USER = p_apex_user;
    exception
      when no_data_found then
          --reset_context;
          return;
    end;

    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gAPEX_USER,
       value     => p_apex_user);

    if p_apex_user = vCurrentApexUser or l_curr_is_superuser then
        DBMS_SESSION.SET_CONTEXT (
           namespace => gNameSpace,
           attribute => gMODE,
           value     => 'RW');
    end if;
    if p_apex_user != vCurrentApexUser and not l_curr_is_superuser and l_curr_tenant=l_tenant and l_curr_is_tenantadm then
        DBMS_SESSION.SET_CONTEXT (
           namespace => gNameSpace,
           attribute => gMODE,
           value     => 'RW');
    end if;
    if p_apex_user != vCurrentApexUser and not l_curr_is_superuser and not (l_curr_tenant=l_tenant and l_curr_is_tenantadm) then
      begin
        select P2PA_CAN_MANAGE into l_can_manage
          from REHAB_PATIENTS2P_ACCESS a
         where P2PA_SUBJ_PAT_ID = l_curr_patient and a.P2PA_TRG_PAT_ID=l_patient;
        DBMS_SESSION.SET_CONTEXT (
           namespace => gNameSpace,
           attribute => gMODE,
           value     => case when l_can_manage then 'RW' else 'RO' end);
      exception
        when no_data_found then
          begin
            reset_context;
            raise_application_error(-20000, 'No access of a current user "'||vCurrentApexUser||'" to the given user "'||p_apex_user||'"');
          end;
      end;
    end if;

    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gTENANT,
       value     => l_tenant);
    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gPATIENT,
       value     => l_patient);
  end;

  function getCURR_APEX_USER return varchar2 is begin return vCurrentApexUser; end;
  function getCURR_PATIENT   return number   is begin return SYS_CONTEXT(gNameSpace, gCURR_PATIENT); end;
  function getGLOBAL_DATE    return date     is begin return to_date(nvl(v('GLOBAL_DATE'),to_char(sysdate,'YYYY-MM-DD')),'YYYY-MM-DD'); end;

  function getAPEX_USER return varchar2 is begin return SYS_CONTEXT(gNameSpace, gAPEX_USER); end;
  function getTENANT    return number is begin return SYS_CONTEXT(gNameSpace, gTENANT); end;
  function getPATIENT   return number is begin return SYS_CONTEXT(gNameSpace, gPATIENT); end;
  function getMODE      return varchar2 is begin return SYS_CONTEXT(gNameSpace, gMODE); end;


  function AccessLevelRW     return boolean is begin return nvl(getMODE,'~') = 'RW'; end;
  function AccessLevelRO     return boolean is begin return nvl(getMODE,'~') in ('RW', 'RO'); end;

begin
   set_current_user(v('APP_USER'));
END REHAB_CONTEXT_PKG;
/

