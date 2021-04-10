using Microsoft.SqlServer.Management.Smo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SqlHelper
{
    public enum StoredProcedureTypes
    {
        Get,
        GetList,
        Insert,
        Update,
        Delete

    }
    public class SpGenerate
    {
        public string Generate(StoredProcedureTypes sptypeGenerate,
            ColumnCollection colsFields, string sTableName)
        {
            StringBuilder sGeneratedCode = new StringBuilder();
            StringBuilder sParamDeclaration = new StringBuilder();
            StringBuilder sBody = new StringBuilder();
            StringBuilder sINSERTValues = new StringBuilder();


            // Setup SP code, begining is the same no matter the type
            sGeneratedCode.AppendFormat($"CREATE PROCEDURE {sTableName}_{sptypeGenerate.ToString()}");
            sGeneratedCode.Append(Environment.NewLine);


            // Setup body code, different for UPDATE and INSERT
            switch (sptypeGenerate)
            {
                case StoredProcedureTypes.Insert:
                    sBody.AppendFormat($"INSERT INTO [{sTableName}] (");
                    sBody.Append(Environment.NewLine);


                    sINSERTValues.Append("VALUES (");
                    sINSERTValues.Append(Environment.NewLine);
                    break;

                case StoredProcedureTypes.Update:
                    sBody.AppendFormat($"UPDATE [{sTableName}]");
                    sBody.Append(Environment.NewLine);
                    sBody.Append("SET");
                    sBody.Append(Environment.NewLine);
                    break;

                case StoredProcedureTypes.Delete:
                    sBody.AppendFormat($"Delete From [{sTableName}]");
                    sBody.Append(Environment.NewLine);
                    break;

                case StoredProcedureTypes.Get:
                    sBody.AppendFormat($"Select * From [{sTableName}]");
                    sBody.Append(Environment.NewLine);
                    break;

                case StoredProcedureTypes.GetList:
                    sBody.AppendFormat($"Select * From [{sTableName}]");
                    break;
            }


            foreach (Column colCurrent in colsFields)
            {
                // Param Declaration construction
                //If Column is Identy and case Is Insert dont add it as parameter
                if (sptypeGenerate == StoredProcedureTypes.Insert &&
                        colCurrent.Identity)
                    continue;

                if ((sptypeGenerate == StoredProcedureTypes.Delete ||
                    sptypeGenerate == StoredProcedureTypes.Get) && !colCurrent.InPrimaryKey)
                    continue;

                if (sptypeGenerate == StoredProcedureTypes.GetList)
                    break;

                {
                    sParamDeclaration.AppendFormat($"    @{colCurrent.Name} {colCurrent.DataType}");

                    // Only binary, char, nchar, nvarchar, varbinary and varchar may have their length declared								


                    if (
                        colCurrent.DataType.Name == "binary" ||
                        colCurrent.DataType.Name == "char" ||
                        colCurrent.DataType.Name == "nchar" ||
                        colCurrent.DataType.Name == "nvarchar" ||
                        colCurrent.DataType.Name == "varbinary" ||
                        colCurrent.DataType.Name == "varchar")
                        sParamDeclaration.AppendFormat($"({colCurrent.DataType.MaximumLength})");

                    sParamDeclaration.Append(",");
                    sParamDeclaration.Append(Environment.NewLine);

                    // Body construction, different for INSERT and UPDATE
                    switch (sptypeGenerate)
                    {
                        case StoredProcedureTypes.Insert:
                            //Take care and don't take Identity
                            if (!colCurrent.Identity)
                            {
                                sINSERTValues.AppendFormat($"    @{colCurrent.Name},");
                                sINSERTValues.Append(Environment.NewLine);


                                sBody.AppendFormat($"    {colCurrent.Name},");
                                sBody.Append(Environment.NewLine);
                            }
                            break;

                        case StoredProcedureTypes.Update:
                            //Take care and don't take Primary Keys
                            if (!colCurrent.InPrimaryKey)
                            {
                                sBody.AppendFormat($"    {colCurrent.Name} = @{colCurrent.Name},");
                                sBody.Append(Environment.NewLine);
                            }


                            break;
                    }

                }
            }

            //Remove last "," if it was Insert or Update
            if (sptypeGenerate == StoredProcedureTypes.Insert ||
                sptypeGenerate == StoredProcedureTypes.Update)
            {
                sBody = new StringBuilder(sBody.ToString().TrimEnd
                    (("," + Environment.NewLine).ToCharArray()));
                sBody.Append(Environment.NewLine);
            }
            //Now Append the Where Condition if there are primary keys
            List<Column> objPrimaryKeys = GetPrimaryKeys(colsFields);
            if (objPrimaryKeys.Count > 0)
            {
                switch (sptypeGenerate)
                {
                    case StoredProcedureTypes.Update:
                    case StoredProcedureTypes.Delete:
                    case StoredProcedureTypes.Get:
                        sBody.AppendFormat(" Where ");
                        sBody.Append(Environment.NewLine);
                        break;
                }

                //Now Append the Primary Keys
                foreach (Column obj in objPrimaryKeys)
                {
                    switch (sptypeGenerate)
                    {
                        case StoredProcedureTypes.Update:
                        case StoredProcedureTypes.Delete:
                        case StoredProcedureTypes.Get:
                            sBody.AppendFormat($"    {obj.Name} = @{obj.Name}");
                            sBody.Append(Environment.NewLine);
                            sBody.Append(" AND ");
                            sBody.Append(Environment.NewLine);
                            break;

                    }
                }

                //Remove the Last AND
                switch (sptypeGenerate)
                {
                    case StoredProcedureTypes.Update:
                    case StoredProcedureTypes.Delete:
                    case StoredProcedureTypes.Get:
                        if (sBody.ToString().EndsWith(" AND " + Environment.NewLine))
                            sBody =
                                new StringBuilder(sBody.ToString().Remove(sBody.ToString().Length - 7, 7));
                        break;

                }
            }


            // Now stitch the body parts together into the SP whole
            if (sptypeGenerate != StoredProcedureTypes.GetList) //there is no parameters
                sGeneratedCode.Append(sParamDeclaration.Remove(sParamDeclaration.Length - 3, 3));

            sGeneratedCode.Append(Environment.NewLine);
            sGeneratedCode.Append("AS");
            sGeneratedCode.Append(Environment.NewLine);
            //sGeneratedCode.Append(sBody.Remove(sBody.Length -3, 3));
            sGeneratedCode.Append(sBody);
            if (sptypeGenerate == StoredProcedureTypes.Insert)
            {
                sGeneratedCode.Append(")");
                sGeneratedCode.Append(Environment.NewLine);
                sGeneratedCode.Append(sINSERTValues.Remove(sINSERTValues.Length - 3, 3));
                sGeneratedCode.Append(")");
            }
            sGeneratedCode.Append(Environment.NewLine);
            sGeneratedCode.Append("GO");

            return sGeneratedCode.ToString();

        }

        public List<Column> GetPrimaryKeys(ColumnCollection colsFields)
        {
            List<Column> returnColumns = new List<Column>();

            foreach (Column obj in colsFields)
            {
                if (obj.InPrimaryKey)
                    returnColumns.Add(obj);
            }

            return returnColumns;
        }

        public List<string> GenerateAllSp(ColumnCollection columns, string tableName)
        {
            List<string> allSpList = new List<string>();

            foreach (var spType in Enum.GetValues(typeof(StoredProcedureTypes)))
            {
                allSpList.Add(Generate((StoredProcedureTypes)spType, columns, tableName));
            }


            return allSpList;
        }

        public void AddCrudSp(Database db,string tableName,ColumnCollection columns)
        {
            foreach (var spType in Enum.GetValues(typeof(StoredProcedureTypes)))
            {

                string sql = Generate((StoredProcedureTypes) spType, columns, tableName);
                db.ExecuteNonQuery(sql);
            }

        }
    }
}
