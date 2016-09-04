
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  roleslist : Page
    {

        private BaseClass bc = new BaseClass();
        public string strc = "";
        public string treehtml = "";


        protected void Button1_Click(object sender, EventArgs e)
        {
            this.loadc();
        }

        public void loadc()
        {
            StringBuilder st = new StringBuilder();
            st.Append("<ul id=\"tree2\"> <li><span><a onclick=\"alll();\">所有角色</a> </span><ul  id=\"ttrree\">");
            string sqlc = "select * from roles ";
            DataTable dt = this.bc.ReadTable(sqlc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st.Append("<li id=\"l" + dt.Rows[i]["rNum"].ToString() + "\"><span><a onclick=\"selectt('" + dt.Rows[i]["rNum"].ToString() + "')\" id=\"" + dt.Rows[i]["rNum"].ToString() + "\" >" + dt.Rows[i]["rName"].ToString() + "</a></span></li>");
            }
            st.Append("</ul></li></ul>");
            this.strc = st.ToString();
        }

        public void loadtree()
        {
            StringBuilder st = new StringBuilder();
            string sqlone = "select oNum,oName from menuone order by oNum ASC";
            DataTable dtone = this.bc.ReadTable(sqlone);
            for (int i = 0; i < dtone.Rows.Count; i++)
            {
                st.Append("<li><span><input onclick=\"twoall('" + dtone.Rows[i]["oNum"].ToString() + "');\" id=\"" + dtone.Rows[i]["oNum"].ToString() + "\"  name=\"onerole\" type=\"checkbox\" class=\"one\" value=\"" + dtone.Rows[i]["oNum"].ToString() + "\" />" + dtone.Rows[i]["oName"].ToString() + "</span><ul>");
                DataTable dttwo = this.bc.ReadTable("select tNum,tName  from menutwo  where   len(tNum)=4 and left(tNum,2)='" + dtone.Rows[i]["oNum"].ToString() + "' ORDER BY tNum ASC");
                if (dttwo.Rows.Count > 0)
                {
                    for (int j = 0; j < dttwo.Rows.Count; j++)
                    {
                        string sqlf = "select eNum from menuthree where  len(eNum)=6 and left(eNum,4)='" + dttwo.Rows[j]["tNum"].ToString() + "' ";
                        if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                        {
                            st.Append("<li><span><input onclick=\"threeall('" + dttwo.Rows[j]["tNum"].ToString() + "');twoclickk('" + dttwo.Rows[j]["tNum"].ToString() + "');\" id=\"" + dttwo.Rows[j]["tNum"].ToString() + "\"  type=\"checkbox\" name=\"tworole\"  class=\"two\" value=\"" + dttwo.Rows[j]["tNum"].ToString() + "\" />" + dttwo.Rows[j]["tName"].ToString() + "</span><ul>");
                            string sqls = "select eNum,eName from menuthree where  len(eNum)=6 and left(eNum,4)='" + dttwo.Rows[j]["tNum"].ToString() + "' ";
                            DataTable dtthree = this.bc.ReadTable(sqls);
                            for (int k = 0; k < dtthree.Rows.Count; k++)
                            {
                                st.Append("<li><span><input id=\"" + dtthree.Rows[k]["eNum"].ToString() + "\" onclick=\"threeclickk('" + dtthree.Rows[k]["eNum"].ToString() + "');\" type=\"checkbox\" name=\"threerole\" class=\"three\" value=\"" + dtthree.Rows[k]["eNum"].ToString() + "\" />" + dtthree.Rows[k]["eName"].ToString() + "</span>");
                                st.Append("</li>");
                            }
                            st.Append("</ul></li>");
                        }
                        else
                        {
                            st.Append("<li><span><input onclick=\"twoclickk('" + dttwo.Rows[j]["tNum"].ToString() + "');\" id=\"" + dttwo.Rows[j]["tNum"].ToString() + "\" type=\"checkbox\" name=\"tworole\" class=\"two\" value=\"" + dttwo.Rows[j]["tNum"].ToString() + "\" />" + dttwo.Rows[j]["tName"].ToString() + "</span>");
                            st.Append("</li>");
                        }
                    }
                }
                st.Append("</ul></li>");
            }
            this.treehtml = st.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadc();
            this.loadtree();
        }
    }


