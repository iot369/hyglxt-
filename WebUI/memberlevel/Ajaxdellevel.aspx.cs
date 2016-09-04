
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxdellevel : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string lnum = base.Request.QueryString["lNum"].ToString();
                string sqlf = "select mId from membersinfo where mLevel='" + lnum + "'";
                if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                {
                    base.Response.Write("No");
                }
                else
                {
                    string sqldel = "delete from memberlevel where lNum = '" + lnum + "'";
                    this.bc.execsql(sqldel);
                    base.Response.Write("true");
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


