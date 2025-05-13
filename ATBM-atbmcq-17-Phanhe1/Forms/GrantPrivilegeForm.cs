using ATBM_atbmcq_17_Phanhe1.Services;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Data.Common;
using System.Windows.Forms;

namespace ATBM_atbmcq_17_Phanhe1.Forms
{
    public partial class GrantPrivilegeForm : Form
    {
        private ConnectionManager cm;
        private OracleConnection conn;

        public GrantPrivilegeForm(ConnectionManager connectionManager)
        {
            InitializeComponent();
            cm = connectionManager;
            conn = cm.getConnection();
        }

        private void GrantPrivilegeForm_Load(object sender, EventArgs e)
        {
            LoadRoles();
            LoadUsersAndRoles();
            cmbObjectType.Items.AddRange(new string[] { "TABLE", "VIEW", "PROCEDURE", "FUNCTION" });
        }

        private void LoadRoles()
        {
            cmbRoles.Items.Clear();
            using (var cmd = new OracleCommand("atbm_user.sp_get_all_roles", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        cmbRoles.Items.Add(reader.GetString(0));
                    }
                }
            }
        }


        private void LoadUsersAndRoles()
        {
            cmbUserOrRole.Items.Clear();
            using (var cmd = new OracleCommand(@"
        SELECT USERNAME 
        FROM DBA_USERS 
        WHERE ORACLE_MAINTAINED = 'N' 
          AND COMMON = 'NO' 
          AND USERNAME NOT IN ('SYS', 'SYSTEM', 'OUTLN', 'DBSNMP', 'APPQOSSYS', 'AUDSYS', 'CTXSYS', 'DVSYS', 'FLOWS_FILES', 'GSMADMIN_INTERNAL', 'LBACSYS', 'MDSYS', 'OJVMSYS', 'ORDDATA', 'ORDPLUGINS', 'ORDSYS', 'XDB', 'WMSYS', 'PUBLIC')
        UNION
        SELECT ROLE 
        FROM DBA_ROLES 
        WHERE ORACLE_MAINTAINED = 'N'
        ", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                        cmbUserOrRole.Items.Add(reader.GetString(0));
                }
            }
        }

        private void cmbObjectType_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbObjectName.Items.Clear();
            cmbPrivilegeType.Items.Clear();
            cmbColumn.Items.Clear();
            string objectType = cmbObjectType.Text;


            if (objectType == "TABLE")
            {
                cmbPrivilegeType.Items.AddRange(new string[] { "SELECT", "INSERT", "UPDATE", "DELETE" });
            }
            else if (objectType == "VIEW")
            {
                cmbPrivilegeType.Items.Add("SELECT");
            }
            else if (objectType == "FUNCTION" || objectType == "PROCEDURE")
            {
                cmbPrivilegeType.Items.Add("EXECUTE");
            }


            string query = $"SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_TYPE = '{objectType}'";

            using (var cmd = new OracleCommand(query, conn))
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    cmbObjectName.Items.Add(reader.GetString(0));
                }
            }
        }


        private void btnGrant_Click(object sender, EventArgs e)
        {
            string privilege = cmbPrivilegeType.Text;
            string userOrRole = cmbUserOrRole.Text;
            string objectName = cmbObjectName.Text;
            string objectType = cmbObjectType.Text;
            string column = cmbColumn.Text;
            string withGrant = chkWithGrantOption.Checked ? " WITH GRANT OPTION" : "";

            string grantStmt = privilege == "EXECUTE"
                ? $"GRANT {privilege} ON {objectName} TO {userOrRole}{withGrant}"
                : (privilege == "UPDATE") && !string.IsNullOrEmpty(column)
                    ? $"GRANT {privilege} ({column}) ON {objectName} TO {userOrRole}{withGrant}"
                    : $"GRANT {privilege} ON {objectName} TO {userOrRole} {withGrant}";

            ExecuteNonQuery(grantStmt);
            MessageBox.Show("Cấp quyền thành công!");
        }

        private void btnRevoke_Click(object sender, EventArgs e)
        {
            string privilege = cmbPrivilegeType.Text;
            string userOrRole = cmbUserOrRole.Text;
            string objectName = cmbObjectName.Text;

            string revokeStmt = $"REVOKE {privilege} ON {objectName} FROM {userOrRole}";
            ExecuteNonQuery(revokeStmt);
            MessageBox.Show("Thu hồi quyền thành công!");
        }

        private void btnViewPrivileges_Click(object sender, EventArgs e)
        {
            string userOrRole = cmbUserOrRole.Text;
            string query = $@"
        SELECT PRIVILEGE, TABLE_NAME, COLUMN_NAME 
        FROM DBA_COL_PRIVS 
        WHERE GRANTEE = '{userOrRole}'
        UNION
        SELECT PRIVILEGE, TABLE_NAME, NULL 
        FROM DBA_TAB_PRIVS 
        WHERE GRANTEE = '{userOrRole}'";

            using (var da = new OracleDataAdapter(query, conn))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgvPrivileges.DataSource = dt;
            }
        }

        private void btnGrantRole_Click(object sender, EventArgs e)
        {
            string selectedRole = cmbRoles.Text;
            string selectedUser = cmbUserOrRole.Text;

            if (string.IsNullOrWhiteSpace(selectedRole) || string.IsNullOrWhiteSpace(selectedUser))
            {
                MessageBox.Show("Please select both a role and a user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            string grantRoleStmt = $"GRANT {selectedRole} TO {selectedUser}";

            try
            {
                ExecuteNonQuery(grantRoleStmt);
                MessageBox.Show($"Role '{selectedRole}' granted to user '{selectedUser}' successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error granting role: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void ExecuteNonQuery(string query)
        {
            using (var cmd = new OracleCommand(query, conn))
            {
                cmd.ExecuteNonQuery();
            }
        }

        private void cmbPrivilegeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbPrivilegeType.Text == "UPDATE" && cmbObjectType.Text == "TABLE")
            {
                cmbColumn.Items.Clear();
                string table = cmbObjectName.Text;
                string query = $"SELECT COLUMN_NAME FROM USER_TAB_COLUMNS WHERE TABLE_NAME = '{table}'";

                using (var cmd = new OracleCommand(query, conn))
                using (var reader = cmd.ExecuteReader())
                    while (reader.Read())
                        cmbColumn.Items.Add(reader.GetString(0));

                cmbColumn.Visible = true;
            }
            else
            {
                cmbColumn.Visible = false;
            }
        }
    }
}
