namespace DBUtility
{
    using System;
    using System.Text.RegularExpressions;

    public class readcard
    {
        private byte[] convertSNR(string str, int keyN)
        {
            string pattern = "[^a-fA-F0-9]";
            if (Regex.Replace(str, pattern, "").Length != 12)
            {
                return null;
            }
            string[] strArray = Regex.Split(str, pattern);
            byte[] buffer = new byte[keyN];
            int index = 0;
            foreach (string str4 in strArray)
            {
                buffer[index] = Convert.ToByte(str4, 0x10);
                index++;
            }
            return buffer;
        }

        public string readcards()
        {
            byte num = 0;
            byte num2 = 0;
            byte mode = (byte) ((num << 1) | num2);
            byte num4 = Convert.ToByte("10", 0x10);
            byte num5 = Convert.ToByte("01", 0x10);
            byte[] snr = new byte[6];
            snr = this.convertSNR("FF FF FF FF FF FF", 6);
            if (snr == null)
            {
                return "序列号无效！";
            }
            byte[] buffer = new byte[0x10 * num5];
            int num6 = Reader.MF_Read(mode, num4, num5, snr, buffer);
            return this.showData("数据：", buffer, 0, 0x10 * num5);
        }

        private string showData(string text, byte[] data, int s, int e)
        {
            int num;
            string str = "";
            for (num = 0; num < e; num++)
            {
                if (data[s + num] < 0)
                {
                    data[s + num] = Convert.ToByte((int) (Convert.ToInt32(data[s + num]) + 0x100));
                }
            }
            for (num = 0; num < e; num++)
            {
                str = str + data[s + num].ToString("X2");
            }
            return (str + "\r\n\r\n");
        }

        private string showStatue(int Code)
        {
            switch (Code)
            {
                case 0:
                    return "命令执行成功 .....";

                case 1:
                    return "命令操作失败 .....";

                case 2:
                    return "地址校验错误 .....";

                case 3:
                    return "找不到已选择的端口 .....";

                case 4:
                    return "读写器返回超时 .....";

                case 5:
                    return "数据包流水号不正确 .....";

                case 7:
                    return "接收异常 .....";

                case 10:
                    return "参数值超出范围 .....";

                case 0x80:
                    return "参数设置成功 .....";

                case 0x81:
                    return "参数设置失败 .....";

                case 130:
                    return "通讯超时.....";

                case 0x83:
                    return "卡不存在.....";

                case 0x84:
                    return "接收卡数据出错.....";

                case 0x85:
                    return "未知的错误.....";

                case 0x87:
                    return "输入参数或者输入命令格式错误.....";

                case 0x89:
                    return "输入的指令代码不存在.....";

                case 0x8a:
                    return "在对于卡块初始化命令中出现错误.....";

                case 0x8b:
                    return "在防冲突过程中得到错误的序列号.....";

                case 140:
                    return "密码认证没通过.....";

                case 0x8f:
                    return "读取器接收到未知命令.....";

                case 0x90:
                    return "卡不支持这个命令.....";

                case 0x91:
                    return "命令格式有错误.....";

                case 0x92:
                    return "在命令的FLAG参数中，不支持OPTION 模式.....";

                case 0x93:
                    return "要操作的BLOCK不存在.....";

                case 0x94:
                    return "要操作的对象已经别锁定，不能进行修改.....";

                case 0x95:
                    return "锁定操作不成功.....";

                case 150:
                    return "写操作不成功.....";
            }
            return "未知错误2.....";
        }
    }
}

