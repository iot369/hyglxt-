
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxset : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string xuhao = base.Server.UrlDecode(base.Request.QueryString["xuhao"].ToString());
                string sqlup = "update Tuijian set tTui='" + xuhao + "' where tType ='积分'";
                this.bc.execsql(sqlup);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


