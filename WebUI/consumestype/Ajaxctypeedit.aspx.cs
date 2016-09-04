
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxctypeedit : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string tnum = base.Server.UrlDecode(base.Request.QueryString["tnum"].ToString());
                string tname = base.Server.UrlDecode(base.Request.QueryString["tname"].ToString());
                string remark = base.Server.UrlDecode(base.Request.QueryString["remark"].ToString());
                string shopstr = base.Server.UrlDecode(base.Request.QueryString["shopstr"].ToString());
                string sqlup = "update  consumetype set tName='" + tname + "',tRemarks='" + remark + "',tsNum='" + shopstr + "' where tNum='" + tnum + "'";
                this.bc.execsql(sqlup);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


