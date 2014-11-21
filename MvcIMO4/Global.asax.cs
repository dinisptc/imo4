using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Globalization;
using System.Threading;

namespace MvcIMO4
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Defaultidpage",                                              // Route name
                 "{controller}/{action}/{id}/{pagee}",                           // URL with parameters
                   new { controller = "Home", action = "Index", id = "", pagee = "" }
 );

            routes.MapRoute(
"Defaultidpageclassessempagee",                                              // Route name
"{controller}/{action}/{lcode_Id}/{classe}",                    // URL with parameters
new { controller = "Imovel", action = "PorCategorias", lcode_Id = "", classe = "" }
);

            routes.MapRoute(
    "Defaultidpageclasses",                                              // Route name
     "{controller}/{action}/{lcode_Id}/{classe}/{pagee}",                           // URL with parameters
       new { controller = "Imovel", action = "PorCategorias", lcode_Id = "", classe = "", pagee = "" }
                            );

           
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            //Create culture info object    
            //It's important to check whether session object is ready  
            if (HttpContext.Current.Session != null)
            {
                CultureInfo ci = (CultureInfo)this.Session["Culture"];
                //Checking first if there is no value in session   
                //and set default language    
                //this can happen for first user's request 
                if (ci == null)
                {
                    //Sets default culture to english invariant 
                    string langName = "en";
                    //Try to get values from Accept lang HTTP header 
                    if (HttpContext.Current.Request.UserLanguages != null && HttpContext.Current.Request.UserLanguages.Length != 0)
                    {
                        //Gets accepted list 
                        langName = HttpContext.Current.Request.UserLanguages[0].Substring(0, 2);
                    }
                    ci = new CultureInfo(langName);
                    this.Session["Culture"] = ci;
                }
                //Finally setting culture for each request  
                Thread.CurrentThread.CurrentUICulture = ci;
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
            }
        }


    }
}