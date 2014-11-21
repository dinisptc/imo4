using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models;
using MvcIMO4.Libraries;

namespace MvcIMO4.Controllers
{
    public class LojaSubscricoesController : Controller
    {

        MvcIMO4.Models.SubscricoesRepositorio.SubcricoesRepositorio subsrepositorio = new MvcIMO4.Models.SubscricoesRepositorio.SubcricoesRepositorio();
 

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "user,admin")]
        public ActionResult Index()
        {

            //GET subscricoes para esta identidade
            var subs = subsrepositorio.FindSubscricoesByIdentidade(User.Identity.Name);

            if (subs == null)
                return View();
            else
            return View("Index",subs);
        }

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "user,admin")]
        public ActionResult AddSubImo()
        {

            //GET subscricoes para esta identidade
            var subs = subsrepositorio.FindSubscricoesByIdentidade(User.Identity.Name);

            if (subs == null)
                return View();
            else
                return View("AddSubImo", subs);
        }
 


        //
        // GET: /Imovel/Create
        [Authorize(Roles = "user,admin")]
        public ActionResult Create()
        {

            return View();
        }

        //
        // POST: /Imovel/Create
        [Authorize(Roles = "user,admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(subscrico est)
        {

            if (ModelState.IsValid)
            {
              
                est.data_criacao_subscricao = DateTime.Now;
                est.identidade = User.Identity.Name;
                est.price = (est.numeroanuncios * subsrepositorio.GetPrecosSubscricao().precoanuncios) + (est.numeromeses * subsrepositorio.GetPrecosSubscricao().precomeses);
                est.pago = false;

                subsrepositorio.AddSubscricao(est);
                subsrepositorio.Save();

                string body = "Subscricaso Criada por " + User.Identity.Name + "na data :" + DateTime.Now + "subscricao id :  " + est.id ;


                Utils.sendSimpleEmail("pedro@dinispt.com", "IMO4", "pedro@dinispt.com", "IMO4 -- Subscrição Criada", body);

                return RedirectToAction("Index"); 

            }
            return View("Create", est);

        }



        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id)
        {
            subscrico imo = subsrepositorio.GetSubcricaoID(id);
            if (imo == null)
                return View("NaoEncontrado");
            else
                return View("Delete", imo);

        }


        // 
        // HTTP POST: /Dinners/Delete/1

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id, string confirmButton)
        {

            subscrico imo = subsrepositorio.GetSubcricaoID(id);

            if (imo == null)
                return View("NaoEncontrado");

            subsrepositorio.Delete(imo);
            subsrepositorio.Save();

            return View("Deleted");
        }

        [Authorize(Roles = "user,admin")]
        public ActionResult Detalhes(int id)
        {
            subscrico imo = subsrepositorio.GetSubcricaoID(id);
            if (imo == null)
                return View("NaoEncontrado");
            else
                return View("Detalhes", imo);

        }

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "admin")]
        public ActionResult ListarPorPagar()
        {

            //GET subscricoes para esta identidade
            var subs = subsrepositorio.FindSubscricoesPorPagar();

            if (subs == null)
                return View();
            else
                return View("Index", subs);
        }

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "admin")]
        public ActionResult ListarExpiradas()
        {

            //GET subscricoes para esta identidade
            var subs = subsrepositorio.FindSubscricoesTodas();

            if (subs == null)
                return View("NaoEncontrado");
            else
                return View("IndexExp", subs);
        }

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "admin")]
        public ActionResult Pagotrue(int id)
        {
            subscrico imo = subsrepositorio.GetSubcricaoID(id);
            if (imo == null)
                return View("NaoEncontrado");
            try
            {
                imo.pago = true;
                UpdateModel(imo);
                subsrepositorio.Save();
                return RedirectToAction("Detalhes", new { id = imo.id });
            }
            catch
            {
                return View("Error");
            }
        }

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "admin,user")]
        public ActionResult Renovar(int id)
        {
            subscrico imo = subsrepositorio.GetSubcricaoID(id);
            if (imo == null)
                return View("NaoEncontrado");
            try
            {
                imo.data_criacao_subscricao = DateTime.Now;
                imo.pago = false;
                UpdateModel(imo);
                subsrepositorio.Save();
                return RedirectToAction("Detalhes", new { id = imo.id });
            }
            catch
            {
                return View("Error");
            }
        }


    }
}
