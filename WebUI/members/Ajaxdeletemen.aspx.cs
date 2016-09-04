
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  Ajaxdeletemen : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string ccid = "M100000000";
                string name1 = "delete from membersinfo where mNum = '" + base.Request.QueryString["mnum"].ToString() + "'";
                name1 = name1 + "update Consumption_Back_select set Card_Id = '" + ccid + "' where Card_Id='" + base.Request.QueryString["mnum"].ToString() + "' ";
                name1 = name1 + "update Consumption_Back set Card_Id = '" + ccid + "' where Card_Id='" + base.Request.QueryString["mnum"].ToString() + "'";
                name1 = name1 + "update memberchong set cmNum = '" + ccid + "' where cmNum='" + base.Request.QueryString["mnum"].ToString() + "' ";
                name1 = name1 + "update prsentchange set cMnum = '" + ccid + "' where cMnum='" + base.Request.QueryString["mnum"].ToString() + "' ";
                string sqldel = name1 + "update conscishu set uMnum = '" + ccid + "' where uMnum='" + base.Request.QueryString["mnum"].ToString() + "' ";
                this.bc.execsql(sqldel);
                base.Response.Write("true");
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


