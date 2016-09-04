
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxdel : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqldel = ("delete from inventorylist where lyNum = '" + base.Request.QueryString["num"].ToString() + "' ") + "delete from inventory where yNum = '" + base.Request.QueryString["num"].ToString() + "'";
                this.bc.execsql(sqldel);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


