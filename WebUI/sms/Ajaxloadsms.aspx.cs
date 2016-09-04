
    using DBUtility;
    using System;
    using System.Data;
    using System.Text;
    using System.Web.UI;

    public partial class  Ajaxloadsms : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sqlf = "select xuhao,Pwd,type,states,contents from messageset where type = 'sms'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    StringBuilder balance = new StringBuilder("0000000000");
                    int result = EUCPComm.GetBalance(dt.Rows[0]["xuhao"].ToString(), balance);
                    string _Response = "";
                    string mybalance = balance.ToString(0, balance.Length);
                    if (result == 1)
                    {
                        _Response = mybalance;
                    }
                    base.Response.Write(dt.Rows[0]["xuhao"].ToString() + "&" + dt.Rows[0]["Pwd"].ToString() + "&" + dt.Rows[0]["states"].ToString() + "&" + _Response + "&" + dt.Rows[0]["contents"].ToString());
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


