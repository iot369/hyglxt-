
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxprintadd : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string ff = base.Server.UrlDecode(base.Request.QueryString["fast"].ToString());
                string sqlup = "update shops set sPrint='" + ff + "'  where sNum ='" + PublicMethod.GetSessionValue("shopnum") + "'";
                this.bc.execsql(sqlup);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


