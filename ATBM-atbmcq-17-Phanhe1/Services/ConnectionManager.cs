using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;


namespace ATBM_atbmcq_17_Phanhe1.Services
{
    class ConnectionManager
    {
        private string username;
        private string password;
        private string hostname;
        private string port;
        private string serviceName;
        private OracleConnection con;

        public ConnectionManager(List<string> connectionInformation)
        {
            if (connectionInformation == null || connectionInformation.Count < 5)
            {
                throw new ArgumentException("\"connectionInformation must contain at least 5 elements: user, password, hostname, port, service name.");
            }

            this.username = connectionInformation[0];
            this.password = connectionInformation[1];
            this.hostname = connectionInformation[2];
            this.port = connectionInformation[3];
            this.serviceName = connectionInformation[4];
        }

        public string createConnectionURL()
        {
            try
            {
                return $"User Id={username};Password={password};Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST={hostname})(PORT={port}))(CONNECT_DATA=(SERVICE_NAME={serviceName})))";
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
            if (!IsOracleDriverAvailable())
            {
                return false;
            }
            else
            {
                string connectionURL = createConnectionURL();
                OracleConnection con = new OracleConnection(connectionURL);

                try
                {
                    con.Open();
                    this.con = con;
                    return true;
                }
                catch (OracleException ex)
                {
                    return false;
                }
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