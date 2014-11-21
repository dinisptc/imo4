using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcIMO4.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        [Authorize(Roles = "user")]
        public ActionResult Index()
        {
            return View();
        }

    }
}
