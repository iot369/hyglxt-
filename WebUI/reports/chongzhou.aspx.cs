
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  chongzhou : Page
    {
        private BaseClass bc = new BaseClass();
        public string month = DateTime.Now.AddDays(-1.0).ToString("yyyy-MM-dd");
        private ViewType types = ViewType.Bar;


        private void DrawPie()
        {
            string sql = "select DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 0) as one";
            DataTable dt = this.bc.ReadTable(sql);
            string title = DateTime.Parse(dt.Rows[0][0].ToString()).ToString("yyyy-MM-dd") + "至" + DateTime.Parse(dt.Rows[0][0].ToString()).AddDays(6.0).ToString("yyyy-MM-dd") + "会员充值金额统计分析图";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "充值金额", this.types, this.load(), "day", "money");
            ChartServices.DrawChart(this.WebChartControl1, "赠送金额", this.types, this.load(), "day", "give");
        }

        public DataTable load()
        {
            int i;
            string sql = "SELECT";
            sql = ((((((((((((((((sql + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 0)) when 0 then cChongMoney else 0.00 end) as '星期一',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 1)) when 0 then cChongMoney else 0.00 end) as '星期二',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 2)) when 0 then cChongMoney else 0.00 end) as '星期三',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 3)) when 0 then cChongMoney else 0.00 end) as '星期四',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 4)) when 0 then cChongMoney else 0.00 end) as '星期五',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 5)) when 0 then cChongMoney else 0.00 end) as '星期六',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 6)) when 0 then cChongMoney else 0.00 end) as '星期日'") + "  from memberchong ") + " union " + "SELECT") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 0)) when 0 then cGive else 0.00 end) as '星期一',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 1)) when 0 then cGive else 0.00 end) as '星期二',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 2)) when 0 then cGive else 0.00 end) as '星期三',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 3)) when 0 then cGive else 0.00 end) as '星期四',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 4)) when 0 then cGive else 0.00 end) as '星期五',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 5)) when 0 then cGive else 0.00 end) as '星期六',") + "  sum(case datediff(dd,cDate,DATEADD(wk, DATEDIFF(wk,0,'" + this.month + "'), 6)) when 0 then cGive else 0.00 end) as '星期日'") + "  from memberchong ";
            DataTable dt = this.bc.ReadTable(sql);
            DataTable dtz = new DataTable();
            dtz.Columns.Add("day", typeof(string));
            dtz.Columns.Add("money", typeof(decimal));
            dtz.Columns.Add("give", typeof(decimal));
            if (dt.Rows.Count == 2)
            {
                for (i = 0; i < 7; i++)
                {
                    dtz.Rows.Add(new object[] { dt.Columns[i].ColumnName, dt.Rows[1][i].ToString(), dt.Rows[0][i].ToString() });
                }
                return dtz;
            }
            for (i = 0; i < 7; i++)
            {
                int j = i + 1;
                dtz.Rows.Add(new object[] { dt.Columns[i].ColumnName, 0, 0 });
            }
            return dtz;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                try
                {
                    this.month = DateTime.Parse(base.Request.QueryString["month"].ToString()).AddDays(-1.0).ToString("yyyy-MM-dd");
                    if (base.Server.UrlDecode(base.Request.QueryString["type"].ToString()) == "树状图")
                    {
                        this.types = ViewType.Bar;
                    }
                    else
                    {
                        this.types = ViewType.Line;
                    }
                }
                catch
                {
                }
                this.DrawPie();
            }
        }
    }


