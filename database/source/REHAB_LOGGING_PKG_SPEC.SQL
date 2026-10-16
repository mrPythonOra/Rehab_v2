

  CREATE OR REPLACE EDITIONABLE PACKAGE "REHAB_LOGGING_PKG" AS

  function prepmsg(p_msg varchar2,
                p1 varchar2 default null,
                p2 varchar2 default null,
                p3 varchar2 default null,
                p4 varchar2 default null,
                p5 varchar2 default null,
                p6 varchar2 default null,
                p7 varchar2 default null,
                p8 varchar2 default null) return varchar2;

  procedure logmsg(
                p_unit varchar2,
                p_line varchar2,
                p_msg varchar2,
                p1 varchar2 default null,
                p2 varchar2 default null,
                p3 varchar2 default null,
                p4 varchar2 default null,
                p5 varchar2 default null,
                p6 varchar2 default null,
                p7 varchar2 default null,
                p8 varchar2 default null);
  procedure lognraise
               (p_unit varchar2,
                p_line varchar2,
                p_msg varchar2,
                p1 varchar2 default null,
                p2 varchar2 default null,
                p3 varchar2 default null,
                p4 varchar2 default null,
                p5 varchar2 default null,
                p6 varchar2 default null,
                p7 varchar2 default null,
                p8 varchar2 default null);

END REHAB_LOGGING_PKG;
/

