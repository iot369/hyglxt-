
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxfast : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string fast = base.Server.UrlDecode(base.Request.QueryString["fast"].ToString());
                string sqlf = "update admininfo set aFast ='" + fast + "' where aNum ='" + PublicMethod.GetSessionValue("nums") + "'";
                this.bc.execsql(sqlf);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


