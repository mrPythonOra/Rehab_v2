

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_UI_REPORTS_PKG" AS

  function dashboard_ref return rehab_dashboard_tab pipelined;

  function clr(p_color varchar2, p_txt varchar2) return varchar2;

END REHAB_UI_REPORTS_PKG;
/

