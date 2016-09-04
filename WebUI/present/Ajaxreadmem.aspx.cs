
    using DBUtility;
    using System;
    using System.Data;
    using System.Web.UI;

    public partial class  Ajaxreadmem : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select membersinfo.mName,membersinfo.mNum,membersinfo.mLevel,membersinfo.mIntegral,memberlevel.lName,memberlevel.lNum from membersinfo,memberlevel where membersinfo.mLevel=memberlevel.lNum and mNum ='" + base.Request.QueryString["mnum"].ToString() + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write(dt.Rows[0]["lName"].ToString() + "&" + dt.Rows[0]["mName"].ToString() + "&" + dt.Rows[0]["mIntegral"].ToString() + "&" + dt.Rows[0]["mNum"].ToString());
                }
                else
                {
                    string sqlfs = "select membersinfo.mName,membersinfo.mNum,membersinfo.mLevel,membersinfo.mIntegral,memberlevel.lName,memberlevel.lNum from membersinfo,memberlevel where membersinfo.mLevel=memberlevel.lNum and mMobile ='" + base.Request.QueryString["mnum"].ToString() + "'";
                    DataTable dts = this.bc.ReadTable(sqlfs);
                    if (dts.Rows.Count > 0)
                    {
                        base.Response.Write(dts.Rows[0]["lName"].ToString() + "&" + dts.Rows[0]["mName"].ToString() + "&" + dts.Rows[0]["mIntegral"].ToString() + "&" + dts.Rows[0]["mNum"].ToString());
                    }
                    else
                    {
                        base.Response.Write("false");
                    }
                }
            }
            catch
            {
                base.Response.Write("false");
            }
        }
    }


