
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  comlist : Page
    {
        private BaseClass bc = new BaseClass();
        public string begin = "";
        public double bili = 0.0;
        public double jine = 0.0;
        public string name = "";
        public string num = "";
        public string over = "";


        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "用户提成统计" + this.txtbegin.Value + "至" + this.txtover.Value;
            ExportToSpreadsheet(this.load(), str);
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

        public DataTable load()
        {
            DataTable dtz = new DataTable();
            dtz.Columns.Add("用户编号", typeof(string));
            dtz.Columns.Add("用户名", typeof(string));
            dtz.Columns.Add("发卡数量", typeof(decimal));
            dtz.Columns.Add("发卡提成", typeof(decimal));
            dtz.Columns.Add("消费金额", typeof(decimal));
            dtz.Columns.Add("消费提成", typeof(decimal));
            string sqladmin = "select * from admininfo where 1=1  and aSnum='" + PublicMethod.GetSessionValue("shopnum").ToString() + "'";
            if (this.txtnum.Value != "")
            {
                sqladmin = sqladmin + "and  charindex('" + this.txtnum.Value + "', aNum)>0";
            }
            if (this.txtname.Value != "")
            {
                sqladmin = sqladmin + "and  charindex('" + this.txtname.Value + "', .aName)>0";
            }
            sqladmin = sqladmin + "order by aId desc";
            DataTable dta = this.bc.ReadTable(sqladmin);
            for (int i = 0; i < dta.Rows.Count; i++)
            {
                double jines = this.loadcout(dta.Rows[i]["aNum"].ToString()) * this.jine;
                double bilis = this.loadmoney(dta.Rows[i]["aNum"].ToString()) * this.bili;
                dtz.Rows.Add(new object[] { dta.Rows[i]["aNum"].ToString(), dta.Rows[i]["aName"].ToString(), this.loadcout(dta.Rows[i]["aNum"].ToString()), jines, this.loadmoney(dta.Rows[i]["aNum"].ToString()), bilis });
            }
            return dtz;
        }

        public double loadcout(string ids)
        {
            string sql = "select count(*) as cout from membersinfo where mMakecard='" + ids + "'";
            if ((this.txtbegin.Value != "") && (this.txtover.Value != ""))
            {
                string name2 = sql;
                sql = name2 + "and  mMakedate >='" + this.txtbegin.Value + "' and mMakedate <='" + this.txtover.Value + "'";
            }
            return double.Parse(this.bc.ReadTable(sql).Rows[0]["cout"].ToString());
        }

        public double loadmoney(string ids)
        {
            string mmem = "";
            string sqlmem = "select mNum from membersinfo where mMakecard='" + ids + "'";
            DataTable dt = this.bc.ReadTable(sqlmem);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                mmem = mmem + dt.Rows[i]["mNum"].ToString() + "|";
            }
            string sqll = "select sum(CONVERT(decimal(18, 2),[money])) as  allmoney  from Consumption_Back_select where charindex(Card_Id,'" + mmem + "')>0 and CardType='会员卡'";
            if ((this.txtbegin.Value != "") && (this.txtover.Value != ""))
            {
                string name2 = sqll;
                sqll = name2 + "and  Addtime >='" + this.txtbegin.Value + "' and Addtime <='" + this.txtover.Value + "'";
            }
            DataTable dtl = this.bc.ReadTable(sqll);
            return double.Parse((dtl.Rows[0]["allmoney"].ToString() == "") ? "0" : dtl.Rows[0]["allmoney"].ToString());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            DateTime d1 = new DateTime(now.Year, now.Month, 1);
            DateTime d2 = d1.AddMonths(1).AddDays(-1.0);
            this.txtbegin.Value = d1.ToString("yyyy-MM-dd");
            this.txtover.Value = d2.ToString("yyyy-MM-dd");
            string sqls = "select sCommission from shops where sNum ='" + PublicMethod.GetSessionValue("shopnum") + "'";
            string[] spr = this.bc.ReadTable(sqls).Rows[0]["sCommission"].ToString().Split(new char[] { '|' });
            this.jine = double.Parse(spr[0].ToString());
            this.bili = double.Parse(spr[1].ToString());
        }
    }


