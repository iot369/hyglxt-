namespace DBUtility
{
    using System;
    using System.Data;
    using System.Data.SqlClient;

    public class DataValidate
    {
        public static string GetQuotedString(string pStr)
        {
            return pStr.Replace("'", "''");
        }

        public static bool IsDateTime(object val)
        {
            try
            {
                Convert.ToDateTime(val);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsDouble(object val)
        {
            try
            {
                Convert.ToDouble(val);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsInt(object val)
        {
            try
            {
                Convert.ToInt32(val);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsString(object val)
        {
            try
            {
                Convert.ToString(val);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static double ValidateDataReader_F(SqlDataReader reader, string colname)
        {
            if (reader.GetValue(reader.GetOrdinal(colname)) != DBNull.Value)
            {
                return reader.GetDouble(reader.GetOrdinal(colname));
            }
            return double.MinValue;
        }

        public static int ValidateDataReader_N(SqlDataReader reader, string colname)
        {
            if (reader.GetValue(reader.GetOrdinal(colname)) != DBNull.Value)
            {
                return reader.GetInt32(reader.GetOrdinal(colname));
            }
            return -2147483648;
        }

        public static string ValidateDataReader_S(SqlDataReader reader, string colname)
        {
            if (reader.GetValue(reader.GetOrdinal(colname)) != DBNull.Value)
            {
                return reader.GetString(reader.GetOrdinal(colname));
            }
            return string.Empty;
        }

        public static DateTime ValidateDataReader_T(SqlDataReader reader, string colname)
        {
            if (reader.GetValue(reader.GetOrdinal(colname)) != DBNull.Value)
            {
                return reader.GetDateTime(reader.GetOrdinal(colname));
            }
            return DateTime.MinValue;
        }

        public static double ValidateDataRow_F(DataRow row, string colname)
        {
            if (row[colname] != DBNull.Value)
            {
                return Convert.ToDouble(row[colname]);
            }
            return double.MinValue;
        }

        public static int ValidateDataRow_N(DataRow row, string colname)
        {
            if (row[colname] != DBNull.Value)
            {
                return Convert.ToInt32(row[colname]);
            }
            return -2147483648;
        }

        public static string ValidateDataRow_S(DataRow row, string colname)
        {
            if (row[colname] != DBNull.Value)
            {
                return row[colname].ToString();
            }
            return string.Empty;
        }

        public static DateTime ValidateDataRow_T(DataRow row, string colname)
        {
            if (row[colname] != DBNull.Value)
            {
                return Convert.ToDateTime(row[colname]);
            }
            return DateTime.MinValue;
        }
    }
}

