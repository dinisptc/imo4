using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models.PricesRepositorio;
using MvcIMO4.Models;

namespace MvcIMO4.Controllers
{
    [Authorize(Roles = "admin")]
    public class PricesController : Controller
    {

        PricesRepositorio pricesrep = new PricesRepositorio();

        //
        // GET: /Prices/

        public ActionResult Index()
        {
            tabelapreco tt= pricesrep.GetTabPrecos();

            return View("Editar",tt);
        }

        //
        // GET: /Prices/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Prices/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Prices/Create

        [HttpPost]
        public ActionResult Create(tabelapreco collection)
        {
            try
            {      
           
                //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                //adicionar a base de dados os preços \\
                ////////////////////////////////////////        
                pricesrep.Add(collection); 
               

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Prices/Edit/5
 
        public ActionResult Edit()
        {
            tabelapreco tt = pricesrep.GetTabPrecos();
            return View("Editar",tt);
        }

        //
        // POST: /Prices/Edit/5

        [HttpPost]
        public ActionResult Edit(tabelapreco collection)
        {
            try
            {                
                pricesrep.Add(collection);
                return RedirectToAction("Index");
            }
            catch
            {
                return View("Editar");
            }
        }

        //
        // GET: /Prices/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Prices/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
