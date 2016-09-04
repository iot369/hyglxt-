
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxshopslist : Page
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
                string scontact = base.Request.QueryString["scontact"].ToString();
                string stnum = base.Server.UrlDecode(base.Request.QueryString["stnum"].ToString());
                string sname = base.Server.UrlDecode(base.Request.QueryString["sname"].ToString());
                string sqll = "where 1=1 and shops.stNum=shopstype.tNum ";
                if (sname != "")
                {
                    sqll = sqll + "and  charindex('" + sname + "', shops.sName)>0";
                }
                if (scontact != "")
                {
                    sqll = sqll + "and  charindex('" + scontact + "', shops.sContact)>0";
                }
                if (stnum != "")
                {
                    sqll = sqll + "and  charindex('" + stnum + "', shops.stNum)>0";
                }
                string sqlwhat = "shops.*,shopstype.tName,tNum";
                int coutt = PublicMethod.QueryDataset("select " + sqlwhat + " from shops,shopstype " + sqll).Tables[0].Rows.Count;
                DataTable dt = PublicMethod.FindForPageAll(page, pagesize, sqll, "shops,shopstype", "shops.sId", sqlwhat);
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


