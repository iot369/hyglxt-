
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxsetsms : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string xuhao = base.Server.UrlDecode(base.Request.QueryString["xuhao"].ToString());
                string pwd = base.Server.UrlDecode(base.Request.QueryString["pwd"].ToString());
                string states = base.Server.UrlDecode(base.Request.QueryString["states"].ToString());
                string contents = base.Server.UrlDecode(base.Request.QueryString["contents"].ToString());
                string sqlup = "update messageset set xuhao='" + xuhao + "',Pwd='" + pwd + "',states='" + states + "', contents='" + contents + "'  where type ='sms'";
                this.bc.execsql(sqlup);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


