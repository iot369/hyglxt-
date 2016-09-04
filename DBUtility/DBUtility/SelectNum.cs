namespace DBUtility
{
    using System;
    using System.Data;

    public class SelectNum
    {
        public string GetNumId(string type, int lenght)
        {
            DataTable table = PublicMethod.QueryDataset("select Num from SetId SelectNum where Type='" + type + "'").Tables[0];
            int num = lenght - table.Rows[0][0].ToString().Length;
            string str2 = type;
            for (int i = 0; i < num; i++)
            {
                str2 = str2 + "0";
            }
            PublicMethod.Execute("update SetId set Num=Num+1 where Type='" + type + "'");
            return (str2 + table.Rows[0][0].ToString());
        }
    }
}

