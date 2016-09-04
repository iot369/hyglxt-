
    using DBUtility;
    using System;
    using System.Web.UI;

    public partial class  selectdate : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            string type = base.Request.QueryString["type"].ToString();
            string date = "";
            switch (type)
            {
                case "100":
                    date = "永久有效";
                    break;

                case "30":
                    date = DateTime.Now.AddMonths(1).ToString("yyyy-MM-dd");
                    break;

                case "90":
                    date = DateTime.Now.AddMonths(3).ToString("yyyy-MM-dd");
                    break;

                case "180":
                    date = DateTime.Now.AddMonths(6).ToString("yyyy-MM-dd");
                    break;

                case "1":
                    date = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
                    break;

                case "3":
                    date = DateTime.Now.AddYears(3).ToString("yyyy-MM-dd");
                    break;
            }
            base.Response.Write(date);
        }
    }


