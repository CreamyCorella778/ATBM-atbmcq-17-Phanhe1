using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ATBM_atbmcq_17_Phanhe1.Services
{
    public class ConnectionManager
    {
        private string username;
        private string password;
        private string hostname;
        private string port;
        private string serviceName;
        private OracleConnection? con = null;

        public ConnectionManager(List<string> connectionInformation) {
            if (connectionInformation == null || connectionInformation.Count < 5)
            {
                throw new ArgumentException("\"connectionInformation must contain at least 5 elements: user, password, hostname, port, service name.");
            }
            string rawPort = connectionInformation[3];
            if (!int.TryParse(rawPort.Trim(), out _))
            {
                MessageBox.Show($"Giá trị nhập ở ô 'Port' không hợp lệ: \"{rawPort}\"", "Lỗi định dạng Port", MessageBoxButtons.OK, MessageBoxIcon.Error);
                throw new FormatException("Port phải là một số hợp lệ!");
            }
            this.username = connectionInformation[0].Trim();
            this.password = connectionInformation[1].Trim();
            this.hostname = connectionInformation[2].Trim();
            this.port = connectionInformation[3].Trim();
            this.serviceName = connectionInformation[4].Trim(); }
            // Thêm phương thức này vào lớp ConnectionManager
        public string getCurrentUser()
        {
            try
            {
                // Lấy tên user hiện tại từ session Oracle
                OracleCommand cmd = new OracleCommand("SELECT USER FROM DUAL", getConnection());
                string currentUser = cmd.ExecuteScalar().ToString();
                return currentUser;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }    
    

        public string createConnectionURL()
        {
            try
            {
                string connStr = $"User Id={username};Password={password};Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST={hostname})(PORT={port}))(CONNECT_DATA=(SERVICE_NAME={serviceName})))";
                Console.WriteLine("🔗 Connection String: " + connStr);
                return connStr;
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("Failed to create connection URL", ex);
            }
        }

        public bool IsOracleDriverAvailable()
        {
            try
            {
                var factory = DbProviderFactories.GetFactory("Oracle.ManagedDataAccess.Client");
                return factory != null;
            }
            catch
            {
                return false;
            }
        }

        public bool connectToDatabase()
        {
            string connectionURL = createConnectionURL();
            OracleConnection con = new OracleConnection(connectionURL);
            try
            {
                if (con != null)
                {
                    con.Open();
                    this.con = con;
                    return true;
                }
                else
                {
                    MessageBox.Show("Kết nối null, không thể mở!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }
            catch (OracleException ex)
            {
                Console.WriteLine("❌ Oracle Error: " + ex.Message);
                MessageBox.Show("Lỗi kết nối Oracle: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

        }

        public OracleConnection getConnection() { return this.con; }

        public void closeConnection()
        {
            if (con != null)
            {
                try
                {
                    con.Close();
                    con = null;
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.StackTrace);
                }
            }
        }
    }
}
