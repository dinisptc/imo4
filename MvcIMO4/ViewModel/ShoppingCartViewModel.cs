using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcIMO4.Models;

namespace MvcIMO4.ViewModel
{
    public class ShoppingCartViewModel
    {    
      public List<Cart> CartItems { get; set; }
      
      public decimal CartTotal { get; set; }
    }
}