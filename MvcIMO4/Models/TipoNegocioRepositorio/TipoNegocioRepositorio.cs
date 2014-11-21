using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.TipoNegocioRepositorio
{
    public class TipoNegocioRepositorio
    {
        private imo4Entities db = new imo4Entities();

        ///buscar os idiomas
        //ver qual eh o actual
        //carregar as categorias com o idioma activo no momento
        public IQueryable<objectivo> FindAllTiposNegocioLang(string idiomacode)
        {
            return (from c in db.objectivoes
                    where c.Idioma.lcode == idiomacode
                    select c);
        }

        public IQueryable<objectivo> FindAllTiposNegocio()
        {
            return db.objectivoes;
        }

        public void Add(objectivo est)
        {
            db.AddToobjectivoes(est);
     
        }

        public IQueryable<Idioma> FindAllIdiomas()
        {
            return db.Idiomas;
        }

        public objectivo GetTipoNegocioByID(int id)
        {
            return db.objectivoes.SingleOrDefault(d => d.id == id);
        }


        public void Delete(objectivo tip)
        {
            db.objectivoes
                .DeleteObject(tip);
        }

        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        } 

    }
}