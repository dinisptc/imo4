using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcIMO4.ViewModel;
using System.IO;

namespace MvcIMO4.Models.ApagaContaRepositorio
{
    public class ApagaContaRepositorio
    {

        private imo4Entities db = new imo4Entities();
        ApagarFotosNoDisco apagafoto = new ApagarFotosNoDisco();

        public IQueryable<ImovelViewModel> FindImoveisByIdentidade(string id)
        {
            var unu = (from imov in db.imovels
                       where imov.identidade == id
                       select new MvcIMO4.ViewModel.ImovelViewModel
                       {
                           imovel = imov,
                           descricao = (from imodesc in db.imovel_descricao
                                        where imodesc.imovel_id == imov.id
                                        select imodesc.descrição).FirstOrDefault()
                       });
            return unu;
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
            var imos = (from c in db.imovel_descricao
                        where c.imovel_id == id
                        select c);

            foreach (imovel_descricao imod in imos.ToList())
            {

                db.imovel_descricao.DeleteObject(imod);
            }

        }


        public IQueryable<subscrico> FindSubscricoesByIdentidade(string id)
        {
            return (from imo in db.subscricoes
                    where imo.identidade == id
                    select imo).OrderByDescending(d => d.data_criacao_subscricao);
        }


        public void DeleteSubs(subscrico imo)
        {
            var imos = db.OrderDetails;


            foreach (var imot in imos.ToList())
            {
                if (imot.SubscricaoId == imo.id)
                {
                    foreach (var order in imos.ToList())
                    {
                        if (order.OrderId == imot.OrderId)
                        {
                            db.OrderDetails.DeleteObject(imot);
                        }

                    }
                }
            }

            //Verificar cart
            var cart = db.Carts;
            foreach (var carttt in cart.ToList())
            {
                if (carttt.SubscricaoId == imo.id)
                {
                    db.Carts.DeleteObject(carttt);
                }


            }

            DeleteSubscricoesIMO(imo.id);

            db.subscricoes.DeleteObject(imo);
        }

        public void DeleteSubscricoesIMO(int subscricaoid)
        {
            var imos = (from c in db.imovels
                        where c.subscricao_id == subscricaoid
                        select c);

            foreach (var imod in imos.ToList())
            {
                DeleteSubscricoesIMO1(imod);
                //db.imovels.DeleteObject(imod);
            }

        }

        public void DeleteSubscricoesIMO1(imovel imo)
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

        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        }

    }
}