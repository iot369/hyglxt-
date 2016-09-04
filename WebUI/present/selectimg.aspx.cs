
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;

    public partial class  selectimg : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select Imgs from presentimg where gNum='" + base.Request.QueryString["gnum"].ToString() + "' ";
            DataTable dt = this.bc.ReadTable(sql);
            if (dt.Rows.Count > 0)
            {
                base.Response.Write(dt.Rows[0]["Imgs"].ToString());
            }
        }
    }


