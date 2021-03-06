using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
namespace SqlHelper
{

    /// <summary>
    /// Sql Server a Baglanip Stored Procedure cikaran alt yapi
    /// </summary>
    public struct SqlHelper
    {
        string _domain; 
        string _username;
        string _password;
        Server _server; // Sql SMO Kutuphanesindeki Class
        /*
         Sql SMO Kutuphanesindeki Class . Server Nesnesi olusturmak icin gerekli olan nesne
         */
        ServerConnection _serverconnection;
       

        /// <summary>
        /// 
        /// </summary>
        /// <param name="domain">Sql Server icin gerekli instance</param>
        /// <param name="username">Sql Server Username</param>
        /// <param name="password">Password</param>
        public SqlHelper(string domain,string username,string password)
        {
            _domain = domain;
            _username = username;
            _password = password;

            _serverconnection = new ServerConnection(domain, username, password);
            _server = new Server(_serverconnection);
        }
        public Server GetServer()
        {
            return _server;
        }
        public DatabaseCollection GetDatabases()
        {
            
            return _server.Databases;
        }

        public TableCollection GetTables(string dbname)
        {
            

            return _server.Databases[dbname].Tables;
        }

        public ColumnCollection GetFields(string dbname ,string tablename)
        {
            return _server.Databases[dbname].Tables[tablename].Columns;
        }


        public string GetServerVersion()
        {
            return _server.Version.ToString();
        }
        public void setDomain(string domain)
        {
            if (!string.IsNullOrEmpty(domain))
            {
                _domain = domain;
            }

        }

        public void setUserName(string username)
        {
            if (!string.IsNullOrEmpty(username))
            {
                _username = username;
            }
        }

        public void setPassword(string password)
        {
            if (!string.IsNullOrEmpty(password))
            {
                _password = password;
            }
        }


        public void changeConnection()
        {
            _serverconnection = new ServerConnection(_domain, _username, _password);
            _server = new Server(_serverconnection);

        }

        public void AddStoredProcedure(Database db)
        {
            db.ExecuteNonQuery("");
            StoredProcedure sp = new StoredProcedure();
            
            


        }

    }


   
    
    
}
