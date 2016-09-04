
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  adminadd : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqladd = "insert into admininfo(aNum,aName,aSex,aPhone,aUsername,aPwd,aDnum,aRnum,aSnum,aIfuser,aDate) values";
            string name1 = sqladd;
            sqladd = name1 + "('" + this.txtnum.Value + "','" + this.txtname.Value + "','" + this.ddlsex.Text + "','" + this.txtphone.Value + "','" + this.txtusername.Value + "','" + DESEncrypt.Encrypt(this.txtPasswords.Value) + "','001','" + this.ddlrole.SelectedValue + "','" + this.ddlshop.SelectedValue + "','" + this.ddlifuser.SelectedValue + "','" + DateTime.Now.ToString() + "')";
            this.bc.execsql(sqladd);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('添加成功！');</script>");
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
            }
        }
    }


