namespace DBUtility
{
    using System;
    using System.Data;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Xml;

    public class PublicMethod
    {
        public static void BindDDL(CheckBoxList MyDDL, string FenGeStr)
        {
            MyDDL.Items.Clear();
            string[] strArray = FenGeStr.Split(new char[] { '|' });
            for (int i = 0; i < strArray.Length; i++)
            {
                if (strArray[i].ToString().Trim().Length > 0)
                {
                    ListItem item = new ListItem();
                    item.Text = strArray[i].ToString();
                    item.Value = strArray[i].ToString();
                    MyDDL.Items.Add(item);
                }
            }
        }

        public static void BindDDL(DropDownList MyDDL, string FenGeStr)
        {
            MyDDL.Items.Clear();
            ListItem item = new ListItem();
            string[] strArray = FenGeStr.Split(new char[] { '|' });
            for (int i = 0; i < strArray.Length; i++)
            {
                if (strArray[i].ToString().Trim().Length > 0)
                {
                    ListItem item2 = new ListItem();
                    item2.Text = strArray[i].ToString();
                    item2.Value = strArray[i].ToString();
                    MyDDL.Items.Add(item2);
                }
            }
        }

        public static void BindDDLForEmPty(DropDownList MyDDL, string FenGeStr)
        {
            ListItem item = new ListItem();
            item.Text = "";
            item.Value = "";
            MyDDL.Items.Add(item);
            string[] strArray = FenGeStr.Split(new char[] { '|' });
            for (int i = 0; i < strArray.Length; i++)
            {
                if (strArray[i].ToString().Trim().Length > 0)
                {
                    ListItem item2 = new ListItem();
                    item2.Text = strArray[i].ToString();
                    item2.Value = strArray[i].ToString();
                    MyDDL.Items.Add(item2);
                }
            }
        }

        public static string CheckCbx(GridView GVData, string CheckBoxName, string LabID)
        {
            string str = "";
            for (int i = 0; i < GVData.Rows.Count; i++)
            {
                GridViewRow row = GVData.Rows[i];
                CheckBox box = (CheckBox) row.FindControl(CheckBoxName);
                Label label = (Label) row.FindControl(LabID);
                if (box.Checked)
                {
                    if (str == "")
                    {
                        str = label.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + label.Text.ToString();
                    }
                }
            }
            return str;
        }

        public static void CheckSession()
        {
            try
            {
                if (HttpContext.Current.Session["username"] == null)
                {
                }
            }
            catch
            {
            }
        }

        public static void EditAppValue(string KeyNameStr, string SetValueStr)
        {
            XmlDocument document = new XmlDocument();
            try
            {
                document.Load(HttpContext.Current.Request.MapPath("../Web.config"));
                document.SelectSingleNode("/configuration/appSettings/add[@key='" + KeyNameStr + "']").Attributes["value"].Value = SetValueStr;
                document.Save(HttpContext.Current.Request.MapPath("../web.config"));
                HttpContext.Current.Response.Write("<script>alert('配置数据修改完成！');</script>");
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write("<script>alert('" + exception.Message.ToString() + "');</script>");
            }
            finally
            {
                document = null;
            }
        }

        public static int Execute(string sql)
        {
            return DbHelperSQL.ExecuteSql(sql);
        }

        public static DataTable FindForPage(int pageIndex, int PageSize, string strWhere, string tablename, string orderkey)
        {
            return DbHelperSQL.Query(string.Concat(new object[] { "select * from (select *,cols = row_number() over(order by [", orderkey, "] desc) from [", tablename, "] ", strWhere, ") as temp where cols>", (pageIndex - 1) * PageSize, " and cols<=", pageIndex * PageSize })).Tables[0];
        }

        public static DataTable FindForPageAll(int pageIndex, int PageSize, string strWhere, string tablename, string orderkey, string selectwhat)
        {
            return DbHelperSQL.Query(string.Concat(new object[] { "select * from (select ", selectwhat, ",cols = row_number() over(order by ", orderkey, " desc) from ", tablename, " ", strWhere, ") as temp where cols>", (pageIndex - 1) * PageSize, " and cols<=", pageIndex * PageSize })).Tables[0];
        }

        public static void GetCheckList(CheckBoxList MyChk, string PerStr)
        {
            for (int i = 0; i < MyChk.Items.Count; i++)
            {
                if (StrIFIn("|" + MyChk.Items[i].Value.ToString() + "|", PerStr))
                {
                    MyChk.Items[i].Selected = true;
                }
                else
                {
                    MyChk.Items[i].Selected = false;
                }
            }
        }

