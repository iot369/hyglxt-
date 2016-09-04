
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;

    public partial class  Ajaxmnumview : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select mId,mNum from membersinfo where mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write("OK&" + dt.Rows[0]["mNum"].ToString());
                }
                else
                {
                    string sqlff = "select mId,mNum from membersinfo where mMobile ='" + base.Request.QueryString["mnum"].ToString() + "'";
                    DataTable dtf = this.bc.ReadTable(sqlff);
                    if (dtf.Rows.Count > 0)
                    {
                        base.Response.Write("OK&" + dtf.Rows[0]["mNum"].ToString());
                    }
                    else
                    {
                        base.Response.Write("NO&" + base.Request.QueryString["mnum"].ToString());
                    }
                }
            }
            catch
            {
                base.Response.Write("NO&" + base.Request.QueryString["mnum"].ToString());
            }
        }
    }


