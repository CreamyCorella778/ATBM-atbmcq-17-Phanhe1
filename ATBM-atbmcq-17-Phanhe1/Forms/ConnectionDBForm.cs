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
                ConnectionManager cm = await Task(Run () =>
                {
                    try
                    {
                        List<string> connectionInfo = this.GetTextFieldValues();
                        ConnectionManager cm = new ConnectionManager(connectionInfo);
                        cm.connectToDatabase();
                        return cm;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                        return null;
                    }
                });

                if (cm == null || cm.getConnection() == null)
                {
                    label1.Text = "Lỗi kết nối cơ sở dữ liệu, chúc may mắn lần sau!";
                    label1.Visible = true;
                    //pane.Invalidate();
                    //pane.Update();
                }
                else
                {
                    Form thisWindow = this.FindForm();
                    thisWindow?.Close();

                    //MenuWindow mw = MenuWindow.getInstance(cm);
                    //mw.launch();
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
    }
}
