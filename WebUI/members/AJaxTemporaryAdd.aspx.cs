
    using DBUtility;
    using System;
    using System.Text;
    using System.Web.UI;

    public partial class  AJaxTemporaryAdd : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                if (base.Request.QueryString["Type"] == "team")
                {
                    try
                    {
                        string[] SarryLin = base.Request.QueryString["Id"].Split(new char[] { '|' });
                        string[] SarryZhu = base.Request.QueryString["PId"].Split(new char[] { '|' });
                        StringBuilder st = new StringBuilder();
                        for (int i = 0; i < (SarryLin.Length - 1); i++)
                        {
                            st.Append("insert into TemporaryCard (P_Id,Addtime,C_Id) values ('" + SarryZhu[i] + "','" + DateTime.Now.ToString() + "','" + SarryLin[i] + "')");
                        }
                        PublicMethod.Execute(st.ToString());
                        base.Response.Write("true");
                    }
                    catch
                    {
                        base.Response.Write("false");
                    }
                }
                else if (base.Request.QueryString["Type"] == "users")
                {
                    try
                    {
                        PublicMethod.Execute("insert into TemporaryCard (Addtime,C_Id) values ('" + DateTime.Now.ToString() + "','" + base.Request.QueryString["Id"] + "')");
                        base.Response.Write("true");
                    }
                    catch
                    {
                        base.Response.Write("false");
                    }
                }
            }
        }
    }


