
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web;
    using System.Web.UI;

    public partial class AJaxDAL : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt;
            string name11;
            if (base.Request.QueryString["Type"] == "load")
            {
                try
                {
                    dt = PublicMethod.QueryDataset("select Id from TemporaryCard where C_Id='" + base.Request.QueryString["Id"] + "'").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        base.Response.Write("临时卡@");
                    }
                    else
                    {
                        string strsp;
                        DataTable dtLevel;
                        DataTable dtMbr = PublicMethod.QueryDataset("select mNum,mLevel,mName,mBalance,convert(varchar(100), mPastdate,23) as 'mPastdate',mType,mPwd,mIntegral,mStates from membersinfo where mNum='" + base.Request.QueryString["Id"] + "'").Tables[0];
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
                                        name11 = strsp;
                                        strsp = name11 + "@" + dtLevel.Rows[0]["lName"].ToString() + "@" + dtLevel.Rows[0]["lDiscount"].ToString() + "@" + dtLevel.Rows[0]["ljifen"].ToString();
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
                            DataTable dtMbrs = PublicMethod.QueryDataset("select mNum,mLevel,mName,mBalance,convert(varchar(100), mPastdate,23) as 'mPastdate',mType,mPwd,mIntegral,mStates,mMobile from membersinfo where mMobile='" + base.Request.QueryString["Id"] + "'").Tables[0];
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
                                            name11 = strsp;
                                            strsp = name11 + "@" + dtLevel.Rows[0]["lName"].ToString() + "@" + dtLevel.Rows[0]["lDiscount"].ToString() + "@" + dtLevel.Rows[0]["ljifen"].ToString();
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
            else if (base.Request.QueryString["Type"] == "sub")
            {
                DataTable dtPwd;
                string sqlf;
                double jifen;
                string C_Id;
                string str;
                string sqlsms;
                DataTable dtsms;
                StringBuilder balance;
                int result;
                string _Response;
                string mybalance;
                string sms;
                object name12;
                if ((base.Request.QueryString["CardType"] != "临时卡") && (base.Request.QueryString["PayType"] == "储值支付"))
                {
                    dtPwd = PublicMethod.QueryDataset("select mNum from membersinfo where mNum='" + base.Request.QueryString["Id"] + "' and mPwd='" + DESEncrypt.Encrypt(base.Request.QueryString["pwd"]) + "'").Tables[0];
                    if (dtPwd.Rows.Count > 0)
                    {
                        sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["Id"].ToString() + "'";
                        dt = this.bc.ReadTable(sqlf);
                        if (dt.Rows.Count > 0)
                        {
                            jifen = double.Parse(base.Request.QueryString["JiFen"]) + double.Parse(dt.Rows[0]["mIntegral"].ToString());
                            C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            str = " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                            name12 = str;
                            name12 = string.Concat(new object[] { name12, "'", C_Id, "','", base.Request.QueryString["Id"], "','快速消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                            name11 = string.Concat(new object[] { name12, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["txtXFMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                            name11 = name11 + "'" + base.Request.QueryString["txtXFMoney"] + "','0','0','0','0','" + base.Request.QueryString["JiFen"] + "') ";
                            PublicMethod.Execute(name11 + "  update membersinfo set mBalance=mBalance-" + base.Request.QueryString["txtXFMoney"] + ",mIntegral=mIntegral+" + base.Request.QueryString["JiFen"] + " where mNum='" + base.Request.QueryString["Id"] + "'");
                            sqlsms = "select xuhao,Pwd,type,states,contents from messageset where type = 'sms'";
                            dtsms = this.bc.ReadTable(sqlsms);
                            if (dtsms.Rows[0]["states"].ToString() == "1")
                            {
                                balance = new StringBuilder("0000000000");
                                result = EUCPComm.GetBalance(dtsms.Rows[0]["xuhao"].ToString(), balance);
                                _Response = "";
                                mybalance = balance.ToString(0, balance.Length - 2);
                                if (result == 1)
                                {
                                    _Response = mybalance;
                                }
                                if (int.Parse(_Response) > 1)
                                {
                                    sms = string.Concat(new object[] { "尊敬的", dt.Rows[0]["mName"].ToString(), dt.Rows[0]["mSex"].ToString(), ",您于", DateTime.Now.ToString("yyyy-MM-dd HH:mm"), "在店面[", PublicMethod.GetSessionValue("shopname"), "]快速消费", base.Request.QueryString["txtXFMoney"], "元,获得积分", base.Request.QueryString["JiFen"], ",总积分为", jifen, "，", dtsms.Rows[0]["contents"].ToString() });
                                    EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                                }
                            }
                            base.Response.Write("true");
                        }
                        else
                        {
                            base.Response.Write("false");
                        }
                    }
                    else
                    {
                        base.Response.Write("false");
                    }
                }
                else if ((base.Request.QueryString["CardType"] != "临时卡") && (base.Request.QueryString["PayType"] == "银行卡"))
                {
                    dtPwd = PublicMethod.QueryDataset("select mNum from membersinfo where mNum='" + base.Request.QueryString["Id"] + "' and mPwd='" + DESEncrypt.Encrypt(base.Request.QueryString["pwd"]) + "'").Tables[0];
                    if (dtPwd.Rows.Count > 0)
                    {
                        sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["Id"].ToString() + "'";
                        dt = this.bc.ReadTable(sqlf);
                        if (dt.Rows.Count > 0)
                        {
                            jifen = double.Parse(base.Request.QueryString["JiFen"]) + double.Parse(dt.Rows[0]["mIntegral"].ToString());
                            C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            str = " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                            name12 = str;
                            name12 = string.Concat(new object[] { name12, "'", C_Id, "','", base.Request.QueryString["Id"], "','快速消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                            name11 = string.Concat(new object[] { name12, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["txtXFMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                            name11 = name11 + "'0','0','" + base.Request.QueryString["txtXFMoney"] + "','0','0','" + base.Request.QueryString["JiFen"] + "') ";
                            PublicMethod.Execute(name11 + "  update membersinfo set mBalance=mBalance-" + base.Request.QueryString["txtXFMoney"] + ",mIntegral=mIntegral+" + base.Request.QueryString["JiFen"] + " where mNum='" + base.Request.QueryString["Id"] + "'");
                            sqlsms = "select xuhao,Pwd,type,states,contents from messageset where type = 'sms'";
                            dtsms = this.bc.ReadTable(sqlsms);
                            if (dtsms.Rows[0]["states"].ToString() == "1")
                            {
                                balance = new StringBuilder("0000000000");
                                result = EUCPComm.GetBalance(dtsms.Rows[0]["xuhao"].ToString(), balance);
                                _Response = "";
                                mybalance = balance.ToString(0, balance.Length - 2);
                                if (result == 1)
                                {
                                    _Response = mybalance;
                                }
                                if (int.Parse(_Response) > 1)
                                {
                                    sms = string.Concat(new object[] { "尊敬的", dt.Rows[0]["mName"].ToString(), dt.Rows[0]["mSex"].ToString(), ",您于", DateTime.Now.ToString("yyyy-MM-dd HH:mm"), "在店面[", PublicMethod.GetSessionValue("shopname"), "]快速消费", base.Request.QueryString["txtXFMoney"], "元,获得积分", base.Request.QueryString["JiFen"], ",总积分为", jifen, "，", dtsms.Rows[0]["contents"].ToString() });
                                    EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                                }
                            }
                            base.Response.Write("true");
                        }
                        else
                        {
                            base.Response.Write("false");
                        }
                    }
                    else
                    {
                        base.Response.Write("false");
                    }
                }
                else if ((base.Request.QueryString["CardType"] != "临时卡") && (base.Request.QueryString["PayType"] == "现金"))
                {
                    sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["Id"].ToString() + "'";
                    dt = this.bc.ReadTable(sqlf);
                    if (dt.Rows.Count > 0)
                    {
                        jifen = double.Parse(base.Request.QueryString["JiFen"]) + double.Parse(dt.Rows[0]["mIntegral"].ToString());
                        C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                        str = " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay,hjifen) values (";
                        name12 = str;
                        name12 = string.Concat(new object[] { name12, "'", C_Id, "','", base.Request.QueryString["Id"], "','快速消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                        name11 = string.Concat(new object[] { name12, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["txtXFMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," });
                        name11 = name11 + "'0','" + base.Request.QueryString["txtXFMoney"] + "','0','0','0','" + base.Request.QueryString["JiFen"] + "') ";
                        PublicMethod.Execute(name11 + "  update membersinfo set mIntegral=mIntegral+" + base.Request.QueryString["JiFen"] + " where mNum='" + base.Request.QueryString["Id"] + "'");
                        sqlsms = "select xuhao,Pwd,type,states,contents from messageset where type = 'sms'";
                        dtsms = this.bc.ReadTable(sqlsms);
                        if (dtsms.Rows[0]["states"].ToString() == "1")
                        {
                            balance = new StringBuilder("0000000000");
                            result = EUCPComm.GetBalance(dtsms.Rows[0]["xuhao"].ToString(), balance);
                            _Response = "";
                            mybalance = balance.ToString(0, balance.Length - 2);
                            if (result == 1)
                            {
                                _Response = mybalance;
                            }
                            if (int.Parse(_Response) > 1)
                            {
                                sms = string.Concat(new object[] { "尊敬的", dt.Rows[0]["mName"].ToString(), dt.Rows[0]["mSex"].ToString(), ",您于", DateTime.Now.ToString("yyyy-MM-dd HH:mm"), "在店面[", PublicMethod.GetSessionValue("shopname"), "]快速消费", base.Request.QueryString["txtXFMoney"], "元,获得积分", base.Request.QueryString["JiFen"], ",总积分为", jifen, "，", dtsms.Rows[0]["contents"].ToString() });
                                EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                            }
                        }
                        base.Response.Write("true");
                    }
                    else
                    {
                        base.Response.Write("false");
                    }
                }
                else
                {
                    C_Id = "XF" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                    str = "insert into Consumption_Back (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay) values (";
                    name12 = str;
                    name12 = string.Concat(new object[] { name12, "'", C_Id, "','", base.Request.QueryString["Id"], "','快速消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                    name12 = (string.Concat(new object[] { name12, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["txtXFMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," }) + "'0','" + base.Request.QueryString["txtXFMoney"] + "','0','0','0') ") + " insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName,CardType,BlancePay,CashPay,BankPay,JifenPay,ElsePay) values (";
                    name12 = string.Concat(new object[] { name12, "'", C_Id, "','", base.Request.QueryString["Id"], "','快速消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["names"], "','", base.Request.QueryString["Remark"], "'" });
                    PublicMethod.Execute(string.Concat(new object[] { name12, ",'", HttpContext.Current.Session["shopname"], "','", HttpContext.Current.Session["shopnum"], "','", base.Request.QueryString["txtXFMoney"], "','", base.Request.QueryString["PayType"], "','','", base.Request.QueryString["txtname"], "','", base.Request.QueryString["CardType"], "'," }) + "'0','" + base.Request.QueryString["txtXFMoney"] + "','0','0','0') ");
                    base.Response.Write("true");
                }
            }
        }
    }


