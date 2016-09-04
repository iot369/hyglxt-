
    using DBUtility;
    using System;
    using System.Data;
    using System.Web;
    using System.Web.UI;

    public partial class  Ajaxlogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = PublicMethod.QueryDataset("select * from admininfo where (aUsername='" + base.Request.QueryString["username"] + "' or aNum='" + base.Request.QueryString["username"] + "') and aPwd='" + DESEncrypt.Encrypt(base.Request.QueryString["password"]) + "'").Tables[0];
            if (dt.Rows.Count > 0)
            {
                HttpContext.Current.Session["Webnames"] = dt.Rows[0]["aName"].ToString();
                HttpContext.Current.Session["Webusername"] = dt.Rows[0]["aName"].ToString();
                HttpContext.Current.Session["Webuserjiao"] = dt.Rows[0]["aRnum"].ToString();
                HttpContext.Current.Session["Webshopnum"] = dt.Rows[0]["aSnum"].ToString();
                DataTable dtshop = PublicMethod.QueryDataset("select sName from shops where sNum = '" + dt.Rows[0]["aSnum"].ToString() + "'").Tables[0];
                if (dtshop.Rows.Count > 0)
                {
                    HttpContext.Current.Session["Webshopname"] = dtshop.Rows[0]["sName"].ToString();
                }
                base.Response.Write("true");
            }
            else
            {
                base.Response.Write("false");
            }
        }
    }


