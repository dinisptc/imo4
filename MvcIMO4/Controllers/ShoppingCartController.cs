using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.ViewModel;
using MvcIMO4.Models.ShoppingCartRepositorio;
using MvcIMO4.Models;

namespace MvcIMO4.Controllers
{
    public class ShoppingCartController : Controller
    {
        private imo4Entities storeDB = new imo4Entities();
        MvcIMO4.Models.ShoppingCartRepositorio.ShoppingCart ShoppingCartRepositorio = new MvcIMO4.Models.ShoppingCartRepositorio.ShoppingCart();
        //
        // GET: /ShoppingCart/

        public ActionResult Index()
        {
            var cart = MvcIMO4.Models.ShoppingCartRepositorio.ShoppingCart.GetCart(this.HttpContext);
            string username = User.Identity.Name;
            // Set up our ViewModel
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(username),
                CartTotal = cart.GetTotal(username)
            };

            // Return the view
            return View(viewModel);
        }


        //
        // GET: /Store/AddToCart/5

        public ActionResult AddToCart(int id)
        {

            // Retrieve the album from the database
            var addedAlbum = storeDB.subscricoes
                .Single(album => album.id == id);

            // Add it to the shopping cart
            var cart = ShoppingCart.GetCart(this.HttpContext);

            cart.AddToCart(addedAlbum,User.Identity.Name);

            // Go back to the main store page for more shopping
            return RedirectToAction("Index");
        }


        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {

            string username = User.Identity.Name;


            // Remove the item from the cart
            var cart = ShoppingCart.GetCart(this.HttpContext);

            // Get the name of the album to display confirmation
            string albumName = storeDB.Carts
                .Single(item => item.RecordId == id).subscrico.identidade;

            // Remove from cart. Note that for simplicity, we're 
            // removing all rather than decrementing the count.
            cart.RemoveFromCart(id);

            // Display the confirmation message
            var results = new ShoppingCartRemoveViewModel
            {
                Message = Server.HtmlEncode(albumName) +
                    " has been removed from your shopping cart.",
                CartTotal = cart.GetTotal(username),
                CartCount = cart.GetCount(username),
                DeleteId = id
            };

            return Json(results);
        }


        [ChildActionOnly]
        public ActionResult CartSummary()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            string username = User.Identity.Name;
            ViewData["CartCount"] = cart.GetCount(username);

            return PartialView("CartSummary");
        }


    }
}
