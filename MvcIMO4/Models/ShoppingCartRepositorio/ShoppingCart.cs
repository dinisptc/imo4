using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcIMO4.Models.ShoppingCartRepositorio
{
    public class ShoppingCart
    {

        private imo4Entities storeDB = new imo4Entities();
        string shoppingCartId { get; set; }
        public const string CartSessionKey = "CartId";

        public static ShoppingCart GetCart(HttpContextBase context)
        {
            var cart = new ShoppingCart();
            cart.shoppingCartId = cart.GetCartId(context);
            return cart;
        }

        public void AddToCart(subscrico album,string username)
        {
            var cartItem = storeDB.Carts.SingleOrDefault(
                c => c.CartId == shoppingCartId &&
                c.SubscricaoId == album.id);

            if (cartItem == null)
            {
                // Create a new cart item
                cartItem = new Cart
                {
                    SubscricaoId = album.id,
                    CartId = shoppingCartId,
                    Count = 1,
                    DateCreated = DateTime.Now,
                    identidade = username,
                };
                storeDB.AddToCarts(cartItem);
            }
            else
            {
                // Add one to the quantity
                //cartItem.Count++;
            }

            // Save it
            storeDB.SaveChanges();
        }

        public void RemoveFromCart(int id)
        {
            //Get the cart
            var cartItem = storeDB.Carts.Single(
                cart => cart.CartId == shoppingCartId
                && cart.RecordId == id);

            if (cartItem != null)
            {
                if (cartItem.Count > 1)
                {
                    cartItem.Count--;
                }
                else
                {
                    storeDB.Carts.DeleteObject(cartItem);
                }
                storeDB.SaveChanges();
            }
        }

        public void EmptyCart()
        {
            var cartItems = storeDB.Carts
                .Where(cart => cart.CartId == shoppingCartId);

            foreach (var cartItem in cartItems)
            {
                storeDB.DeleteObject(cartItem);
            }

            storeDB.SaveChanges();
        }

        public List<Cart> GetCartItems(string username)
        {
          
            var cartItems = (from cart in storeDB.Carts
                             where ((cart.CartId == shoppingCartId)&&(cart.identidade==username))
                             select cart).ToList();
            return cartItems;
        }

        public int GetCount(string username)
        {
            int? count = (from cartItems in storeDB.Carts
                          where ((cartItems.CartId == shoppingCartId) && (cartItems.identidade == username))
                          select (int?)cartItems.Count).Sum();

            return count ?? 0;
        }

        public decimal GetTotal(string username)
        {

            decimal? total =
                (from cartItems in storeDB.Carts
                 where ((cartItems.CartId == shoppingCartId) && (cartItems.identidade == username))
                 select (int?)cartItems.Count * cartItems.subscrico.price)
                .Sum();

            return total ?? decimal.Zero;
        }

        public int CreateOrder(OrdemdeCompra order,string username)
        {
            decimal orderTotal = 0;

            var cartItems = GetCartItems(username);

            //Iterate the items in the cart, adding Order Details for each
            foreach (var cartItem in cartItems)
            {
                var orderDetails = new OrderDetail
                {
                    SubscricaoId = cartItem.SubscricaoId,
                    OrderId = order.OrderId,
                    Price = cartItem.subscrico.price
                };

                storeDB.OrderDetails.AddObject(orderDetails);

                orderTotal += (cartItem.Count * cartItem.subscrico.price);
            }

            //Save the order
            storeDB.SaveChanges();

            //Empty the shopping cart
            EmptyCart();

            //Return the OrderId as a confirmation number
            return order.OrderId;
        }

        // We're using HttpContextBase to allow access to cookies.
        public String GetCartId(HttpContextBase context)
        {
            if (context.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(context.User.Identity.Name))
                {
                    // User is logged in, associate the cart with there username
                    context.Session[CartSessionKey] = context.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid Class
                    Guid tempCartId = Guid.NewGuid();

                    // Send tempCartId back to client as a cookie
                    context.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return context.Session[CartSessionKey].ToString();
        }

        // When a user has logged in, migrate their shopping cart to
        // be associated with their username
        public void MigrateCart(string userName)
        {
            var shoppingCart = storeDB.Carts
                .Where(c => c.CartId == shoppingCartId);

            foreach (Cart item in shoppingCart)
            {
                item.CartId = userName;
            }
            storeDB.SaveChanges();
        }


        public tabelapreco GetPrecosSubscricao()
        {

            return (from tablepr in storeDB.tabelaprecos
                                  select tablepr).SingleOrDefault();

        }

    }
}