        public static string GetListStr(ListBox List1, ListBox List2, string CanShu1, string CanShu2)
        {
            int num;
            if (CanShu1 == "添加")
            {
                if (CanShu2 == "全部")
                {
                    for (num = 0; num < List1.Items.Count; num++)
                    {
                        if (List2.Items.IndexOf(List1.Items[num]) < 0)
                        {
                            List2.Items.Add(List1.Items[num]);
                        }
                    }
                }
                else
                {
                    num = 0;
                    while (num < List1.Items.Count)
                    {
                        if (List1.Items[num].Selected && (List2.Items.IndexOf(List1.Items[num]) < 0))
                        {
                            List2.Items.Add(List1.Items[num]);
                        }
                        num++;
                    }
                }
            }
            else if (CanShu2 == "全部")
            {
                List2.Items.Clear();
            }
            else
            {
                for (num = 0; num < List2.Items.Count; num++)
                {
                    if (List2.Items[num].Selected)
                    {
                        List2.Items.Remove(List2.Items[num]);
                        num--;
                    }
                }
            }
            string str = string.Empty;
            for (int i = 0; i < List2.Items.Count; i++)
            {
                if (str.Trim().Length > 0)
                {
                    str = str + "," + List2.Items[i].Text.Trim();
                }
                else
                {
                    str = List2.Items[i].Text.Trim();
                }
            }
            return str;
        }

        public static string GetSessionValue(string SessionKey)
        {
            try
            {
                return HttpContext.Current.Session[SessionKey].ToString();
            }
            catch
            {
                return "NoLogin";
            }
        }

        public static string GetStringFromCheckList(CheckBoxList MyChk)
        {
            string str = string.Empty;
            for (int i = 0; i < MyChk.Items.Count; i++)
            {
                if (MyChk.Items[i].Selected)
                {
                    str = str + "|" + MyChk.Items[i].Value.ToString() + "|";
                }
            }
            return str;
        }

        public static string GetVoteTable(string ContentStr, string ScoreStr, string IDStr, bool IFTouGuo)
        {
            string str = "<table>";
            string str2 = "</table>";
            string str3 = string.Empty;
            string[] strArray = ContentStr.Split(new char[] { '|' });
            string[] strArray2 = ScoreStr.Split(new char[] { '|' });
            double num = 0.0;
            for (int i = 0; i < strArray2.Length; i++)
            {
                double num3 = double.Parse(strArray2[i]);
                if (num3 > num)
                {
                    num = num3;
                }
            }
            if (num == 0.0)
            {
                num = 1.0;
            }
            for (int j = 0; j < strArray.Length; j++)
            {
                string[] strArray3;
                double num5 = (double.Parse(strArray2[j]) / num) * 250.0;
                if (IFTouGuo)
                {
                    strArray3 = new string[10];
                    strArray3[0] = str3;
                    strArray3[1] = "<tr><td><img src=\"../images/ShiWuSmall.jpg\" /></td><td>";
                    int num6 = j + 1;
                    strArray3[2] = num6.ToString();
                    strArray3[3] = "：";
                    strArray3[4] = strArray[j];
                    strArray3[5] = "&nbsp;&nbsp;&nbsp;&nbsp;</td><td>得票：<img src=\"../images/vote_bg.gif\" height=10 width=";
                    strArray3[6] = num5.ToString();
                    strArray3[7] = "  />&nbsp;&nbsp;";
                    strArray3[8] = strArray2[j];
                    strArray3[9] = "&nbsp;&nbsp;&nbsp;&nbsp;</td><td></td></tr>";
                    str3 = string.Concat(strArray3);
                }
                else
                {
                    strArray3 = new string[] { str3, "<tr><td><img src=\"../images/ShiWuSmall.jpg\" /></td><td>", (j + 1).ToString(), "：", strArray[j], "&nbsp;&nbsp;&nbsp;&nbsp;</td><td>得票：<img src=\"../images/vote_bg.gif\" height=10 width=", num5.ToString(), "  />&nbsp;&nbsp;", strArray2[j], "&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href=VoteYiPiao.aspx?TouPiaoTextID=", j.ToString(), "&ID=", IDStr, "><img border=\"0\" src=\"../images/Button/vote.gif\" /></a></td></tr>" };
                    str3 = string.Concat(strArray3);
                }
            }
            return (str + str3 + str2);
        }

