
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  index : Page
    {
        private BaseClass bc = new BaseClass();
        public string htm = "";
        public string menuhtml = "";

        public void laddfast()
        {
            string sqlff = "select aFast from admininfo where aNum ='" + PublicMethod.GetSessionValue("nums") + "'";
            string fast = this.bc.ReadTable(sqlff).Rows[0]["aFast"].ToString();
            string sqlone = "select tNum,tName,tSrc,tHeight,tWidth,tImg  from menutwo where charindex(tNum,'" + fast + "')>0  order by tNum ASC";
            DataTable dt = this.bc.ReadTable(sqlone);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string name1 = this.htm;
                this.htm = name1 + "{ h: " + dt.Rows[i]["tHeight"].ToString() + ",w: " + dt.Rows[i]["tWidth"].ToString() + ",icon: '" + dt.Rows[i]["tImg"].ToString() + "', title: '" + dt.Rows[i]["tName"].ToString() + "', url: '" + dt.Rows[i]["tSrc"].ToString() + "' },";
            }
            if (this.htm.Length > 0)
            {
                this.htm = this.htm.Substring(0, this.htm.Length - 1);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.Session["username"] = null;
            this.Session["shopnum"] = null;
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script>var manager = $.ligerDialog.waitting('正在退出系统,请稍候...');setTimeout(function (){ ll(); }, 1000);;</script>");
        }

        public void loadmenu()
        {
            string sqlf = "select rRightbtn, rRightone,rRight from roles where rNum ='" + PublicMethod.GetSessionValue("userjiao") + "'";
            DataTable dtf = this.bc.ReadTable(sqlf);
            StringBuilder st = new StringBuilder();
            string sqlone = "select oName,oNum from menuone  where  charindex(oNum,'" + dtf.Rows[0]["rRightone"].ToString() + "')>0  order by oNum ASC";
            DataTable dtone = this.bc.ReadTable(sqlone);
            for (int i = 0; i < dtone.Rows.Count; i++)
            {
                st.Append(" <li><a style=\"cursor: pointer;\">◆" + dtone.Rows[i]["oName"].ToString() + "</a><ul>");
                DataTable dttwo = this.bc.ReadTable("select tNum,tName,tSrc,tHeight,tWidth,tImg  from menutwo  where len(tNum)=4 and left(tNum,2)='" + dtone.Rows[i]["oNum"].ToString() + "'and charindex(tNum,'" + dtf.Rows[0]["rRight"].ToString() + "')>0  ORDER BY tNum ASC");
                if (dttwo.Rows.Count > 0)
                {
                    for (int j = 0; j < dttwo.Rows.Count; j++)
                    {
                        st.Append("<li><a style=\"cursor: pointer;\" onclick=\"f_open('" + dttwo.Rows[j]["tSrc"].ToString() + "', '" + dttwo.Rows[j]["tName"].ToString() + "',  '" + dttwo.Rows[j]["tImg"].ToString() + "', '" + dttwo.Rows[j]["tWidth"].ToString() + "', '" + dttwo.Rows[j]["tHeight"].ToString() + "')\">" + dttwo.Rows[j]["tName"].ToString() + "</a></li>");
                    }
                }
                st.Append("</ul></li>");
            }
            this.menuhtml = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((PublicMethod.GetSessionValue("names") == "") || (PublicMethod.GetSessionValue("names") == "NoLogin"))
            {
                base.Response.Redirect("../index.aspx");
            }
            this.loadmenu();
            this.laddfast();
            this.Label1.Text = PublicMethod.GetSessionValue("names");
        }
    }


