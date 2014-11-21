using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.TipologiasRepositorio
{
    public class TipologiasRepositorio
    {
        private imo4Entities db = new imo4Entities();



        public IQueryable<tipologia> FindAllTipologias()
        {
            return db.tipologias;
        }

    }
}