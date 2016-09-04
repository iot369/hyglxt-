namespace DBUtility
{
    using System;
    using System.Drawing;
    using System.Drawing.Imaging;

    public class ImageThumbnail
    {
        public string ErrorMessage;
        private int ImageHeight;
        private int ImageWidth;
        public Image ResourceImage;

        public ImageThumbnail(string ImageFileName)
        {
            this.ResourceImage = Image.FromFile(ImageFileName);
            this.ErrorMessage = "";
        }

        public bool ReducedImage(double Percent, string targetFilePath)
        {
            try
            {
                Image.GetThumbnailImageAbort callback = new Image.GetThumbnailImageAbort(this.ThumbnailCallback);
                this.ImageWidth = Convert.ToInt32((double) (this.ResourceImage.Width * Percent));
                this.ImageHeight = (this.ResourceImage.Height * this.ImageWidth) / this.ResourceImage.Width;
                Image image = this.ResourceImage.GetThumbnailImage(this.ImageWidth, this.ImageHeight, callback, IntPtr.Zero);
                image.Save(targetFilePath, ImageFormat.Jpeg);
                image.Dispose();
                return true;
            }
            catch (Exception exception)
            {
                this.ErrorMessage = exception.Message;
                return false;
            }
        }

        public bool ReducedImage(int Width, int Height, string targetFilePath)
        {
            try
            {
                Image.GetThumbnailImageAbort callback = new Image.GetThumbnailImageAbort(this.ThumbnailCallback);
                Image image = this.ResourceImage.GetThumbnailImage(Width, Height, callback, IntPtr.Zero);
                image.Save(targetFilePath, ImageFormat.Jpeg);
                image.Dispose();
                return true;
            }
            catch (Exception exception)
            {
                this.ErrorMessage = exception.Message;
                return false;
            }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }
    }
}

