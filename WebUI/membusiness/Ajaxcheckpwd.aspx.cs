
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxcheckpwd : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            string pwd = base.Request.QueryString["pwd"].ToString();
            string mnum = base.Request.QueryString["mnum"].ToString();
            string sqlf = "select mId from membersinfo where mPwd='" + DESEncrypt.Encrypt(pwd) + "' and mNum='" + mnum + "'";
            if (this.bc.ReadTable(sqlf).Rows.Count > 0)
            {
                base.Response.Write("true");
            }
            else
            {
                base.Response.Write("false");
            }
        }
    }


