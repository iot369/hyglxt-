
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  memberage : Page
    {
        private BaseClass bc = new BaseClass();
        public string cmbArea = "全部";
        public string cmbCity = "";
        public string cmbProvince = "";


        private void DrawPie()
        {
            string title = "年龄段会员统计比例饼状图";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "人数", ViewType.Pie, this.llnian(), "nian", "count");
        }

        public DataTable llnian()
        {
            string sql = "select N'nian'=(case((datediff(year,mBirth,getdate() )-1)/10) when 5 then '50岁以上'   when 4 then '41－50岁'   when 3 then '31－40岁' when 2 then'21－30岁'else '20岁以下'end),   count(*) as count     from membersinfo where 1=1  ";
            if (this.cmbProvince != "")
            {
                sql = sql + "and  charindex('" + this.cmbProvince + "', mProvince)>0";
            }
            if (this.cmbCity != "")
            {
                sql = sql + "and  charindex('" + this.cmbCity + "',mCity)>0";
            }
            if (this.cmbArea != "全部")
            {
                sql = sql + "and  charindex('" + this.cmbArea + "', mTown)>0";
            }
            sql = sql + "group by (case((datediff(year,mBirth,getdate())-1)/10)when 5 then '50岁以上'   when 4 then '41－50岁'   when 3 then '31－40岁' when 2 then'21－30岁'else '20岁以下'end)";
            return this.bc.ReadTable(sql);
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


