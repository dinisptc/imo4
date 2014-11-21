using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.Models.ImovelDescricaoRepositorio
{
    public class ImovelDescricaoRepositorio
    {
        private imo4Entities db = new imo4Entities();

        public void Add_Descricao(imovel_descricao cat)
        {
            cat.descrição = HttpContext.Current.Server.HtmlEncode(cat.descrição);
            db.AddToimovel_descricao(cat);
        }

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

        public imovel_descricao GetImovel_Descricao(int id, string idiomacode)
        {
            int idiomid = GetIdioma_ID(idiomacode);
            return (from c in db.imovel_descricao
                    where (c.lcode_id == idiomid) && (c.imovel_id == id)
                    select c).SingleOrDefault();
        }

        public IQueryable<imovel_descricao> GetImovel_Descricao_OnlyByImovelID(int id)
        {
            return (from c in db.imovel_descricao
                    where c.imovel_id == id
                    select c);
        }

        public int GetCountIdiomas(int id)
        {
            return (from c in db.imovel_descricao
                    where (c.imovel_id == id)
                    select c).Count();
        }

        public void Update(int id,string texto)
        {
 

            var cati = (from p in db.imovel_descricao
                        where p.id == id
                        select p).Single();

            cati.descrição = texto;

            db.SaveChanges();
        }




    }
}