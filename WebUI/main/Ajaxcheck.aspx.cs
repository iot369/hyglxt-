
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxcheck : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strr = PublicMethod.GetSessionValue("nums");
            if ((strr == "") || (strr == "NoLogin"))
            {
                base.Response.Write("false");
            }
            else
            {
                base.Response.Write("true");
            }
        }
    }


