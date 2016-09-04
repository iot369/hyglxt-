
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
                string sqlf = "select tTui from Tuijian where tType = '积分'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(dt.Rows[0]["tTui"].ToString());
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


