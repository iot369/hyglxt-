namespace Model
{
    using DBUtility;
    using System;
    using System.Data;
    using System.Web;

    public class Userinfo
    {
        public static int _id;
        public static string _shopnum;
        public static string _userjue;
        public static string _username;
        private BaseClass bc = new BaseClass();

        public string ProcessSqlStr(string Str)
        {
            string SqlStr = "'|exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare";
            string ReturnValue = Str;
            try
            {
                if (Str != "")
                {
                    string[] anySqlStr = SqlStr.Split(new char[] { '|' });
                    foreach (string ss in anySqlStr)
                    {
                        if (Str.ToLower().IndexOf(ss) >= 0)
                        {
                            ReturnValue = "";
                        }
                    }
                }
            }
            catch
            {
                ReturnValue = "";
            }
            if (Str.Length > 20)
            {
                ReturnValue = "";
            }
            return ReturnValue;
        }

        public string UserLogin(string MyUserName, string MyUserPwd)
        {
            DataRow MyDataRow = DbHelperSQL.GetDataRow("select * from admininfo where aUserName='" + this.ProcessSqlStr(MyUserName) + "'");
            if (MyDataRow == null)
            {
                return "user";
            }
            if (MyUserPwd == DataValidate.ValidateDataRow_S(MyDataRow, "aPwd"))
            {
                HttpContext.Current.Session["names"] = DataValidate.ValidateDataRow_S(MyDataRow, "aName");
                HttpContext.Current.Session["nums"] = DataValidate.ValidateDataRow_S(MyDataRow, "aNum");
                HttpContext.Current.Session["username"] = DataValidate.ValidateDataRow_S(MyDataRow, "aUserName");
                HttpContext.Current.Session["userjiao"] = DataValidate.ValidateDataRow_S(MyDataRow, "aRnum");
                HttpContext.Current.Session["shopnum"] = DataValidate.ValidateDataRow_S(MyDataRow, "aSnum");
                string sqlf = "select sName from shops where sNum = '" + DataValidate.ValidateDataRow_S(MyDataRow, "aSnum") + "'";
                DataTable dt = this.bc.ReadTable(sqlf);
                if (dt.Rows.Count > 0)
                {
                    HttpContext.Current.Session["shopname"] = dt.Rows[0]["sName"].ToString();
                }
                return "true";
            }
            return "pwd";
        }
    }
}

