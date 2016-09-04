
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;

    public partial class  Ajaxloadcom : Page
    {
        private BaseClass bc = new BaseClass();
        public string begin = "";
        public double bili = 0.0;
        public double jine = 0.0;
        public string name = "";
        public string num = "";
        public string over = "";

        public DataTable load(int pagesize, int page)
        {
            DataTable dtz = new DataTable();
            dtz.Columns.Add("tnum", typeof(string));
            dtz.Columns.Add("tname", typeof(string));
            dtz.Columns.Add("tfcount", typeof(decimal));
            dtz.Columns.Add("tfmoney", typeof(decimal));
            dtz.Columns.Add("txall", typeof(decimal));
            dtz.Columns.Add("txmoney", typeof(decimal));
            string sqladmin = " where 1=1  and aSnum='" + PublicMethod.GetSessionValue("shopnum").ToString() + "'";
            if (this.num != "")
            {
                sqladmin = sqladmin + "and  charindex('" + this.num + "', aNum)>0";
            }
            if (this.name != "")
            {
                sqladmin = sqladmin + "and  charindex('" + this.name + "', .aName)>0";
            }
            string sqlwhat = "aNum,aName,aSnum";
            DataTable dta = PublicMethod.FindForPageAll(page, pagesize, sqladmin, "admininfo", "aId", sqlwhat);
            for (int i = 0; i < dta.Rows.Count; i++)
            {
                double jines = this.loadcout(dta.Rows[i]["aNum"].ToString()) * this.jine;
                double bilis = this.loadmoney(dta.Rows[i]["aNum"].ToString()) * this.bili;
                dtz.Rows.Add(new object[] { dta.Rows[i]["aNum"].ToString(), dta.Rows[i]["aName"].ToString(), this.loadcout(dta.Rows[i]["aNum"].ToString()), jines, this.loadmoney(dta.Rows[i]["aNum"].ToString()), bilis });
            }
            return dtz;
        }

        public double loadcout(string ids)
        {
            string sql = "select count(*) as cout from membersinfo where mMakecard='" + ids + "'";
            if ((this.begin != "") && (this.over != ""))
            {
                string name2 = sql;
                sql = name2 + "and  mMakedate >='" + this.begin + "' and mMakedate <='" + this.over + "'";
            }
            return double.Parse(this.bc.ReadTable(sql).Rows[0]["cout"].ToString());
        }

        public double loadmoney(string ids)
        {
            string mmem = "";
            string sqlmem = "select mNum from membersinfo where mMakecard='" + ids + "'";
            DataTable dt = this.bc.ReadTable(sqlmem);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                mmem = mmem + dt.Rows[i]["mNum"].ToString() + "|";
            }
            string sqll = "select sum(CONVERT(decimal(18, 2),[money])) as  allmoney  from Consumption_Back_select where charindex(Card_Id,'" + mmem + "')>0 and CardType='会员卡'";
            if ((this.begin != "") && (this.over != ""))
            {
                string name2 = sqll;
                sqll = name2 + "and  Addtime >='" + this.begin + "' and Addtime <='" + this.over + "'";
            }
            DataTable dtl = this.bc.ReadTable(sqll);
            return double.Parse((dtl.Rows[0]["allmoney"].ToString() == "") ? "0" : dtl.Rows[0]["allmoney"].ToString());
        }

        public DataTable loads()
        {
            DataTable dtz = new DataTable();
            dtz.Columns.Add("tnum", typeof(string));
            string sqladmin = "select * from admininfo where 1=1  and aSnum='" + PublicMethod.GetSessionValue("shopnum").ToString() + "'";
            if (this.num != "")
            {
                sqladmin = sqladmin + "and  charindex('" + this.num + "', aNum)>0";
            }
            if (this.name != "")
            {
                sqladmin = sqladmin + "and  charindex('" + this.name + "', .aName)>0";
            }
            DataTable dta = this.bc.ReadTable(sqladmin);
            for (int i = 0; i < dta.Rows.Count; i++)
            {
                dtz.Rows.Add(new object[] { dta.Rows[i]["aNum"].ToString() });
            }
            return dtz;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int page = int.Parse(base.Request.Params["page"].ToString());
                int pagesize = int.Parse(base.Request.Params["pagesize"].ToString());
                this.num = (base.Request.Params["num"].ToString() == "") ? "" : base.Request.Params["num"].ToString().Substring(1);
                this.name = (base.Request.Params["name"].ToString() == "") ? "" : base.Request.Params["name"].ToString().Substring(1);
                this.begin = (base.Server.UrlDecode(base.Request.Params["begin"].ToString()) == ".") ? "" : (base.Server.UrlDecode(base.Request.Params["begin"].ToString()) + " 00:00");
                if (this.begin.IndexOf(",") > 0)
                {
                    string[] begins = this.begin.Split(new char[] { ',' });
                    this.begin = begins[1];
                }
                this.over = (base.Server.UrlDecode(base.Request.Params["over"].ToString()) == ".") ? "" : (base.Server.UrlDecode(base.Request.Params["over"].ToString()) + " 23:59");
                if (this.over.IndexOf(",") > 0)
                {
                    string[] overs = this.over.Split(new char[] { ',' });
                    this.over = overs[1];
                }
                string sqls = "select sCommission from shops where sNum ='" + PublicMethod.GetSessionValue("shopnum") + "'";
                string[] spr = this.bc.ReadTable(sqls).Rows[0]["sCommission"].ToString().Split(new char[] { '|' });
                this.jine = double.Parse(spr[0].ToString());
                this.bili = double.Parse(spr[1].ToString());
                base.Response.Write(BaseClass.CreateJsonParameters(this.load(pagesize, page), this.loads().Rows.Count));
            }
            catch
            {
            }
        }
    }


