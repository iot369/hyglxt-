
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  rolesedit : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string tnum = base.Server.UrlDecode(base.Request.QueryString["tnum"].ToString());
                string tname = base.Server.UrlDecode(base.Request.QueryString["tname"].ToString());
                string remark = base.Server.UrlDecode(base.Request.QueryString["remark"].ToString());
                string twostr = base.Server.UrlDecode(base.Request.QueryString["twostr"].ToString());
                string threestr = base.Server.UrlDecode(base.Request.QueryString["threestr"].ToString());
                string onestr = base.Server.UrlDecode(base.Request.QueryString["onestr"].ToString());
                string sqlup = "update  roles set rName='" + tname + "',rRemark='" + remark + "',rRight='" + twostr + "',rRightbtn='" + threestr + "',rRightone='" + onestr + "' where rNum='" + tnum + "'";
                this.bc.execsql(sqlup);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


