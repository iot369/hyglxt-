namespace DBUtility
{
    using System;
    using System.Data;

    public static class ServiceData
    {
        public static DataTable GetWeekMoneyAndCost()
        {
            DataTable table = new DataTable();
            table.Columns.Add("week", typeof(string));
            table.Columns.Add("money", typeof(decimal));
            table.Columns.Add("cost", typeof(decimal));
            table.Rows.Add(new object[] { "星期一", 0x4b0, 400 });
            table.Rows.Add(new object[] { "星期二", 0x708, 750 });
            table.Rows.Add(new object[] { "星期三", 890, 320 });
            table.Rows.Add(new object[] { "星期四", 0x438, 290 });
            table.Rows.Add(new object[] { "星期五", 0xaf0, 0x3fc });
            table.Rows.Add(new object[] { "星期六", 0xc80, 0x4ec });
            table.Rows.Add(new object[] { "星期日", 0x1194, 0x910 });
            return table;
        }
    }
}

