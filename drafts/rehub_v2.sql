drop user rehab_v2 cascade;
create user rehab_v2 identified by ljhRluih76j$hsLPh;
grant connect, resource to rehab_v2;
alter user rehab_v2 quota 2g on data;
grant CREATE ASSERTION to rehab_v2;
grant READ ANY TABLE on schema reabilitation to rehab_v2;