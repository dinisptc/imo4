using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;


namespace MvcIMO4.Models.CategoriaRepositorio
{
    public class CategoriaRepositorio
    {
        private imo4Entities db = new imo4Entities();
        ApagarFotosNoDisco apagafoto = new ApagarFotosNoDisco();


        // 
        // Query Methods  
        public IQueryable<Categoria> FindAllCategoriasByIdioma(string idiomacode)
        {
            return (from c in db.Categorias
                    where c.Idioma.lcode==idiomacode
                    select c);
        }

        public IQueryable<Categoria> FindAllCategorias()
        {
            return db.Categorias;
        }

        public IQueryable<Idioma> FindAllIdiomas()
        {
            return db.Idiomas;
        }


        //    
        // Insert/Delete Methods     
        public void Add(Categoria cat, HttpPostedFileBase file)
        {
            string imagesDir = HttpContext.Current.Server.MapPath("~/images/categorias/");
            string fileext = System.IO.Path.GetExtension(file.FileName);

            file.SaveAs(imagesDir + cat.id + fileext);
            cat.foto = cat.id + fileext;

            var cati = (from p in db.Categorias
                        where p.id == cat.id
                        select p).Single();

            cati.foto = cat.foto;

            db.SaveChanges();
        }

        //    
        // Insert/Delete Methods     
        public void Add(Categoria cat)
        {

            cat.foto = "no.gif";
            db.AddToCategorias(cat);
        }

        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        }

        public Categoria GetCategoria(int id)
        {

            return db.Categorias.SingleOrDefault(d => d.id == id);
        }

      /*  public bool GetCategoriaOnImoveis(int id,int classe)
        {
                        
            var conta=(from p in db.imovels
                     where ((p.categoria_id==id)&&(p.classe_id==classe))
                     select p);
       
            if (conta != null)
            {
                ///aionda existem categorias com este id na tabela de imoveis
                return true;
            }
            else
            {
                //nao existe nenhuma pode apagar
                return false;
            }
        }

        public bool Delete(Categoria cat)
        {                       
        
            bool tt=GetCategoriaOnImoveis(cat.id, (int)cat.classe);

            //verificar na tabela imoveis se existe alguma categoria com este id
            if (tt)
            {
                return false;
            }else
            {
                string imagesDirCat = HttpContext.Current.Server.MapPath("~/images/categorias/");
                string result = Path.Combine(imagesDirCat, cat.foto);
                if (cat.foto != "no.gif") apagafoto.DeleteFile(result);
                db.Categorias.DeleteObject(cat);
                return true;
            }
        }*/


        public void Delete(Categoria cat)
        {              

                try 
                {

                    db.Categorias.DeleteObject(cat);

                    string imagesDirCat = HttpContext.Current.Server.MapPath("~/images/categorias/");
                    string result = Path.Combine(imagesDirCat, cat.foto);
                    if (cat.foto != "no.gif") apagafoto.DeleteFile(result);
                }
                catch
                { 
                
                }
                
          
        }
    }
}