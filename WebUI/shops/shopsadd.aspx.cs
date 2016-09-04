
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  shopsadd : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            string shopnum = "S" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string pri = "1|" + this.txtname.Value + "|欢迎光临，谢谢回顾||";
            string[] addre = this.txtadd.Value.Split(new char[] { ',' });
            string sqladd = "insert into shops(sNum,sName,sContact,sMobile,sProvince,sCity,sTown,sAddress,sMaker,sDate,stNum,sPrint) values";
            string name2 = sqladd;
            sqladd = name2 + "('" + shopnum + "','" + this.txtname.Value + "','" + this.txtcontact.Value + "','" + this.txtmobile.Value + "','" + addre[0] + "','" + addre[1] + "','" + addre[2] + "','" + this.txtaddress.Value + "','admin','" + DateTime.Now.ToString() + "','" + this.ddltype.SelectedValue + "','" + pri + "')";
            this.bc.execsql(sqladd);
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('添加成功！');</script>");
        }

        public void loadlevel()
        {
            this.ddltype.Items.Clear();
            this.ddltype.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from shopstype";
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


