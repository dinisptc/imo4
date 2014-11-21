using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models;
using MvcIMO4.Models.ShoppingCartRepositorio;

namespace MvcIMO4.Controllers
{

    [Authorize]
    public class CheckoutController : Controller
    {

        private imo4Entities storeDB = new imo4Entities();
        const string PromoCode = "FREE";
       
        //
        // GET: /Checkout/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Checkout/AddressAndPayment
        [ValidateInput(false)]
        public ActionResult AddressAndPayment()
        {
            return View();
        }

        //
        // POST: /Checkout/AddressAndPayment

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddressAndPayment(FormCollection values)
        {
            var order = new OrdemdeCompra();
            TryUpdateModel(order);

            try
            {
                if (string.Equals(values["PromoCode"], PromoCode,
                    StringComparison.OrdinalIgnoreCase) == true)
                {
                    return View(order);
                }
                else
                {
                    order.Username = User.Identity.Name;
                    order.OrderDate = DateTime.Now;

                    //Save Order
                    storeDB.AddToOrdemdeCompras(order);
                    storeDB.SaveChanges();

                    //Process the order
                    var cart = ShoppingCart.GetCart(this.HttpContext);
                    int ordid=cart.CreateOrder(order,User.Identity.Name);



                    return RedirectToAction("CompleteWired", new { id = ordid });
                }

            }
            catch
            {
                //Invalid - redisplay with errors
                return View(order);
            }
        }


        public ActionResult CompleteWired(int id)
        {
            // Validate customer owns this order
            bool isValid = storeDB.OrdemdeCompras.Any(
                o => o.OrderId == id &&
                o.Username == User.Identity.Name);

            var orderi = (from order in storeDB.OrdemdeCompras
                          where order.OrderId == id
                          select order).SingleOrDefault();

            var sunsi = (from suns in orderi.OrderDetails
                         where suns.OrderId == id
                         select suns).SingleOrDefault();

            if (isValid)
            {

                // return RedirectToAction("CompletePay", new { id = orderi.OrderId });
                return View("CompleteWiredPay", sunsi);
                //return RedirectToAction("Recibo", "PayPal", new { id = orderi.OrderId });
                //return RedirectToAction("Pago", new { id = orderi.OrderId });

            }
            else
            {
                return View("Error");
            }
        }

        //
        // GET: /Checkout/Complete

        public ActionResult Complete(int id)
        {

            // Validate customer owns this order
            bool isValid = storeDB.OrdemdeCompras.Any(
                o => o.OrderId == id &&
                o.Username == User.Identity.Name);

            var orderi = (from order in storeDB.OrdemdeCompras
                          where order.OrderId == id
                          select order).SingleOrDefault();

            if (isValid)
            {

               // return RedirectToAction("CompletePay", new { id = orderi.OrderId });
                return View("CompletePay", orderi);
                //return RedirectToAction("Recibo", "PayPal", new { id = orderi.OrderId });
                //return RedirectToAction("Pago", new { id = orderi.OrderId });

            }
            else
            {
                return View("Error");
            }
        }

        // GET: /LojaSubscricoes/
        [Authorize(Roles = "admin")]
        public ActionResult ListarOrdensdeCopmpra()
        {

            //GET subscricoes para esta identidade
            var subs  = (from order in storeDB.OrdemdeCompras             
                          select order);

            if (subs == null)
                return View("NaoEncontrado");
            else
                return View("IndexOrdens", subs);
        }


        [Authorize(Roles = "admin")]
        public ActionResult Detalhes(int id)
        {

            var imo = (from order in storeDB.OrdemdeCompras
                          where order.OrderId == id
                          select order).SingleOrDefault();
            if (imo == null)
                return View("NaoEncontrado");
            else
                return View("Detalhes", imo);

        }


        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id)
        {
            var imo = (from order in storeDB.OrdemdeCompras
                       where order.OrderId == id
                       select order).SingleOrDefault();


            if (imo == null)
                return View("NaoEncontrado");
            else
                return View("Delete", imo);

        }


        // 
        // HTTP POST: /Dinners/Delete/1

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Delete(int id, string confirmButton)
        {

            var imo = (from order in storeDB.OrdemdeCompras
                       where order.OrderId == id
                       select order).SingleOrDefault();

            if (imo == null)
                return View("NaoEncontrado");

            var imos = storeDB.OrdemdeCompras;

            foreach (var imot in imos.ToList())
            {
                if (imot.OrderId == id)
                {
         
                    storeDB.OrdemdeCompras.DeleteObject(imot);
                    storeDB.SaveChanges();

                   
                }
            }

            return View("Deleted");
        }

    }
}


