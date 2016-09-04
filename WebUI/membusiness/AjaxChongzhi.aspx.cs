
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  AjaxChongzhi : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            string mnum = base.Request.QueryString["mnum"].ToString();
            string chong = base.Request.QueryString["chong"].ToString();
            string give = base.Request.QueryString["give"].ToString();
            string heji = base.Request.QueryString["heji"].ToString();
            string remark = base.Server.UrlDecode(base.Request.QueryString["remark"].ToString());
            string name = base.Server.UrlDecode(base.Request.QueryString["name"].ToString());
            try
            {
                string sqlf = "select * from membersinfo where  mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    string cnum = "CZ" + DateTime.Now.ToString("yyyyMMddHHmmss");
                    double yue = double.Parse(heji) + double.Parse(dt.Rows[0]["mBalance"].ToString());
                    object name9 = string.Concat(new object[] { 
                        "insert into memberchong(cNum,cType,cDate,cChongMoney,cMake,cShopnum,cRemark,cYue,cGive,cmNum,cmName) values('", cnum, "','会员充值','", DateTime.Now.ToString(), "','", chong, "','", PublicMethod.GetSessionValue("username"), "','", PublicMethod.GetSessionValue("shopnum"), "','", remark, "','", yue, "','", give, 
                        "','", mnum, "','", name, "')"
                     });
                    string sqlin = string.Concat(new object[] { name9, "update membersinfo set mBalance ='", yue, "' where mNum = '", base.Request.QueryString["mnum"].ToString(), "' " });
                    this.bc.execsql(sqlin);
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
                            string sms = string.Concat(new object[] { "尊敬的", dt.Rows[0]["mName"].ToString(), ",您于", DateTime.Now.ToString("yyyy-MM-dd HH:mm"), "在店面", PublicMethod.GetSessionValue("shopname"), "充值", chong, "元,赠送", give, "元,卡内余额", yue, "元。", dtsms.Rows[0]["contents"].ToString() });
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
            catch
            {
                base.Response.Write("false");
            }
        }
    }


