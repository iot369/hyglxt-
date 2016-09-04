
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class AjaxDate : Page
    {
        private BaseClass bc = new BaseClass();

        public static string CreateJsonParameters(DataTable dt, int cout)
        {
            StringBuilder JsonString = new StringBuilder();
            if ((dt != null) && (dt.Rows.Count > 0))
            {
                JsonString.Append("{ ");
                JsonString.Append("Rows:[ ");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    JsonString.Append("{ ");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        if (j < (dt.Columns.Count - 1))
                        {
                            JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == (dt.Columns.Count - 1))
                        {
                            JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == (dt.Rows.Count - 1))
                    {
                        JsonString.Append("} ");
                    }
                    else
                    {
                        JsonString.Append("}, ");
                    }
                }
                JsonString.Append("],Total:" + cout + "}");
                return JsonString.ToString();
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int page = int.Parse(base.Request.Params["page"].ToString());
                int pagesize = int.Parse(base.Request.Params["pagesize"].ToString());
                string sqlwhat = "C_Id,Card_Id,Type,Addtime,Remark,Shop,Money";
                string where = "";
                DataTable dtCheck = PublicMethod.QueryDataset("select P_Id,C_Id from TemporaryCard where C_Id='" + base.Request.QueryString["mnum"] + "'").Tables[0];
                if (dtCheck.Rows.Count > 0)
                {
                    where = " where Card_Id='" + dtCheck.Rows[0]["P_Id"].ToString() + "' or Card_Id='" + dtCheck.Rows[0]["C_Id"].ToString() + "'";
                }
                else
                {
                    where = " where Card_Id='" + base.Request.QueryString["mnum"] + "'";
                }
                int coutt = PublicMethod.QueryDataset("select " + sqlwhat + " from Consumption_Back " + where).Tables[0].Rows.Count;
                DataTable dt = PublicMethod.FindForPageAll(page, pagesize, where, "Consumption_Back", "Addtime", sqlwhat);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(CreateJsonParameters(dt, coutt));
                    this.bc.execsql("delete from Consumption_Back where Card_Id='" + base.Request.QueryString["mnum"] + "'  delete from TemporaryCard where C_Id='" + base.Request.QueryString["mnum"] + "'");
                }
                else
                {
                    string jsonstr = "{ Rows:[],Total:0}";
                    base.Response.Write(jsonstr);
                    this.bc.execsql("delete from Consumption_Back where Card_Id='" + base.Request.QueryString["mnum"] + "'  delete from TemporaryCard where C_Id='" + base.Request.QueryString["mnum"] + "'");
                }
            }
            catch
            {
            }
        }
    }


