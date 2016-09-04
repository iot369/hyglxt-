
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  levellist : Page
    {

        private BaseClass bc = new BaseClass();
        public string daten = "";
        public string strc = "";


        protected void Button1_Click(object sender, EventArgs e)
        {
            this.loadc();
        }

        public void loadc()
        {
            StringBuilder st = new StringBuilder();
            st.Append("<ul id=\"tree2\"> <li><span><a onclick=\"alll();\">所有等级</a> </span><ul  id=\"ttrree\">");
            string sqlc = "select * from memberlevel ";
            DataTable dt = this.bc.ReadTable(sqlc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st.Append("<li id=\"l" + dt.Rows[i]["lNum"].ToString() + "\"><span><a onclick=\"selectt('" + dt.Rows[i]["lNum"].ToString() + "')\" id=\"" + dt.Rows[i]["lNum"].ToString() + "\" >" + dt.Rows[i]["lName"].ToString() + "</a></span></li>");
            }
            st.Append("</ul></li></ul>");
            this.strc = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadc();
                this.daten = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
            }
        }
    }


