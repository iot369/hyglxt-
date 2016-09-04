
    using DBUtility;
    using System;
    using System.Data;
    using System.Web;
    using System.Web.UI;

    public partial class  Ajaxtuihuo : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string did = base.Request.QueryString["did"].ToString();
                string dnum = base.Request.QueryString["dnum"].ToString();
                string sqld = "select * from Consumption_Back_select where C_Id = '" + dnum + "'";
                DataTable dt = this.bc.ReadTable(sqld);
                if (dt.Rows.Count > 0)
                {
                    string sqls;
                    DataTable dts;
                    string C_Id;
                    string str;
                    object name2;
                    string name4;
                    if (dt.Rows[0]["CardType"].ToString() == "会员卡")
                    {
                        sqls = "select * from consumptiondetail where dId = '" + did + "'";
                        dts = this.bc.ReadTable(sqls);
                        C_Id = "TH" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                        str = "insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                        name2 = str;
                        name2 = string.Concat(new object[] { name2, "'", C_Id, "','", dt.Rows[0]["Card_Id"].ToString(), "','退货消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','退货'" });
                        name4 = string.Concat(new object[] { name2, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','-", dts.Rows[0]["dMoney"].ToString(), "','','','", dt.Rows[0]["ClientName"].ToString(), "','", dt.Rows[0]["CardType"].ToString(), "'," });
                        name4 = name4 + "'-" + dts.Rows[0]["dMoney"].ToString() + "','0','0','0','0','-" + dts.Rows[0]["dJifen"].ToString() + "') ";
                        name4 = name4 + "  update membersinfo set mBalance=mBalance+" + dts.Rows[0]["dMoney"].ToString() + ",mIntegral=mIntegral-" + dts.Rows[0]["dJifen"].ToString() + " where mNum='" + dt.Rows[0]["Card_Id"].ToString() + "'";
                        name4 = name4 + " update consumptiondetail set dtId='" + C_Id + "',dStates=1 where dId ='" + did + "'";
                        str = name4 + "  update consumes set cCount=cCount+" + dts.Rows[0]["dCount"].ToString() + " where cNum='" + dts.Rows[0]["dNum"].ToString() + "'";
                        this.bc.execsql(str);
                        base.Response.Write("true");
                    }
                    else
                    {
                        sqls = "select * from consumptiondetail where dId = '" + did + "'";
                        dts = this.bc.ReadTable(sqls);
                        C_Id = "TH" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                        str = "insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                        name2 = str;
                        name2 = string.Concat(new object[] { name2, "'", C_Id, "','", dt.Rows[0]["Card_Id"].ToString(), "','退货消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','退货'" });
                        name4 = string.Concat(new object[] { name2, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','-", dts.Rows[0]["dMoney"].ToString(), "','','','", dt.Rows[0]["ClientName"].ToString(), "','", dt.Rows[0]["CardType"].ToString(), "'," }) + "'0','-" + dts.Rows[0]["dMoney"].ToString() + "','0','0','0','0') ";
                        name4 = name4 + " update consumptiondetail set dtId='" + C_Id + "',dStates=1  where dId ='" + did + "'";
                        str = name4 + "  update consumes set cCount=cCount+" + dts.Rows[0]["dCount"].ToString() + " where cNum='" + dts.Rows[0]["dNum"].ToString() + "'";
                        this.bc.execsql(str);
                        base.Response.Write("true");
                    }
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


