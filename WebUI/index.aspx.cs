
    using DBUtility;
    using Model;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  index : Page
    {

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Userinfo userl = new Userinfo();
            switch (userl.UserLogin(this.username.Value.Trim(), DESEncrypt.Encrypt(this.password.Value)))
            {
                case "true":
                    base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script>var manager = $.ligerDialog.waitting('登录成功，正在跳转...');setTimeout(function (){ ll(); }, 1000);;</script>");
                    break;

                case "pwd":
                    base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script>  f_alert2('warn', '输入密码错误！');</script>");
                    break;

                case "user":
                    base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script>f_alert2('warn', '用户名不存在！');</script>");
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
 
            }
        }

        public string ProcessSqlStr(string Str)
        {
            string SqlStr = "exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare";
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
    }


