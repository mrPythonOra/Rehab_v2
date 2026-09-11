


  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_CONFIG_PKG" AS

  function get_config_par(p_par_name varchar2) return varchar2 result_cache AS
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

END REHAB_CONFIG_PKG;
/


