using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
using Microsoft.Data.SqlClient;
namespace SqlHelper
{
    public partial class Form1 : Form
    {
        Server server;
        ServerConnection sqlconnection;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                sqlconnection = new ServerConnection(txtServer.Text, txtUserName.Text, txtPasword.Text);

                server = new Server(sqlconnection);
                MessageBox.Show(server.ServerVersion.ToString());
                button2.Enabled = true;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            

        }

        private void button2_Click(object sender, EventArgs e)
        {
            foreach (var item in server.Databases)
            {
                listBoxDb.Items.Add(item.ToString());
            }
        }
    }
}
