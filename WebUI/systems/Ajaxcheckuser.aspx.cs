
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxcheckuser : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select aId from admininfo where aUsername ='" + base.Server.UrlDecode(base.Request.QueryString["auser"].ToString()) + "'";
                if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                {
                    base.Response.Write("false");
                }
                else
                {
                    base.Response.Write("true");
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


