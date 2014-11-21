using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcIMO4.Models.ImovelRepositorio;
using System.IO;

namespace MvcIMO4.Models.SubscricoesRepositorio
{
    public class SubcricoesRepositorio
    {
        ApagarFotosNoDisco apagafoto = new ApagarFotosNoDisco();
        private imo4Entities db = new imo4Entities();
        MvcIMO4.Models.ImovelRepositorio.ImovelRepositorio imoRepository = new MvcIMO4.Models.ImovelRepositorio.ImovelRepositorio();

        public void AddSubscricao(subscrico est)
        {
            db.AddTosubscricoes(est);
        }


        public tabelapreco GetPrecosSubscricao()
        {
            return (from tablepr in db.tabelaprecos
                    select tablepr).SingleOrDefault();
        }

        public IQueryable<subscrico> FindSubscricoesByIdentidade(string id)
        {
            return (from imo in db.subscricoes
                    where imo.identidade == id
                    select imo).OrderByDescending(d => d.data_criacao_subscricao);
        }

        public IQueryable<subscrico> FindSubscricoesPorPagar()
        {
            return (from imo in db.subscricoes
                    where imo.pago == false
                    select imo).OrderByDescending(d => d.data_criacao_subscricao);
        }

        public IQueryable<subscrico> FindSubscricoesTodas()
        {
            return (from imo in db.subscricoes
                    select imo).OrderByDescending(d => d.data_criacao_subscricao);
        }

        public subscrico GetSubcricaoID(int id)
        {
            return db.subscricoes.SingleOrDefault(d => d.id == id);
        }

        public void Delete(subscrico imo)
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

        //     
        // Persistence        
        public void Save()
        {
            db.SaveChanges();
        } 



    }
}