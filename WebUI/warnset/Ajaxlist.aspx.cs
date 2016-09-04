
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxlist : Page
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
                string sqlwhat;
                int page = int.Parse(base.Request.Params["page"].ToString());
                int pagesize = int.Parse(base.Request.Params["pagesize"].ToString());
                string lnum = base.Server.UrlDecode(base.Request.Params["lnum"].ToString());
                if (lnum.IndexOf(",") > 0)
                {
                    lnum = lnum.Split(new char[] { ',' })[1];
                }
                string sqll = "where 1=1 and membersinfo.mShopNum=shops.sNum and membersinfo.mLevel=memberlevel.lNum and shops.sNum='" + PublicMethod.GetSessionValue("shopnum").ToString() + "'";
                if (lnum == "001")
                {
                    sqll = sqll + " and  membersinfo.mPastdate!='永久有效' and DATEDIFF(day, membersinfo.mPastdate,getdate())>=0 ";
                }
                else
                {
                    switch (lnum)
                    {
                        case "003":
                            sqll = sqll + " and  membersinfo.mBalance<10  ";
                            break;

                        case "004":
                            sqll = sqll + " and   DATEDIFF(day, membersinfo.mBirth,getdate())<=3 ";
                            break;

                        case "002":
                        {
                            string detail = "";
                            string sqlf = "select distinct Card_Id from Consumption_Back_select where datediff(month,Addtime,getdate())<3  ";
                            DataTable dtf = this.bc.ReadTable(sqlf);
                            if (dtf.Rows.Count > 0)
                            {
                                for (int i = 0; i < dtf.Rows.Count; i++)
                                {
                                    detail = detail + dtf.Rows[i]["Card_Id"].ToString() + "|";
                                }
                            }
                            sqll = sqll + " and  charindex(mNum,'" + detail + "')=0 and datediff(month,mMakedate,getdate())>3";
                            goto Label_01E4;
                        }
                    }
                }
            Label_01E4:
                sqlwhat = "membersinfo.mId,mNum,mName,mMobile,mLevel,mBalance,mIntegral,mStates,mMakedate,mPastdate,mShopNum,shops.sName,sNum,memberlevel.lName,lNum";
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


