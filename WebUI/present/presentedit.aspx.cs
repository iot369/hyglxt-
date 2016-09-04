
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  presentedit : Page
    {
        private BaseClass bc = new BaseClass();
        public string imgs = "";


        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqladd = "update  present set gNum='" + this.txtnum.Value + "',gName='" + this.txtname.Value + "',gJifen='" + this.txtjifen.Value + "',gState='" + this.ddlifuser.SelectedValue + "',gImg='" + this.hf.Value + "',gCount='" + this.txtcout.Value + "' where gNum='" + base.Request.QueryString["gnum"].ToString() + "'";
            this.bc.execsql(sqladd);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('保存成功！');</script>");
            this.load();
        }

        public void load()
        {
            string sqlf = "select * from present where gNum='" + base.Request.QueryString["gnum"].ToString() + "'";
            DataTable dt = this.bc.ReadTable(sqlf);
            if (dt.Rows.Count > 0)
            {
                this.txtnum.Value = dt.Rows[0]["gNum"].ToString();
                this.txtname.Value = dt.Rows[0]["gName"].ToString();
                this.txtjifen.Value = dt.Rows[0]["gJifen"].ToString();
                this.ddlifuser.SelectedValue = dt.Rows[0]["gState"].ToString();
                this.hf.Value = dt.Rows[0]["gImg"].ToString();
                this.imgs = "pimg/" + dt.Rows[0]["gImg"].ToString();
                this.txtcout.Value = dt.Rows[0]["gCount"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.load();
            }
        }
    }


