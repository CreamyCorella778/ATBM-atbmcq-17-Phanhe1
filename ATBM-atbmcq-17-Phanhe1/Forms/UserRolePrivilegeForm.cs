using ATBM_atbmcq_17_Phanhe1.Services;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ATBM_atbmcq_17_Phanhe1.Forms
{
    public partial class UserRolePrivilegeForm : Form
    {
        private ConnectionManager cm;

        public UserRolePrivilegeForm(ConnectionManager connectionManager)
        {
            InitializeComponent();
            this.cm = connectionManager;
            this.FormClosed += UserRolePrivilegeForm_FormClosed;
        }

        private void LoadUsers()
        {
            try
            {
                OracleCommand cmd = new OracleCommand("atbm_user.sp_get_all_users", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                OracleDataAdapter da = new OracleDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                MessageBox.Show("Số lượng user: " + dt.Rows.Count);

                comboBox1.DataSource = dt;
                comboBox1.DisplayMember = "USERNAME";
                comboBox1.ValueMember = "USERNAME";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Không thể load user: " + ex.Message);
            }
        }

        private void LoadRoles()
        {
            try
            {
                OracleCommand cmd = new OracleCommand("atbm_user.sp_get_all_roles", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                OracleDataAdapter da = new OracleDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                cboRoles.DataSource = dt;
                cboRoles.DisplayMember = "ROLE";
                cboRoles.ValueMember = "ROLE";

                // Add this line to register the event handler
                cboRoles.SelectedIndexChanged += cboRoles_SelectedIndexChanged;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Không thể load roles: " + ex.Message);
            }
        }


        private void UserRolePrivilegeForm_Load(object sender, EventArgs e)
        {
            LoadUsers();
            LoadRoles();
        }

        private void LoadUserDetails(string username)
        {
            try
            {
                listBox1.Items.Clear();

                // Load roles
                OracleCommand cmd1 = new OracleCommand("atbm_user.sp_get_roles_of_user", cm.getConnection());
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("p_username", OracleDbType.Varchar2).Value = username;
                cmd1.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                OracleDataAdapter da1 = new OracleDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);

                listBox1.Items.Add("Roles:");
                foreach (DataRow row in dt1.Rows)
                {
                    listBox1.Items.Add("  - " + row["granted_role"].ToString());
                }

                OracleCommand cmd2 = new OracleCommand("atbm_user.sp_get_sys_privs_of_user", cm.getConnection());
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add("p_username", OracleDbType.Varchar2).Value = username;
                cmd2.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                OracleDataAdapter da2 = new OracleDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                listBox1.Items.Add("System Privileges:");
                foreach (DataRow row in dt2.Rows)
                {
                    listBox1.Items.Add("  - " + row["privilege"].ToString());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi tải thông tin user: " + ex.Message);
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem != null)
            {
                string selectedUser = comboBox1.SelectedValue.ToString();
                LoadUserDetails(selectedUser);
                lblCurrentUsername.Text = $"Tên user hiện tại: {selectedUser}";
                txtNewUsernamForEdit.Text = selectedUser; // Gợi ý: có thể prefill sẵn tên

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string username = comboBox1.SelectedValue.ToString();

                OracleCommand cmd = new OracleCommand("atbm_user.sp_get_object_privs_of_user", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_username", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                OracleDataAdapter da = new OracleDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView1.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi tải object privileges: " + ex.Message);
            }
        }

        private void btnCreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtNewUsername.Text.Trim();
                string password = txtNewPassword.Text.Trim();

                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    MessageBox.Show("Vui lòng nhập đầy đủ tên và mật khẩu cho user mới.");
                    return;
                }

                OracleCommand cmd = new OracleCommand("atbm_user.sp_create_user", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_username", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("p_password", OracleDbType.Varchar2).Value = password;
                cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                string result = cmd.Parameters["p_result"].Value.ToString();
                MessageBox.Show(result);

                if (result.Contains("successfully"))
                {
                    // Refresh user list
                    LoadUsers();
                    txtNewUsername.Clear();
                    txtNewPassword.Clear();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi tạo user: " + ex.Message);
            }
        }

        private void btnCreateRole_Click(object sender, EventArgs e)
        {
            try
            {
                string rolename = txtNewRoleName.Text.Trim();

                if (string.IsNullOrEmpty(rolename))
                {
                    MessageBox.Show("Vui lòng nhập tên cho role mới.");
                    return;
                }

                OracleCommand cmd = new OracleCommand("atbm_user.sp_create_role", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_rolename", OracleDbType.Varchar2).Value = rolename;
                cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                string result = cmd.Parameters["p_result"].Value.ToString();
                MessageBox.Show(result);

                if (result.Contains("successfully"))
                {
                    // Refresh role list
                    LoadRoles();
                    txtNewRoleName.Clear();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi tạo role: " + ex.Message);
            }
        }
        private void btnEditUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem == null)
                {
                    MessageBox.Show("Vui lòng chọn user để sửa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                string currentUsername = comboBox1.SelectedValue.ToString();
                string newUsername = txtNewUsernamForEdit.Text.Trim();
                string newPassword = txtEditPassword.Text.Trim();

                // Kiểm tra dữ liệu nhập vào
                if (string.IsNullOrEmpty(newUsername) && string.IsNullOrEmpty(newPassword))
                {
                    MessageBox.Show("Vui lòng nhập tên user mới hoặc mật khẩu mới.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Kiểm tra nếu đang cố gắng sửa user hiện tại đang đăng nhập
                if (currentUsername.Equals(cm.getCurrentUser(), StringComparison.OrdinalIgnoreCase) && !string.IsNullOrEmpty(newUsername))
                {
                    MessageBox.Show("Không thể đổi tên user đang đăng nhập! Chỉ có thể đổi mật khẩu.", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Xác nhận
                DialogResult confirm = MessageBox.Show(
                    $"Bạn có chắc chắn muốn cập nhật thông tin cho user '{currentUsername}'?",
                    "Xác nhận cập nhật thông tin",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question);

                if (confirm == DialogResult.Yes)
                {
                    // Nếu chỉ thay đổi mật khẩu
                    if (string.IsNullOrEmpty(newUsername))
                    {
                        UpdateUserPassword(currentUsername, newPassword);
                    }
                    // Nếu thay đổi tên user (có thể kèm mật khẩu hoặc không)
                    else
                    {
                        RenameUser(currentUsername, newUsername, newPassword);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi cập nhật thông tin user: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // 4. Thêm các phương thức hỗ trợ
        private void UpdateUserPassword(string username, string newPassword)
        {
            try
            {
                OracleCommand cmd = new OracleCommand("atbm_user.sp_change_user_password", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_username", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("p_password", OracleDbType.Varchar2).Value = newPassword;
                cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                string result = cmd.Parameters["p_result"].Value.ToString();
                MessageBox.Show(result, "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                if (result.Contains("successfully"))
                {
                    txtEditPassword.Clear();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi cập nhật mật khẩu: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void RenameUser(string oldUsername, string newUsername, string newPassword)
        {
            try
            {
                OracleCommand cmd = new OracleCommand("atbm_user.sp_rename_user", cm.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_old_username", OracleDbType.Varchar2).Value = oldUsername;
                cmd.Parameters.Add("p_new_username", OracleDbType.Varchar2).Value = newUsername;
                cmd.Parameters.Add("p_new_password", OracleDbType.Varchar2).Value = string.IsNullOrEmpty(newPassword) ? null : newPassword;
                cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                string result = cmd.Parameters["p_result"].Value.ToString();
                MessageBox.Show(result, "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                if (result.Contains("successfully"))
                {
                    txtNewUsernamForEdit.Clear();
                    txtEditPassword.Clear();
                    LoadUsers(); // Cập nhật lại danh sách users
                }
                LoadUsers();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi đổi tên user: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void btnDeleteUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem == null)
                {
                    MessageBox.Show("Vui lòng chọn user để xóa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                string username = comboBox1.SelectedValue.ToString();

                // Prevent deletion of the current user
                if (username.Equals(cm.getCurrentUser(), StringComparison.OrdinalIgnoreCase))
                {
                    MessageBox.Show("Không thể xóa tài khoản đang đăng nhập!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Confirm deletion
                DialogResult confirm = MessageBox.Show(
                    $"Bạn có chắc chắn muốn xóa user '{username}'? Hành động này không thể hoàn tác.",
                    "Xác nhận xóa user",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Warning);

                if (confirm == DialogResult.Yes)
                {
                    OracleCommand cmd = new OracleCommand("atbm_user.sp_drop_user", cm.getConnection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("p_username", OracleDbType.Varchar2).Value = username;
                    cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    string result = cmd.Parameters["p_result"].Value.ToString();
                    MessageBox.Show(result, "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    if (result.Contains("successfully"))
                    {
                        // Refresh user list
                        LoadUsers();
                        // Clear the user details display
                        listBox1.Items.Clear();
                        lblCurrentUsername.Text = "Tên user hiện tại: [chưa chọn]";
                        txtNewUsernamForEdit.Clear();
                        txtEditPassword.Clear();
                    }
                    LoadUsers();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi xóa user: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void cboRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboRoles.SelectedItem != null)
            {
                string selectedRole = cboRoles.SelectedValue.ToString();
                lblCurrentRole.Text = $"Role hiện tại: {selectedRole}";
                txtEditRoleName.Text = selectedRole; // Prefill with current role name
            }
        }

        // 3.2. Add this to LoadRoles() method - add the event handler


        // 3.3. Implement method to delete a role
        private void btnDeleteRole_Click(object sender, EventArgs e)
        {
            try
            {
                if (cboRoles.SelectedItem == null)
                {
                    MessageBox.Show("Vui lòng chọn role để xóa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                string roleName = cboRoles.SelectedValue.ToString();

                // Confirm deletion
                DialogResult confirm = MessageBox.Show(
                    $"Bạn có chắc chắn muốn xóa role '{roleName}'? Hành động này không thể hoàn tác.",
                    "Xác nhận xóa role",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Warning);

                if (confirm == DialogResult.Yes)
                {
                    OracleCommand cmd = new OracleCommand("atbm_user.sp_drop_role", cm.getConnection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("p_rolename", OracleDbType.Varchar2).Value = roleName;
                    cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    string result = cmd.Parameters["p_result"].Value.ToString();
                    MessageBox.Show(result, "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    if (result.Contains("successfully"))
                    {
                        // Refresh role list
                        LoadRoles();
                        lblCurrentRole.Text = "Role hiện tại: [chưa chọn]";
                        txtEditRoleName.Clear();
                    }
                    LoadRoles();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi xóa role: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // 3.4. Implement method to edit a role
        private void btnEditRole_Click(object sender, EventArgs e)
        {
            try
            {
                if (cboRoles.SelectedItem == null)
                {
                    MessageBox.Show("Vui lòng chọn role để sửa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                string currentRoleName = cboRoles.SelectedValue.ToString();
                string newRoleName = txtEditRoleName.Text.Trim();

                // Validate input
                if (string.IsNullOrEmpty(newRoleName))
                {
                    MessageBox.Show("Vui lòng nhập tên role mới.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                if (currentRoleName == newRoleName)
                {
                    MessageBox.Show("Tên role mới giống tên role hiện tại.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }

                // Confirm update
                DialogResult confirm = MessageBox.Show(
                    $"Bạn có chắc chắn muốn đổi tên role '{currentRoleName}' thành '{newRoleName}'?",
                    "Xác nhận đổi tên role",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question);

                if (confirm == DialogResult.Yes)
                {
                    OracleCommand cmd = new OracleCommand("atbm_user.sp_rename_role", cm.getConnection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("p_old_rolename", OracleDbType.Varchar2).Value = currentRoleName;
                    cmd.Parameters.Add("p_new_rolename", OracleDbType.Varchar2).Value = newRoleName;
                    cmd.Parameters.Add("p_result", OracleDbType.Varchar2, 1000).Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    string result = cmd.Parameters["p_result"].Value.ToString();
                    MessageBox.Show(result, "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    if (result.Contains("successfully"))
                    {
                        // Refresh role list
                        LoadRoles();
                        txtEditRoleName.Clear();
                    }
                    LoadRoles();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi đổi tên role: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void UserRolePrivilegeForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnOpenGrantPrivilegeForm_Click(object sender, EventArgs e)
        {
            GrantPrivilegeForm grantPrivilegeForm = new GrantPrivilegeForm(this.cm);
            grantPrivilegeForm.ShowDialog(); // Opens the form as a 
        }
    }
}