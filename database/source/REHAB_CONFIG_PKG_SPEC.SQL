

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_CONFIG_PKG" AS

  cnstY    constant varchar2(1) := 'Y';
  cnstN    constant varchar2(1) := 'N';

  function get_config_par(p_par_name REHAB_CONFIGS.PAR_NAME%type) return REHAB_CONFIGS.PAR_VALUE%type result_cache;

  procedure set_config_par(p_par_name REHAB_CONFIGS.PAR_NAME%type,
                           p_te_id REHAB_CONFIGS.PAR_TE_ID%type,
                           p_pat_id REHAB_CONFIGS.PAR_PAT_ID%type,
                           p_value REHAB_CONFIGS.PAR_VALUE%type);
  procedure reset_config_par(p_par_name REHAB_CONFIGS.PAR_NAME%type,
                             p_te_id REHAB_CONFIGS.PAR_TE_ID%type,
                             p_pat_id REHAB_CONFIGS.PAR_PAT_ID%type);

END REHAB_CONFIG_PKG;
/

