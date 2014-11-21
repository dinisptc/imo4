using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.EstadoRepositorio
{
    public class EstadoRepositorio
    {

        private imo4Entities db = new imo4Entities();


        ///buscar os idiomas
        //ver qual eh o actual
        //carregar as categorias com o idioma activo no momento
        public IQueryable<estado> FindAllEstadosByIdioma(string idiomacode)
        {

            return (from c in db.estadoes
                    where c.Idioma.lcode == idiomacode
                    select c);
        }



        public void AddEstado(estado est)
        {
            db.AddToestadoes(est);
        }


        public IQueryable<estado> FindAllEstado()
        {
            return db.estadoes;
        }

        public void Delete(estado tip)
        {

            db.estadoes.DeleteObject(tip);
        }

        public estado GetEstado(int id)
        {
            return db.estadoes.SingleOrDefault(d => d.id == id);
        }

        public IQueryable<Idioma> FindAllIdiomas()
        {
            return db.Idiomas;
        }


        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        }


  
        

    }
}