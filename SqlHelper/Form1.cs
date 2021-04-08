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
        SqlHelper server;
        //ServerConnection sqlconnection;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                server = new SqlHelper(txtServer.Text, txtUserName.Text, txtPasword.Text);

               
                MessageBox.Show(server.GetServerVersion());
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
            foreach (var item in server.GetDatabases())
            {
                listBoxDb.Items.Add(item.ToString());
            }
        }

        private void listBoxDb_SelectedIndexChanged(object sender, EventArgs e)
        {
            int dbname = listBoxDb.SelectedIndex;
           

            DatabaseCollection dbs = server.GetDatabases();
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


            DatabaseCollection dbs = server.GetDatabases();
            Database db = dbs[dbname];

            TableCollection tables = db.Tables;
            ColumnCollection columns = tables[listBoxTbl.SelectedIndex].Columns;
            listBoxFields.Items.Clear();
            foreach (var item in columns)
            {
                listBoxFields.Items.Add(item.ToString());
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            int dbname = listBoxDb.SelectedIndex;
            string table = listBoxTbl.SelectedItem.ToString();
            SpGenerate spGenerate = new SpGenerate();

            DatabaseCollection dbs = server.GetDatabases();
            Database db = dbs[dbname];

            TableCollection tables = db.Tables;
            ColumnCollection columns = tables[listBoxTbl.SelectedIndex].Columns;

            List<string> spList = spGenerate.GenerateAllSp(columns, table);

            Server s = server.GetServer();
            foreach (var item in spList)
            {
                StoredProcedure sp = new StoredProcedure();
                
                //db.StoredProcedures.Add();
                txtStoredProcedure.Text += item;
                txtStoredProcedure.Text += " ";

            }


            /*
             
             List<tip> : Verilen Tipte sinamik Liste olusturur.
             string[] splist = new string[10];
             */
        }
    }
}
