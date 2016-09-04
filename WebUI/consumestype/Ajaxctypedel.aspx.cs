
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxctypedel : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string tnum = base.Request.QueryString["tNum"].ToString();
                string sqlf = "select cId from consumes where cTnum='" + tnum + "'";
                if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                {
                    base.Response.Write("No");
                }
                else
                {
                    string sqldel = "delete from consumetype where tNum = '" + tnum + "'";
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


