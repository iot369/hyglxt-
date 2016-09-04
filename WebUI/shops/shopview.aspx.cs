
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  shopview : Page
    {
        private BaseClass bc = new BaseClass();
        public DataTable dt;


        protected void Button2_Click(object sender, EventArgs e)
        {
		this.load();
            string[] addre = this.txtadd.Value.Split(new char[] { ',' });
            string sqlup = "update  shops  set sName='" + this.txtname.Value + "',sContact='" + this.txtcontact.Value + "',sMobile='" + this.txtmobile.Value + "',sProvince='" + addre[0] + "',sCity='" + addre[1] + "',sTown='" + addre[2] + "',sAddress='" + this.txtaddress.Value + "',stNum='" + this.ddltype.SelectedValue + "' where sNum = '" + base.Request.QueryString["snum"].ToString() + "'";
            this.bc.execsql(sqlup);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('保存成功！');window.close();</script>");
        }

        public void load()
        {
            string sqlf = "select * from shops where sNum = '" + base.Request.QueryString["snum"].ToString() + "'";
            this.dt = this.bc.ReadTable(sqlf);
            if (this.dt.Rows.Count > 0)
            {
                this.txtname.Value = this.dt.Rows[0]["sName"].ToString();
                this.txtcontact.Value = this.dt.Rows[0]["sContact"].ToString();
                this.txtmobile.Value = this.dt.Rows[0]["sMobile"].ToString();
                this.ddltype.SelectedValue = this.dt.Rows[0]["stNum"].ToString();
                this.txtaddress.Value = this.dt.Rows[0]["sAddress"].ToString();
            }
        }

        public void loadlevel()
        {
            this.ddltype.Items.Clear();
            this.ddltype.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from shopstype";
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


