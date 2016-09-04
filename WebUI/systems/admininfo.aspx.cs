
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class  admininfo : Page
    {
        private BaseClass bc = new BaseClass();
        public string strc = "";


        public void loadc()
        {
            StringBuilder st = new StringBuilder();
            st.Append("<ul id=\"tree2\"> <li><span><a onclick=\"alll();\">所有角色权限</a> </span><ul>");
            string sqlc = "select * from roles ";
            DataTable dt = this.bc.ReadTable(sqlc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st.Append(string.Concat(new object[] { "<li><span><a href=\"#\"  id=\"A", i, "\" onclick=\"selectt('", dt.Rows[i]["rNum"].ToString(), "','", dt.Rows[i]["rName"].ToString(), "')\">", dt.Rows[i]["rName"].ToString(), "</a></span></li>" }));
            }
            st.Append("</ul></li></ul>");
            this.strc = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadc();
        }
    }


