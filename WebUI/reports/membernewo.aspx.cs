
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  membernewo : Page
    {
        private BaseClass bc = new BaseClass();
        public string cmbArea = "全部";
        public string cmbCity = "";
        public string cmbProvince = "";
        public string nowdate = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");


        private void DrawPie()
        {
            string title = "新老会员统计比例饼状图";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "人数", ViewType.Pie, this.llnian(), "type", "cout");
        }

        public DataTable llnian()
        {
            string sql = "select sum(case when DATEDIFF(day,mMakedate,'2013-12-16')>0 then 0 else 1 end) as '新会员',sum(case when DATEDIFF(day,mMakedate,'2013-12-16')<0 then 0 else 1 end) as '老会员' from membersinfo where 1=1  ";
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
            DataTable dt = this.bc.ReadTable(sql);
            DataTable dtz = new DataTable();
            dtz.Columns.Add("type", typeof(string));
            dtz.Columns.Add("cout", typeof(decimal));
            if ((dt.Rows.Count > 0) && (dt.Rows[0][0].ToString() != ""))
            {
                dtz.Rows.Add(new object[] { dt.Columns[0].ColumnName, dt.Rows[0][0].ToString() });
                dtz.Rows.Add(new object[] { dt.Columns[1].ColumnName, dt.Rows[0][1].ToString() });
            }
            return dtz;
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


