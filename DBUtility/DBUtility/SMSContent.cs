namespace DBUtility
{
    using System;

    public class SMSContent
    {
        private string _ct = "";
        private int _flag = 0;
        private long _id = 0L;
        private string _mobile = "";
        private string _recvaddi = "";
        private string _sd = "";
        private string _senderaddi = "";

        public string Ct
        {
            get
            {
                return this._ct;
            }
            set
            {
                this._ct = value;
            }
        }

        public int Flag
        {
            get
            {
                return this._flag;
            }
            set
            {
                this._flag = value;
            }
        }

        public long Id
        {
            get
            {
                return this._id;
            }
            set
            {
                this._id = value;
            }
        }

        public string Mobile
        {
            get
            {
                return this._mobile;
            }
            set
            {
                this._mobile = value;
            }
        }

        public string Recvaddi
        {
            get
            {
                return this._recvaddi;
            }
            set
            {
                this._recvaddi = value;
            }
        }

        public string Sd
        {
            get
            {
                return this._sd;
            }
            set
            {
                this._sd = value;
            }
        }

        public string Senderaddi
        {
            get
            {
                return this._senderaddi;
            }
            set
            {
                this._senderaddi = value;
            }
        }
    }
}

