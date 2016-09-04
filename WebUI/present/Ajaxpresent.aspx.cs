
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxpresent : Page
    {
        private BaseClass bc = new BaseClass();
        public string menuhtml = "";

        public void loadmenu()
        {
            StringBuilder st = new StringBuilder();
            DataTable dttwo = this.bc.ReadTable("select gName,gImg,gJifen,gNum,gCount,gState  from present where gSnum in ('" + PublicMethod.GetSessionValue("shopnum") + "','S10000') and gState=1   ORDER BY gId ASC");
            if (dttwo.Rows.Count > 0)
            {
                for (int i = 0; i < dttwo.Rows.Count; i++)
                {
                    string states = "";
                    if (dttwo.Rows[i]["gCount"].ToString() == "0")
                    {
                        states = "disabled=\"disabled\"";
                    }
                    st.Append(" <div style=\"width: 32%; float: left; text-align: center; margin-top: 3px;\"><table style=\"border: 1px solid #C0C0C0;\"><tr><td><img onerror=\"this.src='../images/noimg.gif '\" style=\" padding: 3px; width: 120px; height: 120px; margin: 2px;\" id=\"Img3\" src=\"pimg/" + dttwo.Rows[i]["gImg"].ToString() + "\" /></td>");
                    st.Append("</tr><tr><td>" + dttwo.Rows[i]["gName"].ToString() + "(<span style=\"color:Red;\">" + dttwo.Rows[i]["gCount"].ToString() + "</span>)</td></tr><tr><td>所需积分：<span style=\"color:Red;\">" + dttwo.Rows[i]["gJifen"].ToString() + "</span></td></tr></table>");
                    st.Append("<table style=\" margin-top:10px;margin-bottom:10px;\"><tr><td><input " + states + " id=\"Button3\" type=\"button\" value=\"马上兑换\"  class=\"btnSubmit\" style=\"width:80px;\" onclick=\"changeper('" + dttwo.Rows[i]["gNum"].ToString() + "','" + dttwo.Rows[i]["gJifen"].ToString() + "')\"/></td></tr></table> </div>");
                }
            }
            base.Response.Write(st.ToString());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadmenu();
        }
    }


