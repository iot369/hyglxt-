
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  comdian : Page
    {
        private BaseClass bc = new BaseClass();
        private ViewType types = ViewType.Bar;


        private void DrawPie()
        {
            string title = "店铺消费金额统计表";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "消费金额", this.types, this.load(), "sName", "mony");
        }

        public DataTable load()
        {
            string sql = "select sName,sum(CONVERT(decimal(18, 2),[money])) as mony from shops,Consumption_Back_select where Consumption_Back_select.ShopId=shops.sNum ";
            sql = sql + "group by sName";
            return this.bc.ReadTable(sql);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                if (base.Server.UrlDecode(base.Request.QueryString["type"].ToString()) == "树状图")
                {
                    this.types = ViewType.Bar;
                }
                else
                {
                    this.types = ViewType.Line;
                }
                this.DrawPie();
            }
        }
    }


