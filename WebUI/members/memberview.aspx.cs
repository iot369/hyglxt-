
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  memberview : Page
    {
        private BaseClass bc = new BaseClass();
        public DataTable dt;
        public string userjiao = "";

        protected void Button2_Click(object sender, EventArgs e)
        {
            string[] addre = this.txtadd.Value.Split(new char[] { ',' });
            string sqladd = "update  membersinfo set mName='" + this.txtname.Value + "', mSex='" + this.ddlsex.Text + "',mNoId='" + this.txtnoid.Value + "',mBirth='" + this.txtbirth.Value + "',mMobile='" + this.txtmobile.Value + "',mQQ='" + this.txtqq.Value + "',mWeChat='" + this.txtwechat.Value + "',mEmail='" + this.txtemail.Value + "',mProvince='" + addre[0] + "',mCity='" + addre[1] + "',mTown='" + addre[2] + "',mAddress='" + this.txtaddress.Value + "',mRemark='" + this.txtremark.Text + "' where mNum ='" + this.txtnum.Value + "'";
            this.bc.execsql(sqladd);
            this.loadmem();
            this.right();
        }

        public string loadlevel(string levelnum)
        {
            string leve = "";
            string sqll = "select lName from memberlevel where lNum='" + levelnum + "'";
            DataTable dts = this.bc.ReadTable(sqll);
            if (dts.Rows.Count > 0)
            {
                leve = dts.Rows[0]["lName"].ToString();
            }
            return leve;
        }

        public void loadmem()
        {
            string sql = "select * from membersinfo where mNum = '" + base.Request.QueryString["mnum"].ToString() + "'";
            this.dt = this.bc.ReadTable(sql);
            if (this.dt.Rows.Count > 0)
            {
                this.txtnum.Value = this.dt.Rows[0]["mNum"].ToString();
                this.txtlevel.Value = this.loadlevel(this.dt.Rows[0]["mLevel"].ToString());
                this.txtjifen.Value = this.dt.Rows[0]["mIntegral"].ToString();
                this.txtBlancce.Value = this.dt.Rows[0]["mBalance"].ToString();
                this.txtname.Value = this.dt.Rows[0]["mName"].ToString();
                this.ddlsex.Text = this.dt.Rows[0]["mSex"].ToString();
                this.txtnoid.Value = this.dt.Rows[0]["mNoId"].ToString();
                this.txtmobile.Value = this.dt.Rows[0]["mMobile"].ToString();
                this.txtqq.Value = this.dt.Rows[0]["mQQ"].ToString();
                this.txtwechat.Value = this.dt.Rows[0]["mWeChat"].ToString();
                this.txtemail.Value = this.dt.Rows[0]["mEmail"].ToString();
                this.txtaddress.Value = this.dt.Rows[0]["mAddress"].ToString();
                this.txtremark.Text = this.dt.Rows[0]["mRemark"].ToString();
                this.txtshop.Value = this.loadshop(this.dt.Rows[0]["mShopNum"].ToString());
                this.txtpastdate.Value = this.dt.Rows[0]["mPastdate"].ToString();
                this.txttuijian.Value = this.dt.Rows[0]["mTuiJian"].ToString();
                this.txttuijianname.Value = this.dt.Rows[0]["mTuiJIanName"].ToString();
            }
        }

        public string loadshop(string snum)
        {
            string leve = "";
            string sqll = "select sName from shops where sNum='" + snum + "'";
            DataTable dts = this.bc.ReadTable(sqll);
            if (dts.Rows.Count > 0)
            {
                leve = dts.Rows[0]["sName"].ToString();
            }
            return leve;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadmem();
                this.right();
            }
        }

        public void right()
        {
            string sqlf = "select rRightbtn from roles where rNum ='" + PublicMethod.GetSessionValue("userjiao") + "'";
            DataTable dtf = this.bc.ReadTable(sqlf);
            this.userjiao = dtf.Rows[0]["rRightbtn"].ToString();
        }
    }


