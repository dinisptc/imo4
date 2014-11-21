using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.PricesRepositorio
{
    public class PricesRepositorio
    {
        private imo4Entities db = new imo4Entities();

        // Get
        public tabelapreco GetTabPrecos()
        {
            return (from o in db.tabelaprecos
                     select o).SingleOrDefault();
        }

        // Add
        public void Add(tabelapreco tab)
        {
            tabelapreco tfab = (from o in db.tabelaprecos
                       select o).SingleOrDefault();
         
            tfab.precomeses = tab.precomeses;
            tfab.precoanuncios = tab.precoanuncios;

            db.SaveChanges();            
        }

    }
}