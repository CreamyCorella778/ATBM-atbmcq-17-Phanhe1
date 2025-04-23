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

        private void UserRolePrivilegeForm_Load(object sender, EventArgs e)
        {
            LoadUsers();
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
        private void UserRolePrivilegeForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
