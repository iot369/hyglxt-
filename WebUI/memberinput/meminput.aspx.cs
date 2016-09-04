
    using DBUtility;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.OleDb;
    using System.Data.SqlClient;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class  meminput : Page
    {
        private BaseClass bc = new BaseClass();
        public string FileName = "";


        private void bcp_SqlRowsCopied(object sender, SqlRowsCopiedEventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile && (this.FileUpload1.PostedFile.ContentLength < 0xa00000))
            {
                this.FileName = this.FileUpload1.PostedFile.FileName.ToString();
                string FileExt = this.FileName.Substring(this.FileName.LastIndexOf("."));
                string FrontFileName = DateTime.Now.ToFileTimeUtc() + this.FileUpload1.PostedFile.ContentLength.ToString();
                this.FileName = "~/memberinput/uploadmen/" + FrontFileName + FileExt;
                try
                {
                    this.FileUpload1.PostedFile.SaveAs(base.Server.MapPath(this.FileName));
                    string connString = ConfigurationManager.AppSettings["ConnectionString"].ToString();
                    this.TransferData(base.Server.MapPath(this.FileName), "membersinfo", connString);
                }
                catch
                {
                }
            }
        }

        public void loadlevel()
        {
            this.ddllevel.Items.Clear();
            this.ddllevel.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from memberlevel  where lStates=1";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddllevel.Items.Add(new ListItem(dtj.Rows[i]["lName"].ToString(), dtj.Rows[i]["lNum"].ToString()));
            }
        }

        public void loadlmake()
        {
            this.ddlmakecard.Items.Clear();
            this.ddlmakecard.Items.Add(new ListItem("请选择", "NONE"));
            string sqlf = "select * from admininfo where aSnum='" + PublicMethod.GetSessionValue("shopnum") + "'";
            DataTable dtj = this.bc.ReadTable(sqlf);
            for (int i = 0; i < dtj.Rows.Count; i++)
            {
                this.ddlmakecard.Items.Add(new ListItem(dtj.Rows[i]["aName"].ToString(), dtj.Rows[i]["aNum"].ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.loadlevel();
                this.loadlmake();
            }
        }

        public void TransferData(string excelFile, string sheetName, string connectionString)
        {
            DataSet ds = new DataSet();
            string Id = "";
            string mobile = "";
            StringBuilder st = new StringBuilder();
            try
            {
                int i;
                string sqlnum;
                string strConn = "provider=Microsoft.ACE.OleDb.12.0; Data Source ='" + excelFile + "';Extended Properties='Excel 12.0;HDR=yes;IMEX=1';";
                OleDbConnection conn = new OleDbConnection(strConn);
                conn.Open();
                new OleDbDataAdapter(string.Format("select * from [{0}$]", this.txtBName.Text), strConn).Fill(ds, "membersinfo");
                ds.Tables[0].Columns.Add("mMakecard", typeof(string));
                ds.Tables[0].Columns.Add("mMakedate", typeof(string));
                ds.Tables[0].Columns.Add("mPastdate", typeof(string));
                ds.Tables[0].Columns.Add("mBalance", typeof(string));
                ds.Tables[0].Columns.Add("mIntegral", typeof(string));
                ds.Tables[0].Columns.Add("mShopNum", typeof(string));
                ds.Tables[0].Columns.Add("mStates", typeof(string));
                ds.Tables[0].Columns.Add("mType", typeof(string));
                ds.Tables[0].Columns.Add("mLevel", typeof(string));
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    sqlnum = "select * from membersinfo where mNum='" + ds.Tables[0].Rows[i]["会员卡号"].ToString() + "'";
                    if (this.bc.ReadTable(sqlnum).Rows.Count > 0)
                    {
                        Id = Id + "'" + ds.Tables[0].Rows[i]["会员卡号"].ToString() + "',";
                        ds.Tables[0].Rows[i].Delete();
                    }
                }
                ds.AcceptChanges();
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    sqlnum = "select * from membersinfo where mMobile='" + ds.Tables[0].Rows[i]["手机"].ToString() + "'";
                    if (this.bc.ReadTable(sqlnum).Rows.Count > 0)
                    {
                        mobile = mobile + "'" + ds.Tables[0].Rows[i]["手机"].ToString() + "',";
                        ds.Tables[0].Rows[i].Delete();
                    }
                }
                ds.AcceptChanges();
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ds.Tables[0].Rows[i]["mMakecard"] = this.ddlmakecard.SelectedValue;
                    ds.Tables[0].Rows[i]["mMakedate"] = DateTime.Now.ToString();
                    ds.Tables[0].Rows[i]["mPastdate"] = DateTime.Now.AddYears(1).ToString();
                    ds.Tables[0].Rows[i]["mBalance"] = "0";
                    ds.Tables[0].Rows[i]["mIntegral"] = "0";
                    ds.Tables[0].Rows[i]["mShopNum"] = PublicMethod.GetSessionValue("shopnum");
                    ds.Tables[0].Rows[i]["mStates"] = "0";
                    ds.Tables[0].Rows[i]["mType"] = "会员卡";
                    ds.Tables[0].Rows[i]["mLevel"] = this.ddllevel.SelectedValue;
                }
                string strSql = string.Format("if object_id('{0}') is null create table {0}(", "membersinfo");
                foreach (DataColumn c in ds.Tables[0].Columns)
                {
                    strSql = strSql + string.Format("[{0}] varchar(255),", c.ColumnName);
                }
                strSql = strSql.Trim(new char[] { ',' }) + ")";
                using (SqlConnection sqlconn = new SqlConnection(connectionString))
                {
                    sqlconn.Open();
                    SqlCommand command = sqlconn.CreateCommand();
                    command.CommandText = strSql;
                    command.ExecuteNonQuery();
                    sqlconn.Close();
                }
                using (SqlBulkCopy bcp = new SqlBulkCopy(connectionString))
                {
                    bcp.SqlRowsCopied += new SqlRowsCopiedEventHandler(this.bcp_SqlRowsCopied);
                    bcp.BatchSize = 100;
                    bcp.NotifyAfter = 100;
                    bcp.DestinationTableName = "membersinfo";
                    bcp.WriteToServer(ds.Tables[0]);
                }
                conn.Close();
                if ((Id.Length > 0) || (mobile.Length > 0))
                {
                    base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('导入成功！');</script>");
                }
                else
                {
                    base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('导入成功！：');</script>");
                }
            }
            catch
            {
                base.ClientScript.RegisterStartupScript(base.ClientScript.GetType(), "myscript", "<script> $.ligerDialog.success('导入失败！');</script>");
            }
        }
    }


