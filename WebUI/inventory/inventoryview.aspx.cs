
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  inventoryview : Page
    {
        private BaseClass bc = new BaseClass();


        public void load()
        {
            string sqlf = "select * from inventory where yNum='" + base.Request.QueryString["num"].ToString() + "'";
            DataTable dt = this.bc.ReadTable(sqlf);
            if (dt.Rows.Count > 0)
            {
                this.lblnum.Text = dt.Rows[0]["yNum"].ToString();
                this.lbldate.Text = DateTime.Parse(dt.Rows[0]["yDate"].ToString()).ToString("yyyy-MM-dd HH:mm");
                this.lblpay.Text = dt.Rows[0]["yPaytype"].ToString();
                this.lblmark.Text = dt.Rows[0]["yMaker"].ToString();
                this.lblremark.Text = dt.Rows[0]["yRemark"].ToString();
                this.lblshop.Text = dt.Rows[0]["yShopnum"].ToString();
            }
            string sql = "select * from inventorylist where lyNum ='" + base.Request.QueryString["num"].ToString() + "'";
            DataTable dts = this.bc.ReadTable(sql);
            this.Repeater1.DataSource = dts;
            this.Repeater1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.load();
            }
        }
    }


