
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  memberarea : Page
    {
        private BaseClass bc = new BaseClass();
        public string cmbArea = "全部";
        public string cmbCity = "";
        public string cmbProvince = "";


        private void DrawPie()
        {
            string title = "区域会员统计树形图";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "人数", ViewType.Bar, this.load(), "mTown", "cout");
        }

        public DataTable load()
        {
            string sqll = "select mTown,count(*) as cout from membersinfo where 1=1 ";
            if (this.cmbProvince != "")
            {
                sqll = sqll + "and  charindex('" + this.cmbProvince + "', mProvince)>0";
            }
            if (this.cmbCity != "")
            {
                sqll = sqll + "and  charindex('" + this.cmbCity + "',mCity)>0";
            }
            if (this.cmbArea != "全部")
            {
                sqll = sqll + "and  charindex('" + this.cmbArea + "', mTown)>0";
            }
            sqll = sqll + "group by mTown";
            return this.bc.ReadTable(sqll);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                try
                {
                    this.cmbProvince = base.Server.UrlDecode(base.Request.QueryString["cmbProvince"].ToString());
                    this.cmbCity = base.Server.UrlDecode(base.Request.QueryString["cmbCity"].ToString());
                    this.cmbArea = base.Server.UrlDecode(base.Request.QueryString["cmbArea"].ToString());
                }
                catch
                {
                }
                this.DrawPie();
            }
        }
    }


