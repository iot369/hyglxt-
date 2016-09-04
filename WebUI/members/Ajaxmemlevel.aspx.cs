
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxmemlevel : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder st = new StringBuilder();
            st.Append("<ul id=\"tree2\"> <li><span><a onclick=\"ll();\">会员类别</a> </span><ul>");
            string sqlc = "select * from memberlevel ";
            DataTable dt = this.bc.ReadTable(sqlc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st.Append(string.Concat(new object[] { "<li><span><a href=\"#\"  id=\"A", i, "\" onclick=\"selectt('", dt.Rows[i]["lNum"].ToString(), "')\">", dt.Rows[i]["lName"].ToString(), "</a></span></li>" }));
            }
            st.Append("</ul></li></ul>");
            base.Response.Write(st.ToString());
        }
    }


