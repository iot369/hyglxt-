
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;

    public partial class  Ajaxload : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select sCommission from shops where sNum = '" + PublicMethod.GetSessionValue("shopnum") + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(dt.Rows[0][0].ToString());
                }
                else
                {
                    base.Response.Write("false");
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


