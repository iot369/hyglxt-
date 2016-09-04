
    using DBUtility;
    using System;
    using System.Data;
    using System.Web;
    using System.Web.UI;

    public partial class  AjaxDate : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (base.Request.QueryString["Type"] == "getuser")
            {
                try
                {
                    DataTable dtMbr = PublicMethod.QueryDataset("select mNum,mLevel,mName,mBalance,convert(varchar(100), mPastdate,23) as 'mPastdate',mType,mPwd,mIntegral from membersinfo where mNum='" + base.Request.QueryString["Id"] + "'").Tables[0];
                    if (dtMbr.Rows.Count > 0)
                    {
                        if (int.Parse(DateTime.Parse(dtMbr.Rows[0]["mPastdate"].ToString()).ToString("yyyyMMdd")) < int.Parse(DateTime.Now.ToString("yyyyMMdd")))
                        {
                            base.Response.Write("OutDate");
                        }
                        else
                        {
                            string sql = "";
                            DataTable dtLevel = PublicMethod.QueryDataset("select lName,lDiscount,ljifen from memberlevel where lNum='" + dtMbr.Rows[0]["mLevel"].ToString() + "'").Tables[0];
                            if (dtLevel.Rows.Count > 0)
                            {
                                sql = dtMbr.Rows[0]["mNum"].ToString() + "@" + dtLevel.Rows[0]["lName"].ToString() + "@" + dtMbr.Rows[0]["mName"].ToString() + "@" + dtMbr.Rows[0]["mBalance"].ToString() + "@" + dtMbr.Rows[0]["mPastdate"].ToString() + "@" + dtLevel.Rows[0]["lDiscount"].ToString() + "@" + dtLevel.Rows[0]["ljifen"].ToString();
                            }
                            base.Response.Write(sql);
                        }
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
            else if (base.Request.QueryString["Type"] == "postdate")
            {
                try
                {
                    DataTable dtPwd = PublicMethod.QueryDataset("select mNum from membersinfo where mNum='" + base.Request.QueryString["Id"] + "' and mPwd='" + DESEncrypt.Encrypt(base.Request.QueryString["pwd"]) + "'").Tables[0];
                    if (dtPwd.Rows.Count > 0)
                    {
                        string C_Id = base.Request.QueryString["XFId"];
                        string str = "insert into Consumption_Back (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName) values (";
                        object name9 = str;
                        name9 = string.Concat(new object[] { name9, "'", C_Id, "','", base.Request.QueryString["Id"], "','终端消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["Webnames"], "','终端支付'" });
                        name9 = string.Concat(new object[] { name9, ",'", HttpContext.Current.Session["Webshopname"], "','", HttpContext.Current.Session["Webshopnum"], "','", base.Request.QueryString["money"], "','余额支付','','", base.Request.QueryString["txtname"], "')" }) + "insert into Consumption_Back_select (C_Id,Card_Id,Type,Addtime,Users,Remark,Shop,ShopId,Money,PayType,Consum_Type,ClientName) values (";
                        name9 = string.Concat(new object[] { name9, "'", C_Id, "','", base.Request.QueryString["Id"], "','终端消费','", DateTime.Now.ToString(), "','", HttpContext.Current.Session["Webnames"], "','终端支付'" });
                        string name5 = string.Concat(new object[] { name9, ",'", HttpContext.Current.Session["Webshopname"], "','", HttpContext.Current.Session["Webshopnum"], "','", base.Request.QueryString["money"], "','余额支付','','", base.Request.QueryString["txtname"], "')" });
                        PublicMethod.Execute(name5 + "  update membersinfo set mBalance=mBalance-" + base.Request.QueryString["money"] + ",mIntegral=mIntegral+" + base.Request.QueryString["AllJifen"] + " where mNum='" + base.Request.QueryString["Id"] + "'");
                        base.Response.Write("true");
                    }
                    else
                    {
                        base.Response.Write("pwd");
                    }
                }
                catch
                {
                    base.Response.Write("false");
                }
            }
            else if (base.Request.QueryString["Type"] == "getId")
            {
                base.Response.Write("XF" + base.Request.QueryString["Id"] + DateTime.Now.ToString("yyyyMMddHHmmssffff"));
            }
            else if (base.Request.QueryString["Type"] == "checkId")
            {
                DataTable dt = PublicMethod.QueryDataset("select Id from Consumption_Back where C_Id ='" + base.Request.QueryString["Id"] + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    base.Response.Write("true");
                }
                else
                {
                    base.Response.Write("false");
                }
            }
        }
    }


