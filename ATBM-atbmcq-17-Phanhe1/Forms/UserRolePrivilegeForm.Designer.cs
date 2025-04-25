namespace ATBM_atbmcq_17_Phanhe1.Forms
{
    partial class UserRolePrivilegeForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            dataGridView1 = new DataGridView();
            listBox1 = new ListBox();
            comboBox1 = new ComboBox();
            button1 = new Button();
            label1 = new Label();
            label2 = new Label();
            label3 = new Label();
            tabControl1 = new TabControl();
            tabPage1 = new TabPage();
            lblCurrentUsername = new Label();
            btnCreateUser = new Button();
            label5 = new Label();
            txtNewPassword = new TextBox();
            txtNewUsername = new TextBox();
            label4 = new Label();
            txtNewUsernamForEdit = new TextBox();
            label9 = new Label();
            txtEditPassword = new TextBox();
            btnEditUser = new Button();
            btnDeleteUser = new Button();
            label8 = new Label();
            tabPage2 = new TabPage();
            cboRoles = new ComboBox();
            label7 = new Label();
            btnCreateRole = new Button();
            txtNewRoleName = new TextBox();
            label6 = new Label();
            lblCurrentRole = new Label();
            label10 = new Label();
            txtEditRoleName = new TextBox();
            btnEditRole = new Button();
            btnDeleteRole = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            tabControl1.SuspendLayout();
            tabPage1.SuspendLayout();
            tabPage2.SuspendLayout();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(329, 112);
            dataGridView1.Margin = new Padding(3, 4, 3, 4);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 51;
            dataGridView1.RowTemplate.Height = 25;
            dataGridView1.Size = new Size(571, 465);
            dataGridView1.TabIndex = 0;
            // 
            // listBox1
            // 
            listBox1.FormattingEnabled = true;
            listBox1.ItemHeight = 20;
            listBox1.Location = new Point(14, 112);
            listBox1.Margin = new Padding(3, 4, 3, 4);
            listBox1.Name = "listBox1";
            listBox1.Size = new Size(308, 464);
            listBox1.TabIndex = 1;
            // 
            // comboBox1
            // 
            comboBox1.FormattingEnabled = true;
            comboBox1.Location = new Point(312, 16);
            comboBox1.Margin = new Padding(3, 4, 3, 4);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(155, 28);
            comboBox1.TabIndex = 2;
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            // 
            // button1
            // 
            button1.Location = new Point(505, 16);
            button1.Margin = new Padding(3, 4, 3, 4);
            button1.Name = "button1";
            button1.Size = new Size(199, 31);
            button1.TabIndex = 3;
            button1.Text = "Xem quyền đối tượng";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label1.Location = new Point(209, 17);
            label1.Name = "label1";
            label1.Size = new Size(103, 28);
            label1.TabIndex = 4;
            label1.Text = "Chọn user:";
            label1.Click += label1_Click;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI Semibold", 14.25F, FontStyle.Bold, GraphicsUnit.Point);
            label2.Location = new Point(112, 68);
            label2.Name = "label2";
            label2.Size = new Size(114, 32);
            label2.TabIndex = 5;
            label2.Text = "Role user";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI Semibold", 14.25F, FontStyle.Bold, GraphicsUnit.Point);
            label3.Location = new Point(579, 68);
            label3.Name = "label3";
            label3.Size = new Size(138, 32);
            label3.TabIndex = 6;
            label3.Text = "Quyền user";
            // 
            // tabControl1
            // 
            tabControl1.Controls.Add(tabPage1);
            tabControl1.Controls.Add(tabPage2);
            tabControl1.Location = new Point(14, 587);
            tabControl1.Margin = new Padding(3, 4, 3, 4);
            tabControl1.Name = "tabControl1";
            tabControl1.SelectedIndex = 0;
            tabControl1.Size = new Size(887, 264);
            tabControl1.TabIndex = 7;
            // 
            // tabPage1
            // 
            tabPage1.Controls.Add(lblCurrentUsername);
            tabPage1.Controls.Add(btnCreateUser);
            tabPage1.Controls.Add(label5);
            tabPage1.Controls.Add(txtNewPassword);
            tabPage1.Controls.Add(txtNewUsername);
            tabPage1.Controls.Add(label4);
            tabPage1.Controls.Add(txtNewUsernamForEdit);
            tabPage1.Controls.Add(label9);
            tabPage1.Controls.Add(txtEditPassword);
            tabPage1.Controls.Add(btnEditUser);
            tabPage1.Controls.Add(btnDeleteUser);
            tabPage1.Controls.Add(label8);
            tabPage1.Location = new Point(4, 29);
            tabPage1.Margin = new Padding(3, 4, 3, 4);
            tabPage1.Name = "tabPage1";
            tabPage1.Padding = new Padding(3, 4, 3, 4);
            tabPage1.Size = new Size(879, 231);
            tabPage1.TabIndex = 0;
            tabPage1.Text = "Tạo User";
            tabPage1.UseVisualStyleBackColor = true;
            // 
            // lblCurrentUsername
            // 
            lblCurrentUsername.Location = new Point(411, 11);
            lblCurrentUsername.Name = "lblCurrentUsername";
            lblCurrentUsername.Size = new Size(300, 25);
            lblCurrentUsername.TabIndex = 0;
            lblCurrentUsername.Text = "Tên user hiện tại: [chưa chọn]";
            // 
            // btnCreateUser
            // 
            btnCreateUser.Location = new Point(101, 155);
            btnCreateUser.Margin = new Padding(3, 4, 3, 4);
            btnCreateUser.Name = "btnCreateUser";
            btnCreateUser.Size = new Size(229, 43);
            btnCreateUser.TabIndex = 4;
            btnCreateUser.Text = "Tạo User";
            btnCreateUser.UseVisualStyleBackColor = true;
            btnCreateUser.Click += btnCreateUser_Click;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(25, 95);
            label5.Name = "label5";
            label5.Size = new Size(70, 20);
            label5.TabIndex = 3;
            label5.Text = "Password";
            // 
            // txtNewPassword
            // 
            txtNewPassword.Location = new Point(101, 91);
            txtNewPassword.Margin = new Padding(3, 4, 3, 4);
            txtNewPassword.Name = "txtNewPassword";
            txtNewPassword.PasswordChar = '*';
            txtNewPassword.Size = new Size(228, 27);
            txtNewPassword.TabIndex = 2;
            // 
            // txtNewUsername
            // 
            txtNewUsername.Location = new Point(101, 36);
            txtNewUsername.Margin = new Padding(3, 4, 3, 4);
            txtNewUsername.Name = "txtNewUsername";
            txtNewUsername.Size = new Size(228, 27);
            txtNewUsername.TabIndex = 1;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(25, 40);
            label4.Name = "label4";
            label4.Size = new Size(75, 20);
            label4.TabIndex = 0;
            label4.Text = "Username";
            // 
            // txtNewUsernamForEdit
            // 
            txtNewUsernamForEdit.Location = new Point(560, 47);
            txtNewUsernamForEdit.Margin = new Padding(3, 4, 3, 4);
            txtNewUsernamForEdit.Name = "txtNewUsernamForEdit";
            txtNewUsernamForEdit.Size = new Size(228, 27);
            txtNewUsernamForEdit.TabIndex = 10;
            // 
            // label9
            // 
            label9.AutoSize = true;
            label9.Location = new Point(411, 54);
            label9.Name = "label9";
            label9.Size = new Size(93, 20);
            label9.TabIndex = 9;
            label9.Text = "Tên user mới";
            // 
            // txtEditPassword
            // 
            txtEditPassword.Location = new Point(560, 95);
            txtEditPassword.Margin = new Padding(3, 4, 3, 4);
            txtEditPassword.Name = "txtEditPassword";
            txtEditPassword.PasswordChar = '*';
            txtEditPassword.Size = new Size(228, 27);
            txtEditPassword.TabIndex = 11;
            // 
            // btnEditUser
            // 
            btnEditUser.Location = new Point(559, 137);
            btnEditUser.Margin = new Padding(3, 4, 3, 4);
            btnEditUser.Name = "btnEditUser";
            btnEditUser.Size = new Size(229, 43);
            btnEditUser.TabIndex = 12;
            btnEditUser.Text = "Cập nhật thông tin";
            btnEditUser.Click += btnEditUser_Click;
            // 
            // btnDeleteUser
            // 
            btnDeleteUser.BackColor = Color.LightCoral;
            btnDeleteUser.Location = new Point(561, 188);
            btnDeleteUser.Margin = new Padding(3, 4, 3, 4);
            btnDeleteUser.Name = "btnDeleteUser";
            btnDeleteUser.Size = new Size(229, 43);
            btnDeleteUser.TabIndex = 13;
            btnDeleteUser.Text = "Xóa User";
            btnDeleteUser.UseVisualStyleBackColor = false;
            btnDeleteUser.Click += btnDeleteUser_Click;
            // 
            // label8
            // 
            label8.Location = new Point(411, 102);
            label8.Name = "label8";
            label8.Size = new Size(126, 20);
            label8.TabIndex = 14;
            label8.Text = "Mật khẩu mới";
            // 
            // tabPage2
            // 
            tabPage2.Controls.Add(cboRoles);
            tabPage2.Controls.Add(label7);
            tabPage2.Controls.Add(btnCreateRole);
            tabPage2.Controls.Add(txtNewRoleName);
            tabPage2.Controls.Add(label6);
            tabPage2.Controls.Add(lblCurrentRole);
            tabPage2.Controls.Add(label10);
            tabPage2.Controls.Add(txtEditRoleName);
            tabPage2.Controls.Add(btnEditRole);
            tabPage2.Controls.Add(btnDeleteRole);
            tabPage2.Location = new Point(4, 29);
            tabPage2.Margin = new Padding(3, 4, 3, 4);
            tabPage2.Name = "tabPage2";
            tabPage2.Padding = new Padding(3, 4, 3, 4);
            tabPage2.Size = new Size(879, 231);
            tabPage2.TabIndex = 1;
            tabPage2.Text = "Tạo Role";
            tabPage2.UseVisualStyleBackColor = true;
            // 
            // cboRoles
            // 
            cboRoles.FormattingEnabled = true;
            cboRoles.Location = new Point(607, 18);
            cboRoles.Margin = new Padding(3, 4, 3, 4);
            cboRoles.Name = "cboRoles";
            cboRoles.Size = new Size(228, 28);
            cboRoles.TabIndex = 4;
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Location = new Point(439, 18);
            label7.Name = "label7";
            label7.Size = new Size(133, 20);
            label7.TabIndex = 3;
            label7.Text = "Danh sách các role";
            // 
            // btnCreateRole
            // 
            btnCreateRole.Location = new Point(103, 95);
            btnCreateRole.Margin = new Padding(3, 4, 3, 4);
            btnCreateRole.Name = "btnCreateRole";
            btnCreateRole.Size = new Size(229, 43);
            btnCreateRole.TabIndex = 2;
            btnCreateRole.Text = "Tạo Role";
            btnCreateRole.UseVisualStyleBackColor = true;
            btnCreateRole.Click += btnCreateRole_Click;
            // 
            // txtNewRoleName
            // 
            txtNewRoleName.Location = new Point(103, 36);
            txtNewRoleName.Margin = new Padding(3, 4, 3, 4);
            txtNewRoleName.Name = "txtNewRoleName";
            txtNewRoleName.Size = new Size(228, 27);
            txtNewRoleName.TabIndex = 1;
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(25, 40);
            label6.Name = "label6";
            label6.Size = new Size(80, 20);
            label6.TabIndex = 0;
            label6.Text = "Role name";
            // 
            // lblCurrentRole
            // 
            lblCurrentRole.Location = new Point(439, 65);
            lblCurrentRole.Name = "lblCurrentRole";
            lblCurrentRole.Size = new Size(300, 25);
            lblCurrentRole.TabIndex = 5;
            lblCurrentRole.Text = "Role hiện tại: [chưa chọn]";
            // 
            // label10
            // 
            label10.AutoSize = true;
            label10.Location = new Point(439, 106);
            label10.Name = "label10";
            label10.Size = new Size(92, 20);
            label10.TabIndex = 7;
            label10.Text = "Tên role mới";
            // 
            // txtEditRoleName
            // 
            txtEditRoleName.Location = new Point(607, 103);
            txtEditRoleName.Margin = new Padding(3, 4, 3, 4);
            txtEditRoleName.Name = "txtEditRoleName";
            txtEditRoleName.Size = new Size(228, 27);
            txtEditRoleName.TabIndex = 6;
            // 
            // btnEditRole
            // 
            btnEditRole.Location = new Point(607, 138);
            btnEditRole.Margin = new Padding(3, 4, 3, 4);
            btnEditRole.Name = "btnEditRole";
            btnEditRole.Size = new Size(228, 43);
            btnEditRole.TabIndex = 8;
            btnEditRole.Text = "Cập nhật role";
            btnEditRole.UseVisualStyleBackColor = true;
            btnEditRole.Click += btnEditRole_Click;
            // 
            // btnDeleteRole
            // 
            btnDeleteRole.BackColor = Color.LightCoral;
            btnDeleteRole.Location = new Point(607, 188);
            btnDeleteRole.Margin = new Padding(3, 4, 3, 4);
            btnDeleteRole.Name = "btnDeleteRole";
            btnDeleteRole.Size = new Size(228, 43);
            btnDeleteRole.TabIndex = 9;
            btnDeleteRole.Text = "Xóa Role";
            btnDeleteRole.UseVisualStyleBackColor = false;
            btnDeleteRole.Click += btnDeleteRole_Click;
            // 
            // UserRolePrivilegeForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(914, 867);
            Controls.Add(tabControl1);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(label1);
            Controls.Add(button1);
            Controls.Add(comboBox1);
            Controls.Add(listBox1);
            Controls.Add(dataGridView1);
            Margin = new Padding(3, 4, 3, 4);
            Name = "UserRolePrivilegeForm";
            Text = "UserRolePrivilegeForm";
            Load += UserRolePrivilegeForm_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            tabControl1.ResumeLayout(false);
            tabPage1.ResumeLayout(false);
            tabPage1.PerformLayout();
            tabPage2.ResumeLayout(false);
            tabPage2.PerformLayout();
            ResumeLayout(false);
            PerformLayout();


        }

        #endregion

        private DataGridView dataGridView1;
        private ListBox listBox1;
        private ComboBox comboBox1;
        private Button button1;
        private Label label1;
        private Label label2;
        private Label label3;
        private TabControl tabControl1;
        private TabPage tabPage1;
        private Button btnCreateUser;
        private Label label5;
        private TextBox txtNewPassword;
        private TextBox txtNewUsername;
        private Label label4;
        private TabPage tabPage2;
        private ComboBox cboRoles;
        private Label label7;
        private Button btnCreateRole;
        private TextBox txtNewRoleName;
        private Label label6;
        private Button btnDeleteUser;
        private Button btnEditUser;
        private TextBox txtEditPassword;
        private Label label8;
        private TextBox txtNewUsernamForEdit;
        private Label label9;
        private Label lblCurrentUsername;
        private Label lblCurrentRole;
        private Label label10;
        private TextBox txtEditRoleName;
        private Button btnEditRole;
        private Button btnDeleteRole;
    }
}