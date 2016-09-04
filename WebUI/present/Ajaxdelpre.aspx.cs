
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxdelpre : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqldel = ("delete from present where gNum = '" + base.Request.QueryString["gnum"].ToString() + "' ") + "delete from presentimg where gNum = '" + base.Request.QueryString["gnum"].ToString() + "'";
                this.bc.execsql(sqldel);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


