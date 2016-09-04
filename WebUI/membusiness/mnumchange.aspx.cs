
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  mnumchange : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string name3 = "update  membersinfo set mNum='" + this.txtnnum.Value + "' where mNum ='" + this.txtnum.Value + "' ";
                name3 = name3 + "update Consumption_Back_select set Card_Id = '" + this.txtnnum.Value + "' where Card_Id='" + this.txtnum.Value + "' ";
                name3 = name3 + "update Consumption_Back set Card_Id = '" + this.txtnnum.Value + "' where Card_Id='" + this.txtnum.Value + "'";
                name3 = name3 + "update memberchong set cmNum = '" + this.txtnnum.Value + "' where cmNum='" + this.txtnum.Value + "' ";
                name3 = name3 + "update prsentchange set cMnum = '" + this.txtnnum.Value + "' where cMnum='" + this.txtnum.Value + "' ";
                string sqladd = name3 + "update conscishu set uMnum = '" + this.txtnnum.Value + "' where uMnum='" + this.txtnum.Value + "' ";
                this.bc.execsql(sqladd);
            }
            catch
            {
            }
        }

        public void loadmem()
        {
            string sql = "select * from membersinfo where mNum = '" + base.Request.QueryString["mnum"].ToString() + "'";
            DataTable dt = this.bc.ReadTable(sql);
            if (dt.Rows.Count > 0)
            {
                this.txtnum.Value = dt.Rows[0]["mNum"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadmem();
            }
        }
    }


