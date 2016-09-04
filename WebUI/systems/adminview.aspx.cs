
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  adminview : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqladd = "update  admininfo set aNum='" + this.txtnum.Value + "',aName='" + this.txtname.Value + "',aSex='" + this.ddlsex.Text + "',aPhone='" + this.txtphone.Value + "',aUsername='" + this.txtusername.Value + "',aRnum='" + this.ddlrole.SelectedValue + "',aSnum='" + this.ddlshop.SelectedValue + "',aIfuser='" + this.ddlifuser.SelectedValue + "' where aNum='" + base.Request.QueryString["anum"].ToString() + "'";
            this.bc.execsql(sqladd);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('保存成功！');</script>");
        }

        public void loadadmin()
        {
            string sql = "select * from admininfo where aNum = '" + base.Request.QueryString["anum"].ToString() + "'";
            DataTable dt = this.bc.ReadTable(sql);
            if (dt.Rows.Count > 0)
            {
                this.txtnum.Value = dt.Rows[0]["aNum"].ToString();
                this.txtname.Value = dt.Rows[0]["aName"].ToString();
                this.txtusername.Value = dt.Rows[0]["aUsername"].ToString();
                this.ddlrole.SelectedValue = dt.Rows[0]["aRnum"].ToString();
                this.ddlsex.Text = dt.Rows[0]["aSex"].ToString();
                this.txtphone.Value = dt.Rows[0]["aPhone"].ToString();
                this.ddlshop.SelectedValue = dt.Rows[0]["aSnum"].ToString();
                this.ddldepartment.SelectedValue = dt.Rows[0]["aDnum"].ToString();
                this.ddlifuser.SelectedValue = dt.Rows[0]["aIfuser"].ToString();
            }
        }

        public void loadrole()
        {
            this.ddlrole.Items.Clear();
            this.ddlrole.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from roles";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddlrole.Items.Add(new ListItem(dtj.Rows[i]["rName"].ToString(), dtj.Rows[i]["rNum"].ToString()));
            }
        }

        public void loadshop()
        {
            this.ddlshop.Items.Clear();
            this.ddlshop.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from shops";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddlshop.Items.Add(new ListItem(dtj.Rows[i]["sName"].ToString(), dtj.Rows[i]["sNum"].ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadrole();
                this.loadshop();
                this.loadadmin();
            }
        }
    }


