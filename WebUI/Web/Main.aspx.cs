
    using System;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  Main : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["Webnames"] == null)
            {
                base.Response.Redirect("Login.aspx");
            }
        }
    }


