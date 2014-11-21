using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models;
using MvcIMO4.Models.EstadoRepositorio;

namespace MvcIMO4.Controllers
{
    public class EstadoController : Controller
    {


        //
        // GET: /Tipologia/
        EstadoRepositorio estadoRepository = new EstadoRepositorio();
        [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            var est = estadoRepository.FindAllEstado().ToList();

            return View("Index", est);
        }


        //
        // GET: /Categorias/Create
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Create()
        {

            ViewData["Idiomas"] = new SelectList(estadoRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);

            return View();

        }

        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(estado est)
        {
            ViewData["Idiomas"] = new SelectList(estadoRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);


            if (est.estado1 != null)
            {
                estadoRepository.AddEstado(est);
                estadoRepository.Save();
                return RedirectToAction("Index");
            }
            return View("Create", est);

        }

        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Editar(int id)
        {
            estado tip = estadoRepository.GetEstado(id);
            if (tip == null)
                return View("NaoEncontrado");

            ViewData["Idiomas"] = new SelectList(estadoRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);
            return View("Editar", tip);

        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Editar(int id, FormCollection formValues)
        {

            estado tip = estadoRepository.GetEstado(id);
            if (tip == null)
                return View("NaoEncontrado");
            try
            {

                UpdateModel(tip);
                estadoRepository.Save();
                return RedirectToAction("Index");
            }
            catch
            {
                return View("Editar", tip);
            }
        }


        public ActionResult Details(int id)
        {
            estado tip = estadoRepository.GetEstado(id);
            if (tip == null)
                return View("NaoEncontrado");

            return View("Detalhes", tip);
        }


        //////////////////////////
        /////////////////////////
        //////////////////
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id)
        {
            estado cat = estadoRepository.GetEstado(id);
            if (cat == null)
                return View("NaoEncontrado");
            else
                return View("Delete", cat);
        }

        ///////////////////////////////////////
        /////////////////////////////////////
        /////////////////////////////////
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id, string confirmButton)
        {

            estado cat = estadoRepository.GetEstado(id);

            if (cat == null)
                return View("NaoEncontrado");          
            try
            {
                estadoRepository.Delete(cat);
                estadoRepository.Save();
                return View("Deleted");
            }
            catch
            {
                return View("Error");
            }



        }
    }
}
