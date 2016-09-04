
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  membersAdd : Page
    {
        private BaseClass bc = new BaseClass();
        public string datenow = "";
        public string datepast = "";

        protected void Button2_Click(object sender, EventArgs e)
        {
            string lNblance = "0";
            string lNjifen = "0";
            string paymo = "0";
            double give = 0.0;
            string sqfl = "select lNblance,lNjifen,lBuyprice from memberlevel where lNum ='" + this.ddllevel.SelectedValue + "'";
            DataTable dtl = this.bc.ReadTable(sqfl);
            if (dtl.Rows.Count > 0)
            {
                lNblance = dtl.Rows[0]["lNblance"].ToString();
                lNjifen = dtl.Rows[0]["lNjifen"].ToString();
                paymo = dtl.Rows[0]["lBuyprice"].ToString();
                give = double.Parse(lNblance) - double.Parse(paymo);
            }
            string[] addre = this.txtadd.Value.Split(new char[] { ',' });
            string sqladd = "insert into membersinfo(mNum,mName,mLevel,mSex,mPwd,mNoId,mBirth,mMobile,mQQ,mWeChat,mEmail,mProvince,mCity,mTown,mAddress,mMakecard,mMakedate,mPastdate,mShopNum,mRemark,mBalance,mIntegral,mStates,mType,mTuiJian,mTuiJIanName) values";
            string name2 = sqladd;
            sqladd = name2 + "('" + this.txtmNum.Value + "','" + this.txtname.Value + "','" + this.ddllevel.SelectedValue + "','" + this.ddlsex.Text + "','" + DESEncrypt.Encrypt(this.txtPasswords.Value) + "','" + this.txtnoid.Value + "','" + this.txtbirth.Value + "','" + this.txtmobile.Value + "','" + this.txtqq.Value + "','" + this.txtwechat.Value + "','" + this.txtemail.Value + "','" + addre[0] + "','" + addre[1] + "','" + addre[2] + "','" + this.txtaddress.Value + "','" + this.ddlmakecard.SelectedValue + "','" + DateTime.Now.ToString() + "','" + this.txtpastdate.Value + "','" + PublicMethod.GetSessionValue("shopnum") + "','" + this.txtremark.Text + "','" + lNblance + "','" + lNjifen + "','0','会员卡','" + this.txttuijian.Value + "','" + this.txttuijianname.Value + "')";
            this.bc.execsql(sqladd);
            string cnum = "CZ" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string sqlin = string.Concat(new object[] { 
                "insert into memberchong(cNum,cType,cDate,cChongMoney,cMake,cShopnum,cRemark,cYue,cGive,cmNum) values('", cnum, "','会员发卡','", DateTime.Now.ToString(), "','", paymo, "','", PublicMethod.GetSessionValue("username"), "','", PublicMethod.GetSessionValue("shopnum"), "','会员发卡初始金额','", lNblance, "','", give, "','", this.txtmNum.Value, 
                "')"
             });
            this.bc.execsql(sqlin);
            string sqlsms = "select xuhao,Pwd,type,states from messageset where type = 'sms'";
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
                    string sms = "尊敬的" + this.txtname.Value + this.ddlsex.Text + ",您于" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "在店面[" + PublicMethod.GetSessionValue("shopname") + "]成功注册成为幸福一方的会员，会员卡密码：" + this.txtPasswords.Value + "，请保管好，谢谢！客服:22682888【幸福一方】";
                    EUCPComm.SendSMS(dtsms.Rows[0]["xuhao"].ToString(), this.txtmobile.Value, sms, "");
                }
            }
            base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script>  $.ligerDialog.confirm('保存成功，是否马上充值？',function(type) {if (type)chongzhi('" + this.txtmNum.Value + "');});</script>");
        }

        public void loadlevel()
        {
            this.ddllevel.Items.Clear();
            this.ddllevel.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from memberlevel  where lStates=1";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddllevel.Items.Add(new ListItem(dtj.Rows[i]["lName"].ToString(), dtj.Rows[i]["lNum"].ToString()));
            }
        }

        public void loadlmake()
        {
            this.ddlmakecard.Items.Clear();
            this.ddlmakecard.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from admininfo where aSnum='" + PublicMethod.GetSessionValue("shopnum") + "'";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddlmakecard.Items.Add(new ListItem(dtj.Rows[i]["aName"].ToString(), dtj.Rows[i]["aNum"].ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadlevel();
                this.loadlmake();
            }
            this.datenow = DateTime.Now.ToString("yyyy-MM-dd");
            this.txtpastdate.Value = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
        }
    }


