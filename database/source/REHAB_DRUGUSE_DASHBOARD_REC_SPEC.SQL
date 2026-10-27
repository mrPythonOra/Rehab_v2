

  CREATE OR REPLACE EDITIONABLE TYPE "REHAB_DRUGUSE_DASHBOARD_REC"
  OID '5ED265B5DCB96F7CE0638D62000A0BD7' AS OBJECT (
    id           number,
    mainlabel    VARCHAR2(4000),
    sublabel     varchar2(4000),
    data1        VARCHAR2(4000),
    data2        VARCHAR2(4000),
    bagecol      VARCHAR2(4000),
    bagelabel    VARCHAR2(4000),
    app_page     number,
    dru_id       number,
    dr_id        number,
    prr_id       number,
    pr_id        number,
    pratr_id     number,
    prd_id       number,
    cptr_id      number,
    drug_img     blob
);
/

