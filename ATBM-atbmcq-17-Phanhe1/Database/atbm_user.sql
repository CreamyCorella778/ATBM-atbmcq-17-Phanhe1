-- L?y danh sách ng??i dùng
CREATE OR REPLACE PROCEDURE sp_get_all_users (
    p_cursor OUT SYS_REFCURSOR
) 
AUTHID CURRENT_USER
AS
BEGIN
    OPEN p_cursor FOR
    SELECT username FROM all_users ORDER BY username;
END;
/

-- L?y danh sách role
CREATE OR REPLACE PROCEDURE sp_get_roles_of_user (
    p_username IN VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
)
AUTHID CURRENT_USER
AS
BEGIN
    OPEN p_cursor FOR
        SELECT granted_role
        FROM dba_role_privs
        WHERE grantee = UPPER(p_username);
END;
/

-- L?y quy?n c?a user
CREATE OR REPLACE PROCEDURE SP_GET_SYS_PRIVS_OF_USER (
    p_username IN VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
)
AUTHID CURRENT_USER
AS
BEGIN
    OPEN p_cursor FOR
    SELECT privilege
    FROM dba_sys_privs
    WHERE grantee = UPPER(p_username);
END;
/

CREATE OR REPLACE PROCEDURE sp_get_object_privs_of_user (
    p_username IN VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
)
AUTHID CURRENT_USER
AS
BEGIN
    OPEN p_cursor FOR
    SELECT grantee, table_schema AS owner, table_name, privilege
    FROM all_tab_privs
    WHERE grantee = UPPER(p_username);
END;
/

