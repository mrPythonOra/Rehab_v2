

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_DRUG_STORAGE_PKG" AS

  cotRemains  constant number := 1;
  cotPurch    constant number := 2;
  cotMovement constant number := 3;
  cotDiscard  constant number := 4;

  procedure validate_drug_movement(p_DA_ID          REHAB_DRUG_ACCOUNTINGS.DA_ID%TYPE,
                                   p_move_quantity  number,
                                   p_result_msg out varchar2);
  procedure move_drug_to_storage  (p_DA_ID          REHAB_DRUG_ACCOUNTINGS.DA_ID%TYPE,
                                   p_ds_id_trg      REHAB_DRUG_ACCOUNTINGS.DA_DS_ID%TYPE,
                                   p_move_quantity  number);

  procedure assign_pr(P_DA_ID REHAB_DRUG_ACCOUNTINGS.DA_ID%type,
                      P_PRR_ID REHAB_PRESCRIPTORS.PRR_ID%type,
                      P_PR_ID REHAB_PRESCRIPTIONS.PR_ID%type,
                      P_PRATR_ID REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES.PRATR_ID%type);

  procedure remove_assign_pr(P_DA_ID REHAB_DRUG_ACCOUNTINGS.DA_ID%type);

END REHAB_DRUG_STORAGE_PKG;
/

