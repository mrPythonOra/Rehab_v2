

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_DRUGUSE_PKG" AS

  function druguse_dashboard_ref(p_tp_id REHAB_TIME_PERIODS.TP_ID%type) return rehab_druguse_dashboard_tab pipelined;

  procedure consume_drug(p_dru_prd_id REHAB_DRUG_USES.dru_prd_id%type,
                         P_DRU_PR_ID REHAB_DRUG_USES.DRU_PR_ID%type,
                         P_DRU_CPTR_ID REHAB_DRUG_USES.DRU_CPTR_ID%type,
                         P_DRU_DR_ID REHAB_DRUG_USES.DRU_DR_ID%type,
                         P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type,
                         P_DRU_ACTUAL_DOSAGE REHAB_DRUG_USES.DRU_ACTUAL_DOSAGE%type);
--  procedure consume_drug_now
--                        (p_dru_prd_id REHAB_DRUG_USES.dru_prd_id%type,
--                         P_DRU_PR_ID REHAB_DRUG_USES.DRU_PR_ID%type,
--                         P_DRU_CPTR_ID REHAB_DRUG_USES.DRU_CPTR_ID%type,
--                         P_DRU_DR_ID REHAB_DRUG_USES.DRU_DR_ID%type);

  procedure modify_drug_use(p_dru_id REHAB_DRUG_USES.dru_id%type,
                            P_DRU_CONSUMED REHAB_DRUG_USES.DRU_CONSUMED%type,
                            P_DRU_ACTUAL_DOSAGE REHAB_DRUG_USES.DRU_ACTUAL_DOSAGE%type);
  procedure remove_drug_use(p_dru_id REHAB_DRUG_USES.dru_id%type);

END REHAB_DRUGUSE_PKG;
/