        public static string GetWenJian(string WenJianList, string DirStr)
        {
            string[] strArray = WenJianList.Split(new char[] { '|' });
            string str = string.Empty;
            for (int i = 0; i < strArray.Length; i++)
            {
                if (strArray[i].ToString().Trim().Length > 0)
                {
                    string sHSL;
                    if (str.Trim().Length > 0)
                    {
                        if (strArray[i].ToString().IndexOf("MailAttachments/") >= 0)
                        {
                            str = str + "&nbsp;&nbsp;&nbsp;&nbsp;<img src=../images/ico_clip.gif /><a target=\"_blank\" href='" + DirStr + strArray[i].ToString() + "'>" + strArray[i].ToString().Replace("MailAttachments/", "") + "</a>";
                        }
                        else
                        {
                            sHSL = DbHelperSQL.GetSHSL("select OldName from ERPSaveFileName where NowName='" + strArray[i].ToString().Replace("MailAttachments/", "") + "'");
                            if (sHSL.Trim().Length <= 0)
                            {
                                sHSL = strArray[i].ToString().Replace("MailAttachments/", "");
                            }
                            str = str + "&nbsp;&nbsp;&nbsp;&nbsp;<img src=../images/ico_clip.gif /><a target=\"_blank\" href='" + DirStr + strArray[i].ToString() + "'>" + sHSL + "</a>&nbsp;<a href='../DsoFramer/ReadFile.aspx?FilePath=" + strArray[i].ToString() + "' target='_blank'><img border=0 src=../images/Button/ReadFile.gif /></a>";
                        }
                    }
                    else if (strArray[i].ToString().IndexOf("MailAttachments/") >= 0)
                    {
                        str = "<img src=../images/ico_clip.gif /><a target=\"_blank\" href='" + DirStr + strArray[i].ToString() + "'>" + strArray[i].ToString().Replace("MailAttachments/", "") + "</a>";
                    }
                    else
                    {
                        sHSL = DbHelperSQL.GetSHSL("select OldName from ERPSaveFileName where NowName='" + strArray[i].ToString().Replace("MailAttachments/", "") + "'");
                        if (sHSL.Trim().Length <= 0)
                        {
                            sHSL = strArray[i].ToString().Replace("MailAttachments/", "");
                        }
                        str = "<img src=../images/ico_clip.gif /><a target=\"_blank\" href='" + DirStr + strArray[i].ToString() + "'>" + sHSL + "</a>&nbsp;<a href='../DsoFramer/ReadFile.aspx?FilePath=" + strArray[i].ToString() + "' target='_blank'><img border=0 src=../images/Button/ReadFile.gif /></a>";
                    }
                }
            }
            if (str.ToString().Trim().Length <= 0)
            {
                str = str + "无文件！";
            }
            return str;
        }

        public static void GridViewRowDataBound(GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#E4F4FF'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }

        public static bool IfOkFile(string DirName)
        {
            bool flag = true;
            try
            {
                string str = DirName.Split(new char[] { '.' })[1].ToString();
                if (DbHelperSQL.GetSHSL("select FileType from ERPSystemSetting where FileType like '%|" + str + "|%'").Length < 1)
                {
                    flag = false;
                }
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public static void JSbox(string str)
        {
            string key = "somekey";
            Page handler = HttpContext.Current.Handler as Page;
            handler.ClientScript.RegisterStartupScript(typeof(string), key, str, true);
        }

        public static string LongToShortStr(string LongStr, int StrNum)
        {
            try
            {
                return (LongStr.Substring(0, StrNum - 2) + "……");
            }
            catch
            {
                return LongStr;
            }
        }

        public static DataSet QueryDataset(string sql)
        {
            return DbHelperSQL.Query(sql);
        }

        public static void SetSessionValue(string SessionKey, string ValueStr)
        {
            HttpContext.Current.Session[SessionKey] = ValueStr;
        }

        public static void Show(Page page, string msg)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
        }

        public static bool StrIFIn(string Str1, string Str2)
        {
            if (Str2.IndexOf(Str1) < 0)
            {
                return false;
            }
            return true;
        }

        public static string StripHTML(string strHtml)
        {
            string[] strArray = new string[] { "<script[^>]*?>.*?</script>", "<(\\/\\s*)?!?((\\w+:)?\\w+)(\\w+(\\s*=?\\s*(([\"'])(\\\\[\"'tbnr]|[^\\7])*?\\7|\\w+)|.{0})|\\s)*?(\\/\\s*)?>", @"([\r\n])[\s]+", "&(quot|#34);", "&(amp|#38);", "&(lt|#60);", "&(gt|#62);", "&(nbsp|#160);", "&(iexcl|#161);", "&(cent|#162);", "&(pound|#163);", "&(copy|#169);", @"&#(\d+);", "-->", @"<!--.*\n" };
            string[] strArray2 = new string[] { "", "", "", "\"", "&", "<", ">", " ", "\x00a1", "\x00a2", "\x00a3", "\x00a9", "", "\r\n", "" };
            string str = strArray[0];
            string input = strHtml;
            for (int i = 0; i < strArray.Length; i++)
            {
                input = new Regex(strArray[i], RegexOptions.IgnoreCase).Replace(input, strArray2[i]);
            }
            input.Replace("<", "");
            input.Replace(">", "");
            input.Replace("\r\n", "");
            return input;
        }
    }
}

