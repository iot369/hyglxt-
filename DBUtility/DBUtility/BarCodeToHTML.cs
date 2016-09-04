namespace DBUtility
{
    using System;
    using System.Collections;
    using System.Text.RegularExpressions;

    public class BarCodeToHTML
    {
        private static string ean13(char c, char type)
        {
            switch (type)
            {
                case 'A':
                    switch (c)
                    {
                        case '0':
                            return "0001101";

                        case '1':
                            return "0011001";

                        case '2':
                            return "0010011";

                        case '3':
                            return "0111101";

                        case '4':
                            return "0100011";

                        case '5':
                            return "0110001";

                        case '6':
                            return "0101111";

                        case '7':
                            return "0111011";

                        case '8':
                            return "0110111";

                        case '9':
                            return "0001011";
                    }
                    return "Error!";

                case 'B':
                    switch (c)
                    {
                        case '0':
                            return "0100111";

                        case '1':
                            return "0110011";

                        case '2':
                            return "0011011";

                        case '3':
                            return "0100001";

                        case '4':
                            return "0011101";

                        case '5':
                            return "0111001";

                        case '6':
                            return "0000101";

                        case '7':
                            return "0010001";

                        case '8':
                            return "0001001";

                        case '9':
                            return "0010111";
                    }
                    return "Error!";

                case 'C':
                    switch (c)
                    {
                        case '0':
                            return "1110010";

                        case '1':
                            return "1100110";

                        case '2':
                            return "1101100";

                        case '3':
                            return "1000010";

                        case '4':
                            return "1011100";

                        case '5':
                            return "1001110";

                        case '6':
                            return "1010000";

                        case '7':
                            return "1000100";

                        case '8':
                            return "1001000";

                        case '9':
                            return "1110100";
                    }
                    return "Error!";
            }
            return "Error!";
        }

        private static string ean13type(char c)
        {
            switch (c)
            {
                case '0':
                    return "AAAAAA";

                case '1':
                    return "AABABB";

                case '2':
                    return "AABBAB";

                case '3':
                    return "AABBBA";

                case '4':
                    return "ABAABB";

                case '5':
                    return "ABBAAB";

                case '6':
                    return "ABBBAA";

                case '7':
                    return "ABABAB";

                case '8':
                    return "ABABBA";

                case '9':
                    return "ABBABA";
            }
            return "Error!";
        }

        public static string get39(string s, int width, int height)
        {
            object obj2;
            Hashtable hashtable = new Hashtable();
            hashtable.Add('A', "110101001011");
            hashtable.Add('B', "101101001011");
            hashtable.Add('C', "110110100101");
            hashtable.Add('D', "101011001011");
            hashtable.Add('E', "110101100101");
            hashtable.Add('F', "101101100101");
            hashtable.Add('G', "101010011011");
            hashtable.Add('H', "110101001101");
            hashtable.Add('I', "101101001101");
            hashtable.Add('J', "101011001101");
            hashtable.Add('K', "110101010011");
            hashtable.Add('L', "101101010011");
            hashtable.Add('M', "110110101001");
            hashtable.Add('N', "101011010011");
            hashtable.Add('O', "110101101001");
            hashtable.Add('P', "101101101001");
            hashtable.Add('Q', "101010110011");
            hashtable.Add('R', "110101011001");
            hashtable.Add('S', "101101011001");
            hashtable.Add('T', "101011011001");
            hashtable.Add('U', "110010101011");
            hashtable.Add('V', "100110101011");
            hashtable.Add('W', "110011010101");
            hashtable.Add('X', "100101101011");
            hashtable.Add('Y', "110010110101");
            hashtable.Add('Z', "100110110101");
            hashtable.Add('0', "101001101101");
            hashtable.Add('1', "110100101011");
            hashtable.Add('2', "101100101011");
            hashtable.Add('3', "110110010101");
            hashtable.Add('4', "101001101011");
            hashtable.Add('5', "110100110101");
            hashtable.Add('6', "101100110101");
            hashtable.Add('7', "101001011011");
            hashtable.Add('8', "110100101101");
            hashtable.Add('9', "101100101101");
            hashtable.Add('+', "100101001001");
            hashtable.Add('-', "100101011011");
            hashtable.Add('*', "100101101101");
            hashtable.Add('/', "100100101001");
            hashtable.Add('%', "101001001001");
            hashtable.Add('$', "100100100101");
            hashtable.Add('.', "110010101101");
            hashtable.Add(' ', "100110101101");
            s = "*" + s.ToUpper() + "*";
            string str = "";
            try
            {
                foreach (char ch in s)
                {
                    str = str + hashtable[ch].ToString() + "0";
                }
            }
            catch
            {
                return "存在不允许的字符！";
            }
            string str2 = "";
            string str3 = "";
            foreach (char ch2 in str)
            {
                str3 = (ch2 == '0') ? "#FFFFFF" : "#000000";
                obj2 = str2;
                str2 = string.Concat(new object[] { obj2, "<div style=\"width:", width, "px;height:", height, "px;float:left;background:", str3, ";\"></div>" });
            }
            str2 = str2 + "<div style=\"clear:both\"></div>";
            int length = hashtable['*'].ToString().Length;
            foreach (char ch2 in s)
            {
                obj2 = str2;
                str2 = string.Concat(new object[] { obj2, "<div style=\"width:", width * (length + 1), "px;float:left;color:#000000;text-align:center;\">", ch2, "</div>" });
            }
            str2 = str2 + "<div style=\"clear:both\"></div>";
            return string.Concat(new object[] { "<div style=\"background:#FFFFFF;padding:5px;font-size:", width * 10, "px;font-family:'楷体';\">", str2, "</div>" });
        }

        public static string getEAN13(string s, int width, int height)
        {
            int num4;
            char ch2;
            object obj2;
            int num = -1;
            if (!Regex.IsMatch(s, @"^\d{12}$"))
            {
                if (!Regex.IsMatch(s, @"^\d{13}$"))
                {
                    return "存在不允许的字符！";
                }
                ch2 = s[12];
                num = int.Parse(ch2.ToString());
                s = s.Substring(0, 12);
            }
            int num2 = 0;
            int num3 = 0;
            for (num4 = 0; num4 < 12; num4++)
            {
                if ((num4 % 2) == 0)
                {
                    ch2 = s[num4];
                    num3 += int.Parse(ch2.ToString());
                }
                else
                {
                    ch2 = s[num4];
                    num2 += int.Parse(ch2.ToString());
                }
            }
            int num5 = (10 - (((num2 * 3) + num3) % 10)) % 10;
            if ((num > 0) && (num != num5))
            {
                return "输入的校验码错误！";
            }
            s = s + num5;
            string str = "";
            str = str + "000000000101";
            string str2 = ean13type(s[0]);
            for (num4 = 1; num4 < 7; num4++)
            {
                str = str + ean13(s[num4], str2[num4 - 1]);
            }
            str = str + "01010";
            for (num4 = 7; num4 < 13; num4++)
            {
                str = str + ean13(s[num4], 'C');
            }
            str = str + "101000000000";
            string str3 = "";
            string str4 = "";
            int num6 = width * 5;
            foreach (char ch in str)
            {
                str4 = (ch == '0') ? "write.jpg" : "black.jpg";
                obj2 = str3;
                str3 = string.Concat(new object[] { obj2, " <div style=\"width:", width, "px;height:", height, "px;float:left;\"><img src=\"../winimg/", str4, "\" style=\"width:", width, "px;height:", height, "px;\" /></div>" });
            }
            obj2 = str3 + "<div style=\"clear:both\"></div>";
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;color:#000000;width:", width * 9, "px;text-align:center;\">", s[0], "</div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/black.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/write.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/black.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            for (num4 = 1; num4 < 7; num4++)
            {
                obj2 = str3;
                str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width * 7, "px;color:#000000;text-align:center;\">", s[num4], "</div>" });
            }
            obj2 = str3;
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/write.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/black.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/write.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/black.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/write.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            for (num4 = 7; num4 < 13; num4++)
            {
                obj2 = str3;
                str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width * 7, "px;color:#000000;text-align:center;\">", s[num4], "</div>" });
            }
            obj2 = str3;
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/black.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/write.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;\"><img src=\"../winimg/black.jpg\" style=\"width:", width, "px;height:", num6, "px;\" /></div>" });
            str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;color:#000000;width:", width * 9, "px;\"></div>" }) + "<div style=\"clear:both\"></div>";
            return string.Concat(new object[] { "<div style=\"background-image:url('../winimg/write.jpg'); background-repeat:repeat;padding:0px;font-size:", width * 10, "px;font-family:'楷体';\">", str3, "</div>" });
        }

        public static string getEAN13S(string s, int width, int height)
        {
            int num4;
            char ch2;
            object obj2;
            int num = -1;
            if (!Regex.IsMatch(s, @"^\d{12}$"))
            {
                if (!Regex.IsMatch(s, @"^\d{13}$"))
                {
                    return "存在不允许的字符！";
                }
                ch2 = s[12];
                num = int.Parse(ch2.ToString());
                s = s.Substring(0, 12);
            }
            int num2 = 0;
            int num3 = 0;
            for (num4 = 0; num4 < 12; num4++)
            {
                if ((num4 % 2) == 0)
                {
                    ch2 = s[num4];
                    num3 += int.Parse(ch2.ToString());
                }
                else
                {
                    ch2 = s[num4];
                    num2 += int.Parse(ch2.ToString());
                }
            }
            int num5 = (10 - (((num2 * 3) + num3) % 10)) % 10;
            if ((num > 0) && (num != num5))
            {
                return "输入的校验码错误！";
            }
            s = s + num5;
            string str = "";
            str = str + "000000000101";
            string str2 = ean13type(s[0]);
            for (num4 = 1; num4 < 7; num4++)
            {
                str = str + ean13(s[num4], str2[num4 - 1]);
            }
            str = str + "01010";
            for (num4 = 7; num4 < 13; num4++)
            {
                str = str + ean13(s[num4], 'C');
            }
            str = str + "101000000000";
            string str3 = "";
            string str4 = "";
            int num6 = width * 5;
            foreach (char ch in str)
            {
                str4 = (ch == '0') ? "#FFFFFF" : "#000000";
                obj2 = str3;
                str3 = string.Concat(new object[] { obj2, "<div style=\"width:", width, "px;height:", height, "px;float:left;background:", str4, ";\"></div>" });
            }
            obj2 = str3 + "<div style=\"clear:both\"></div>";
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;color:#000000;width:", width * 9, "px;text-align:center;\">", s[0], "</div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#000000;\"></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#FFFFFF;\"></div>" });
            str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#000000;\"></div>" });
            for (num4 = 1; num4 < 7; num4++)
            {
                obj2 = str3;
                str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width * 7, "px;color:#000000;text-align:center;\">", s[num4], "</div>" });
            }
            obj2 = str3;
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#FFFFFF;\"></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#000000;\"></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#FFFFFF;\"></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#000000;\"></div>" });
            str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#FFFFFF;\"></div>" });
            for (num4 = 7; num4 < 13; num4++)
            {
                obj2 = str3;
                str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width * 7, "px;color:#000000;text-align:center;\">", s[num4], "</div>" });
            }
            obj2 = str3;
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#000000;\"></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#FFFFFF;\"></div>" });
            obj2 = string.Concat(new object[] { obj2, "<div style=\"float:left;width:", width, "px;height:", num6, "px;background:#000000;\"></div>" });
            str3 = string.Concat(new object[] { obj2, "<div style=\"float:left;color:#000000;width:", width * 9, "px;\"></div>" }) + "<div style=\"clear:both\"></div>";
            return string.Concat(new object[] { "<div style=\"background:#FFFFFF;padding:0px;font-size:", width * 10, "px;font-family:'楷体';\">", str3, "</div>" });
        }
    }
}

