
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class Ajaxkouci : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string detail = base.Request.QueryString["detail"].ToString();
                string[] de = detail.Substring(0, detail.Length - 1).Split(new char[] { '|' });
                for (int i = 0; i < de.Length; i++)
                {
                    string[] dde = de[i].Split(new char[] { '#' });
                    string sqlup = "update conscishu set uCount=uCount-" + dde[1] + ",uXiao=uXiao+" + dde[1] + " where uId='" + dde[0] + "' ";
                    this.bc.execsql(sqlup);
                }
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


