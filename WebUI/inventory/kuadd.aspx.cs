
    using DBUtility;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  kuadd : Page
    {
        private BaseClass bc = new BaseClass();


        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.HiddenField1.Value.IndexOf("|") > 0)
            {
                string sqlins = "insert into inventory(yNum,yDate,yPaytype,yMaker,yShopnum,yRemark) values('" + this.txtnums.Value + "','" + DateTime.Now.ToString() + "','" + this.txtpaytype.Value + "','" + this.txtmarkname.Value + "','" + this.txtshopname.Value + "','" + this.txtremark.Value + "')";
                this.bc.execsql(sqlins);
                string[] sArray = this.HiddenField1.Value.Substring(0, this.HiddenField1.Value.Length - 1).Split(new char[] { '|' });
                foreach (string i in sArray)
                {
                    string[] Val = i.ToString().Split(new char[] { ',' });
                    string name6 = "insert into inventorylist(lyNum,lNum,lName,lType,lPrice,lCount,lRemark) values('" + this.txtnums.Value + "','" + Val[0] + "','" + Val[1] + "','" + Val[2] + "','" + Val[3] + "','" + Val[4] + "','" + Val[5] + "')";
                    string sqlin = name6 + " update consumes set cCount=cCount+" + Val[4] + " where cNum='" + Val[0] + "'";
                    this.bc.execsql(sqlin);
                    base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('保存成功！');</script>");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.txtnums.Value = "RK" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                this.txtdate.Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                this.txtmarkname.Value = PublicMethod.GetSessionValue("names");
                this.txtshopname.Value = PublicMethod.GetSessionValue("shopname");
            }
        }
    }


