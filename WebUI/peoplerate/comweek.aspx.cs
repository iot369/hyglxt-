
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
            string ttt = string.Concat(new object[] { "第", this.WeekOfYear(DateTime.Parse(this.week).AddDays(-7.0)), "周与第", this.WeekOfYear(DateTime.Parse(this.week)), "周的人流统计分析图-周图表" });
            ChartServices.SetChartTitle(this.WebChartControl1, true, ttt, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "人数", this.types, this.loadz(), "类型", "人数");
        }

        public DataTable loadz()
        {
            string sql = "select count(distinct case DATEDIFF(week,Addtime,'" + this.week + "') when 0 then Card_Id else null end) as '本周', count(distinct case DATEDIFF(week,Addtime,'" + this.week + "') when 1 then Card_Id else null end) as '上周' from Consumption_Back_select where shopId='" + PublicMethod.GetSessionValue("shopnum").ToString() + "'";
            DataTable dt = this.bc.ReadTable(sql);
            DataTable dtz = new DataTable();
            dtz.Columns.Add("类型", typeof(string));
            dtz.Columns.Add("人数", typeof(decimal));
            dtz.Rows.Add(new object[] { dt.Columns[1].ColumnName, dt.Rows[0][1].ToString() });
            dtz.Rows.Add(new object[] { dt.Columns[0].ColumnName, dt.Rows[0][0].ToString() });
            return dtz;
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


