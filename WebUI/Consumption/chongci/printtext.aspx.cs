
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  printtext : Page
    {
        private BaseClass bc = new BaseClass();
        public string detail = "";
        public string riqi = "";
        public string shouyin = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            this.shui.Text = "XF" + base.Request.QueryString["liushui"];
            this.shouyin = PublicMethod.GetSessionValue("names");
            this.riqi = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            this.yingshou.Text = base.Request.QueryString["yingshou"];
            this.shishou.Text = base.Request.QueryString["shishou"];
            this.yingzhao.Text = base.Request.QueryString["yingzhao"];
            this.jifen.Text = base.Request.QueryString["jifen"];
            this.shuliang.Text = base.Request.QueryString["SCount"];
            this.jine.Text = base.Request.QueryString["yingshou"];
            this.memcard.Text = base.Request.QueryString["CardId"];
            string sqlf = "select mIntegral,mBalance from membersinfo where mNum='" + base.Request.QueryString["CardId"] + "'";
            DataTable dt = this.bc.ReadTable(sqlf);
            if (dt.Rows.Count > 0)
            {
                //double yue = double.Parse(dt.Rows[0]["mBalance"].ToString()) - double.Parse(base.Request.QueryString["chuzi"]);
                this.lblkeyong.Text = (int.Parse(dt.Rows[0]["mIntegral"].ToString()) + int.Parse(base.Request.QueryString["jifen"].ToString())).ToString();
                //this.lblyue.Text = yue.ToString();
            }
            string sqls = "select sPrint from shops where sNum ='" + PublicMethod.GetSessionValue("shopnum") + "'";
            string[] spr = this.bc.ReadTable(sqls).Rows[0]["sPrint"].ToString().Split(new char[] { '|' });
            this.lbltop.Text = spr[1].ToString();
            this.lblwel.Text = spr[2].ToString();
            this.lbladd.Text = spr[3].ToString();
            this.lbltel.Text = spr[4].ToString();
            StringBuilder st = new StringBuilder();
            string detal = base.Server.UrlDecode(base.Request.QueryString["detail"].ToString());
            string[] detals = detal.Substring(0, detal.Length - 1).Split(new char[] { '|' });
            for (int i = 0; i < detals.Length; i++)
            {
                string[] str = detals[i].Split(new char[] { ',' });
                string sname = "";
                if (str[0].Length > 8)
                {
                    sname = str[0].Substring(0, 8) + "..";
                }
                else
                {
                    sname = str[0];
                }
                st.Append("<tr><td style=\"text-align: left\">" + sname + "</td><td style=\"text-align: center\">" + str[1] + "</td><td style=\"text-align: center\">" + str[2] + "</td><td style=\"text-align: right\">" + str[3] + "</td></tr>");
            }
            this.detail = st.ToString();
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> PrintTable();</script>");
        }
    }


