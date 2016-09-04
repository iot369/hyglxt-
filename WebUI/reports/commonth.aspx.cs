
    using DBUtility;
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  commonth : Page
    {
        private BaseClass bc = new BaseClass();
        private ViewType types = ViewType.Bar;
        public string years = DateTime.Now.ToString("yyyy");

        private void DrawPie()
        {
            string title = this.years + "年-每月会员充值金额统计分析图";
            ChartServices.SetChartTitle(this.WebChartControl1, true, title, StringAlignment.Center, ChartTitleDockStyle.Top, true, new Font("宋体", 12f, FontStyle.Bold), Color.Red, 10);
            ChartServices.DrawChart(this.WebChartControl1, "充值金额", this.types, this.load(), "month", "money");
        }

        public DataTable load()
        {
            int i;
            string sql = "select sum(case month(Addtime) when 1 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '1月',";
            sql = ((((((sql + " sum(case month(Addtime) when 2 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '2月',") + " sum(case month(Addtime) when 3 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '3月'," + "sum(case month(Addtime) when 4 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '4月',") + "sum(case month(Addtime) when 5 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '5月'," + "sum(case month(Addtime) when 6 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '6月',") + " sum(case month(Addtime) when 7 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '7月'," + "sum(case month(Addtime) when 8 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '8月',") + " sum(case month(Addtime) when 9 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '9月'," + " sum(case month(Addtime) when 10 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '10月',") + " sum(case month(Addtime) when 11 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '11月'," + " sum(case month(Addtime) when 12 then CONVERT(decimal(18, 2),[money]) else 0.00 end) as '12月'") + " from Consumption_Back_select where DATEPART(yyyy,Addtime)='" + this.years + "' ";
            DataTable dt = this.bc.ReadTable(sql);
            DataTable dtz = new DataTable();
            dtz.Columns.Add("month", typeof(string));
            dtz.Columns.Add("money", typeof(decimal));
            if (dt.Rows[0]["1月"].ToString() != "")
            {
                for (i = 0; i < 12; i++)
                {
                    dtz.Rows.Add(new object[] { dt.Columns[i].ColumnName, dt.Rows[0][dt.Columns[i].ColumnName].ToString() });
                }
                return dtz;
            }
            for (i = 0; i < 12; i++)
            {
                dtz.Rows.Add(new object[] { dt.Columns[i].ColumnName, 0 });
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


