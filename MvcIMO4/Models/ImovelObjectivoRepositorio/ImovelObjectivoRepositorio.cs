using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.ImovelObjectivoRepositorio
{
    public class ImovelObjectivoRepositorio
    {

        private imo4Entities db = new imo4Entities();



        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        }

        ///buscar os idiomas
        //ver qual eh o actual
        //carregar as categorias com o idioma activo no momento
        public int GetIdioma_ID(string idiomacode)
        {

            return (from c in db.Idiomas
                    where c.lcode == idiomacode
                    select c.id).SingleOrDefault();

        }



    }
}