using ATBM_atbmcq_17_Phanhe1.Forms;

namespace ATBM_atbmcq_17_Phanhe1.Services
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            ConnectionDBForm f = new ConnectionDBForm();
            Application.Run(f);
            //Application.Run(new Form1());
        }
    }
}