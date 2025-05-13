namespace ATBM_atbmcq_17_Phanhe1.Forms
{
    partial class GrantPrivilegeForm
    {
        private System.ComponentModel.IContainer components = null;

        private System.Windows.Forms.Label lblUserOrRole;
        private System.Windows.Forms.ComboBox cmbUserOrRole;
        private System.Windows.Forms.Label lblPrivilegeType;
        private System.Windows.Forms.ComboBox cmbPrivilegeType;
        private System.Windows.Forms.Label lblObjectType;
        private System.Windows.Forms.ComboBox cmbObjectType;
        private System.Windows.Forms.Label lblObjectName;
        private System.Windows.Forms.ComboBox cmbObjectName;
        private System.Windows.Forms.Label lblColumn;
        private System.Windows.Forms.ComboBox cmbColumn;
        private System.Windows.Forms.CheckBox chkWithGrantOption;
        private System.Windows.Forms.Button btnGrant;
        private System.Windows.Forms.Button btnRevoke;
        private System.Windows.Forms.Button btnViewPrivileges;
        private System.Windows.Forms.DataGridView dgvPrivileges;

        private System.Windows.Forms.Label lblRole;
        private System.Windows.Forms.ComboBox cmbRoles;
        private System.Windows.Forms.Button btnGrantRole;


        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            lblRole = new Label();
            cmbRoles = new ComboBox();
            btnGrantRole = new Button();
            lblUserOrRole = new Label();
            cmbUserOrRole = new ComboBox();
            lblPrivilegeType = new Label();
            cmbPrivilegeType = new ComboBox();
            lblObjectType = new Label();
            cmbObjectType = new ComboBox();
            lblObjectName = new Label();
            cmbObjectName = new ComboBox();
            lblColumn = new Label();
            cmbColumn = new ComboBox();
            chkWithGrantOption = new CheckBox();
            btnGrant = new Button();
            btnRevoke = new Button();
            btnViewPrivileges = new Button();
            dgvPrivileges = new DataGridView();
            panel1 = new Panel();
            ((System.ComponentModel.ISupportInitialize)dgvPrivileges).BeginInit();
            panel1.SuspendLayout();
            SuspendLayout();
            // 
            // lblRole
            // 
            lblRole.AutoSize = true;
            lblRole.Location = new Point(591, 59);
            lblRole.Name = "lblRole";
            lblRole.Size = new Size(101, 25);
            lblRole.TabIndex = 0;
            lblRole.Text = "Select Role:";
            // 
            // cmbRoles
            // 
            cmbRoles.FormattingEnabled = true;
            cmbRoles.Location = new Point(707, 56);
            cmbRoles.Name = "cmbRoles";
            cmbRoles.Size = new Size(200, 33);
            cmbRoles.TabIndex = 1;
            // 
            // btnGrantRole
            // 
            btnGrantRole.Location = new Point(707, 99);
            btnGrantRole.Name = "btnGrantRole";
            btnGrantRole.Size = new Size(131, 30);
            btnGrantRole.TabIndex = 2;
            btnGrantRole.Text = "Grant Role";
            btnGrantRole.UseVisualStyleBackColor = true;
            btnGrantRole.Click += btnGrantRole_Click;
            // 
            // lblUserOrRole
            // 
            lblUserOrRole.AutoSize = true;
            lblUserOrRole.Location = new Point(20, 20);
            lblUserOrRole.Name = "lblUserOrRole";
            lblUserOrRole.Size = new Size(92, 25);
            lblUserOrRole.TabIndex = 0;
            lblUserOrRole.Text = "User/Role:";
            // 
            // cmbUserOrRole
            // 
            cmbUserOrRole.Location = new Point(150, 20);
            cmbUserOrRole.Name = "cmbUserOrRole";
            cmbUserOrRole.Size = new Size(200, 33);
            cmbUserOrRole.TabIndex = 1;
            // 
            // lblPrivilegeType
            // 
            lblPrivilegeType.AutoSize = true;
            lblPrivilegeType.Location = new Point(0, 91);
            lblPrivilegeType.Name = "lblPrivilegeType";
            lblPrivilegeType.Size = new Size(124, 25);
            lblPrivilegeType.TabIndex = 2;
            lblPrivilegeType.Text = "Privilege Type:";
            // 
            // cmbPrivilegeType
            // 
            cmbPrivilegeType.Location = new Point(129, 88);
            cmbPrivilegeType.Name = "cmbPrivilegeType";
            cmbPrivilegeType.Size = new Size(200, 33);
            cmbPrivilegeType.TabIndex = 3;
            cmbPrivilegeType.SelectedIndexChanged += cmbPrivilegeType_SelectedIndexChanged;
            // 
            // lblObjectType
            // 
            lblObjectType.AutoSize = true;
            lblObjectType.Location = new Point(0, 5);
            lblObjectType.Name = "lblObjectType";
            lblObjectType.Size = new Size(110, 25);
            lblObjectType.TabIndex = 4;
            lblObjectType.Text = "Object Type:";
            // 
            // cmbObjectType
            // 
            cmbObjectType.Location = new Point(130, 2);
            cmbObjectType.Name = "cmbObjectType";
            cmbObjectType.Size = new Size(200, 33);
            cmbObjectType.TabIndex = 5;
            cmbObjectType.SelectedIndexChanged += cmbObjectType_SelectedIndexChanged;
            // 
            // lblObjectName
            // 
            lblObjectName.AutoSize = true;
            lblObjectName.Location = new Point(0, 45);
            lblObjectName.Name = "lblObjectName";
            lblObjectName.Size = new Size(120, 25);
            lblObjectName.TabIndex = 6;
            lblObjectName.Text = "Object Name:";
            // 
            // cmbObjectName
            // 
            cmbObjectName.Location = new Point(129, 45);
            cmbObjectName.Name = "cmbObjectName";
            cmbObjectName.Size = new Size(200, 33);
            cmbObjectName.TabIndex = 7;
            // 
            // lblColumn
            // 
            lblColumn.AutoSize = true;
            lblColumn.Location = new Point(0, 128);
            lblColumn.Name = "lblColumn";
            lblColumn.Size = new Size(78, 25);
            lblColumn.TabIndex = 8;
            lblColumn.Text = "Column:";
            // 
            // cmbColumn
            // 
            cmbColumn.Location = new Point(129, 128);
            cmbColumn.Name = "cmbColumn";
            cmbColumn.Size = new Size(200, 33);
            cmbColumn.TabIndex = 9;
            cmbColumn.Visible = false;
            // 
            // chkWithGrantOption
            // 
            chkWithGrantOption.AutoSize = true;
            chkWithGrantOption.Location = new Point(0, 214);
            chkWithGrantOption.Name = "chkWithGrantOption";
            chkWithGrantOption.Size = new Size(184, 29);
            chkWithGrantOption.TabIndex = 10;
            chkWithGrantOption.Text = "With Grant Option";
            // 
            // btnGrant
            // 
            btnGrant.Location = new Point(0, 178);
            btnGrant.Name = "btnGrant";
            btnGrant.Size = new Size(100, 30);
            btnGrant.TabIndex = 11;
            btnGrant.Text = "Grant";
            btnGrant.Click += btnGrant_Click;
            // 
            // btnRevoke
            // 
            btnRevoke.Location = new Point(114, 178);
            btnRevoke.Name = "btnRevoke";
            btnRevoke.Size = new Size(100, 30);
            btnRevoke.TabIndex = 12;
            btnRevoke.Text = "Revoke";
            btnRevoke.Click += btnRevoke_Click;
            // 
            // btnViewPrivileges
            // 
            btnViewPrivileges.Location = new Point(220, 178);
            btnViewPrivileges.Name = "btnViewPrivileges";
            btnViewPrivileges.Size = new Size(150, 30);
            btnViewPrivileges.TabIndex = 13;
            btnViewPrivileges.Text = "View Privileges";
            btnViewPrivileges.Click += btnViewPrivileges_Click;
            // 
            // dgvPrivileges
            // 
            dgvPrivileges.ColumnHeadersHeight = 34;
            dgvPrivileges.Location = new Point(0, 265);
            dgvPrivileges.Name = "dgvPrivileges";
            dgvPrivileges.RowHeadersWidth = 62;
            dgvPrivileges.Size = new Size(565, 200);
            dgvPrivileges.TabIndex = 14;
            // 
            // panel1
            // 
            panel1.Controls.Add(lblObjectType);
            panel1.Controls.Add(cmbColumn);
            panel1.Controls.Add(lblColumn);
            panel1.Controls.Add(cmbObjectName);
            panel1.Controls.Add(lblObjectName);
            panel1.Controls.Add(cmbObjectType);
            panel1.Controls.Add(dgvPrivileges);
            panel1.Controls.Add(chkWithGrantOption);
            panel1.Controls.Add(lblPrivilegeType);
            panel1.Controls.Add(btnViewPrivileges);
            panel1.Controls.Add(btnRevoke);
            panel1.Controls.Add(btnGrant);
            panel1.Controls.Add(cmbPrivilegeType);
            panel1.Location = new Point(20, 59);
            panel1.Name = "panel1";
            panel1.Size = new Size(565, 526);
            panel1.TabIndex = 15;
            // 
            // GrantPrivilegeForm
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(942, 615);
            Controls.Add(panel1);
            Controls.Add(lblRole);
            Controls.Add(cmbRoles);
            Controls.Add(btnGrantRole);
            Controls.Add(lblUserOrRole);
            Controls.Add(cmbUserOrRole);
            Name = "GrantPrivilegeForm";
            Text = "Grant Privileges";
            Load += GrantPrivilegeForm_Load;
            ((System.ComponentModel.ISupportInitialize)dgvPrivileges).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }
        private Panel panel1;
    }
}