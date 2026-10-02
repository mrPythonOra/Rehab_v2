

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_CONFIG_PKG" AS

  cnstY    constant varchar2(1) := 'Y';
  cnstN    constant varchar2(1) := 'N';

  function get_config_par(p_par_name varchar2) return varchar2 result_cache;

END REHAB_CONFIG_PKG;
/

