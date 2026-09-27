create or replace TYPE rehab_druguse_dashboard_rec AS OBJECT (
    id           number,
    mainlabel    VARCHAR2(4000),
    sublabel     varchar2(4000),
    data1        VARCHAR2(4000),
    data2        VARCHAR2(4000),
    bagecol      VARCHAR2(4000),
    bagelabel    VARCHAR2(4000),
    app_page     number,
    dr_id        number,
    pr_id        number,
    prr_id       number,
    cptr_id      number,
    drug_img     blob
);
/
create or replace TYPE rehab_druguse_dashboard_tab AS TABLE OF rehab_druguse_dashboard_rec;
/
create or replace TYPE rehab_dashboard_rec AS OBJECT (
    id           number,
    mainlabel    VARCHAR2(4000),
    sublabel     varchar2(4000),
    data1        VARCHAR2(4000),
    data2        VARCHAR2(4000),
    iconfile     VARCHAR2(4000),
    bagecol      VARCHAR2(4000),
    bagelabel    VARCHAR2(4000),    
    app_page     number
);
/
create or replace TYPE rehab_dashboard_tab AS TABLE OF rehab_dashboard_rec;
/

select da.*, dr.DR_ITEM_IMAGE1 from table(REHAB_DRUGUSE_PKG.druguse_dashboard_ref) da, REHAB_DRUGS dr where da.dr_id = dr.dr_id;

set serveroutput on
DECLARE
    v_checkbox VARCHAR2(10) := UNISTR('\D83D\DDF9');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Task Status: ' || v_checkbox || ' Completed');
END;
/
DECLARE
    v_cross_box VARCHAR2(10) := UNISTR('\D83D\DDF7');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Task Status: ' || v_cross_box || ' Cancelled');
END;
/