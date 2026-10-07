

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_PRESCRIPTIONS_PKG" AS

    procedure delete_prescriptor(p_PRR_ID REHAB_PRESCRIPTORS.PRR_ID%type);

    procedure insert_PRESCRIPTION (
         p_PR_ID out REHAB_PRESCRIPTIONS.PR_ID%type
        ,p_PR_DR_ID in REHAB_PRESCRIPTIONS.PR_DR_ID%type
        ,p_PR_PAT_ID in REHAB_PRESCRIPTIONS.PR_PAT_ID%type
        ,p_PR_PRR_ID in REHAB_PRESCRIPTIONS.PR_PRR_ID%type
        ,p_PR_NOTES in REHAB_PRESCRIPTIONS.PR_NOTES%type default null
        ,p_PR_PLANNED_START in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_START%type default null
        ,p_PR_PLANNED_END in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_END%type default null
        ,p_ts_format varchar2
    );
    -- update
    procedure update_PRESCRIPTION (
         p_PR_ID in REHAB_PRESCRIPTIONS.PR_ID%type
        ,p_PR_DR_ID in REHAB_PRESCRIPTIONS.PR_DR_ID%type
        ,p_PR_NOTES in REHAB_PRESCRIPTIONS.PR_NOTES%type default null
        ,p_PR_PLANNED_START in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_START%type default null
        ,p_PR_PLANNED_END in varchar2 --REHAB_PRESCRIPTIONS.PR_PLANNED_END%type default null
        ,p_ts_format varchar2
    );
    -- delete
    procedure delete_PRESCRIPTION (
        p_PR_ID in REHAB_PRESCRIPTIONS.PR_ID%type
    );
END REHAB_PRESCRIPTIONS_PKG;
/

