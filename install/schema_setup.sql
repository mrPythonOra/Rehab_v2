set verify off

begin
  if not &ISCLOUD. then
    begin 
      execute immediate 'create bigfile tablespace &tblspc_name. datafile size 100m autoextend on next 100m maxsize 10000m'; 
    exception 
      when others then dbms_output.put_line('CREATE TABLESPACE "&tblspc_name.": '||sqlerrm);
    end;
  end if;
end;
/

CREATE USER &appschemaname. IDENTIFIED BY &appschemapwd.
      DEFAULT TABLESPACE &tblspc_name.
      TEMPORARY TABLESPACE TEMP;

alter user &appschemaname. quota unlimited on &tblspc_name.;


grant RESOURCE to &appschemaname.;
grant CONNECT to &appschemaname.;

grant select on v$mystat to &appschemaname.;
grant select on v$instance to &appschemaname.;