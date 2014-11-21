using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcIMO4.Libraries;
using MvcIMO4.ViewModel;
using System.IO;

namespace MvcIMO4.Models.ImovelRepositorio
{
    public class ImovelRepositorio
    {
        ApagarFotosNoDisco apagafoto = new ApagarFotosNoDisco();
        private imo4Entities db = new imo4Entities();
        
        string LanguageCode = System.Globalization.CultureInfo.CurrentCulture.TwoLetterISOLanguageName;

        // Add
        public void Add(imovel cat)
        {           
            db.AddToimovels(cat);
        }

        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        }

        public subscrico GetSubscricaoByID(int subscricao_id)
        {

            return db.subscricoes.SingleOrDefault(d => d.id == subscricao_id);

        }

        public int GetTotalImoveisBySubscricaoID(int id, string username)
        {

            var imoid = from imo in db.imovels
                        where ((imo.subscricao_id == id) && (imo.identidade == username))
                        select imo;

            return imoid.Count();

        }

        public imovel GetImovel(int id,string username)
        {

            var imoi = (from p in db.imovels
                        where p.id == id && p.identidade == username
                        select p).SingleOrDefault();


            return imoi;
        }
        public imovel GetImovel(int id)
        {

            return db.imovels.SingleOrDefault(d => d.id == id);
        }

        public void Update(int id,imovel imo)
        {
            var imoi = (from p in db.imovels
                        where p.id == id
                        select p).SingleOrDefault();

            imoi.classe_id = imo.classe_id;
            imoi.area_bruta = imo.area_bruta;
            imoi.area_terreno = imo.area_terreno;
            imoi.area_util = imo.area_util;
            imoi.categoria_id = imo.categoria_id;
            imoi.concelho = imo.concelho;
           // imoi.data_aprovacao = imo.data_aprovacao;
           // imoi.data_criacao = imo.data_criacao;
           // imoi.data_expira = imo.data_expira;
            imoi.distrito = imo.distrito;
            //imoi.estado = imo.estado;
            imoi.estado_classe_id = imo.estado_classe_id;
            imoi.estado_id = imo.estado_id;
            imoi.freguesia = imo.freguesia;
            //imoi.identidade = imo.identidade;
            imoi.objectivo_classe_id = imo.objectivo_classe_id;
            imoi.objectivo_id = imo.objectivo_id;
            imoi.pais = imo.pais;
            imoi.preco = imo.preco;
            imoi.rua = imo.rua;
            imoi.status = imo.status;
            //imoi.subscricao_id = imo.subscricao_id;
            imoi.tipologia_id = imo.tipologia_id;
            

            db.SaveChanges();
        
        }

        public int GetTotalImoveis()
        {
            int toint = 0;
            toint = Convert.ToInt32(AdStatus.Activated);

            var imoid = from imo in db.imovels
                        where imo.status == toint
                        select imo;

            return imoid.Count();
        }


        public int GetTotalImoveisByid(string id)
        {

            var imoid = from imo in db.imovels
                        where imo.identidade == id
                        select imo;


            return imoid.Count();
        }


        public IQueryable<ImovelViewModel> FindImoveisByIdentidade(string id, int start, int offset)
        {


            var unu = (from imov in db.imovels
                       where imov.identidade == id
                       select new MvcIMO4.ViewModel.ImovelViewModel
                       {
                           imovel = imov,
                           descricao = (from imodesc in db.imovel_descricao
                                        where imodesc.imovel_id == imov.id
                                        select imodesc.descrição).FirstOrDefault()
                       }).OrderByDescending(d => d.imovel.data_criacao).Skip(start).Take(offset);

            return unu;

        }


        public IQueryable<imovel> FindAllImoveis(int start, int offset,string lcode)
        {

            int totint = Convert.ToInt32(AdStatus.Activated);

           
            int lcodeint = GetIdioma_ID(lcode);

            var model = (from c in db.imovels
                        where (c.status == totint) 
                         select c).OrderByDescending(d => d.data_criacao).Skip(start).Take(offset);

            return model;  
           
        }
        
