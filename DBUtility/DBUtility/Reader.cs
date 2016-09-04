namespace DBUtility
{
    using System;
    using System.Runtime.InteropServices;

    public class Reader
    {
        [DllImport("function.dll")]
        public static extern int ControlBuzzer(int freq, int duration, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ControlLED(int freq, int duration, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int GetSerNum([In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int GetVersionNum([In] byte[] strVersionNum);
        [DllImport("function.dll")]
        public static extern int ISO15693_GetMulSecurity(byte flag, byte blkAddr, byte blkNum, [In] byte[] uid, [In] byte[] pBuffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_GetSysInfo(byte flag, [In] byte[] uid, [In] byte[] Buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_Inventory([In] byte[] Cardnumber, [In] byte[] pBuffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_Lock(byte flags, byte num_blk, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_LockAFI(byte flags, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_LockDSFID(byte flags, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_Read(byte flags, byte blk_add, byte num_blk, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_Select(byte flags, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_Write(byte flag, byte blk_add, byte num_blk, [In] byte[] uid, [In] byte[] data);
        [DllImport("function.dll")]
        public static extern int ISO15693_WriteAFI(byte flags, byte afi, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int ISO15693_WriteDSFID(byte flags, byte DSFID, [In] byte[] uid, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int MF_Anticoll([In] byte[] commHandle, int DeviceAddress, [In] byte[] snr, [In] byte[] status);
        [DllImport("function.dll")]
        public static extern int MF_Dec(byte mode, byte SectNum, [In] byte[] snr, [In] byte[] value);
        [DllImport("function.dll")]
        public static extern int MF_Getsnr(int mode, int halt, [In] byte[] snr, [In] byte[] value);
        [DllImport("function.dll")]
        public static extern int MF_Halt();
        [DllImport("function.dll")]
        public static extern int MF_Inc(byte mode, byte SectNum, [In] byte[] snr, [In] byte[] value);
        [DllImport("function.dll")]
        public static extern int MF_InitValue(byte mode, byte SectNum, [In] byte[] snr, [In] byte[] value);
        [DllImport("function.dll")]
        public static extern int MF_Read(byte mode, byte blk_add, byte num_blk, [In] byte[] snr, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int MF_Request([In] byte[] commHandle, int DeviceAdddress, byte inf_mode, [In] byte[] Buffer);
        [DllImport("function.dll")]
        public static extern int MF_Restore([In] byte[] commHandle, int DeviceAddress, byte mode, byte cardlength, [In] byte[] carddata);
        [DllImport("function.dll")]
        public static extern int MF_Select([In] byte[] commHandle, int DeviiceAddress, byte inf_mode, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int MF_Write(byte mode, byte blk_add, byte num_blk, [In] byte[] snr, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int SetSerNum(byte[] newValue, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int TypeB_Request([In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int TYPEB_SFZSNR(byte mode, byte halt, [In] byte[] snr, [In] byte[] value);
        [DllImport("function.dll")]
        public static extern int TypeB_TransCOS([In] byte[] cmd, int cmdSize, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int UL_HLRead(byte mode, byte blk_add, [In] byte[] snr, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int UL_HLWrite(byte mode, byte blk_add, [In] byte[] snr, [In] byte[] buffer);
        [DllImport("function.dll")]
        public static extern int UL_Request(byte mode, [In] byte[] snr);
    }
}

