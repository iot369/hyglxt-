
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  fenlist : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "店铺结算" + this.begins.Value + "至" + this.overs.Value;
            ExportToSpreadsheet(this.DataBindToGridviewex(), str);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.load();
            this.loadchong();
        }

        public DataTable DataBindToGridviewex()
        {
            string begin = this.begins.Value + " 00:00";
            string over = this.overs.Value + " 23:59";
            string sql = "select C_Id as 单号,Addtime as 日期 ,Type as 消费类型 ,ClientName as 消费会员,Shop as 店铺,CONVERT(decimal(18, 2),[Money]) as 消费金额,BlancePay as 储值,CashPay as 现金,BankPay as 银行,JifenPay as 积分,ElsePay as 其他 from Consumption_Back_select  where 1=1 and ShopId='" + PublicMethod.GetSessionValue("shopnum") + "'";
            if ((begin != "") && (over != ""))
            {
                string name2 = sql;
                sql = name2 + "and  Addtime >='" + begin + "' and Addtime <='" + over + "'";
            }
            sql = sql + "order by Addtime desc";
            return this.bc.ReadTable(sql);
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

        public void load()
        {
            string begin = this.begins.Value + " 00:00";
            string over = this.overs.Value + " 23:59";
            string sql = "select sum(CONVERT(decimal(18, 2),[money])) as zong ,sum(CONVERT(decimal(18, 2),[BlancePay])) as BlancePay  from Consumption_Back_select  where 1=1 and ShopId='" + PublicMethod.GetSessionValue("shopnum") + "'";
            if ((begin != "") && (over != ""))
            {
                string name3 = sql;
                sql = name3 + "and  Addtime >='" + begin + "' and Addtime <='" + over + "'";
            }
            DataTable dt = this.bc.ReadTable(sql);
            this.zong.Value = dt.Rows[0]["zong"].ToString() + "元";
            this.txtchu.Value = dt.Rows[0]["BlancePay"].ToString() + "元";
        }

        public void loadchong()
        {
            string begin = this.begins.Value + " 00:00";
            string over = this.overs.Value + " 23:59";
            string sql = "select sum(CONVERT(decimal(18, 2),[cChongMoney])) as zong   from memberchong  where 1=1 and cShopnum='" + PublicMethod.GetSessionValue("shopnum") + "'";
            if ((begin != "") && (over != ""))
            {
                string name3 = sql;
                sql = name3 + "and  cDate >='" + begin + "' and cDate <='" + over + "'";
            }
            DataTable dt = this.bc.ReadTable(sql);
            this.txtchong.Value = dt.Rows[0]["zong"].ToString() + "元";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                DateTime dt = DateTime.Now;
                this.begins.Value = dt.AddDays((double) (-dt.Day + 1)).ToString("yyyy-MM-dd");
                this.overs.Value = DateTime.Now.ToString("yyyy-MM-dd");
                this.load();
                this.loadchong();
            }
        }
    }


