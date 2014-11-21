using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MvcIMO4.Models.ApagaContaRepositorio;
using MvcIMO4.Models.ImovelRepositorio;
using MvcIMO4.Models.SubscricoesRepositorio;
using MvcIMO4.Models;

namespace MvcIMO4.Controllers
{
    public class ApagaContaController : Controller
    {

        ApagaContaRepositorio apagrep = new ApagaContaRepositorio();

        private imo4Entities db = new imo4Entities();

        

        [Authorize(Roles = "user,empresa")]
        [ValidateInput(false)]
        public ActionResult Apaga()
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);
            if (u == null)
                return View("NaoEncontrado");
            else
                return View("Delete", u);
        }

        // 
        // HTTP POST: /Dinners/Delete/1

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "user,empresa")]
        [ValidateInput(false)]
        public ActionResult Apaga(string confirmButton)
        {
            try
            {
                //apagar todas as ofertas 
                if (Roles.IsUserInRole("user"))
                {

                    //delete de tudo relacionado com este utilizador

                    //get de todos os imoveis para este utilizador

                    var imotod=apagrep.FindImoveisByIdentidade(User.Identity.Name);

                    foreach (var imot in imotod.ToList())
                    {
                        apagrep.Delete(imot.imovel);
                        apagrep.Save();
                    }

                    //get todas subscricoes
                    var subs = apagrep.FindSubscricoesByIdentidade(User.Identity.Name);
                    //apaga subscricoes
                    foreach (var imot in subs.ToList())
                    {
                        apagrep.DeleteSubs(imot);
                        apagrep.Save();
                    }

                   
              
                }

            }
            catch
            {
                return View("ErroLigacoes");

            }

            // Excluindo Usuário
            if (Membership.DeleteUser(User.Identity.Name))
            {
                Session.Abandon();
                return View("Deleted");
            }
            else
            {
                return View("NaoEncontrado");
            }

        }


       

    }
}
