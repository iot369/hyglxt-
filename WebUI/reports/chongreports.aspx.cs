
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  chongreports : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.txtSendTimeMIN.Value = DateTime.Now.ToString("yyyy-MM-dd");
                this.ddlyear.Text = DateTime.Now.ToString("yyyy");
            }
        }
    }


