
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxleveladd : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string lname = base.Server.UrlDecode(base.Request.QueryString["lname"].ToString());
                string lDiscount = base.Server.UrlDecode(base.Request.QueryString["lDiscount"].ToString());
                string ljifen = base.Server.UrlDecode(base.Request.QueryString["ljifen"].ToString());
                string lNblance = base.Server.UrlDecode(base.Request.QueryString["lNblance"].ToString());
                string lNjifen = base.Server.UrlDecode(base.Request.QueryString["lNjifen"].ToString());
                string lBuyprice = base.Server.UrlDecode(base.Request.QueryString["lBuyprice"].ToString());
                string lRemark = base.Server.UrlDecode(base.Request.QueryString["lRemark"].ToString());
                string lPasttime = base.Server.UrlDecode(base.Request.QueryString["lPasttime"].ToString());
                string lStates = base.Server.UrlDecode(base.Request.QueryString["lStates"].ToString());
                string strnum = "l" + DateTime.Now.ToString("yyMMddHHmmss");
                string sqladd = "insert into memberlevel(lNum,lname,lDiscount,ljifen,lNblance,lNjifen,lBuyprice,lRemark,lPasttime,lStates)";
                string name3 = sqladd;
                sqladd = name3 + "values('" + strnum + "','" + lname + "','" + lDiscount + "','" + ljifen + "','" + lNblance + "','" + lNjifen + "','" + lBuyprice + "','" + lRemark + "','" + lPasttime + "','" + lStates + "')";
                this.bc.execsql(sqladd);
                base.Response.Write(strnum);
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


