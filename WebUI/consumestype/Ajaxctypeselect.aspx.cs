
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxctypeselect : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                StringBuilder st = new StringBuilder();
                string tnum = base.Request.QueryString["tnum"].ToString();
                string sqlf = "select * from consumetype where tNum ='" + tnum + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    st.Append(dt.Rows[0]["tName"].ToString() + "&");
                    st.Append(dt.Rows[0]["tRemarks"].ToString() + "&");
                    st.Append(dt.Rows[0]["tsNum"].ToString() ?? "");
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


