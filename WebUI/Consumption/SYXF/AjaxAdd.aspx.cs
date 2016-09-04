
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web;
    using System.Web.UI;

    public partial class AjaxAdd : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt;
            if (base.Request.QueryString["type"] == "addshop")
            {
                dt = PublicMethod.QueryDataset("select cId,cNum,cName,cPrice from consumes where cNum='" + base.Request.QueryString["cNum"] + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(dt.Rows[0]["cId"].ToString() + "@" + dt.Rows[0]["cName"].ToString() + "@" + dt.Rows[0]["cPrice"].ToString());
                }
                else
                {
                    base.Response.Write("false");
                }
            }
            else
            {
                string name21;
                if (base.Request.QueryString["type"] == "postDate")
                {
                    try
                    {
                        dt = PublicMethod.QueryDataset("select Id,C_Id from TemporaryCard where C_Id='" + base.Request.QueryString["cNum"] + "'").Tables[0];
                        if (dt.Rows.Count > 0)
                        {
                            base.Response.Write("临时卡@" + dt.Rows[0]["C_Id"].ToString());
                        }
                        else
                        {
                            string strsp;
                            DataTable dtLevel;
                            DataTable dtMbr = PublicMethod.QueryDataset("select mNum,mLevel,mName,mBalance,convert(varchar(100), mPastdate,23) as 'mPastdate',mType,mPwd,mIntegral,mStates from membersinfo where mNum='" + base.Request.QueryString["cNum"] + "'").Tables[0];
                            if (dtMbr.Rows.Count > 0)
                            {
                                if (dtMbr.Rows[0]["mStates"].ToString() == "0")
                                {
                                    if ((dtMbr.Rows[0]["mPastdate"].ToString() == "永久有效") || (DateTime.Parse(dtMbr.Rows[0]["mPastdate"].ToString()) > DateTime.Now))
                                    {
                                        strsp = dtMbr.Rows[0]["mType"].ToString() + "@" + dtMbr.Rows[0]["mLevel"].ToString() + "@" + dtMbr.Rows[0]["mName"].ToString() + "@" + dtMbr.Rows[0]["mBalance"].ToString() + "@" + dtMbr.Rows[0]["mPastdate"].ToString() + "@" + dtMbr.Rows[0]["mNum"].ToString() + "@" + DESEncrypt.Decrypt(dtMbr.Rows[0]["mPwd"].ToString()) + "@" + dtMbr.Rows[0]["mIntegral"].ToString();
                                        dtLevel = PublicMethod.QueryDataset("select lName,lDiscount,ljifen from memberlevel where lNum='" + dtMbr.Rows[0]["mLevel"].ToString() + "'").Tables[0];
                                        if (dtLevel.Rows.Count > 0)
                                        {
                                            name21 = strsp;
                                            strsp = name21 + "@" + dtLevel.Rows[0]["lName"].ToString() + "@" + dtLevel.Rows[0]["lDiscount"].ToString() + "@" + dtLevel.Rows[0]["ljifen"].ToString();
                                        }
                                        base.Response.Write(strsp);
                                    }
                                    else
                                    {
                                        base.Response.Write("过期@");
                                    }
                                }
                                else
                                {
                                    base.Response.Write("挂失@");
                                }
                            }
                            else
                            {
                                DataTable dtMbrs = PublicMethod.QueryDataset("select mNum,mLevel,mName,mBalance,convert(varchar(100), mPastdate,23) as 'mPastdate',mType,mPwd,mIntegral,mStates,mMobile from membersinfo where mMobile='" + base.Request.QueryString["cNum"] + "'").Tables[0];
                                if (dtMbrs.Rows.Count > 0)
                                {
                                    if (dtMbrs.Rows[0]["mStates"].ToString() == "0")
                                    {
                                        if ((dtMbrs.Rows[0]["mPastdate"].ToString() == "永久有效") || (DateTime.Parse(dtMbrs.Rows[0]["mPastdate"].ToString()) > DateTime.Now))
                                        {
                                            strsp = dtMbrs.Rows[0]["mType"].ToString() + "@" + dtMbrs.Rows[0]["mLevel"].ToString() + "@" + dtMbrs.Rows[0]["mName"].ToString() + "@" + dtMbrs.Rows[0]["mBalance"].ToString() + "@" + dtMbrs.Rows[0]["mPastdate"].ToString() + "@" + dtMbrs.Rows[0]["mNum"].ToString() + "@" + DESEncrypt.Decrypt(dtMbrs.Rows[0]["mPwd"].ToString()) + "@" + dtMbrs.Rows[0]["mIntegral"].ToString();
                                            dtLevel = PublicMethod.QueryDataset("select lName,lDiscount,ljifen from memberlevel where lNum='" + dtMbrs.Rows[0]["mLevel"].ToString() + "'").Tables[0];
                                            if (dtLevel.Rows.Count > 0)
                                            {
                                                name21 = strsp;
                                                strsp = name21 + "@" + dtLevel.Rows[0]["lName"].ToString() + "@" + dtLevel.Rows[0]["lDiscount"].ToString() + "@" + dtLevel.Rows[0]["ljifen"].ToString();
                                            }
                                            base.Response.Write(strsp);
                                        }
                                        else
                                        {
                                            base.Response.Write("过期@");
                                        }
                                    }
                                    else
                                    {
                                        base.Response.Write("挂失@");
                                    }
                                }
                                else
                                {
                                    base.Response.Write("不存在@");
                                }
                            }
                        }
                    }
                    catch
                    {
                    }
                }
                else if (base.Request.QueryString["type"] == "change")
                {
                    try
                    {
                        string C_Id;
                        double cash;
                        string blance;
                        string bank;
                        string jifens;
                        string elsee;
                        string str;
                        string ddnow;
                        StringBuilder st;
                        string detal;
                        string[] detals;
                        int i;
                        string[] strs;
                        object name22;
                        if (base.Request.QueryString["CardType"].ToString() == "会员卡")
                        {
                            string sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["CardId"].ToString() + "'";
                            dt = this.bc.ReadTable(sqlf);
                            if (dt.Rows.Count > 0)
                            {
                                double jifen = double.Parse(base.Request.QueryString["SJiFen"]) + double.Parse(dt.Rows[0]["mIntegral"].ToString());
                                C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                cash = double.Parse(base.Request.QueryString["cash"]) - double.Parse(base.Request.QueryString["zhaoling"]);
                                blance = base.Request.QueryString["blance"];
                                bank = base.Request.QueryString["bank"];
                                jifens = base.Request.QueryString["jifen"];
                                elsee = base.Request.QueryString["elses"];
                                str = "insert into Consumption_Back (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                                name22 = str;
                                name22 = string.Concat(new object[] { name22, "'", C_Id, "','", base.Request.QueryString["CardId"], "','收银消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                                name22 = string.Concat(new object[] { name22, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["PayMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                                name22 = string.Concat(new object[] { name22, "'", blance, "','", cash, "','", bank, "','", jifens, "','", elsee, "','", base.Request.QueryString["SJiFen"], "') " }) + " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                                name22 = string.Concat(new object[] { name22, "'", C_Id, "','", base.Request.QueryString["CardId"], "','收银消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                                name22 = string.Concat(new object[] { name22, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["PayMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                                name21 = string.Concat(new object[] { name22, "'", blance, "','", cash, "','", bank, "','", jifens, "','", elsee, "','", base.Request.QueryString["SJiFen"], "') " });
                                PublicMethod.Execute(name21 + "  update membersinfo set mBalance=mBalance-" + base.Request.QueryString["txtchuz"] + ",mIntegral=mIntegral+" + base.Request.QueryString["SJiFen"] + " where mNum='" + base.Request.QueryString["CardId"] + "'");
                                ddnow = DateTime.Now.ToString();
                                st = new StringBuilder();
                                detal = base.Server.UrlDecode(base.Request.QueryString["detail"].ToString());
                                detals = detal.Substring(0, detal.Length - 1).Split(new char[] { '|' });
                                for (i = 0; i < detals.Length; i++)
                                {
                                    strs = detals[i].Split(new char[] { ',' });
                                    st.Append("insert into consumptiondetail(dNum,dName,dPrice,dCount,dMoney,dDate,dcId,dZhe,dJifen,dStates)values('" + strs[4] + "','" + strs[0] + "','" + strs[1] + "','" + strs[2] + "','" + strs[3] + "','" + ddnow + "','" + C_Id + "','" + strs[5] + "','" + strs[6] + "','0')");
                                }
                                PublicMethod.Execute(st.ToString());
                                string sqlsms = "select xuhao,Pwd,type,states,contents from messageset where type = 'sms'";
                                DataTable dtsms = this.bc.ReadTable(sqlsms);
                                if (dtsms.Rows[0]["states"].ToString() == "1")
                                {
                                    StringBuilder balance = new StringBuilder("0000000000");
                                    int result = EUCPComm.GetBalance(dtsms.Rows[0]["xuhao"].ToString(), balance);
                                    string _Response = "";
                                    string mybalance = balance.ToString(0, balance.Length - 2);
                                    if (result == 1)
                                    {
                                        _Response = mybalance;
                                    }
                                    if (int.Parse(_Response) > 1)
                                    {
                                        string sms = string.Concat(new object[] { "尊敬的", dt.Rows[0]["mName"].ToString(), dt.Rows[0]["mSex"].ToString(), ",您于", DateTime.Now.ToString("yyyy-MM-dd HH:mm"), "在店面[", PublicMethod.GetSessionValue("shopname"), "]消费", base.Request.QueryString["PayMoney"], "元,获得积分", base.Request.QueryString["SJiFen"], ",总积分为", jifen, ",", dtsms.Rows[0]["contents"].ToString() });
                                        EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                                    }
                                }
                                base.Response.Write(C_Id);
                            }
                            else
                            {
                                base.Response.Write("false");
                            }
                        }
                        else if (base.Request.QueryString["CardType"].ToString() == "临时卡")
                        {
                            C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            cash = double.Parse(base.Request.QueryString["cash"]) - double.Parse(base.Request.QueryString["zhaoling"]);
                            blance = base.Request.QueryString["blance"];
                            bank = base.Request.QueryString["bank"];
                            jifens = base.Request.QueryString["jifen"];
                            elsee = base.Request.QueryString["elses"];
                            str = "insert into Consumption_Back (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                            name22 = str;
                            name22 = string.Concat(new object[] { name22, "'", C_Id, "','", base.Request.QueryString["CardId"], "','收银消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                            name22 = string.Concat(new object[] { name22, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["PayMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                            name22 = string.Concat(new object[] { name22, "'", blance, "','", cash, "','", bank, "','", jifens, "','", elsee, "','", base.Request.QueryString["SJiFen"], "') " }) + " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                            name22 = string.Concat(new object[] { name22, "'", C_Id, "','", base.Request.QueryString["CardId"], "','收银消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                            name22 = string.Concat(new object[] { name22, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["PayMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                            PublicMethod.Execute(string.Concat(new object[] { name22, "'", blance, "','", cash, "','", bank, "','", jifens, "','", elsee, "','", base.Request.QueryString["SJiFen"], "') " }));
                            ddnow = DateTime.Now.ToString();
                            st = new StringBuilder();
                            detal = base.Server.UrlDecode(base.Request.QueryString["detail"].ToString());
                            detals = detal.Substring(0, detal.Length - 1).Split(new char[] { '|' });
                            for (i = 0; i < detals.Length; i++)
                            {
                                strs = detals[i].Split(new char[] { ',' });
                                st.Append("insert into consumptiondetail(dNum,dName,dPrice,dCount,dMoney,dDate,dcId,dZhe,dJifen,dStates)values('" + strs[4] + "','" + strs[0] + "','" + strs[1] + "','" + strs[2] + "','" + strs[3] + "','" + ddnow + "','" + C_Id + "','" + strs[5] + "','" + strs[6] + "','0')");
                            }
                            PublicMethod.Execute(st.ToString());
                            base.Response.Write(C_Id);
                        }
                        else if (base.Request.QueryString["CardType"].ToString() == "")
                        {
                            C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            cash = double.Parse(base.Request.QueryString["cash"]) - double.Parse(base.Request.QueryString["zhaoling"]);
                            blance = base.Request.QueryString["blance"];
                            bank = base.Request.QueryString["bank"];
                            jifens = base.Request.QueryString["jifen"];
                            elsee = base.Request.QueryString["elses"];
                            str = " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                            name22 = str;
                            name22 = string.Concat(new object[] { name22, "'", C_Id, "','1000000000','收银消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                            name22 = string.Concat(new object[] { name22, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["PayMoney"], "','", base.Request.QueryString["PayType"], "','','散客','散客卡'," });
                            PublicMethod.Execute(string.Concat(new object[] { name22, "'", blance, "','", cash, "','", bank, "','", jifens, "','", elsee, "','", base.Request.QueryString["SJiFen"], "') " }));
                            ddnow = DateTime.Now.ToString();
                            st = new StringBuilder();
                            detal = base.Server.UrlDecode(base.Request.QueryString["detail"].ToString());
                            detals = detal.Substring(0, detal.Length - 1).Split(new char[] { '|' });
                            for (i = 0; i < detals.Length; i++)
                            {
                                strs = detals[i].Split(new char[] { ',' });
                                st.Append("insert into consumptiondetail(dNum,dName,dPrice,dCount,dMoney,dDate,dcId,dZhe,dJifen,dStates)values('" + strs[4] + "','" + strs[0] + "','" + strs[1] + "','" + strs[2] + "','" + strs[3] + "','" + ddnow + "','" + C_Id + "','" + strs[5] + "','" + strs[6] + "','0')");
                            }
                            PublicMethod.Execute(st.ToString());
                            base.Response.Write(C_Id);
                        }
                    }
                    catch
                    {
                        base.Response.Write("false");
                    }
                }
            }
        }
    }


