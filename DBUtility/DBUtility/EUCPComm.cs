namespace DBUtility
{
    using System;
    using System.Runtime.CompilerServices;
    using System.Runtime.InteropServices;
    using System.Text;

    public class EUCPComm
    {
        private static EUCPComm comm = new EUCPComm();
        public delegSMSReport report = null;
        public delegSMSReportEx reportex = null;
        public deleSQF sqf = null;

        private event deleSQF _mySmsContent;

        private event delegSMSReport _mySmsReport;

        private event delegSMSReportEx _mySmsReportEx;

        public event deleSQF mySmsContent;

        public event delegSMSReport mySmsReport;

        public event delegSMSReportEx mySmsReportEx;

        private EUCPComm()
        {
            this.sqf = new deleSQF(this.comm_mySmsContent);
            this.report = new delegSMSReport(this.comm_mySmsReport);
            this.reportex = new delegSMSReportEx(this.comm_mySmsReportEx);
            this._mySmsContent = (deleSQF) Delegate.Combine(this._mySmsContent, this.sqf);
            this._mySmsReport = (delegSMSReport) Delegate.Combine(this._mySmsReport, this.report);
            this._mySmsReportEx = (delegSMSReportEx) Delegate.Combine(this._mySmsReportEx, this.reportex);
        }

        [DllImport("EUCPComm.dll")]
        public static extern int CancelTransfer(string sn);
        [DllImport("EUCPComm.dll")]
        public static extern int ChargeUp(string sn, string acco, string pass);
        private void comm_mySmsContent(string mobile, string senderaddi, string recvaddi, string ct, string sd, ref int flag)
        {
            this.mySmsContent(mobile, senderaddi, recvaddi, ct, sd, ref flag);
        }

        private void comm_mySmsReport(string mobile, string errorCode, string serviceCodeAdd, string reportType, ref int flag)
        {
            this.mySmsReport(mobile, errorCode, serviceCodeAdd, reportType, ref flag);
        }

        private void comm_mySmsReportEx(string seq, string mobile, string errorCode, string serviceCodeAdd, string reportType, ref int flag)
        {
            this.mySmsReportEx(seq, mobile, errorCode, serviceCodeAdd, reportType, ref flag);
        }

        [DllImport("EUCPComm.dll")]
        public static extern int GetBalance(string m, StringBuilder balance);
        public static EUCPComm GetInstance()
        {
            return comm;
        }

        [DllImport("EUCPComm.dll")]
        public static extern int GetPrice(string m, StringBuilder balance);
        [DllImport("EUCPComm.dll")]
        public static extern int ReceiveSMS(string sn, deleSQF mySmsContent);
        [DllImport("EUCPComm.dll")]
        public static extern int ReceiveSMSEx(string sn, deleSQF mySmsContent);
        [DllImport("EUCPComm.dll")]
        public static extern int Register(string sn, string pwd, string EntName, string LinkMan, string Phone, string Mobile, string Email, string Fax, string sAddress, string Postcode);
        [DllImport("EUCPComm.dll")]
        public static extern int RegistryPwdUpd(string sn, string oldPWD, string newPWD);
        [DllImport("EUCPComm.dll")]
        public static extern int RegistryTransfer(string sn, string mn);
        [DllImport("EUCPComm.dll")]
        public static extern int SendScheSMS(string sn, string mn, string ct, string ti, string priority);
        [DllImport("EUCPComm.dll")]
        public static extern int SendScheSMSEx(string sn, string mn, string ct, string ti, string addi, string priority);
        [DllImport("EUCPComm.dll")]
        public static extern int SendSMS(string sn, string mn, string ct, string priority);
        [DllImport("EUCPComm.dll")]
        public static extern int SendSMSEx(string sn, string mn, string ct, string addi, string priority);
        [DllImport("EUCPComm.dll")]
        public static extern int SetProxy(string IP, string Port, string UserName, string PWD);
        [DllImport("EUCPComm.dll")]
        public static extern int UnRegister(string sn);

        public delegate void delegSMSReport(string mobile, string errorCode, string serviceCodeAdd, string reportType, ref int flag);

        public delegate void delegSMSReportEx(string seq, string mobile, string errorCode, string serviceCodeAdd, string reportType, ref int flag);

        public delegate void deleSQF(string mobile, string senderaddi, string recvaddi, string ct, string sd, ref int flag);
    }
}

