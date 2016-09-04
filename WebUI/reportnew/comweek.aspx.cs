
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  comweek : Page
    {
        private BaseClass bc = new BaseClass();
        private ViewType types = ViewType.Bar;
        public string week = DateTime.Now.ToString("yyyy-MM-dd");

        private void DrawPie()
        {
            string ttt = string.Concat(new object[] { "第", this.WeekOfYear(DateTime.Parse(this.week).AddDays(-7.0)), "周与第", this.WeekOfYear(DateTime.Parse(this.week)), "周的会员消费金额统计分析图" });
            ChartServices.SetChartTitle(this.WebChartControl1, true, ttt, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            if (this.types == ViewType.Bar)
            {
                ChartServices.DrawChart(this.WebChartControl1, "会员卡", this.types, this.load(), "类型", "会员卡");
                ChartServices.DrawChart(this.WebChartControl1, "临时卡", this.types, this.load(), "类型", "临时卡");
                ChartServices.DrawChart(this.WebChartControl1, "散客卡", this.types, this.load(), "类型", "散客卡");
            }
            else
            {
                ChartServices.DrawChart(this.WebChartControl1, "上周", this.types, this.loadz(), "CardType", "上周");
                ChartServices.DrawChart(this.WebChartControl1, "本周", this.types, this.loadz(), "CardType", "本周");
            }
        }

        public DataTable load()
        {
            string sql = "select CardType,sum(case datediff(week,Addtime,'" + this.week + "') when 0 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '本周',sum(case DATEDIFF(week,Addtime,'" + this.week + "') when 1 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '上周' from Consumption_Back_select group by CardType ";
            DataTable dt = this.bc.ReadTable(sql);
            DataTable dtz = new DataTable();
            dtz.Columns.Add("类型", typeof(string));
            dtz.Columns.Add("会员卡", typeof(decimal));
            dtz.Columns.Add("临时卡", typeof(decimal));
            dtz.Columns.Add("散客卡", typeof(decimal));
            if (dt.Rows.Count == 0)
            {
                dtz.Rows.Add(new object[] { dt.Columns[2].ColumnName, "0", "0", "0" });
                dtz.Rows.Add(new object[] { dt.Columns[1].ColumnName, "0", "0", "0" });
                return dtz;
            }
            if (dt.Rows.Count == 1)
            {
                dtz.Rows.Add(new object[] { dt.Columns[2].ColumnName, dt.Rows[0][2].ToString(), "0", "0" });
                dtz.Rows.Add(new object[] { dt.Columns[1].ColumnName, dt.Rows[0][1].ToString(), "0", "0" });
                return dtz;
            }
            if (dt.Rows.Count == 2)
            {
                dtz.Rows.Add(new object[] { dt.Columns[2].ColumnName, dt.Rows[0][2].ToString(), dt.Rows[1][2].ToString(), "0" });
                dtz.Rows.Add(new object[] { dt.Columns[1].ColumnName, dt.Rows[0][1].ToString(), dt.Rows[1][1].ToString(), "0" });
                return dtz;
            }
            dtz.Rows.Add(new object[] { dt.Columns[2].ColumnName, dt.Rows[0][2].ToString(), dt.Rows[1][2].ToString(), dt.Rows[2][2].ToString() });
            dtz.Rows.Add(new object[] { dt.Columns[1].ColumnName, dt.Rows[0][1].ToString(), dt.Rows[1][1].ToString(), dt.Rows[2][1].ToString() });
            return dtz;
        }

        public DataTable loadz()
        {
            string sql = "select CardType,sum(case datediff(week,Addtime,'" + this.week + "') when 0 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '本周',sum(case DATEDIFF(week,Addtime,'" + this.week + "') when 1 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '上周' from Consumption_Back_select group by CardType ";
            return this.bc.ReadTable(sql);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                try
                {
                    this.week = DateTime.Parse(base.Request.QueryString["week"].ToString()).ToString("yyyy-MM-dd");
                    if (base.Server.UrlDecode(base.Request.QueryString["type"].ToString()) == "树状图")
                    {
                        this.types = ViewType.Bar;
                    }
                    else
                    {
                        this.types = ViewType.Pie;
                    }
                }
                catch
                {
                }
                this.DrawPie();
            }
        }

        public int WeekOfYear(DateTime day)
        {
            int k = Convert.ToInt32(DateTime.Parse(day.Year.ToString() + "-01-01").DayOfWeek);
            if (k == 0)
            {
                k = 7;
            }
            int l = Convert.ToInt32(day.DayOfYear) - ((7 - k) + 1);
            if (l <= 0)
            {
                return 1;
            }
            if ((l % 7) == 0)
            {
                return ((l / 7) + 1);
            }
            return ((l / 7) + 2);
        }
    }


