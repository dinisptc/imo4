using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace MvcIMO4.Models.FotosRepositorio
{
    public class FotoRepositorio
    {
        private imo4Entities db = new imo4Entities();
        ApagarFotosNoDisco apagafoto = new ApagarFotosNoDisco();

        //    
        // Insert/Delete Methods     
        public void Add(string ft, HttpPostedFileBase file)
        {
            string imagesDir = HttpContext.Current.Server.MapPath("~/images/imoveis/");
            string fileext = System.IO.Path.GetExtension(file.FileName);

            Foto fto = new Foto();


            fto.imovel_id = Convert.ToInt32(ft);
            fto.image_file_name = "";

            db.AddToFotos(fto);
            db.SaveChanges();

            file.SaveAs(imagesDir + fto.id + fileext);
            fto.image_file_name = fto.id + fileext;

            var cati = (from p in db.Fotos
                        where p.id == fto.id
                        select p).Single();

            cati.image_file_name = fto.image_file_name;


            db.SaveChanges();


        }


        public IQueryable<Foto> FindAllFotosById(int id)
        {

            return from foto in db.Fotos
                   where foto.imovel_id == id
                   select foto;

        }


        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        }

        public Foto GetFoto(int id)
        {
            return db.Fotos.SingleOrDefault(d => d.id == id);
        }

        public void DeleteFotoImoveis(Foto foto)
        {

            string imagesDir = HttpContext.Current.Server.MapPath("~/images/imoveis/");


            if (foto.image_file_name.Equals("no.gif"))
            { }
            else
            {
                string result1 = Path.Combine(imagesDir, foto.image_file_name);
                apagafoto.DeleteFile(result1);
            }
            db.Fotos.DeleteObject(foto);
            Save();
        } 


    }
}