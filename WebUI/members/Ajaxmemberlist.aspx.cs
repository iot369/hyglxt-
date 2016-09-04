
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxmemberlist : Page
    {
        private BaseClass bc = new BaseClass();

        public static string CreateJsonParameters(DataTable dt, int cout)
        {
            StringBuilder JsonString = new StringBuilder();
            if ((dt != null) && (dt.Rows.Count > 0))
            {
                JsonString.Append("{ ");
                JsonString.Append("Rows:[ ");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    JsonString.Append("{ ");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        if (j < (dt.Columns.Count - 1))
                        {
                            JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == (dt.Columns.Count - 1))
                        {
                            JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == (dt.Rows.Count - 1))
                    {
                        JsonString.Append("} ");
                    }
                    else
                    {
                        JsonString.Append("}, ");
                    }
                }
                JsonString.Append("],Total:" + cout + "}");
                return JsonString.ToString();
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int page = int.Parse(base.Request.Params["page"].ToString());
                int pagesize = int.Parse(base.Request.Params["pagesize"].ToString());
                string mnum = (base.Request.Params["mnum"].ToString() == "") ? "" : base.Request.Params["mnum"].ToString().Substring(1);
                string mmobile = (base.Request.Params["mmobile"].ToString() == "") ? "" : base.Request.Params["mmobile"].ToString().Substring(1);
                string mname = (base.Server.UrlDecode(base.Request.Params["mname"].ToString()) == "") ? "" : base.Server.UrlDecode(base.Request.Params["mname"].ToString()).Substring(1);
                string lnum = (base.Server.UrlDecode(base.Request.Params["lnum"].ToString()) == "") ? "" : base.Server.UrlDecode(base.Request.Params["lnum"].ToString()).Substring(1);
                string sname = base.Server.UrlDecode(base.Request.Params["sname"].ToString());
                string sqll = "where 1=1 and membersinfo.mShopNum=shops.sNum and membersinfo.mLevel=memberlevel.lNum ";
                if (mnum != "")
                {
                    sqll = sqll + "and  charindex('" + mnum + "', membersinfo.mNum)>0";
                }
                if (mname != "")
                {
                    sqll = sqll + "and  charindex('" + mname + "', membersinfo.mName)>0";
                }
                if (mmobile != "")
                {
                    sqll = sqll + "and  charindex('" + mmobile + "', membersinfo.mMobile)>0";
                }
                if (lnum != "")
                {
                    sqll = sqll + "and  charindex('" + lnum + "', membersinfo.mLevel)>0";
                }
                if (sname != "总部")
                {
                    sqll = sqll + " and shops.sNum='" + PublicMethod.GetSessionValue("shopnum").ToString() + "'";
                }
                string sqlwhat = "membersinfo.mId,mNum,mName,mMobile,mLevel,mBalance,mIntegral,mStates,mMakedate,mPastdate,mShopNum,shops.sName,sNum,memberlevel.lName,lNum";
                int coutt = PublicMethod.QueryDataset("select " + sqlwhat + " from shops,membersinfo,memberlevel " + sqll).Tables[0].Rows.Count;
                DataTable dt = PublicMethod.FindForPageAll(page, pagesize, sqll, "shops,membersinfo,memberlevel", "membersinfo.mId", sqlwhat);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(CreateJsonParameters(dt, coutt));
                }
                else
                {
                    string jsonstr = "{ Rows:[],Total:0}";
                    base.Response.Write(jsonstr);
                }
            }
            catch
            {
            }
        }
    }


