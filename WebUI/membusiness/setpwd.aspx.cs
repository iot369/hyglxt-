
    using DBUtility;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  setpwd : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string sqladd = "update  membersinfo set mPwd='" + DESEncrypt.Encrypt(this.txtPasswords.Value) + "' where mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                this.bc.execsql(sqladd);
            }
            catch
            {
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtnum.Value = base.Request.QueryString["mnum"].ToString();
        }
    }


