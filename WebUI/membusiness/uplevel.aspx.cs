
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  uplevel : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string sqladd = "update  membersinfo set mLevel='" + this.ddllevel.SelectedValue + "' where mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                this.bc.execsql(sqladd);
                this.loadmem();
            }
            catch
            {
            }
        }

        public void loadlevel()
        {
            this.ddllevel.Items.Clear();
            string sqlf = "select * from memberlevel";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddllevel.Items.Add(new ListItem(dtj.Rows[i]["lName"].ToString(), dtj.Rows[i]["lNum"].ToString()));
            }
        }

        public void loadmem()
        {
            string sql = "select * from membersinfo where mNum = '" + base.Request.QueryString["mnum"].ToString() + "'";
            DataTable dt = this.bc.ReadTable(sql);
            if (dt.Rows.Count > 0)
            {
                this.txtnum.Value = dt.Rows[0]["mNum"].ToString();
                this.ddllevel.SelectedValue = dt.Rows[0]["mLevel"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadlevel();
                this.loadmem();
            }
        }
    }


