
    using DBUtility;
    using System;
    using System.IO;
    using System.Web;
    using System.Web.UI;

    public partial class  AjaxUpload : Page
    {
        private BaseClass bc = new BaseClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpFileCollection files = base.Request.Files;
            string gnum = base.Request.QueryString["gnum"].ToString();
            if ((files != null) && (files.Count > 0))
            {
                HttpPostedFile file = files[0];
                string tmpPath = base.Server.MapPath("pimg/");
                string fileName = gnum + "-" + DateTime.Now.ToString("yyyyMMddHHmmssffff") + Path.GetFileName(file.FileName);
                try
                {
                    string sqladd;
                    file.SaveAs(tmpPath + fileName);
                    string sqlf = "select * from presentimg where gNum='" + gnum + "'";
                    if (this.bc.ReadTable(sqlf).Rows.Count > 0)
                    {
                        sqladd = "update  presentimg set Imgs='" + fileName + "' where gNum='" + gnum + "'";
                        this.bc.execsql(sqladd);
                    }
                    else
                    {
                        sqladd = "insert into presentimg(Imgs,gNum) values('" + fileName + "','" + gnum + "')";
                        this.bc.execsql(sqladd);
                    }
                    base.Response.Write("{\r\n                    status : 'success', \r\n                    msg: { \r\n                        Origin : 'pimg/" + fileName + "' \r\n                       \r\n                    }\r\n                    \r\n                }");
                }
                catch (Exception ex)
                {
                    base.Response.Write("{\r\n                status : 'error',\r\n                msg : '" + ex.Message + "'\r\n                }");
                    base.Response.End();
                }
            }
        }
    }


