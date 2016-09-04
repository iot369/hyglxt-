
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxctypeadd : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string tname = base.Server.UrlDecode(base.Request.QueryString["tname"].ToString());
                string remark = base.Server.UrlDecode(base.Request.QueryString["remark"].ToString());
                string shopstr = base.Server.UrlDecode(base.Request.QueryString["shopstr"].ToString());
                string strnum = "l" + DateTime.Now.ToString("yyMMddHHmmss");
                string sqladd = "insert into consumetype(tNum,tName,tRemarks,tsNum)";
                string name3 = sqladd;
                sqladd = name3 + "values('" + strnum + "','" + tname + "','" + remark + "','" + shopstr + "')";
                this.bc.execsql(sqladd);
                base.Response.Write(strnum);
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


