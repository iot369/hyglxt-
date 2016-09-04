
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  Pay : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.CardId.Value = base.Request.QueryString["CardId"];
                this.XFId.Value = base.Request.QueryString["XFId"];
                this.getZK.Value = base.Request.QueryString["Discount"];
                this.HidJifen.Value = base.Request.QueryString["HidJifen"];
                this.PayMoney.Value = base.Request.QueryString["PayMoney"];
            }
        }
    }


