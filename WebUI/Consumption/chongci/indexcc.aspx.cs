
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class indexcc : Page
    {
        private BaseClass bc = new BaseClass();
        public string datenow = "";
        public string liushui = "";
        public string priint = "";
        public string riqi = "";
        public string shouyin = "";
        public string strc = "";


        public void loadc()
        {
            StringBuilder st = new StringBuilder();
            DataTable dtCt = this.bc.ReadTable("select tNum,tName from consumetype");
            st.Append("<ul id=\"tree2\"> ");
            for (int x = 0; x < dtCt.Rows.Count; x++)
            {
                st.Append("<li><span><a>" + dtCt.Rows[x]["tName"].ToString() + "</a> </span><ul>");
                string sqlc = "select cId,cNum,cName,cPrice from consumes where cTnum='" + dtCt.Rows[x]["tNum"].ToString() + "'";
                DataTable dt = this.bc.ReadTable(sqlc);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    st.Append(string.Concat(new object[] { "<li><span><a href=\"#\"  id=\"A", i, "\" onclick=\"add1('", dt.Rows[i]["cId"].ToString(), "','", dt.Rows[i]["cName"].ToString(), "','", dt.Rows[i]["cPrice"].ToString(), "','", dt.Rows[i]["cNum"].ToString(), "')\">", dt.Rows[i]["cName"].ToString(), "(", dt.Rows[i]["cPrice"].ToString(), "元)</a></span></li>" }));
                }
                st.Append("</ul></li>");
            }
            st.Append("</ul>");
            this.strc = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadc();
            this.liushui = base.Request.QueryString["CardId"] + DateTime.Now.ToString("yyyyMMddHHmmssffff");
            this.shouyin = PublicMethod.GetSessionValue("names");
            this.riqi = DateTime.Now.ToString("yyyyMMdd HH:mm");
            string sqls = "select sPrint from shops where sNum ='" + PublicMethod.GetSessionValue("shopnum") + "'";
            string[] spr = this.bc.ReadTable(sqls).Rows[0]["sPrint"].ToString().Split(new char[] { '|' });
            this.priint = spr[0].ToString();
            this.datenow = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }


