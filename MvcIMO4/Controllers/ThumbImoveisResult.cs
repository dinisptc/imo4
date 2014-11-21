using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcIMO4.Controllers
{
        public class ThumbImoveisResult : ActionResult
        {


            public ThumbImoveisResult(string virtualPath)
            {
                this.VirtualPath = virtualPath;
            }

            public string VirtualPath { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                context.HttpContext.Response.ContentType = "image/bmp";

                string fullFileName =
                    context.HttpContext.Server.MapPath("~/images/imoveis/" + VirtualPath);
                using (System.Drawing.Image photoImg = System.Drawing.Image.FromFile(fullFileName))
                {
                    using (System.Drawing.Image thumbPhoto = photoImg.GetThumbnailImage(100, 100, null, new System.IntPtr()))
                    {
                        using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
                        {
                            thumbPhoto.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                            context.HttpContext.Response.BinaryWrite(ms.ToArray());
                            context.HttpContext.Response.End();
                        }
                    }
                }
            }
  
    }
}