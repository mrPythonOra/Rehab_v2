


  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_CONTEXT_PKG" AS

  gNameSpace constant varchar2(128) := 'REHAB20_CONTEXT';
  gAPEX_USER constant varchar2(128) := 'APEX_USER';
  gTENANT    constant varchar2(128) := 'TENANT';
  gPATIENT   constant varchar2(128) := 'PATIENT';
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
    l_is_superuser boolean;
  begin

    begin
      select PAT_TE_ID, PAT_ID, PAT_IS_SUPERUSER into l_tenant, l_patient, l_is_superuser
        from REHAB_PATIENTS where PAT_APEX_USER = vCurrentApexUser;
    exception
      when no_data_found then
          reset_context;
          return;
    end;

    DBMS_SESSION.SET_CONTEXT (
       namespace => gNameSpace,
       attribute => gAPEX_USER,
       value     => p_apex_user);

    if p_apex_user = vCurrentApexUser or l_is_superuser then
        DBMS_SESSION.SET_CONTEXT (
           namespace => gNameSpace,
           attribute => gMODE,
           value     => 'RW');
    end if;
    if p_apex_user != vCurrentApexUser and not l_is_superuser then
      begin
        select P2PA_CAN_MANAGE, PAT_TE_ID, PAT_ID into l_can_manage, l_tenant, l_patient
          from REHAB_PATIENTS2P_ACCESS a, REHAB_PATIENTS p
         where P2PA_SUBJ_PAT_ID = l_patient and a.P2PA_TRG_PAT_ID=p.PAT_ID and PAT_APEX_USER = p_apex_user;
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
    elsif p_apex_user != vCurrentApexUser and l_is_superuser then
        select
          PAT_TE_ID, PAT_ID into l_tenant, l_patient
        from REHAB_PATIENTS where PAT_APEX_USER = p_apex_user;
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


