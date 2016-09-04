
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  ctypelist : Page
    {

        private BaseClass bc = new BaseClass();
        public string shophtml = "";
        public string strc = "";


        protected void Button1_Click(object sender, EventArgs e)
        {
            this.loadc();
            this.loadshop();
        }

        public void loadc()
        {
            StringBuilder st = new StringBuilder();
            st.Append("<ul id=\"tree2\"> <li><span><a onclick=\"alll();\">所有类别</a> </span><ul  id=\"ttrree\">");
            string sqlc = "select * from consumetype ";
            DataTable dt = this.bc.ReadTable(sqlc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st.Append("<li id=\"l" + dt.Rows[i]["tNum"].ToString() + "\"><span><a onclick=\"selectt('" + dt.Rows[i]["tNum"].ToString() + "')\" id=\"" + dt.Rows[i]["tNum"].ToString() + "\" >" + dt.Rows[i]["tName"].ToString() + "</a></span></li>");
            }
            st.Append("</ul></li></ul>");
            this.strc = st.ToString();
        }

        public void loadshop()
        {
            StringBuilder st = new StringBuilder();
            string sqlf = "select * from shops ";
            DataTable dt = this.bc.ReadTable(sqlf);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    st.Append("<tr><td> <input id=\"" + dt.Rows[i]["sNum"].ToString() + "\" name=\"checkshop\" type=\"checkbox\"  class=\"checkall\"  value=\"" + dt.Rows[i]["sNum"].ToString() + "\"/></td><td style=\"padding-left:2px; text-align:left;\">" + dt.Rows[i]["sName"].ToString() + "</td></tr>");
                }
            }
            this.shophtml = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadc();
                this.loadshop();
            }
        }
    }


