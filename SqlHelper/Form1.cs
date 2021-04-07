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

                // Server Nesnesi ServerConnection istediginden bu nesne olusturuldu.
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
            listBoxDb.Items.Clear();
            foreach (var item in server.Databases)
            {
                listBoxDb.Items.Add(item.ToString());
            }
        }

        private void listBoxDb_SelectedIndexChanged(object sender, EventArgs e)
        {
            int dbname = listBoxDb.SelectedIndex;
           

            DatabaseCollection dbs = server.Databases;
            Database db = dbs[dbname];
            
            TableCollection tables = db.Tables;
            listBoxTbl.Items.Clear();
            foreach (var item in tables)
            {
                listBoxTbl.Items.Add(item.ToString());
            }

        }

        private void listBoxTbl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int dbname = listBoxDb.SelectedIndex;


            DatabaseCollection dbs = server.Databases;
            Database db = dbs[dbname];

            TableCollection tables = db.Tables;
            ColumnCollection columns = tables[listBoxTbl.SelectedIndex].Columns;
            listBoxFields.Items.Clear();
            foreach (var item in columns)
            {
                listBoxFields.Items.Add(item.ToString());
            }

        }
    }
}
