using ATBM_atbmcq_17_Phanhe1.Services;
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
    public partial class ConnectionDBForm : Form
    {
        public ConnectionDBForm()
        {
            InitializeComponent();
        }

        public List<string> GetTextFieldValues()
        {
            List<string> values = new List<string>();
            values.Add(textBox2.Text);
            values.Add(textBox3.Text);
            values.Add(textBox4.Text);
            values.Add(textBox5.Text);
            values.Add(textBox6.Text);
            return values;
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectionManager? cm = null;

                await Task.Run(() =>
                {
                    try
                    {
                        List<string> connectionInfo = this.GetTextFieldValues();
                        ConnectionManager cmInner = new ConnectionManager(connectionInfo);

                        bool success = cmInner.connectToDatabase();
                        if (success)
                        {
                            cm = cmInner;
                        }
                    }
                    catch (Exception ex)
                    {
                        this.Invoke((MethodInvoker)(() =>
                        {
                            MessageBox.Show("Lỗi không xác định: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }));
                    }
                });


                if (cm == null || cm.getConnection() == null)
                {
                    Console.WriteLine("cm hoặc connection null!");
                    label1.Text = "Lỗi kết nối cơ sở dữ liệu, chúc may mắn lần sau!";
                    label1.Visible = true;
                }
                else
                {
                    // Thông báo thành công (tuỳ chọn)
                    MessageBox.Show("✅ Kết nối thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // Mở UserRolePrivilegeForm
                    UserRolePrivilegeForm nextForm = new UserRolePrivilegeForm(cm);
                    this.Hide(); 
                    nextForm.FormClosed += (s, args) => this.Close(); 
                    nextForm.Show();
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                label1.Text = $"Đã xảy ra lỗi: {ex.Message}";
                label1.Visible = true;
                //pane.Invalidate();
                //pane.Update();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form thisWindow = this.FindForm();
            thisWindow?.Close();
        }
        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            // handle text change
        }
        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            // handle text change
        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
