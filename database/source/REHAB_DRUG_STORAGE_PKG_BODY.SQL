

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_DRUG_STORAGE_PKG" AS

  procedure validate_quantity     (p_DA_ID          REHAB_DRUG_ACCOUNTINGS.DA_ID%TYPE,
                                   p_move_quantity  number,
                                   p_available_qnt  out number) AS
  BEGIN
    select
           DA_QUANTITY * DA_ENTIRY_WEIGHT
      into p_available_qnt
    from REHAB_DRUG_ACCOUNTINGS
    where DA_ID = p_DA_ID;
  END validate_quantity;

  procedure validate_drug_movement(p_DA_ID          REHAB_DRUG_ACCOUNTINGS.DA_ID%TYPE,
                                   p_move_quantity  number,
                                   p_result_msg out varchar2) AS
    l_available_quantity_mg number;
  BEGIN
    validate_quantity(p_DA_ID, p_move_quantity, l_available_quantity_mg);
    p_result_msg := case when l_available_quantity_mg >= p_move_quantity then 'Занесено достатньо медикаменту.' else 'Недостатньо медикаменту, занесено: '||l_available_quantity_mg||' мг.' end;
  END validate_drug_movement;

  procedure move_drug_to_storage  (p_DA_ID          REHAB_DRUG_ACCOUNTINGS.DA_ID%TYPE,
                                   p_ds_id_trg      REHAB_DRUG_ACCOUNTINGS.DA_DS_ID%TYPE,
                                   p_move_quantity  number) AS
    l_available_quantity_mg number;
  BEGIN
    validate_quantity(p_DA_ID, p_move_quantity, l_available_quantity_mg);
    if l_available_quantity_mg >= p_move_quantity then
      for i in (select * from REHAB_DRUG_ACCOUNTINGS where DA_ID = p_DA_ID) loop
        INSERT INTO rehab_drug_accountings
               (da_id,
                da_ds_id,      da_dr_id,   da_prr_id,   da_pr_id,   da_ws_id,   da_pratr_id,
                da_order_type, da_quantity,                                   da_entiry_weight, da_cost,
                  da_purchased,   da_check_point_dt,   da_best_before)
        VALUES (SQ_REHAB_DRUG_ACCOUNTINGS.nextval,
                p_ds_id_trg, i.da_dr_id, i.da_prr_id, i.da_pr_id, i.da_ws_id, i.da_pratr_id,
                cotMovement,   round(p_move_quantity/i.da_entiry_weight,3), i.da_entiry_weight, round(i.da_cost*(p_move_quantity/(i.da_quantity*i.da_entiry_weight)),3),
                i.da_purchased, i.da_check_point_dt, i.da_best_before);
        update rehab_drug_accountings set
          da_quantity = da_quantity - round(p_move_quantity/i.da_entiry_weight,3),
          da_cost = da_cost - round(i.da_cost*(p_move_quantity/(i.da_quantity*i.da_entiry_weight)),3)
        where DA_ID = p_DA_ID;
      end loop;
    else
      raise_application_error(-20100,'Недостатньо медикаменту, занесено: '||l_available_quantity_mg||' мг.');
    end if;
  END move_drug_to_storage;

END REHAB_DRUG_STORAGE_PKG;
/

