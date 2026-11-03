

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_CONFIG_PKG" AS

  function get_config_par(p_par_name REHAB_CONFIGS.PAR_NAME%type) return REHAB_CONFIGS.PAR_VALUE%type result_cache AS
    l_result REHAB_CONFIGS.PAR_VALUE%type;
  BEGIN

    for i in (select * from REHAB_CONFIGS where PAR_NAME = p_par_name order by PAR_TE_ID nulls last, PAR_PAT_ID nulls last)
    loop
      if i.PAR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() then
        l_result := i.PAR_VALUE;
        exit;
      end if;
      if i.PAR_TE_ID = REHAB_CONTEXT_PKG.getTENANT() then
        l_result := i.PAR_VALUE;
        exit;
      end if;
      l_result := i.PAR_VALUE;
    end loop;
    RETURN l_result;
  END get_config_par;

  procedure set_config_par(p_par_name REHAB_CONFIGS.PAR_NAME%type,
                           p_te_id REHAB_CONFIGS.PAR_TE_ID%type,
                           p_pat_id REHAB_CONFIGS.PAR_PAT_ID%type,
                           p_value REHAB_CONFIGS.PAR_VALUE%type)
  is
    l_rows number;
  begin
    REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'set_config_par: p_par_name "%p", p_te_id "%p", p_pat_id "%p", p_value "%p".',p_par_name, p_te_id, p_pat_id, p_value);
    if REHAB_CONTEXT_PKG.AccessLevelADM then
      REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Admin branch.');
      if p_te_id is null and p_pat_id is null then
          update REHAB_CONFIGS set PAR_VALUE = p_value
          where PAR_NAME = p_par_name and PAR_TE_ID is null and PAR_PAT_ID is null;
          REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Common branch updated %p.', sql%rowcount);
      elsif p_te_id is not null and p_pat_id is null then
          update REHAB_CONFIGS set PAR_VALUE = p_value
          where PAR_NAME = p_par_name and PAR_TE_ID = p_te_id and PAR_PAT_ID is null;
          l_rows := sql%rowcount;
          REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Tenant branch updated %p.', l_rows);
          if l_rows = 0 then
            insert into REHAB_CONFIGS (par_name, PAR_HUMAN_NAME, PAR_CATEGOTY, PAR_TE_ID, PAR_PAT_ID, PAR_VALUE, PAR_DESCRIPTION)
            select par_name, PAR_HUMAN_NAME, PAR_CATEGOTY, p_te_id PAR_TE_ID, PAR_PAT_ID, p_value PAR_VALUE, PAR_DESCRIPTION from REHAB_CONFIGS
            where par_name = p_par_name and PAR_TE_ID is null and PAR_PAT_ID is null;
            REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Tenant branch inserted %p.', sql%rowcount);
          end if;
      elsif p_pat_id is not null then
          update REHAB_CONFIGS set PAR_VALUE = p_value
          where PAR_NAME = p_par_name and PAR_TE_ID = (select PAT_TE_ID from REHAB_PATIENTS where PAT_ID = p_pat_id) and PAR_PAT_ID = p_pat_id;
          l_rows := sql%rowcount;
          REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Patient branch updated %p.', l_rows);
          if l_rows = 0 then
            insert into REHAB_CONFIGS (par_name, PAR_HUMAN_NAME, PAR_CATEGOTY, PAR_TE_ID, PAR_PAT_ID, PAR_VALUE, PAR_DESCRIPTION)
            select par_name, PAR_HUMAN_NAME, PAR_CATEGOTY, (select PAT_TE_ID from REHAB_PATIENTS where PAT_ID = p_pat_id) PAR_TE_ID, p_pat_id PAR_PAT_ID, p_value PAR_VALUE, PAR_DESCRIPTION from REHAB_CONFIGS
            where par_name = p_par_name and PAR_TE_ID is null and PAR_PAT_ID is null;
            REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Patient branch inserted %p.', sql%rowcount);
          end if;
      end if;
    else
      update REHAB_CONFIGS set PAR_VALUE = p_value
      where PAR_NAME = p_par_name and PAR_TE_ID = REHAB_CONTEXT_PKG.getTENANT() and PAR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT();
      l_rows := sql%rowcount;
      REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Patient own branch updated %p.', l_rows);
      if l_rows = 0 then
        insert into REHAB_CONFIGS (par_name, PAR_HUMAN_NAME, PAR_CATEGOTY, PAR_TE_ID, PAR_PAT_ID, PAR_VALUE, PAR_DESCRIPTION)
        select par_name, PAR_HUMAN_NAME, PAR_CATEGOTY, REHAB_CONTEXT_PKG.getTENANT() PAR_TE_ID, REHAB_CONTEXT_PKG.getPATIENT() PAR_PAT_ID, p_value PAR_VALUE, PAR_DESCRIPTION from REHAB_CONFIGS
        where par_name = p_par_name and PAR_TE_ID is null and PAR_PAT_ID is null;
        REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Patient own branch inserted %p.', sql%rowcount);
      end if;
    end if;
  end;
  procedure reset_config_par(p_par_name REHAB_CONFIGS.PAR_NAME%type,
                             p_te_id REHAB_CONFIGS.PAR_TE_ID%type,
                             p_pat_id REHAB_CONFIGS.PAR_PAT_ID%type)
  is
  begin
    REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'reset_config_par: p_par_name "%p", p_te_id "%p", p_pat_id "%p".',p_par_name, p_te_id, p_pat_id);
    if REHAB_CONTEXT_PKG.AccessLevelADM then
      REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Admin branch.');
      if p_te_id is not null and p_pat_id is null then
        delete from REHAB_CONFIGS where PAR_NAME = p_par_name and PAR_TE_ID = p_te_id and PAR_PAT_ID is null;
        REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Tenant branch reset %p.', sql%rowcount);
      elsif p_pat_id is not null then
        delete from REHAB_CONFIGS where PAR_NAME = p_par_name and PAR_TE_ID = (select PAT_TE_ID from REHAB_PATIENTS where PAT_ID = p_pat_id) and PAR_PAT_ID = p_pat_id;
        REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Patient branch reset %p.', sql%rowcount);
      end if;
    else
      delete from REHAB_CONFIGS where PAR_NAME = p_par_name and PAR_TE_ID = REHAB_CONTEXT_PKG.getTENANT() and PAR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT();
      REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Patient own branch reset %p.', sql%rowcount);
    end if;
  end;
END REHAB_CONFIG_PKG;
/

