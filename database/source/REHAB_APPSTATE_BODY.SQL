

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_APPSTATE" AS

--  procedure set_jparam(p_pname      varchar2,
--                       p_value      varchar2)
--  is
--  begin
--    extract_jparams();
--    gParams(p_pname):=p_value;
--    store_jparams();
--  end;
  gStorageId apex_stored_states.storage_id%type;
  gApp_User  apex_stored_states.app_user%type;
  gApp_Page  apex_stored_states.app_page%type;
  gStorage_Type apex_stored_states.STORAGE_TYPE%type;

  function curr_storage_id return apex_stored_states.storage_id%type
  is
  begin
    return gStorageId;
  end;

  procedure set_jparam(p_pname      varchar2,
                         p_value      varchar2)
  is
  begin
    gParams(p_pname):=p_value;
  end;

  procedure del_jparam(p_pname      varchar2)
  is
  begin
    gParams.delete(p_pname);
  end;

  procedure delete_storage(p_storage_id apex_stored_states.storage_id%type)
  is
  begin
    delete from apex_stored_states
         where storage_id = p_storage_id;
  end;

  procedure store_jparams(p_storage_name APEX_STORED_STATES.STORAGE_NAME%type)
  is
    l_indx varchar2(100);
  begin
    APEX_JSON.initialize_clob_output;
    APEX_JSON.open_object;
    APEX_JSON.open_array('params');
    l_indx := gParams.first;
    loop
      if gParams(l_indx) is not null then
        APEX_JSON.open_object;
        APEX_JSON.write('param_name', l_indx);
        APEX_JSON.write('param_value', gParams(l_indx));
        APEX_JSON.close_object;
      end if;
      l_indx := gParams.next(l_indx);
      exit when l_indx is null;
    end loop;

    APEX_JSON.close_array;
    APEX_JSON.close_object;

    if gStorageId is null then gStorageId := sq_apex_stored_states.nextval; end if;

    if p_storage_name is not null
    then
        gStorage_Type := 'USERDEFINED';
        merge /*+ noparallel */ into apex_stored_states t
        using (select gStorageId STORAGE_ID,
                      gApp_User app_user,
                      gApp_Page app_page,
                      gStorage_Type STORAGE_TYPE,
                      p_storage_name STORAGE_NAME,
                      systimestamp STORAGE_UPDATED,
                      APEX_JSON.get_clob_output PARAMS
                 from dual) s
        on (t.app_user = s.app_user and t.app_page = s.app_page and t.STORAGE_NAME = s.STORAGE_NAME)
        when matched then update set t.PARAMS = s.PARAMS, t.STORAGE_UPDATED=s.STORAGE_UPDATED
        when not matched then insert (t.storage_id, t.APP_USER, t.APP_PAGE, t.STORAGE_TYPE, t.STORAGE_NAME, t.STORAGE_UPDATED, t.PARAMS)
          values (sq_apex_stored_states.nextval, s.APP_USER, s.APP_PAGE, s.STORAGE_TYPE, s.STORAGE_NAME, s.STORAGE_UPDATED, s.PARAMS)
          returning storage_id into gStorageId;
    else
        if gStorage_Type is null then gStorage_Type := 'DEFAULT'; end if;
        merge into apex_stored_states t
        using (select gStorageId STORAGE_ID,
                      gApp_User app_user,
                      gApp_Page app_page,
                      gStorage_Type STORAGE_TYPE,
                      case when gStorage_Type = 'DEFAULT' then 'Default' else p_storage_name end case STORAGE_NAME,
                      systimestamp STORAGE_UPDATED,
                      APEX_JSON.get_clob_output PARAMS
                 from dual) s
        on (t.STORAGE_ID = s.STORAGE_ID)
        when matched then update set t.PARAMS = s.PARAMS, t.STORAGE_UPDATED=s.STORAGE_UPDATED
        when not matched then insert (t.storage_id, t.APP_USER, t.APP_PAGE, t.STORAGE_TYPE, t.STORAGE_NAME, t.STORAGE_UPDATED, t.PARAMS)
          values (s.storage_id, s.APP_USER, s.APP_PAGE, s.STORAGE_TYPE, s.STORAGE_NAME, s.STORAGE_UPDATED, s.PARAMS);
    end if;

    APEX_JSON.free_output;
--    gStorageId := null;
--    gApp_User := null;
--    gApp_Page := null;
--    gStorage_Type := null;
  end;

  procedure extract_jparams_i(p_storage_id apex_stored_states.storage_id%type,
                              p_app_user apex_stored_states.app_user%type,
                              p_app_page apex_stored_states.app_page%type)
  is
    l_json_text VARCHAR2(32767);
    l_count     PLS_INTEGER;
  begin
    gParams.delete;

    if p_storage_id is not null then
        select STORAGE_TYPE, params into gStorage_Type, l_json_text from apex_stored_states
         where storage_id = p_storage_id;
        gStorageId := p_storage_id;
    else
        begin
            select storage_id, STORAGE_TYPE, params into gStorageId, gStorage_Type, l_json_text from apex_stored_states
             where app_user = p_app_user and app_page = p_app_page and storage_type = 'DEFAULT';
        exception
          when no_data_found then null;
        end;
    end if;

    if gStorageId is not null then
        APEX_JSON.parse(l_json_text);
        l_count := APEX_JSON.get_count(p_path => 'params');

        FOR i IN 1 .. l_count LOOP
          gParams(APEX_JSON.get_varchar2(p_path => 'params[%d].param_name', p0 => i)) := APEX_JSON.get_varchar2(p_path => 'params[%d].param_value', p0 => i);
        END LOOP;
    end if;
  exception
      when no_data_found then null;
  end;

  procedure extract_jparams(p_storage_id apex_stored_states.storage_id%type,
                            p_app_user apex_stored_states.app_user%type,
                            p_app_page apex_stored_states.app_page%type)
  is
  begin
    gStorageId := p_storage_id;
    gApp_User := p_app_user;
    gApp_Page := p_app_page;
    extract_jparams_i(p_storage_id, null, null);
  end;

  procedure extract_jparams(p_app_user apex_stored_states.app_user%type, p_app_page apex_stored_states.app_page%type)
  is
  begin
    gStorageId := null;
    gApp_User := p_app_user;
    gApp_Page := p_app_page;
    extract_jparams_i(null, p_app_user, p_app_page);
  end;

--  procedure get_jparam(p_pname      varchar2,
--                       p_value  out varchar2,
--                       p_default    varchar2 default null)
--  is
--  begin
--    extract_jparams();
--
--    if gParams.exists(p_pname) then
--      p_value := gParams(p_pname);
--    else
--      p_value := p_default;
--    end if;
--  end;

  procedure get_jparam(p_pname      varchar2,
                         p_value  out varchar2,
                         p_default    varchar2 default null)
  is
  begin

    if gParams.exists(p_pname) then
      p_value := gParams(p_pname);
    else
      p_value := p_default;
    end if;
  end;

  function  get_jparam(p_pname      varchar2,
                       p_default    varchar2 default null) return varchar2
  is
    l_res varchar2(4000);
  begin
    get_jparam(p_pname, l_res, p_default);
    return l_res;
  end;

END REHAB_APPSTATE;
/

