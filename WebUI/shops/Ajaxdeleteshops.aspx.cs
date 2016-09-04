
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxdeleteshops : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqldel = "delete from shops where sNum = '" + base.Request.QueryString["snum"].ToString() + "'";
                this.bc.execsql(sqldel);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


