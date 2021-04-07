using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
namespace SqlHelper
{
    public struct SqlHelper
    {
        string _domain;
        string _username;
        string _password;
        Server _server;
        ServerConnection _serverconnection;
        

        public SqlHelper(string domain,string username,string password)
        {
            _domain = domain;
            _username = username;
            _password = password;

            _serverconnection = new ServerConnection(domain, username, password);
            _server = new Server(_serverconnection);
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
        

    }
}