        public IQueryable<imovel> FindAllImoveisALL(int start, int offset)
        {

            int totint = Convert.ToInt32(AdStatus.Activated);

           


            var model = (from c in db.imovels
                         where (c.status == totint) 
                         select c).OrderByDescending(d => d.data_criacao).Skip(start).Take(offset);

            return model;  
           
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

        public int GetTotalImoveisByCategoriaID(int classe,int lcode_Id)
        {

           /*var imoid = (from imo in db.imovels
                        where imo.categoria_id == id
                        select imo);
            return imoid.Count();*/


            var imoid = (from imo in db.imovels
                         where imo.classe_id == classe 
                         select imo);

            return imoid.Count();


        }

        public IQueryable<imovel> FindImoveisByCategoria(int classe, int lcode_Id, int start, int offset)
        {

            int totint = Convert.ToInt32(AdStatus.Activated);
            return (from imo in db.imovels
                    where (imo.classe_id == classe) && (imo.status == totint) 
                    select imo).OrderByDescending(d => d.data_criacao).Skip(start).Take(offset);

        }

        public void Delete(imovel imo)
        {
            string imagesDir = HttpContext.Current.Server.MapPath("~/images/imoveis/");

            foreach (Foto foto in imo.Fotos.ToList())
            {
                if (foto.image_file_name.Equals("no.gif"))
                { }
                else
                {
                    string result1 = Path.Combine(imagesDir, foto.image_file_name);
                    apagafoto.DeleteFile(result1);
                }
                db.Fotos.DeleteObject(foto);
            }

            //apagar descricoes de imovel
            //in imovel_id
            DeleteDescricoes(imo.id);
    
            db.imovels.DeleteObject(imo);

        }

        public void DeleteDescricoes(int id)
        {
            var imos=(from c in db.imovel_descricao
                    where c.imovel_id == id
                    select c);

            foreach (imovel_descricao imod in imos.ToList())
            {

                db.imovel_descricao.DeleteObject(imod);
            }

        }



        public void JobApagaExpirados()
        { 

            //verifica data hoje 
            var imos= db.imovels;

            foreach(var imot in imos.ToList())
            {
                if (imot.data_expira < DateTime.Now)
                {
                    Delete(imot);                     
                }
            }
                
        }

        public IQueryable<imovel> FindImoveisByPesquisaTotalRows(imovel imov)
        {

            int totint = Convert.ToInt32(AdStatus.Activated);
            var imo3 = (from c in db.imovels
                        where (c.status == totint) 
                        select c);

            return from imo in imo3
                   where ((imo.classe_id == imov.classe_id) || (imov.classe_id == null)) &&
                   ((imo.estado_classe_id == imov.estado_classe_id) || (imov.estado_classe_id == null)) &&
                   ((imo.objectivo_classe_id == imov.objectivo_classe_id) || (imov.objectivo_classe_id == null)) &&
                     ((imo.tipologia_id == imov.tipologia_id) || (imov.tipologia_id == null)) &&
                      //((imo.objectivo_id == imov.objectivo_id) || (imov.objectivo_id == null)) &&
                      //((imo.estado_id == imov.estado_id) || (imov.estado_id == null)) &&
                      ((imo.preco <= imov.preco) || (imov.preco == null)) &&
                       (imo.concelho.Contains(imov.concelho)|| imov.concelho==null) &&
                       (imo.distrito.Contains(imov.distrito) || imov.distrito==null) &&
                       (imo.freguesia.Contains(imov.freguesia) || imov.freguesia == null) &&
                          (imo.pais.Contains(imov.pais) || imov.pais == null)
                   select imo;
        }
        public IQueryable<imovel> FindImoveisByPesquisa(imovel imov)
        {

               //var imo3 = FindAllImoveisALL(start, offset);
               int totint = Convert.ToInt32(AdStatus.Activated);
               var imo3 = (from c in db.imovels
                           where (c.status == totint)
                           select c);

               return from imo in imo3
                      where ((imo.classe_id == imov.classe_id) || (imov.classe_id == null)) &&         
                        ((imo.tipologia_id == imov.tipologia_id) || (imov.tipologia_id == null)) &&
                             ((imo.estado_classe_id == imov.estado_classe_id) || (imov.estado_classe_id == null)) &&
                   ((imo.objectivo_classe_id == imov.objectivo_classe_id) || (imov.objectivo_classe_id == null)) &&
                         //((imo.objectivo_id == imov.objectivo_id) || (imov.objectivo_id == null)) &&
                        // ((imo.estado_id == imov.estado_id) || (imov.estado_id == null)) &&
                         ((imo.preco <= imov.preco) || (imov.preco == null)) &&
                          (imo.concelho.Contains(imov.concelho) || imov.concelho == null) &&
                          (imo.distrito.Contains(imov.distrito) || imov.distrito == null) &&
                          (imo.freguesia.Contains(imov.freguesia) || imov.freguesia == null)&&
                          (imo.pais.Contains(imov.pais) || imov.pais == null)
                   select imo;
        }

        public int GetTotalImoveisAprovar()
        {
            int temp = 0;

            temp = Convert.ToInt32(AdStatus.ActivationPending);
            var imoid = from imo in db.imovels
                        where imo.status == temp
                        select imo;

            return imoid.Count();



        }


        public IQueryable<ImovelViewModel> FindAllImoveisPorAprovar(int start, int offset)
        {
            int stat = Convert.ToInt32(AdStatus.ActivationPending);

            var unu = (from imov in db.imovels
                       where imov.status == stat
                       select new MvcIMO4.ViewModel.ImovelViewModel
                       {
                           imovel = imov,
                           descricao = (from imodesc in db.imovel_descricao
                                        where imodesc.imovel_id == imov.id
                                        select imodesc.descrição).FirstOrDefault()
                       }).OrderByDescending(d => d.imovel.data_criacao).Skip(start).Take(offset);

            return unu;

        }





    }
}