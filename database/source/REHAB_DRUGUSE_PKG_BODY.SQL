


  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_DRUGUSE_PKG" AS

  function druguse_dashboard_ref return rehab_druguse_dashboard_tab pipelined AS
    l_img blob;
    l_img2 blob;
  BEGIN
    select DR_ITEM_IMAGE1 into l_img
    from REHAB_DRUGS where DR_ID = 21;
    pipe row (rehab_druguse_dashboard_rec(
       1,           --     id           number,
       'Main',      --     mainlabel    VARCHAR2(4000),
       'SubLabel',  --     sublabel     varchar2(4000),
       'Data1',     --     data1        VARCHAR2(4000),
       'Data2',     --     data2        VARCHAR2(4000),
       'bagecol',   --bagecol      VARCHAR2(4000),
       'bagelabel', --bagelabel    VARCHAR2(4000),
       1,           -- app_page     number,
       21,           -- dr_id        number,
       0,           -- pr_id        number,
       0,           -- prr_id       number,
       0,           -- cptr_id      number,
       l_img        -- drug_img     blob
    ));

    select DR_ITEM_IMAGE1 into l_img
    from REHAB_DRUGS where DR_ID = 61;
    pipe row (rehab_druguse_dashboard_rec(
       2,           --     id           number,
       'Main1',      --     mainlabel    VARCHAR2(4000),
       'SubLabel1',  --     sublabel     varchar2(4000),
       'Data11',     --     data1        VARCHAR2(4000),
       'Data21',     --     data2        VARCHAR2(4000),
       '',   --bagecol      VARCHAR2(4000),
       '', --bagelabel    VARCHAR2(4000),
       1,           -- app_page     number,
       61,           -- dr_id        number,
       0,           -- pr_id        number,
       0,           -- prr_id       number,
       0,           -- cptr_id      number,
       l_img        -- drug_img     blob
    ));

    RETURN;
  END druguse_dashboard_ref;

END REHAB_DRUGUSE_PKG;
/


