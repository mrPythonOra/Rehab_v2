

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_MIGRATE_PKG" AS

  procedure fix_prescriptions(p_prr_id number, p_ws_id number);
  procedure refresh_data;

END REHAB_MIGRATE_PKG;
/

