-- L?y danh sách ng??i dùng
CREATE OR REPLACE PROCEDURE atbm_user.sp_get_all_users (
    p_cursor OUT SYS_REFCURSOR
) 
AUTHID CURRENT_USER
AS
BEGIN
    OPEN p_cursor FOR
    SELECT username FROM all_users 
    WHERE ORACLE_MAINTAINED = 'N' 
  AND COMMON = 'NO' 
  AND USERNAME NOT IN ('SYS', 'SYSTEM', 'OUTLN', 'DBSNMP', 'APPQOSSYS', 'AUDSYS', 'CTXSYS', 'DVSYS', 'FLOWS_FILES', 'GSMADMIN_INTERNAL', 'LBACSYS', 'MDSYS', 'OJVMSYS', 'ORDDATA', 'ORDPLUGINS', 'ORDSYS', 'XDB', 'WMSYS', 'PUBLIC')
    ORDER BY username;
END;
/

-- L?y danh sách role
CREATE OR REPLACE PROCEDURE atbm_user.sp_get_roles_of_user (
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
CREATE OR REPLACE PROCEDURE atbm_user.SP_GET_SYS_PRIVS_OF_USER (
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

CREATE OR REPLACE PROCEDURE atbm_user.sp_get_object_privs_of_user (
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


CREATE OR REPLACE PROCEDURE atbm_user.sp_create_user (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    p_result OUT VARCHAR2
)
AUTHID DEFINER
AS
    v_sql VARCHAR2(1000);
BEGIN
    BEGIN
        v_sql := 'CREATE USER ' || p_username || ' IDENTIFIED BY ' || p_password;
        EXECUTE IMMEDIATE v_sql;
        p_result := 'User created successfully';
    EXCEPTION
        WHEN OTHERS THEN
            p_result := 'Error creating user: ' || SQLERRM;
    END;
END;
/

-- Create a new role
CREATE OR REPLACE PROCEDURE atbm_user.sp_create_role (
    p_rolename IN VARCHAR2,
    p_result OUT VARCHAR2
)
AUTHID CURRENT_USER
AS
    v_sql VARCHAR2(1000);
BEGIN
    BEGIN
        v_sql := 'CREATE ROLE ' || p_rolename;
        EXECUTE IMMEDIATE v_sql;
        p_result := 'Role created successfully';
    EXCEPTION
        WHEN OTHERS THEN
            p_result := 'Error creating role: ' || SQLERRM;
    END;
END;
/

-- Get all roles for dropdown
CREATE OR REPLACE PROCEDURE atbm_user.sp_get_all_roles (
    p_cursor OUT SYS_REFCURSOR
)
AUTHID CURRENT_USER
AS
BEGIN
    OPEN p_cursor FOR
    SELECT role FROM dba_roles 
    WHERE ORACLE_MAINTAINED = 'N'
    ORDER BY role ;
END;
/



CREATE OR REPLACE PROCEDURE atbm_user.sp_rename_user(
    p_old_username IN VARCHAR2,
    p_new_username IN VARCHAR2,
    p_new_password IN VARCHAR2,
    p_result OUT VARCHAR2
)
AS
    v_role_count NUMBER;
    v_sys_priv_count NUMBER;
    v_tab_priv_count NUMBER;
    v_col_priv_count NUMBER;
    v_role_cursor SYS_REFCURSOR;
    v_sys_priv_cursor SYS_REFCURSOR;
    v_tab_priv_cursor SYS_REFCURSOR;
    v_col_priv_cursor SYS_REFCURSOR;
    
    v_role VARCHAR2(100);
    v_sys_priv VARCHAR2(100);
    v_table_name VARCHAR2(100);
    v_privilege VARCHAR2(100);
    v_grantable VARCHAR2(5);
    v_column_name VARCHAR2(100);
    
    v_create_user_stmt VARCHAR2(200);
    v_grant_role_stmt VARCHAR2(200);
    v_grant_sys_priv_stmt VARCHAR2(200);
    v_grant_tab_priv_stmt VARCHAR2(250);
    v_grant_col_priv_stmt VARCHAR2(300);
BEGIN
    -- Kiểm tra user cũ có tồn tại không
    SELECT COUNT(*) INTO v_role_count FROM DBA_USERS WHERE USERNAME = UPPER(p_old_username);
    
    IF v_role_count = 0 THEN
        p_result := 'Error: User ' || p_old_username || ' không tồn tại';
        RETURN;
    END IF;
    
    -- Kiểm tra user mới đã tồn tại chưa
    SELECT COUNT(*) INTO v_role_count FROM DBA_USERS WHERE USERNAME = UPPER(p_new_username);
    
    IF v_role_count > 0 THEN
        p_result := 'Error: User ' || p_new_username || ' đã tồn tại';
        RETURN;
    END IF;
    
    -- Tạo user mới với mật khẩu mới hoặc giữ nguyên mật khẩu
    BEGIN
        IF p_new_password IS NOT NULL THEN
            v_create_user_stmt := 'CREATE USER ' || p_new_username || ' IDENTIFIED BY ' || p_new_password;
        ELSE
            -- Không đổi mật khẩu, giữ nguyên mật khẩu (không thể truy xuất mật khẩu cũ)
            -- Bạn có thể yêu cầu người dùng nhập mật khẩu mới bắt buộc
            p_result := 'Error: Khi đổi tên user, mật khẩu mới là bắt buộc';
            RETURN;
        END IF;
        
        EXECUTE IMMEDIATE v_create_user_stmt;
    EXCEPTION
        WHEN OTHERS THEN
            p_result := 'Error creating new user: ' || SQLERRM;
            RETURN;
    END;
    
    -- Cấp lại các role
    OPEN v_role_cursor FOR 
        SELECT GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTEE = UPPER(p_old_username);
    
    LOOP
        FETCH v_role_cursor INTO v_role;
        EXIT WHEN v_role_cursor%NOTFOUND;
        
        v_grant_role_stmt := 'GRANT ' || v_role || ' TO ' || p_new_username;
        
        BEGIN
            EXECUTE IMMEDIATE v_grant_role_stmt;
        EXCEPTION
            WHEN OTHERS THEN
                NULL; -- Bỏ qua lỗi và tiếp tục
        END;
    END LOOP;
    
    CLOSE v_role_cursor;
    
    -- Cấp lại các system privileges
    OPEN v_sys_priv_cursor FOR 
        SELECT PRIVILEGE, ADMIN_OPTION 
        FROM DBA_SYS_PRIVS 
        WHERE GRANTEE = UPPER(p_old_username);
    
    LOOP
        FETCH v_sys_priv_cursor INTO v_sys_priv, v_grantable;
        EXIT WHEN v_sys_priv_cursor%NOTFOUND;
        
        v_grant_sys_priv_stmt := 'GRANT ' || v_sys_priv || ' TO ' || p_new_username;
        
        IF v_grantable = 'YES' THEN
            v_grant_sys_priv_stmt := v_grant_sys_priv_stmt || ' WITH ADMIN OPTION';
        END IF;
        
        BEGIN
            EXECUTE IMMEDIATE v_grant_sys_priv_stmt;
        EXCEPTION
            WHEN OTHERS THEN
                NULL; -- Bỏ qua lỗi và tiếp tục
        END;
    END LOOP;
    
    CLOSE v_sys_priv_cursor;
    
    -- Cấp lại các object privileges (table)
    OPEN v_tab_priv_cursor FOR 
        SELECT TABLE_NAME, PRIVILEGE, GRANTABLE 
        FROM DBA_TAB_PRIVS 
        WHERE GRANTEE = UPPER(p_old_username);
    
    LOOP
        FETCH v_tab_priv_cursor INTO v_table_name, v_privilege, v_grantable;
        EXIT WHEN v_tab_priv_cursor%NOTFOUND;
        
        v_grant_tab_priv_stmt := 'GRANT ' || v_privilege || ' ON ' || v_table_name || ' TO ' || p_new_username;
        
        IF v_grantable = 'YES' THEN
            v_grant_tab_priv_stmt := v_grant_tab_priv_stmt || ' WITH GRANT OPTION';
        END IF;
        
        BEGIN
            EXECUTE IMMEDIATE v_grant_tab_priv_stmt;
        EXCEPTION
            WHEN OTHERS THEN
                NULL; -- Bỏ qua lỗi và tiếp tục
        END;
    END LOOP;
    
    CLOSE v_tab_priv_cursor;
    
    -- Cấp lại các column privileges (nếu có)
    OPEN v_col_priv_cursor FOR 
        SELECT TABLE_NAME, COLUMN_NAME, PRIVILEGE, GRANTABLE 
        FROM DBA_COL_PRIVS 
        WHERE GRANTEE = UPPER(p_old_username);
    
    LOOP
        FETCH v_col_priv_cursor INTO v_table_name, v_column_name, v_privilege, v_grantable;
        EXIT WHEN v_col_priv_cursor%NOTFOUND;
        
        v_grant_col_priv_stmt := 'GRANT ' || v_privilege || ' (' || v_column_name || ') ON ' || 
                               v_table_name || ' TO ' || p_new_username;
        
        IF v_grantable = 'YES' THEN
            v_grant_col_priv_stmt := v_grant_col_priv_stmt || ' WITH GRANT OPTION';
        END IF;
        
        BEGIN
            EXECUTE IMMEDIATE v_grant_col_priv_stmt;
        EXCEPTION
            WHEN OTHERS THEN
                NULL; -- Bỏ qua lỗi và tiếp tục
        END;
    END LOOP;
    
    CLOSE v_col_priv_cursor;
    
    -- Xóa user cũ
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER ' || p_old_username || ' CASCADE';
        p_result := 'User đổi tên thành công từ ' || p_old_username || ' thành ' || p_new_username;
    EXCEPTION
        WHEN OTHERS THEN
            p_result := 'Đã tạo user mới và cấp quyền, nhưng không thể xóa user cũ: ' || SQLERRM;
    END;
END;
/


CREATE OR REPLACE PROCEDURE atbm_user.sp_drop_user (
    p_username IN VARCHAR2,
    p_result OUT VARCHAR2
)
AUTHID DEFINER
AS
    v_user_count NUMBER;
BEGIN
    -- Check if user exists
    SELECT COUNT(*) INTO v_user_count 
    FROM DBA_USERS 
    WHERE USERNAME = UPPER(p_username);
    
    IF v_user_count = 0 THEN
        p_result := 'Error: User ' || p_username || ' không tồn tại';
        RETURN;
    END IF;
    
    -- Drop the user with CASCADE option to remove dependent objects
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER ' || p_username || ' CASCADE';
        p_result := 'User ' || p_username || ' đã được xóa thành công';
    EXCEPTION
        WHEN OTHERS THEN
            p_result := 'Lỗi khi xóa user: ' || SQLERRM;
    END;
END;
/


CREATE OR REPLACE PROCEDURE atbm_user.sp_drop_role(
    p_rolename IN VARCHAR2,
    p_result OUT VARCHAR2
)
AS
    v_count NUMBER;
BEGIN
    -- Check if the role exists
    SELECT COUNT(*) INTO v_count
    FROM DBA_ROLES
    WHERE ROLE = UPPER(p_rolename);
    
    IF v_count = 0 THEN
        p_result := 'Role ' || p_rolename || ' không tồn tại!';
        RETURN;
    END IF;
    
    -- Drop the role
    EXECUTE IMMEDIATE 'DROP ROLE ' || p_rolename;
    
    p_result := 'Role ' || p_rolename || ' đã được xóa thành công!';
EXCEPTION
    WHEN OTHERS THEN
        p_result := 'Lỗi khi xóa role: ' || SQLERRM;
END;
/

-- 2. Stored procedure to rename a role
CREATE OR REPLACE PROCEDURE atbm_user.sp_rename_role(
    p_old_rolename IN VARCHAR2,
    p_new_rolename IN VARCHAR2,
    p_result OUT VARCHAR2
)
AS
    v_count NUMBER;
    v_count_new NUMBER;
BEGIN
    -- Check if the old role exists
    SELECT COUNT(*) INTO v_count
    FROM DBA_ROLES
    WHERE ROLE = UPPER(p_old_rolename);
    
    IF v_count = 0 THEN
        p_result := 'Role ' || p_old_rolename || ' không tồn tại!';
        RETURN;
    END IF;
    
    -- Check if the new role name already exists
    SELECT COUNT(*) INTO v_count_new
    FROM DBA_ROLES
    WHERE ROLE = UPPER(p_new_rolename);
    
    IF v_count_new > 0 THEN
        p_result := 'Role ' || p_new_rolename || ' đã tồn tại!';
        RETURN;
    END IF;
    
    -- In Oracle, there is no direct "RENAME ROLE" command
    -- We need to create a new role, grant all privileges from the old role to the new role,
    -- then drop the old role
    
    -- 1. Create the new role
    EXECUTE IMMEDIATE 'CREATE ROLE ' || p_new_rolename;
    
    -- 2. Grant all system privileges from the old role to the new role
    FOR rec IN (SELECT PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE = UPPER(p_old_rolename)) LOOP
        EXECUTE IMMEDIATE 'GRANT ' || rec.PRIVILEGE || ' TO ' || p_new_rolename;
    END LOOP;
    
    -- 3. Grant all object privileges from the old role to the new role
    FOR rec IN (SELECT OWNER, TABLE_NAME, PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE = UPPER(p_old_rolename)) LOOP
        EXECUTE IMMEDIATE 'GRANT ' || rec.PRIVILEGE || ' ON ' || rec.OWNER || '.' || rec.TABLE_NAME || ' TO ' || p_new_rolename;
    END LOOP;
    
    -- 4. Grant all roles granted to the old role to the new role
    FOR rec IN (SELECT GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTEE = UPPER(p_old_rolename)) LOOP
        EXECUTE IMMEDIATE 'GRANT ' || rec.GRANTED_ROLE || ' TO ' || p_new_rolename;
    END LOOP;
    
    -- 5. Grant the new role to all users/roles that had the old role
    FOR rec IN (SELECT GRANTEE FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = UPPER(p_old_rolename)) LOOP
        EXECUTE IMMEDIATE 'GRANT ' || p_new_rolename || ' TO ' || rec.GRANTEE;
    END LOOP;
    
    -- 6. Drop the old role
    EXECUTE IMMEDIATE 'DROP ROLE ' || p_old_rolename;
    
    p_result := 'Role ' || p_old_rolename || ' đã được đổi tên thành ' || p_new_rolename || ' thành công!';
EXCEPTION
    WHEN OTHERS THEN
        -- Attempt rollback if possible
        BEGIN
            EXECUTE IMMEDIATE 'DROP ROLE ' || p_new_rolename;
        EXCEPTION
            WHEN OTHERS THEN
                NULL; -- Ignore errors during cleanup
        END;
        
        p_result := 'Lỗi khi đổi tên role: ' || SQLERRM;
END;
/