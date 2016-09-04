
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxchange : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string cnum = "YH" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                string mnum = base.Request.QueryString["mnum"].ToString();
                string jifen = base.Request.QueryString["jifen"].ToString();
                string gid = base.Request.QueryString["gid"].ToString();
                string sqlft = "select * from membersinfo where  mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                DataTable dt = this.bc.ReadTable(sqlft);
                if (dt.Rows.Count > 0)
                {
                    double jifens = double.Parse(dt.Rows[0]["mIntegral"].ToString()) - double.Parse(base.Request.QueryString["jifen"]);
                    string name9 = "update  membersinfo set  mIntegral=convert(decimal(18, 0),mIntegral)-" + jifen + " where mNum ='" + base.Request.QueryString["mnum"].ToString() + "' ";
                    string sqlf = (name9 + "insert into prsentchange(cNum,cMnum,cGnum,cShopname,cDate,cMaker,jifen) values('" + cnum + "','" + mnum + "','" + gid + "','" + PublicMethod.GetSessionValue("shopname") + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + PublicMethod.GetSessionValue("names") + "','" + jifen + "')") + " update present set gCount=gCount-1 where gNum='" + gid + "' ";
                    this.bc.execsql(sqlf);
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
                            string sms = string.Concat(new object[] { "尊敬的", dt.Rows[0]["mName"].ToString(), dt.Rows[0]["mSex"].ToString(), ",您于", DateTime.Now.ToString("yyyy-MM-dd HH:mm"), "在店面[", PublicMethod.GetSessionValue("shopname"), "]兑换礼品,扣除积分", base.Request.QueryString["jifen"], ",剩余积分为", jifens, "，谢谢惠顾!", dtsms.Rows[0]["contents"].ToString() });
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


