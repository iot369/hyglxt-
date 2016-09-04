
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  consumeview : Page
    {
        private BaseClass bc = new BaseClass();
        public DataTable dt;


        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqlup = "update  consumes  set cNum='" + this.txtnum.Value + "',cName='" + this.txtname.Value + "',cPrice='" + this.txtprice.Value + "',cTnum='" + this.ddltype.SelectedValue + "',cIfbargain='" + this.ddlcIfbargain.SelectedValue + "',cBargain='" + this.txtBargain.Value + "',cJifen='" + this.ddljifen.SelectedValue + "',cDiscount='" + this.ddlcDiscount.SelectedValue + "',cIfshow='" + this.ddlIfshow.SelectedValue + "',cRemark='" + this.txtremark.Text + "',cInprice='" + this.txtinprice.Value + "',cCount='" + this.txtcount.Value + "' where cNum = '" + base.Request.QueryString["cnum"].ToString() + "'";
            this.bc.execsql(sqlup);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('保存成功！');</script>");
        }

        public void load()
        {
            string sqlf = "select * from consumes where cNum = '" + base.Request.QueryString["cnum"].ToString() + "'";
            this.dt = this.bc.ReadTable(sqlf);
            if (this.dt.Rows.Count > 0)
            {
                this.txtnum.Value = this.dt.Rows[0]["cNum"].ToString();
                this.txtname.Value = this.dt.Rows[0]["cName"].ToString();
                this.txtprice.Value = this.dt.Rows[0]["cPrice"].ToString();
                this.ddltype.SelectedValue = this.dt.Rows[0]["cTnum"].ToString();
                this.ddlcIfbargain.SelectedValue = this.dt.Rows[0]["cIfbargain"].ToString();
                this.txtBargain.Value = this.dt.Rows[0]["cBargain"].ToString();
                this.ddljifen.SelectedValue = this.dt.Rows[0]["cJifen"].ToString();
                this.ddlcDiscount.SelectedValue = this.dt.Rows[0]["cDiscount"].ToString();
                this.ddlIfshow.SelectedValue = this.dt.Rows[0]["cIfshow"].ToString();
                this.txtremark.Text = this.dt.Rows[0]["cRemark"].ToString();
                this.txtinprice.Value = this.dt.Rows[0]["cInprice"].ToString();
                this.txtcount.Value = this.dt.Rows[0]["cCount"].ToString();
            }
        }

        public void loadlevel()
        {
            this.ddltype.Items.Clear();
            this.ddltype.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from consumetype";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddltype.Items.Add(new ListItem(dtj.Rows[i]["tName"].ToString(), dtj.Rows[i]["tNum"].ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadlevel();
                this.load();
            }
        }
    }


