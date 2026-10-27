

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_APPSTATE" AS

  type t_params is table of varchar2(4000) index by varchar2(256);
  gParams t_params;

  function curr_storage_id return apex_stored_states.storage_id%type;

--  procedure set_jparam(p_pname      varchar2,
--                       p_value      varchar2);

  procedure set_jparam(p_pname      varchar2,
                       p_value      varchar2);

--  procedure get_jparam(p_pname      varchar2,
--                       p_value  out varchar2,
--                       p_default    varchar2 default null);

  procedure get_jparam(p_pname      varchar2,
                       p_value  out varchar2,
                       p_default    varchar2 default null);

  function  get_jparam(p_pname      varchar2,
                       p_default    varchar2 default null) return varchar2;

  procedure del_jparam(p_pname      varchar2);

  procedure store_jparams(p_storage_name APEX_STORED_STATES.STORAGE_NAME%type);
  procedure extract_jparams(p_app_user apex_stored_states.app_user%type,
                            p_app_page apex_stored_states.app_page%type);
  procedure extract_jparams(p_storage_id apex_stored_states.storage_id%type,
                            p_app_user apex_stored_states.app_user%type,
                            p_app_page apex_stored_states.app_page%type);

  procedure delete_storage(p_storage_id apex_stored_states.storage_id%type);

END REHAB_APPSTATE;
/

