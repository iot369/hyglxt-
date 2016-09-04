
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxselectlevel : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                StringBuilder st = new StringBuilder();
                string lnum = base.Request.QueryString["lnum"].ToString();
                string sqlf = "select * from memberlevel where lNum ='" + lnum + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    st.Append(dt.Rows[0]["lName"].ToString() + "&");
                    st.Append(dt.Rows[0]["lBuyprice"].ToString() + "&");
                    st.Append(dt.Rows[0]["ljifen"].ToString() + "&");
                    st.Append(dt.Rows[0]["lDiscount"].ToString() + "&");
                    st.Append(dt.Rows[0]["lNblance"].ToString() + "&");
                    st.Append(dt.Rows[0]["lNjifen"].ToString() + "&");
                    st.Append(((dt.Rows[0]["lPasttime"].ToString() ?? "") == "") ? "" : (DateTime.Parse(dt.Rows[0]["lPasttime"].ToString()).ToString("yyyy-MM-dd") + "&"));
                    st.Append(dt.Rows[0]["lRemark"].ToString() + "&");
                    st.Append(dt.Rows[0]["lStates"].ToString() ?? "");
                    base.Response.Write(st.ToString());
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


