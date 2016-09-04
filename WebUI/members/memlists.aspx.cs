
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  memlists : Page
    {
        private BaseClass bc = new BaseClass();
        public string sname = "";
        public string strc = "";
        public string userjiao = "";

        public void loadc()
        {
            StringBuilder st = new StringBuilder();
            st.Append("<ul id=\"tree2\"> <li><span><a onclick=\"alll();\">所有类别</a> </span><ul>");
            string sqlc = "select * from memberlevel ";
            DataTable dt = this.bc.ReadTable(sqlc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st.Append(string.Concat(new object[] { "<li><span><a href=\"#\"  id=\"A", i, "\" onclick=\"selectt('", dt.Rows[i]["lNum"].ToString(), "','", dt.Rows[i]["lName"].ToString(), "')\">", dt.Rows[i]["lName"].ToString(), "</a></span></li>" }));
            }
            st.Append("</ul></li></ul>");
            this.strc = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.sname = PublicMethod.GetSessionValue("shopname").ToString();
            this.right();
            this.loadc();
        }

        public void right()
        {
            string sqlf = "select rRightbtn from roles where rNum ='" + PublicMethod.GetSessionValue("userjiao") + "'";
            DataTable dtf = this.bc.ReadTable(sqlf);
            this.userjiao = dtf.Rows[0]["rRightbtn"].ToString();
        }
    }


