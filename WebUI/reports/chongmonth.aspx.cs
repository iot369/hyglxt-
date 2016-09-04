
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  chongmonth : Page
    {
        private BaseClass bc = new BaseClass();
        private ViewType types = ViewType.Bar;
        public string years = DateTime.Now.ToString("yyyy");

        private void DrawPie()
        {
            string title = this.years + "年-每月会员充值金额统计分析图";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "充值金额", this.types, this.load(), "month", "money");
            ChartServices.DrawChart(this.WebChartControl1, "赠送金额", this.types, this.load(), "month", "give");
        }

        public DataTable load()
        {
            int i;
            int j;
            string sql = "select sum(case month(cDate) when 1 then cChongMoney else 0.00 end) as '1月',";
            sql = ((((((((((((((sql + " sum(case month(cDate) when 2 then cChongMoney else 0.00 end) as '2月',") + " sum(case month(cDate) when 3 then cChongMoney else 0.00 end) as '3月'," + "sum(case month(cDate) when 4 then cChongMoney else 0.00 end) as '4月',") + "sum(case month(cDate) when 5 then cChongMoney else 0.00 end) as '5月'," + "sum(case month(cDate) when 6 then cChongMoney else 0.00 end) as '6月',") + " sum(case month(cDate) when 7 then cChongMoney else 0.00 end) as '7月'," + "sum(case month(cDate) when 8 then cChongMoney else 0.00 end) as '8月',") + " sum(case month(cDate) when 9 then cChongMoney else 0.00 end) as '9月'," + " sum(case month(cDate) when 10 then cChongMoney else 0.00 end) as '10月',") + " sum(case month(cDate) when 11 then cChongMoney else 0.00 end) as '11月'," + " sum(case month(cDate) when 12 then cChongMoney else 0.00 end) as '12月'") + " from memberchong where DATEPART(yyyy,cDate)='" + this.years + "' ") + " union ") + "select sum(case month(cDate) when 1 then cGive else 0.00 end) as '1月'," + " sum(case month(cDate) when 2 then cGive else 0.00 end) as '2月',") + " sum(case month(cDate) when 3 then cGive else 0.00 end) as '3月'," + "sum(case month(cDate) when 4 then cGive else 0.00 end) as '4月',") + "sum(case month(cDate) when 5 then cGive else 0.00 end) as '5月'," + "sum(case month(cDate) when 6 then cGive else 0.00 end) as '6月',") + " sum(case month(cDate) when 7 then cGive else 0.00 end) as '7月'," + "sum(case month(cDate) when 8 then cGive else 0.00 end) as '8月',") + " sum(case month(cDate) when 9 then cGive else 0.00 end) as '9月'," + " sum(case month(cDate) when 10 then cGive else 0.00 end) as '10月',") + " sum(case month(cDate) when 11 then cGive else 0.00 end) as '11月'," + " sum(case month(cDate) when 12 then cGive else 0.00 end) as '12月'") + " from memberchong where DATEPART(yyyy,cDate)='" + this.years + "' ";
            DataTable dt = this.bc.ReadTable(sql);
            DataTable dtz = new DataTable();
            dtz.Columns.Add("month", typeof(string));
            dtz.Columns.Add("money", typeof(decimal));
            dtz.Columns.Add("give", typeof(decimal));
            if (dt.Rows[0]["1月"].ToString() != "")
            {
                for (i = 0; i < 12; i++)
                {
                    j = i + 1;
                    dtz.Rows.Add(new object[] { j + "月", dt.Rows[1][j + "月"].ToString(), dt.Rows[0][j + "月"].ToString() });
                }
                return dtz;
            }
            for (i = 0; i < 12; i++)
            {
                j = i + 1;
                dtz.Rows.Add(new object[] { j + "月", 0, 0 });
            }
            return dtz;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                try
                {
                    this.years = base.Request.QueryString["year"].ToString();
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


