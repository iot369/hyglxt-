
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxcheckphone : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select mId from membersinfo where mMoblie='" + base.Request.QueryString["mphone"].ToString() + "'";
                if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                {
                    base.Response.Write("false");
                }
                else
                {
                    base.Response.Write("true");
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


