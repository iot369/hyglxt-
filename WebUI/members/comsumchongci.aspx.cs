
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  comsumchongci : Page
    {
        public string cid = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            this.cid = base.Request.QueryString["cid"].ToString();
        }
    }


