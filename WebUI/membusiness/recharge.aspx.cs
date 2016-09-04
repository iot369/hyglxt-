
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  recharge : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string mnum = base.Request.QueryString["mnum"].ToString();
                this.txtmNum.Value = mnum;
                base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script>  readmems();</script>");
            }
            catch
            {
            }
        }
    }


