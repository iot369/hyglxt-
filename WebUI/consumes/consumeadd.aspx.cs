
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  consumeadd : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqladd = "insert into consumes(cNum,cName,cPrice,cTnum,cIfbargain,cBargain,cJifen,cDiscount,cIfshow,cRemark,csNum,cInprice,cCount) values";
            string name1 = sqladd;
            sqladd = name1 + "('" + this.txtnum.Value + "','" + this.txtname.Value + "','" + this.txtprice.Value + "','" + this.ddltype.SelectedValue + "','" + this.ddlcIfbargain.SelectedValue + "','" + this.txtBargain.Value + "','" + this.ddljifen.SelectedValue + "','" + this.ddlcDiscount.SelectedValue + "','" + this.ddlIfshow.SelectedValue + "','" + this.txtremark.Text + "','" + PublicMethod.GetSessionValue("shopnum") + "','" + this.txtinprice.Value + "','" + this.txtcount.Value + "')";
            this.bc.execsql(sqladd);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('添加成功！');</script>");
        }

        public void loadlevel()
        {
            this.ddltype.Items.Clear();
            this.ddltype.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from consumetype";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddltype.Items.Add(new ListItem(dtj.Rows[i]["tName"].ToString(), dtj.Rows[i]["tNum"].ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadlevel();
            }
        }
    }


