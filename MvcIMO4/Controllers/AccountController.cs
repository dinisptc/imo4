using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using MvcIMO4.Models;
using System.Globalization;
using MvcIMO4.Libraries;

namespace MvcIMO4.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {

        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Account/LogOn
        // **************************************

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        // **************************************
        // URL: /Account/LogOff
        // **************************************

        public ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToAction("Index", "Home");
        }

        // **************************************
        // URL: /Account/Register
        // **************************************

        public ActionResult Register()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    System.Web.Security.Roles.AddUserToRole(model.UserName, "user"); 

                    FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePassword
        // **************************************

        [Authorize]
        public ActionResult ChangePassword()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePasswordSuccess
        // **************************************

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }


        public ActionResult ChangeCulture(string lang, string returnUrl)
        {
            Session["Culture"] = new CultureInfo(lang);
            return Redirect(returnUrl);
        }


        public ActionResult Recuperar()
        {
            return View("RecuperarPassword");
        }

        [HttpPost]
        public ActionResult Recuperar(LogOnModel model)
        {

            try
            {
                string password = Membership.Provider.ResetPassword(model.UserName, null);
                MembershipUser u = Membership.GetUser(model.UserName);

                string body = "";
                body = "Palavra Chave :" + password;
                if (!Utils.sendSimpleEmail(u.Email, u.UserName, "pedro@dinispt.com", "IMO4 -- Recuperação de Palavra Chave", body))
                    ViewData["erroemail"] = "Erro ao enviar a password!";
                else
                    ViewData["sucesso"] = "Sucesso ao enviar a password!";
            }
            catch (System.Configuration.Provider.ProviderException e)
            {

                ViewData.ModelState.AddModelError(model.UserName, "Erro ao recuperar a Password!");
                ViewData["erro"] = "Erro ao recuperar a Password!";


            }



            return View("RecuperarPassword", model);
            /*
            string user = "";
                try
                {
                    //string password = Membership.Provider.ResetPassword(model.UserName, null);
                    string username = Membership.GetUserNameByEmail(mailuser.UserEmail);
                    user = username;
                    string password = Membership.Provider.ResetPassword(username, null);


                    string body = "";
                    body = "Palavra Chave :" + password;
                    if (!Utils.sendSimpleEmail(mailuser.UserEmail, username, "pedro@dinispt.com", "IMO4 -- Recuperação de Palavra Chave", body))
                        ViewData["erroemail"] = "Erro ao enviar a password!";
                    else
                        ViewData["sucesso"] = "Sucesso ao enviar a password!";

                }
                catch (System.Configuration.Provider.ProviderException e)
                {
                    ViewData.ModelState.AddModelError(user, "Erro ao recuperar a Password!");
                    ViewData["erro"] = "Erro ao recuperar a Password!";
                }


                return View("RecuperarPassword", mailuser);
             * 
             */
        }

    }
}
