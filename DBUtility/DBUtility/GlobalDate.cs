namespace DBUtility
{
    using System;
    using System.Collections.Generic;
    using System.Runtime.CompilerServices;

    public class GlobalDate
    {
        private static volatile GlobalDate date = new GlobalDate();
        public IList<SMSContent> SMSContentList = new List<SMSContent>();
        public IList<SMSReport> SMSReportList = new List<SMSReport>();

        public static GlobalDate GetDate()
        {
            return date;
        }

        public IList<SMSContent> GetSMSContentList()
        {
            return this.SMSContentList;
        }
    }
}

