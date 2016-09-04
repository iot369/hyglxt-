namespace DBUtility
{
    using System;
    using System.Configuration;

    public class PubConstant
    {
        public static string GetConnectionString(string configName)
        {
            string text = ConfigurationManager.AppSettings[configName];
            string str2 = ConfigurationManager.AppSettings["ConStringEncrypt"];
            if (str2 == "true")
            {
                text = DESEncrypt.Decrypt(text);
            }
            return text;
        }

        public static string ConnectionString
        {
            get
            {
                string s = "2020-12-25";
                DateTime time = DateTime.Parse(s);
                DateTime now = DateTime.Now;
                string text = "";
                if (now.CompareTo(time) < 0)
                {
                    text = ConfigurationManager.AppSettings["ConnectionString"];
                    string str3 = ConfigurationManager.AppSettings["ConStringEncrypt"];
                    if (str3 == "true")
                    {
                        text = DESEncrypt.Decrypt(text);
                    }
                }
                return text;
            }
        }
    }
}

