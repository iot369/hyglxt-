
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  memreport : Page
    {


        private void DrawBar()
        {
            ChartServices.SetChartTitle(this.WebChartControl1, true, "2012年12月第1周收入情况", StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "收益", ViewType.Bar, ServiceData.GetWeekMoneyAndCost(), "week", "money");
            ChartServices.DrawChart(this.WebChartControl1, "成本", ViewType.Bar, ServiceData.GetWeekMoneyAndCost(), "week", "cost");
            ChartServices.SetAxisX(this.WebChartControl1, true, StringAlignment.Center, "星期", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
            ChartServices.SetAxisY(this.WebChartControl1, true, StringAlignment.Center, "金额", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
        }

        private void DrawBarAndLine()
        {
            ChartServices.SetChartTitle(this.WebChartControl2, true, "2012年12月第1周收入情况", StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl2, "收益", ViewType.Bar, ServiceData.GetWeekMoneyAndCost(), "week", "money");
            ChartServices.DrawChart(this.WebChartControl2, "成本", ViewType.Bar, ServiceData.GetWeekMoneyAndCost(), "week", "cost");
            ChartServices.SetAxisX(this.WebChartControl2, true, StringAlignment.Center, "星期", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
            ChartServices.SetAxisY(this.WebChartControl2, true, StringAlignment.Center, "金额", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
            ChartServices.SetChartTitle(this.WebChartControl2, false, "2012年12月第1周收入情况", StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl2, "收益", ViewType.Line, ServiceData.GetWeekMoneyAndCost(), "week", "money");
            ChartServices.DrawChart(this.WebChartControl2, "成本", ViewType.Line, ServiceData.GetWeekMoneyAndCost(), "week", "cost");
            ChartServices.SetAxisX(this.WebChartControl2, true, StringAlignment.Center, "星期", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
            ChartServices.SetAxisY(this.WebChartControl2, true, StringAlignment.Center, "金额", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
        }

        private void DrawLine()
        {
            ChartServices.SetChartTitle(this.WebChartControl3, true, "2012年12月第1周收入情况", StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl3, "收益", ViewType.Line, ServiceData.GetWeekMoneyAndCost(), "week", "money");
            ChartServices.DrawChart(this.WebChartControl3, "成本", ViewType.Line, ServiceData.GetWeekMoneyAndCost(), "week", "cost");
            ChartServices.SetAxisX(this.WebChartControl3, true, StringAlignment.Center, "星期", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
            ChartServices.SetAxisY(this.WebChartControl3, true, StringAlignment.Center, "金额", Color.Red, true, new Font("宋体", 12f, FontStyle.Bold));
        }

        private void DrawPie()
        {
            ChartServices.SetChartTitle(this.WebChartControl4, true, "2012年12月第1周收入情况", StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl4, ServiceData.GetWeekMoneyAndCost().Rows[0][0].ToString(), ViewType.Pie, ServiceData.GetWeekMoneyAndCost(), "week", "money");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.DrawBar();
            this.DrawLine();
            this.DrawPie();
            this.DrawBarAndLine();
        }
    }


