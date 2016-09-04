
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class Ajaxloadci : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                StringBuilder st = new StringBuilder();
                string mnum = base.Request.QueryString["mnum"].ToString();
                string sqlf = "select * from conscishu where uMnum ='" + mnum + "' and uCount!=0 ";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string daten = DateTime.Now.ToString("yyyy-MM-dd");
                        string datew = dt.Rows[i]["uPastdate"].ToString();
                        string datee = "";
                        if (datew == "永久")
                        {
                            datee = "1";
                        }
                        else if (DateTime.Parse(daten) > DateTime.Parse(datew))
                        {
                            datee = "0";
                        }
                        else
                        {
                            datee = "1";
                        }
                        string ss = dt.Rows[i]["uId"].ToString() + "#" + dt.Rows[i]["uName"].ToString() + "#" + dt.Rows[i]["uCount"].ToString() + "#" + dt.Rows[i]["uPastdate"].ToString() + "#" + datee + "|";
                        st.Append(ss);
                    }
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


