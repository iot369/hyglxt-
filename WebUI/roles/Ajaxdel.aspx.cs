
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxdel : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string tnum = base.Request.QueryString["tNum"].ToString();
                string sqlff = "select rNum  from roles where rNum='" + tnum + "'";
                if (this.bc.ReadTable(sqlff).Rows[0]["rNum"].ToString() == "10000")
                {
                    base.Response.Write("NN");
                }
                else
                {
                    string sqlf = "select aId from admininfo where aRnum='" + tnum + "'";
                    if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                    {
                        base.Response.Write("No");
                    }
                    else
                    {
                        string sqldel = "delete from roles where rNum = '" + tnum + "'";
                        this.bc.execsql(sqldel);
                        base.Response.Write("true");
                    }
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


