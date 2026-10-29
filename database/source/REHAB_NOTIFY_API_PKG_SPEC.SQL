

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_NOTIFY_API_PKG" AS

  procedure setup_notification_next_med(p_NP_PR_ID_EVENT REHAB_NOTIFICATION_PARS.NP_PR_ID_EVENT%type,
                                        p_NP_PR_ID_TRG REHAB_NOTIFICATION_PARS.NP_PR_ID_TRG%type,
                                        p_NP_TIME_DELAY REHAB_NOTIFICATION_PARS.NP_TIME_DELAY%type);

  procedure add_notification_next_med(p_pr_id REHAB_PRESCRIPTIONS.PR_ID%type,
                                      P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type);

END REHAB_NOTIFY_API_PKG;
/

