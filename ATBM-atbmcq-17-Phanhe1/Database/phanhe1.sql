create pluggable database ORCL21PDB1
admin user pdb_admin identified by password
FILE_NAME_CONVERT = ('pdbseed', 'ORCL21PDB1');

alter pluggable database ORCL21PDB1 open;
--alter pluggable database ORCL21PDB1 close;

alter session set container = ORCL21PDB1;

CREATE USER atbm_user IDENTIFIED BY atbm123;
--CREATE USER atbm_user1 IDENTIFIED BY atbm123;
--CREATE USER atbm_user2 IDENTIFIED BY atbm123;
--GRANT CREATE SESSION TO ATBM_USER2;

-- grant mot so quyen cho atbm_user
GRANT CONNECT, RESOURCE TO atbm_user;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO atbm_user;
GRANT SELECT ON DBA_ROLE_PRIVS TO ATBM_USER;
GRANT SELECT ON dba_sys_privs TO atbm_user;
GRANT SELECT ON dba_roles TO atbm_user;
GRANT CREATE USER TO atbm_user;
GRANT UNLIMITED TABLESPACE TO atbm_user;
GRANT CREATE ROLE TO atbm_user;
GRANT SELECT ON DBA_USERS TO ATBM_USER;
GRANT SELECT ON DBA_ROLE_PRIVS TO ATBM_USER;
GRANT SELECT ON DBA_SYS_PRIVS TO ATBM_USER;
GRANT SELECT ON DBA_TAB_PRIVS TO ATBM_USER;
GRANT SELECT ON DBA_COL_PRIVS TO ATBM_USER;
GRANT DROP USER TO atbm_user;
GRANT DROP ANY ROLE TO atbm_user;






-- De user khác chay các proc can grant
GRANT EXECUTE ON atbm_user.sp_get_all_users TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_roles_of_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_sys_privs_of_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_object_privs_of_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_create_role TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_create_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_all_roles TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_rename_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_drop_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_drop_role TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_rename_role TO PUBLIC;

