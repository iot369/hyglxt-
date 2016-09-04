
    using DBUtility;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  presentadd : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqladd = "insert into present(gNum,gName,gJifen,gState,gImg,gSnum,gDate,gCount) values";
            string name1 = sqladd;
            sqladd = name1 + "('" + this.txtnum.Value + "','" + this.txtname.Value + "','" + this.txtjifen.Value + "','" + this.ddlifuser.SelectedValue + "','" + this.hf.Value + "','" + PublicMethod.GetSessionValue("shopnum") + "','" + DateTime.Now.ToString() + "','" + this.txtcout.Value + "')";
            this.bc.execsql(sqladd);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('添加成功！');</script>");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }


