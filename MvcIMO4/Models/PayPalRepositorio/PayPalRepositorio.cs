using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.PayPalRepositorio
{
    public class PayPalRepositorio
    {
        private MvcIMO4.Models.imo4Entities db = new MvcIMO4.Models.imo4Entities();

        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        } 







    }
}