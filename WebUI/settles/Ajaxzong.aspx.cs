
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxzong : Page
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

        public double loadchong(string begins, string overs, string shopid)
        {
            string sql = "select sum(CONVERT(decimal(18, 2),[cChongMoney])) as zong   from memberchong  where 1=1 and cShopnum='" + shopid + "'";
            if ((begins != "") && (overs != ""))
            {
                string name2 = sql;
                sql = name2 + "and  cDate >='" + begins + "' and cDate <='" + overs + "'";
            }
            return double.Parse(this.bc.ReadTable(sql).Rows[0]["zong"].ToString());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int page = int.Parse(base.Request.Params["page"].ToString());
                int pagesize = int.Parse(base.Request.Params["pagesize"].ToString());
                string begin = base.Server.UrlDecode(base.Request.QueryString["begin"].ToString()) + " 00:00";
                string over = base.Server.UrlDecode(base.Request.QueryString["over"].ToString()) + " 23:59";
                string dian = base.Server.UrlDecode(base.Request.QueryString["dian"].ToString());
                string sqll = "where 1=1  ";
                if ((begin != "") && (over != ""))
                {
                    string name3 = sqll;
                    sqll = name3 + "and  Addtime >='" + begin + "' and Addtime <='" + over + "'";
                }
                if (dian != "NONE")
                {
                    sqll = sqll + "and ShopId='" + dian + "' ";
                }
                sqll = sqll + "group by Shop,ShopId";
                string sqlwhat = "ShopId,Shop,sum(CONVERT(decimal(18, 2),[money])) as money, sum(BlancePay) as BlancePay,sum(CashPay) as CashPay,sum(BankPay) as BankPay,sum(JifenPay) as JifenPay,sum(ElsePay) as ElsePay ";
                int coutt = PublicMethod.QueryDataset("select " + sqlwhat + " from Consumption_Back_select " + sqll).Tables[0].Rows.Count;
                DataTable dt = PublicMethod.FindForPageAll(page, pagesize, sqll, "Consumption_Back_select", "ShopId", sqlwhat);
                if (dt.Rows.Count > 0)
                {
                    dt.Columns.Add("chong", typeof(decimal));
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        dt.Rows[i]["chong"] = this.loadchong(begin, over, dt.Rows[i]["ShopId"].ToString());
                    }
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


