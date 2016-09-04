
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  rolesadd : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string tname = base.Server.UrlDecode(base.Request.QueryString["tname"].ToString());
                string remark = base.Server.UrlDecode(base.Request.QueryString["remark"].ToString());
                string twostr = base.Server.UrlDecode(base.Request.QueryString["twostr"].ToString());
                string threestr = base.Server.UrlDecode(base.Request.QueryString["threestr"].ToString());
                string onestr = base.Server.UrlDecode(base.Request.QueryString["onestr"].ToString());
                string strnum = "R" + DateTime.Now.ToString("yyMMddHHmmss");
                string sqladd = "insert into roles(rNum,rName,rRight,rRightbtn,rRemark,rRightone)";
                string name3 = sqladd;
                sqladd = name3 + "values('" + strnum + "','" + tname + "','" + twostr + "','" + threestr + "','" + remark + "','" + onestr + "')";
                this.bc.execsql(sqladd);
                base.Response.Write(strnum);
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


