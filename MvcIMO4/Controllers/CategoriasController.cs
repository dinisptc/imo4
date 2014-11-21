using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models.CategoriaRepositorio;
using MvcIMO4.Controllers;
using MvcIMO4.Models;

namespace MvcIMO4.Controllers
{
    public class CategoriasController : Controller
    {
        // GET: /Categorias/
        CategoriaRepositorio catRepository = new CategoriaRepositorio();

        public ActionResult Index()
        {

            string LanguageCode = System.Globalization.CultureInfo.CurrentCulture.TwoLetterISOLanguageName;
            
            var cat = catRepository.FindAllCategoriasByIdioma(LanguageCode).ToList();

            return View("Index", cat);

        }

        public ActionResult IndexAdmin()
        {



            var cat = catRepository.FindAllCategorias().ToList();

            return View("IndexAdmin", cat);

        }

        //
        // GET: /Categorias/Create
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Create()
        {

            ViewData["Idiomas"] = new SelectList(catRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);

            return View();

        }

        //
        // POST: /Categorias/Create
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Categoria collection)
        {

            ViewData["Idiomas"] = new SelectList(catRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);

            try
            {
                // TODO: Add insert logic here
                catRepository.Add(collection);
                catRepository.Save();
                return View();
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Thumbnail(string id)
        {
            return new ThumbnailResult(id);
        }

        //
        // GET: /Categorias/Create
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Editar(int id)
        {


            Categoria cat = catRepository.GetCategoria(id);
            if (cat == null)
                return View("NaoEncontrado");


            ViewData["Idiomas"] = new SelectList(catRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);

            return View("Editar", cat);

        }

        //
        // POST: /Categorias/Create
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Editar(int id, FormCollection formValues)
        {
           
            Categoria cat = catRepository.GetCategoria(id);
            if (cat == null)
                return View("NaoEncontrado");

            ViewData["Idiomas"] = new SelectList(catRepository.FindAllIdiomas().AsEnumerable(), "id", "lcode", 0);

            try
            {

                UpdateModel(cat);
                catRepository.Save();
                return RedirectToAction("IndexAdmin");
            }
            catch
            {
                return View("Editar", cat);
            }
        }

        public ActionResult Details(int id)
        {
            Categoria cat = catRepository.GetCategoria(id);
            if (cat == null)
                return View("NaoEncontrado");        

            return View("Detalhes", cat);
        }


        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult InsereFotos(Categoria cat)
        {
            ViewData["idi"] = cat.id;

            cat = catRepository.GetCategoria(cat.id);

            foreach (string name in Request.Files)
            {
                var file = Request.Files[name];

                string fileName = System.IO.Path.GetFileName(file.FileName);

                catRepository.Add(cat, file);
                catRepository.Save();

                return View("InsereFotos", cat);
            }
            return View("InsereFotos", cat);
        }


        //////////////////////////
        /////////////////////////
        //////////////////
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id)
        {
            Categoria cat = catRepository.GetCategoria(id);
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

            Categoria cat = catRepository.GetCategoria(id);

            if (cat == null)
                return View("NaoEncontrado");
            try
            {
                catRepository.Delete(cat);            
                catRepository.Save();
                return View("Deleted");
            }            
            catch
            {
                return View("Error");
            }                   
        }

    }
}
