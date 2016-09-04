
    using DBUtility;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  Ajaxdeladmin : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqldel = "delete from admininfo where aNum = '" + base.Request.QueryString["anum"].ToString() + "'";
                this.bc.execsql(sqldel);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


