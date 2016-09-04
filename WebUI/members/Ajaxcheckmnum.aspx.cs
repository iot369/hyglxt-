
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxcheckmnum : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select mId,mNum from membersinfo where mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                {
                    base.Response.Write("false");
                }
                else
                {
                    string sqlff = "select mId,mNum from membersinfo where mMobile ='" + base.Request.QueryString["mnum"].ToString() + "'";
                    if (this.bc.ReadTable(sqlff).Rows.Count > 0)
                    {
                        base.Response.Write("false");
                    }
                    else
                    {
                        base.Response.Write("true");
                    }
                }
            }
            catch
            {
                base.Response.Write("true");
            }
        }
    }


