
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxfenlist : Page
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
                string begin = base.Server.UrlDecode(base.Request.QueryString["begin"].ToString()) + " 00:00";
                string over = base.Server.UrlDecode(base.Request.QueryString["over"].ToString()) + " 23:59";
                string sqll = "where 1=1 and ShopId='" + PublicMethod.GetSessionValue("shopnum") + "'  ";
                if ((begin != "") && (over != ""))
                {
                    string name3 = sqll;
                    sqll = name3 + "and  Addtime >='" + begin + "' and Addtime <='" + over + "'";
                }
                string sqlwhat = "* ";
                int coutt = PublicMethod.QueryDataset("select " + sqlwhat + " from Consumption_Back_select " + sqll).Tables[0].Rows.Count;
                DataTable dt = PublicMethod.FindForPageAll(page, pagesize, sqll, "Consumption_Back_select", "Id", sqlwhat);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(CreateJsonParameters(dt, coutt));
                }
                else
                {
                    string jsonstr = "{ Rows:[],Total:0}";
                    base.Response.Write(jsonstr);
                }
            }
            catch
            {
            }
        }
    }


