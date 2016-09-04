
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;

    public partial class  Ajaxchecktuijian : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select mId,mNum,mName from membersinfo where mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write("OK&" + dt.Rows[0]["mName"].ToString());
                }
                else
                {
                    string sqlff = "select mId,mNum,mName from membersinfo where mMobile ='" + base.Request.QueryString["mnum"].ToString() + "'";
                    if (this.bc.ReadTable(sqlff).Rows.Count > 0)
                    {
                        base.Response.Write("OK&" + dt.Rows[0]["mName"].ToString());
                    }
                    else
                    {
                        base.Response.Write("NO&NO");
                    }
                }
            }
            catch
            {
                base.Response.Write("NO&NO");
            }
        }
    }


