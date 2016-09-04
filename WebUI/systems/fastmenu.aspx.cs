
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  fastmenu : Page
    {
        private BaseClass bc = new BaseClass();
        public string menuhtml = "";


        public void loadmenu()
        {
            string sqlff = "select aFast from admininfo where aNum ='" + PublicMethod.GetSessionValue("nums") + "'";
            string fast = this.bc.ReadTable(sqlff).Rows[0]["aFast"].ToString();
            string sqlf = "select rRightbtn, rRightone,rRight from roles where rNum ='" + PublicMethod.GetSessionValue("userjiao") + "'";
            DataTable dtf = this.bc.ReadTable(sqlf);
            StringBuilder st = new StringBuilder();
            DataTable dttwo = this.bc.ReadTable("select tNum,tName,tSrc,tHeight,tWidth,tImg  from menutwo  where len(tNum)=4 and  charindex(tNum,'" + dtf.Rows[0]["rRight"].ToString() + "')>0  ORDER BY tNum ASC");
            if (dttwo.Rows.Count > 0)
            {
                for (int j = 0; j < dttwo.Rows.Count; j++)
                {
                    string ff = "";
                    if (fast.IndexOf(dttwo.Rows[j]["tNum"].ToString()) >= 0)
                    {
                        ff = "checked=\"checked\"";
                    }
                    st.Append("  <div style=\"width:32%; float:left; text-align:center; margin-top: 3px;\"> <input id=\"two" + dttwo.Rows[j]["tNum"].ToString() + "\"  value=\"" + dttwo.Rows[j]["tNum"].ToString() + "\" name=\"two\" type=\"checkbox\" " + ff + " />" + dttwo.Rows[j]["tName"].ToString() + "</div>");
                }
            }
            this.menuhtml = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadmenu();
        }
    }


