
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  zonglist : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "总部结算" + this.begins.Value + "至" + this.overs.Value;
            ExportToSpreadsheet(this.DataBindToGridviewex(), str);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        }

        public DataTable DataBindToGridviewex()
        {
            string begin = this.begins.Value + " 00:00";
            string over = this.overs.Value + " 23:59";
            string sql = "select ShopId as 店铺编号,Shop as 店铺名称,sum(CONVERT(decimal(18, 2),[money])) as 销售金额, sum(BlancePay) as 储值,sum(CashPay) as 现金,sum(BankPay) as 银行,sum(JifenPay) as 积分,sum(ElsePay) as 其他 from Consumption_Back_select  where 1=1 ";
            if ((begin != "") && (over != ""))
            {
                string name2 = sql;
                sql = name2 + "and  Addtime >='" + begin + "' and Addtime <='" + over + "'";
            }
            sql = sql + "group by Shop,ShopId ";
            DataTable dt = this.bc.ReadTable(sql);
            if (dt.Rows.Count > 0)
            {
                dt.Columns.Add("充值总额", typeof(decimal));
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i]["充值总额"] = this.loadchong(begin, over, dt.Rows[i]["店铺编号"].ToString());
                }
            }
            return dt;
        }

        public static void ExportToSpreadsheet(DataTable table, string name)
        {
            Random r = new Random();
            string rf = "";
            for (int j = 0; j < 10; j++)
            {
                rf = r.Next(0x7fffffff).ToString();
            }
            HttpContext context = HttpContext.Current;
            context.Response.Clear();
            context.Response.AppendHeader("content-disposition", "attachment;filename=\"" + HttpUtility.UrlEncode(name, Encoding.UTF8) + ".xls\"");
            context.Response.ContentEncoding = Encoding.GetEncoding("GB2312");
            context.Response.ContentType = "text/csv";
            context.Response.BinaryWrite(Encoding.UTF8.GetPreamble());
            foreach (DataColumn column in table.Columns)
            {
                context.Response.Write(column.ColumnName + ",");
            }
            context.Response.Write(Environment.NewLine);
            foreach (DataRow row in table.Rows)
            {
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    double test;
                    string name8 = table.Columns[i].DataType.ToString();
                    if (name8 == null)
                    {
                        goto Label_0298;
                    }
                    if (!(name8 == "System.String"))
                    {
                        if (name8 == "System.DateTime")
                        {
                            goto Label_0204;
                        }
                        goto Label_0298;
                    }
                    if (double.TryParse(row[i].ToString(), out test))
                    {
                        context.Response.Write("=");
                    }
                    context.Response.Write("\"" + row[i].ToString().Replace("\"", "\"\"") + "\",");
                    continue;
                Label_0204:
                    if (row[i].ToString() != "")
                    {
                        DateTime name5 = (DateTime) row[i];
                        context.Response.Write("\"" + name5.ToString("yyyy-MM-dd hh:mm:ss") + "\",");
                    }
                    else
                    {
                        context.Response.Write("\"" + row[i].ToString().Replace("\"", "\"\"") + "\",");
                    }
                    continue;
                Label_0298:
                    context.Response.Write("\"" + row[i].ToString().Replace("\"", "\"\"") + "\",");
                }
                context.Response.Write(Environment.NewLine);
            }
            context.Response.End();
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

        public void loaddian()
        {
            this.ddldian.Items.Clear();
            this.ddldian.Items.Add(new ListItem("全部", "NONE"));
            string sqlf = "select * from shops";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddldian.Items.Add(new ListItem(dtj.Rows[i]["sName"].ToString(), dtj.Rows[i]["sNum"].ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                DateTime dt = DateTime.Now;
                this.begins.Value = dt.AddDays((double) (-dt.Day + 1)).ToString("yyyy-MM-dd");
                this.overs.Value = DateTime.Now.ToString("yyyy-MM-dd");
                this.loaddian();
            }
        }
    }


