
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxsentsms : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf;
                DataTable dt;
                string sqlsms;
                DataTable dtsms;
                StringBuilder balance;
                int result;
                string _Response;
                string mybalance;
                string sms;
                string type = base.Request.QueryString["type"].ToString();
                switch (type)
                {
                    case "001":
                        sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                        dt = this.bc.ReadTable(sqlf);
                        if (dt.Rows.Count > 0)
                        {
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
                                    sms = "尊敬的" + dt.Rows[0]["mName"].ToString() + dt.Rows[0]["mSex"].ToString() + "，您的会员卡已经过期,请及时到本店续期，以免影响你的使用，谢谢。" + dtsms.Rows[0]["contents"].ToString();
                                    EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                                }
                            }
                            base.Response.Write("true");
                        }
                        return;

                    case "002":
                        sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                        dt = this.bc.ReadTable(sqlf);
                        if (dt.Rows.Count > 0)
                        {
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
                                    sms = "尊敬的" + dt.Rows[0]["mName"].ToString() + dt.Rows[0]["mSex"].ToString() + "，您的会员卡已经有3个月的没有到本店消费了，本店目前有许多优惠活动，欢迎您的光临。" + dtsms.Rows[0]["contents"].ToString();
                                    EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                                }
                            }
                            base.Response.Write("true");
                        }
                        return;

                    case "003":
                        sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                        dt = this.bc.ReadTable(sqlf);
                        if (dt.Rows.Count > 0)
                        {
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
                                    sms = "尊敬的" + dt.Rows[0]["mName"].ToString() + dt.Rows[0]["mSex"].ToString() + "，您的会员卡余额已经低于10元,请及时到本店充值，以免影响你的使用，谢谢。" + dtsms.Rows[0]["contents"].ToString();
                                    EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                                }
                            }
                            base.Response.Write("true");
                        }
                        return;
                }
                if (type == "004")
                {
                    sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                    dt = this.bc.ReadTable(sqlf);
                    if (dt.Rows.Count > 0)
                    {
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
                                sms = "尊敬的" + dt.Rows[0]["mName"].ToString() + dt.Rows[0]["mSex"].ToString() + "，您的即将生日，我们公司为你提供许多生日优惠活动，欢迎你的光临，谢谢。" + dtsms.Rows[0]["contents"].ToString();
                                EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), dt.Rows[0]["mMobile"].ToString(), sms, "");
                            }
                        }
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


