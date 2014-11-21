using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models.TipoNegocioRepositorio;
using MvcIMO4.Models;

namespace MvcIMO4.Controllers
{
    public class TipoNegocioController : Controller
    {
        //
        // GET: /Tipologia/
        TipoNegocioRepositorio tiponegocioRepositorio = new TipoNegocioRepositorio();


        [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            var est = tiponegocioRepositorio.FindAllTiposNegocio().ToList();

            return View("Index", est);
        }

        //
        // GET: /Categorias/Create
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Create()
        {

            ViewData["Idiomas"] = new SelectList(tiponegocioRepositorio.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);

            return View();

        }

        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(objectivo est)
        {
            ViewData["Idiomas"] = new SelectList(tiponegocioRepositorio.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);


            if (est.tipo_negocio != null)
            {
                tiponegocioRepositorio.Add(est);
                tiponegocioRepositorio.Save();
                return RedirectToAction("Index");
            }
            return View("Create", est);

        }



        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Editar(int id)
        {
            objectivo tip = tiponegocioRepositorio.GetTipoNegocioByID(id);
            if (tip == null)
                return View("NaoEncontrado");

            ViewData["Idiomas"] = new SelectList(tiponegocioRepositorio.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);
            return View("Editar", tip);

        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Editar(int id, FormCollection formValues)
        {

            objectivo tip = tiponegocioRepositorio.GetTipoNegocioByID(id);
            if (tip == null)
                return View("NaoEncontrado");
            try
            {

                UpdateModel(tip);
                tiponegocioRepositorio.Save();
                return RedirectToAction("Index");
            }
            catch
            {
                return View("Editar", tip);
            }
        }

        //////////////////////////
        /////////////////////////
        //////////////////
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id)
        {
            objectivo tip = tiponegocioRepositorio.GetTipoNegocioByID(id);
            if (tip == null)
                return View("NaoEncontrado");
            else
                return View("Delete", tip);
        }

        ///////////////////////////////////////
        /////////////////////////////////////
        /////////////////////////////////
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id, string confirmButton)
        {

            objectivo tip = tiponegocioRepositorio.GetTipoNegocioByID(id);

            if (tip == null)
                return View("NaoEncontrado");
            try
            {
                tiponegocioRepositorio.Delete(tip);
                tiponegocioRepositorio.Save();
                return View("Deleted");
            }
            catch
            {
                return View("Error");
            }
        }


        public ActionResult Details(int id)
        {
            objectivo tip = tiponegocioRepositorio.GetTipoNegocioByID(id);
            if (tip == null)
                return View("NaoEncontrado");

            return View("Detalhes", tip);
        }


    }
}
