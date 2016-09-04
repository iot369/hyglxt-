namespace DBUtility
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Text;
    using System.Web;
    using System.Web.UI;

    public class BaseClass
    {
        private string strConn = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];

        public static string CreateJsonParameters(DataTable dt, int cout)
        {
            StringBuilder builder = new StringBuilder();
            if ((dt != null) && (dt.Rows.Count > 0))
            {
                builder.Append("{ ");
                builder.Append("Rows:[ ");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    builder.Append("{ ");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        if (j < (dt.Columns.Count - 1))
                        {
                            builder.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == (dt.Columns.Count - 1))
                        {
                            builder.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == (dt.Rows.Count - 1))
                    {
                        builder.Append("} ");
                    }
                    else
                    {
                        builder.Append("}, ");
                    }
                }
                builder.Append("],Total:" + cout + "}");
                return builder.ToString();
            }
            return "{ Rows:[],Total:0}";
        }

        public void execsql(string strSql)
        {
            SqlConnection connection = new SqlConnection(this.strConn);
            SqlCommand command = new SqlCommand(strSql, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public DataSet GetDataSet(string strSql, string tableName)
        {
            DataSet dataSet = new DataSet();
            SqlConnection selectConnection = new SqlConnection(this.strConn);
            selectConnection.Open();
            new SqlDataAdapter(strSql, selectConnection).Fill(dataSet, tableName);
            selectConnection.Close();
            return dataSet;
        }

        public void JSbox(string str)
        {
            string key = "somekey";
            Page handler = HttpContext.Current.Handler as Page;
            handler.ClientScript.RegisterStartupScript(typeof(string), key, str, true);
        }

        public DataSet ReadDataSet(string strSql)
        {
            DataSet dataSet = new DataSet();
            SqlConnection selectConnection = new SqlConnection(this.strConn);
            selectConnection.Open();
            new SqlDataAdapter(strSql, selectConnection).Fill(dataSet);
            selectConnection.Close();
            return dataSet;
        }

        public SqlDataReader readrow(string sql)
        {
            SqlConnection connection = new SqlConnection(this.strConn);
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                command.Dispose();
                return reader;
            }
            command.Dispose();
            return null;
        }

        public string Readstr(string strSql, int flag)
        {
            DataSet dataSet = new DataSet();
            SqlConnection selectConnection = new SqlConnection(this.strConn);
            selectConnection.Open();
            new SqlDataAdapter(strSql, selectConnection).Fill(dataSet);
            string str = dataSet.Tables[0].Rows[0].ItemArray[flag].ToString();
            selectConnection.Close();
            return str;
        }

        public DataTable ReadTable(string strSql)
        {
            DataTable dataTable = new DataTable();
            SqlConnection selectConnection = new SqlConnection(this.strConn);
            selectConnection.Open();
            new SqlDataAdapter(strSql, selectConnection).Fill(dataTable);
            selectConnection.Close();
            return dataTable;
        }

        public void Show(Page page, string msg)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
        }

        public static void ShowAndRedirect(Page page, string msg, string url)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<script language='javascript' defer>");
            builder.AppendFormat("alert('{0}');", msg);
            builder.AppendFormat("window.location.href='{0}'", url);
            builder.Append("</script>");
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", builder.ToString());
        }
    }
}

