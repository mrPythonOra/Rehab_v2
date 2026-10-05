

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_CONTEXT_PKG" AS

  procedure set_default_context;
  procedure set_specific_context(p_apex_user varchar2);
  procedure reset_context;

  function getCURR_APEX_USER return varchar2;
  function getCURR_PATIENT   return number;

  function getAPEX_USER return varchar2;
  function getTENANT    return number;
  function getPATIENT   return number;
  function getMODE      return varchar2;
  function getGLOBAL_DATE return date;
  function getGLOBAL_DATE_TRUNC return date;
  function getGLOBAL_DATE_TSTZ return timestamp with time zone;

  function AccessLevelRW     return boolean;
  function AccessLevelRO     return boolean;

  --debug
  procedure set_current_user(p_apex_user varchar2);

END REHAB_CONTEXT_PKG;
/

