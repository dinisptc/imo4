using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models.ImovelRepositorio;
using MvcIMO4.Models.CategoriaRepositorio;
using MvcIMO4.Models.TipoNegocioRepositorio;
using MvcIMO4.Models.EstadoRepositorio;
using MvcIMO4.Models.TipologiasRepositorio;
using MvcIMO4.Models;
using MvcIMO4.Models.ImovelDescricaoRepositorio;
using MvcIMO4.Libraries;
using MvcIMO4.Models.ImovelEstadoRepositorio;
using Valentica.Libraries;
using MvcIMO4.Models.ImovelObjectivoRepositorio;
using MvcIMO4.Controllers;
using System.Text.RegularExpressions;
using System.Web.Security;


namespace MvcIMO4.Controllers
{
    public class ImovelController : Controller
    {

        ImovelRepositorio imoRepository = new ImovelRepositorio();
        CategoriaRepositorio catRepository = new CategoriaRepositorio();
        TipologiasRepositorio tipoRepository = new TipologiasRepositorio();
        EstadoRepositorio estadoRepository = new EstadoRepositorio();
        TipoNegocioRepositorio objectivoRepository = new TipoNegocioRepositorio();
        MvcIMO4.Models.FotosRepositorio.FotoRepositorio ftrepository = new MvcIMO4.Models.FotosRepositorio.FotoRepositorio();
        ImovelDescricaoRepositorio descricaorepo = new ImovelDescricaoRepositorio();
        ImovelEstadoRepositorio imoestadorepo = new ImovelEstadoRepositorio();
        ImovelObjectivoRepositorio imoobjectivorepo = new ImovelObjectivoRepositorio();
        
        /// <summary>
        /// ////////////////////////////////////
        /// </summary>
       

        string LanguageCode = System.Globalization.CultureInfo.CurrentCulture.TwoLetterISOLanguageName;

        
        // GET: /Imovel/
        public ActionResult Index()
        {
            return View();
        }

        
        // GET: /Imovel/
        public ActionResult Geo()
        {
            return View("Georeferencia");
        }

        //////////////////////////////////////////

        public ActionResult Ultimos()
        {

            string pageString = "";

            try
            {
                pageString = Request.Url.Segments[3];
            }
            catch (Exception)
            {
                pageString = null;
            }

            int page = (String.IsNullOrEmpty(pageString)) ? 1 : Int32.Parse(pageString);

            //UserModel userModel = new UserModel();

            int totalUsers = imoRepository.GetTotalImoveis();

            Pagination pagination = new Pagination(true);

            pagination.BaseUrl = "/Imovel/Ultimos/";
            pagination.TotalRows = totalUsers;
            pagination.CurPage = page;
            pagination.PerPage = 10;

            pagination.PrevLink = "Anteriores";
            pagination.NextLink = "Proximos";

            string pageLinks = pagination.GetPageLinks();

            int start = (page - 1) * pagination.PerPage;
            int offset = pagination.PerPage;

            // List<User> users = userModel.GetUsers(start, offset);
     
            try
            {

            var imo = imoRepository.FindAllImoveis(start, offset, LanguageCode).ToList();
           
            ViewData["title"] = "Ultimos Imoveis";
            ViewData["totalUsers"] = totalUsers;
            ViewData["users"] = imo;
            ViewData["pageLinks"] = pageLinks;

                return View("Index", imo);
            }
            catch
            {
                return View("Error");
            }
        }








        public ActionResult Detalhes(int id)
        {

            /* descricaorepo */
            imovel_descricao imodesc = descricaorepo.GetImovel_Descricao(id, LanguageCode);

     
            //se a descricao for null quer dizer que nao existe descrição para o idioma activo
            if (imodesc == null)
            {
                //procurar alternativa
                //contar quantas traducoes existem
                int numero = descricaorepo.GetCountIdiomas(id);

                if (numero == 0)
                {
                    return View("NaoEncontrado");
                }

                //faz um get para saber que idiomas existem para alem do activo
                var imodescv = descricaorepo.GetImovel_Descricao_OnlyByImovelID(id);

                foreach (var idi in imodescv)
                {
                    if (idi.Idioma.lcode == "en")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "pt")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "fr")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "es")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "de")
                    {
                        imodesc = idi;
                        break;
                    }


                }


            }

            imovel iml = imoRepository.GetImovel(id);
            if (iml == null)
                return View("NaoEncontrado");
            else
            {

                MvcIMO4.ViewModel.ImovelViewModel imo = new MvcIMO4.ViewModel.ImovelViewModel();

                imo.imovel = iml;
                imo.descricao = HttpContext.Server.HtmlDecode(imodesc.descrição);


                return View("Detalhes", imo);

            }
        }

        //
        // GET: /Imovel/Create  
        [ValidateInput(false)]
        [Authorize(Roles = "user,admin")]
        public ActionResult Create(int subsid)
        {

            ViewData["Categorias"] = new SelectList(catRepository.FindAllCategoriasByIdioma(LanguageCode).AsEnumerable(), "id", "nome", 0);
            ViewData["Tipologias"] = new SelectList(tipoRepository.FindAllTipologias().AsEnumerable(), "id", "nome", 0);
            ViewData["Estados"] = new SelectList(estadoRepository.FindAllEstadosByIdioma(LanguageCode).AsEnumerable(), "id", "estado1", 0);
            ViewData["Objectivos"] = new SelectList(objectivoRepository.FindAllTiposNegocioLang(LanguageCode).AsEnumerable(), "id", "tipo_negocio", 0);

            //Verificar quantos imoveis para este utilizador e para esta subscrição ainda estao disponiveis
            //pelo numero da subscrição ir buscar o numero de anuncios
            subscrico subs = imoRepository.GetSubscricaoByID(subsid);

            //Contar o numero de anuncios com esta subscrição.

            int numero = imoRepository.GetTotalImoveisBySubscricaoID(subsid, User.Identity.Name);

            //comparar
            if (numero >= subs.numeroanuncios)
                return View("LimiteSub");

            return View();
        } 

        //
        // POST: /Imovel/Create
        [HttpPost]
        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult Create(MvcIMO4.ViewModel.ImovelViewModel collection,int subsid)
        {

           ValidaImovel(collection.imovel);
            



            ViewData["Categorias"] = new SelectList(catRepository.FindAllCategoriasByIdioma(LanguageCode).AsEnumerable(), "id", "nome", 0);
            ViewData["Tipologias"] = new SelectList(tipoRepository.FindAllTipologias().AsEnumerable(), "id", "nome", 0);
            ViewData["Estados"] = new SelectList(estadoRepository.FindAllEstadosByIdioma(LanguageCode).AsEnumerable(), "id", "estado1", 0);
            ViewData["Objectivos"] = new SelectList(objectivoRepository.FindAllTiposNegocioLang(LanguageCode).AsEnumerable(), "id", "tipo_negocio", 0);
        
                if (ModelState.IsValid)
                {

                    //Verificar quantos imoveis para este utilizador e para esta subscrição ainda estao disponiveis
                    //pelo numero da subscrição ir buscar o numero de anuncios
                    subscrico subs = imoRepository.GetSubscricaoByID(subsid);

                    //Contar o numero de anuncios com esta subscrição.

                    int numero = imoRepository.GetTotalImoveisBySubscricaoID(subsid, User.Identity.Name);

                    //comparar
                    if ((numero >= subs.numeroanuncios) || (DateTime.Now > subs.data_criacao_subscricao.AddMonths(subs.numeromeses)))
                        return View("LimiteSub");

                    //adicionar a subscrição ao imovel
                    collection.imovel.subscricao_id = subsid;

                    //verificar a linguagem
                    collection.imovel.identidade = User.Identity.Name;
                    collection.imovel.status = Convert.ToInt32(MvcIMO4.Libraries.AdStatus.ActivationPending);
                    collection.imovel.data_criacao = DateTime.Now;

                    MvcIMO4.Models.imo4Entities db = new MvcIMO4.Models.imo4Entities();

                    //ir a tabela categoria ao id e sacar a classe para esse id
                    int classe_da_categoria= (from c in db.Categorias
                                      where collection.imovel.categoria_id==c.id
                                      select c.classe).SingleOrDefault();

                    collection.imovel.classe_id = classe_da_categoria;

                
                        estado estadoti = (from c in db.estadoes
                                           where c.id == collection.imovel.estado_id
                                           select c).SingleOrDefault();

                        collection.imovel.estado_classe_id = estadoti.classe;
                
                    objectivo objecti = (from c in db.objectivoes
                                       where c.id == collection.imovel.objectivo_id
                                       select c).SingleOrDefault();

                    collection.imovel.objectivo_classe_id = objecti.classe;

                    //gravar na base de dados
                    //imoRepository.Add(collection.imovel);

                    imovel_descricao imodesc = new imovel_descricao();
                    imodesc.descrição = collection.descricao;
                    imodesc.lcode_id = descricaorepo.GetIdioma_ID(LanguageCode);


                    imoRepository.Add(collection.imovel);
                    imoRepository.Save();

                    imodesc.imovel_id = collection.imovel.id;
                   // imodesc.descrição = HttpContext.Server.HtmlEncode(imodesc.descrição);

                    descricaorepo.Add_Descricao(imodesc);
                    descricaorepo.Save();


                    string body = "Imovel Criado por " + User.Identity.Name + "na data :" + DateTime.Now;

                    Utils.sendSimpleEmail("pedro@dinispt.com", "MvcIMO4", "pedro@dinispt.com", "IMO4 -- Imovel Criado", body);

                    return View("Gravado");
                }
                         
                return View(collection);
            }
    
    
  
        
        //
        // GET: /Imovel/Edit/5
        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult Editar(int id)
        {


            // imo.estado = imoestado;

            //   int tedte = imo.estado.estadoid;

            ViewData["Categorias"] = new SelectList(catRepository.FindAllCategoriasByIdioma(LanguageCode).AsEnumerable(), "id", "nome", 0);
            ViewData["Tipologias"] = new SelectList(tipoRepository.FindAllTipologias().AsEnumerable(), "id", "nome", 0);
            ViewData["Estados"] = new SelectList(estadoRepository.FindAllEstadosByIdioma(LanguageCode).AsEnumerable(), "id", "estado1", 0);
            ViewData["Objectivos"] = new SelectList(objectivoRepository.FindAllTiposNegocioLang(LanguageCode).AsEnumerable(), "id", "tipo_negocio", 0);

            
            imovel_descricao imodesc = descricaorepo.GetImovel_Descricao(id, LanguageCode);


            imovel iml = imoRepository.GetImovel(id, User.Identity.Name);
            if (iml == null)
                return RedirectToAction("LogOn", "Account");
             else
             {

                 MvcIMO4.ViewModel.ImovelViewModel imo = new MvcIMO4.ViewModel.ImovelViewModel();

                 imo.imovel = iml;


                if (imodesc!= null)
                 {
                     imo.descricao = HttpContext.Server.HtmlDecode(imodesc.descrição);
                     //imo.descricao = HttpContext.Server.HtmlDecode(imo.descricao);
                     return View("Editar", imo);
                 }
                 else
                 {
                     return View("NaoIdioma");
                 }                              
                 
             }
        }

        //
        // POST: /Imovel/Edit/5
        [Authorize(Roles = "user,admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Editar(int id, MvcIMO4.ViewModel.ImovelViewModel imoin)
        {
            ValidaImovel(imoin.imovel);


            ViewData["Categorias"] = new SelectList(catRepository.FindAllCategoriasByIdioma(LanguageCode).AsEnumerable(), "id", "nome", 0);
            ViewData["Tipologias"] = new SelectList(tipoRepository.FindAllTipologias().AsEnumerable(), "id", "nome", 0);
            ViewData["Estados"] = new SelectList(estadoRepository.FindAllEstadosByIdioma(LanguageCode).AsEnumerable(), "id", "estado1", 0);
            ViewData["Objectivos"] = new SelectList(objectivoRepository.FindAllTiposNegocioLang(LanguageCode).AsEnumerable(), "id", "tipo_negocio", 0);

            MvcIMO4.ViewModel.ImovelViewModel imo = new ViewModel.ImovelViewModel();
       

            try
            {
               
                //imo.imovel = imoRepository.GetImovel(id);

                imo.imovel = imoRepository.GetImovel(id, User.Identity.Name);
                if (imo.imovel == null)
                    return RedirectToAction("LogOn", "Account");


                //buscar a descricao á base de dados
                imoin.imovel.status = Convert.ToInt32(AdStatus.ActivationPending);
  
                MvcIMO4.Models.imo4Entities db = new MvcIMO4.Models.imo4Entities();
                


                imovel_descricao imodesc = descricaorepo.GetImovel_Descricao(id, LanguageCode);
                if (imodesc == null)
                    return RedirectToAction("Globalizar", new { id = imo.imovel.id });

                

                //ir a tabela categoria ao id e sacar a classe para esse id
                int classe_da_categoria = (from c in db.Categorias
                                           where imoin.imovel.categoria_id == c.id
                                           select c.classe).SingleOrDefault();

                imoin.imovel.classe_id = classe_da_categoria;


                estado estadoti = (from c in db.estadoes
                                   where c.id == imoin.imovel.estado_id
                                   select c).SingleOrDefault();

                imoin.imovel.estado_classe_id = estadoti.classe;

                objectivo objecti = (from c in db.objectivoes
                                     where c.id == imoin.imovel.objectivo_id
                                     select c).SingleOrDefault();

                imoin.imovel.objectivo_classe_id = objecti.classe;

                imoRepository.Update(imo.imovel.id, imoin.imovel);     
                imoRepository.Save();
       
                if (imodesc == null)
                {
                    imodesc = new imovel_descricao();

                    imodesc.descrição = HttpContext.Server.HtmlEncode(imoin.descricao);
                    imodesc.imovel_id = id;
                    imodesc.lcode_id = descricaorepo.GetIdioma_ID(LanguageCode);
                    descricaorepo.Add_Descricao(imodesc);
                    descricaorepo.Save();
                }
                else
                {
                    imodesc.descrição = HttpContext.Server.HtmlEncode(imoin.descricao);
                    imodesc.imovel_id = id;
                    imodesc.lcode_id = descricaorepo.GetIdioma_ID(LanguageCode);


                    descricaorepo.Update(imodesc.id, imoin.descricao);

                    descricaorepo.Save();
                }    



                string body = "Editado por :" + User.Identity.Name;

                Utils.sendSimpleEmail("pedro@dinispt.com", "IMO4", "pedro@dinispt.com", "IMO4 -- Imovel Editado", body);


                return RedirectToAction("Detalhes", new { id = imo.imovel.id });
            }
            catch
            {
                return View("Editar", imo);
            }
        }

        //
        // GET: /Imovel/Delete/5
         [Authorize(Roles = "user,admin")]
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Imovel/Delete/5

        [HttpPost]
        [Authorize(Roles = "user,admin")]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult ThumbImoveis(string id)
        {
            return new ThumbImoveisResult(id);
        }


        /// <summary>
        /// ///////////////////////////////////////////
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>

        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult Globalizar(int id)
        {





            /* descricaorepo */
            imovel_descricao imodesc = descricaorepo.GetImovel_Descricao(id, LanguageCode);

            //se a descricao for null quer dizer que nao existe descrição para o idioma activo
            if (imodesc == null)
            {
                //procurar alternativa
                //contar quantas traducoes existem
                int numero = descricaorepo.GetCountIdiomas(id);

                if (numero == 0)
                {
                    return View("NaoEncontrado");
                }

                //faz um get para saber que idiomas existem para alem do activo
                var imodescv = descricaorepo.GetImovel_Descricao_OnlyByImovelID(id);

                foreach (var idi in imodescv)
                {
                    if (idi.Idioma.lcode == "en")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "pt")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "fr")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "es")
                    {
                        imodesc = idi;
                        break;
                    }
                    if (idi.Idioma.lcode == "de")
                    {
                        imodesc = idi;
                        break;
                    }


                }


            }

            imovel iml = imoRepository.GetImovel(id,User.Identity.Name);
            if (iml == null)
                return RedirectToAction("LogOn", "Account");
            else
            {
                MvcIMO4.ViewModel.ImovelViewModel imo = new MvcIMO4.ViewModel.ImovelViewModel();

                imo.imovel = iml;
                imo.descricao = HttpContext.Server.HtmlDecode(imodesc.descrição);                

                return View("Globalizar", imo);

            }

        }


        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult Globalizar(int id, MvcIMO4.ViewModel.ImovelViewModel formvalues)
        {

            try
            {
                 
                //update ao imovel
                MvcIMO4.ViewModel.ImovelViewModel imo = new ViewModel.ImovelViewModel();

                imo.imovel = imoRepository.GetImovel(id,User.Identity.Name);
                if (imo == null)
                    return RedirectToAction("LogOn", "Account");
              
            
                imo.imovel.status = Convert.ToInt32(AdStatus.ActivationPending);
               // imo.descricao = HttpContext.Server.HtmlEncode(imo.descricao);

                UpdateModel(imo);
                imoRepository.Save();

                //adicionar nova descrição na base de dados

                imovel_descricao imodesc = descricaorepo.GetImovel_Descricao(id, LanguageCode);

                if (imodesc == null)
                {
                    imodesc = new imovel_descricao();

                    //imodesc.descrição = HttpContext.Server.HtmlEncode(imo.descricao);
                    imodesc.imovel_id = id;
                    imodesc.lcode_id = descricaorepo.GetIdioma_ID(LanguageCode);
                    imodesc.descrição = formvalues.descricao;
                    descricaorepo.Add_Descricao(imodesc);
                    descricaorepo.Save();
                }
                else
                {
                    //imodesc.descrição = HttpContext.Server.HtmlEncode(imo.descricao);
                    imodesc.imovel_id = id;
                    imodesc.lcode_id = descricaorepo.GetIdioma_ID(LanguageCode);

  
                   
                    //UpdateModel(imodesc, null, null, new[] { "id" }, formvalues.ToValueProvider());
                   // UpdateModel(imodesc);



                    descricaorepo.Update(imodesc.id, formvalues.descricao);

                    descricaorepo.Save();
                }                        

                string body = "Editado por :" + User.Identity.Name;

                Utils.sendSimpleEmail("pedro@dinispt.com", "IMO4", "pedro@dinispt.com", "IMO4 -- Imovel Editado", body);

                imo.descricao = HttpContext.Server.HtmlDecode(imodesc.descrição);

                return View("Globalizar", imo);
               // return RedirectToAction("Detalhes", new { id = imo.imovel.id });
            }
            catch
            {
                return View("NaoIdioma");
            }
        }

        //////////////////////////////////////////

        public ActionResult PorCategorias(int lcode_Id, int classe, int pagee = 1)
        {
            int page = pagee;

            //UserModel userModel = new UserModel();

            int totalUsers = imoRepository.GetTotalImoveisByCategoriaID(classe,lcode_Id);

            Pagination pagination = new Pagination(true);

            pagination.BaseUrl = "/Imovel/PorCategorias/" + lcode_Id + "/" + classe + "/";
            pagination.TotalRows = totalUsers;
            pagination.CurPage = page;

            pagination.PerPage = 10;

            pagination.PrevLink = "Anteriores";
            pagination.NextLink = "Proximos";

            string pageLinks = pagination.GetPageLinks();

            int start = (page - 1) * pagination.PerPage;
            int offset = pagination.PerPage;

            // List<User> users = userModel.GetUsers(start, offset);
            var imo = imoRepository.FindImoveisByCategoria(classe,lcode_Id, start, offset).ToList();

            ViewData["title"] = "Imoveis por Categoria";
            ViewData["totalUsers"] = totalUsers;
            ViewData["users"] = imo;
            ViewData["pageLinks"] = pageLinks;


            return View("Index", imo);
        }



        //////////////////////////////////////////

        /////////////////////////////////USER
        //////////////////////////////////////////
        [Authorize(Roles = "user")]
        [ValidateInput(false)]
        public ActionResult MeusImoveis()
        {

            string pageString = "";

            try
            {
                pageString = Request.Url.Segments[3];
            }
            catch (Exception)
            {
                pageString = null;
            }

            int page = (String.IsNullOrEmpty(pageString)) ? 1 : Int32.Parse(pageString);

            //UserModel userModel = new UserModel();

            int totalUsers = imoRepository.GetTotalImoveisByid(User.Identity.Name);

            Pagination pagination = new Pagination(true);

            pagination.BaseUrl = "/Imovel/MeusImoveis/";
            pagination.TotalRows = totalUsers;
            pagination.CurPage = page;
            pagination.PerPage = 10;

            pagination.PrevLink = "Anteriores";
            pagination.NextLink = "Proximos";

            string pageLinks = pagination.GetPageLinks();

            int start = (page - 1) * pagination.PerPage;
            int offset = pagination.PerPage;

            // List<User> users = userModel.GetUsers(start, offset);
            var imo = imoRepository.FindImoveisByIdentidade(User.Identity.Name, start, offset).ToList();

            ViewData["title"] = "Pagination in Asp.Net Mvc";
            ViewData["totalUsers"] = totalUsers;
            ViewData["users"] = imo;
            ViewData["pageLinks"] = pageLinks;


            return View("IndexMeus", imo);
        }


        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult InsereFotos(string id)
        {
            int idi = 0;
            if (id != "")
            {
                idi = Convert.ToInt32(id);
            }

            ViewData["idi"] = id;

            var fotosporimovel = ftrepository.FindAllFotosById(idi);

            foreach (string name in Request.Files)
            {
                var file = Request.Files[name];
                string fileName = System.IO.Path.GetFileName(file.FileName);
                ftrepository.Add(id, file);
                ftrepository.Save();
                int idd = Convert.ToInt32(id);
                //return RedirectToAction("InsereFotos", new { id = idd });
                fotosporimovel = ftrepository.FindAllFotosById(idi);
                return View("Fotos", fotosporimovel);
            }
            return View("Fotos", fotosporimovel);
        }

        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult ApagarImovel(int id)
        {
            imovel imo = imoRepository.GetImovel(id);
            if (imo == null)
                return View("NaoEncontrado");
            else
                return View("Delete", imo);

        }


        // 
        // HTTP POST: /Dinners/Delete/1

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult ApagarImovel(int id, string confirmButton)
        {

            imovel imo = imoRepository.GetImovel(id);

            if (imo == null)
                return View("NaoEncontrado");

            imoRepository.Delete(imo);
            imoRepository.Save();

            return View("Deleted");
        }


        [Authorize(Roles = "user,admin")]
        [ValidateInput(false)]
        public ActionResult ApagarFoto(int id)
        {
            Foto foto = ftrepository.GetFoto(id);
            string idi = foto.imovel_id.ToString();

            if (foto == null)
                return View("NaoEncontrado");
            else
            {
                ftrepository.DeleteFotoImoveis(foto);
                return RedirectToAction("InsereFotos", "Imovel", new { id = idi });
            }

        }


      
        public ActionResult Search()
        {



            ViewData["Categorias"] = new SelectList(catRepository.FindAllCategoriasByIdioma(LanguageCode).AsEnumerable(), "classe", "nome", 0);
            ViewData["Tipologias"] = new SelectList(tipoRepository.FindAllTipologias().AsEnumerable(), "id", "nome", 0);
            ViewData["Estados"] = new SelectList(estadoRepository.FindAllEstadosByIdioma(LanguageCode).AsEnumerable(), "classe", "estado1", 0);
            ViewData["Objectivos"] = new SelectList(objectivoRepository.FindAllTiposNegocioLang(LanguageCode).AsEnumerable(), "classe", "tipo_negocio", 0);

            /*
            string pageString = "";

            try
            {
                pageString = Request.Url.Segments[3];
            }
            catch (Exception)
            {
                pageString = null;
            }



            int page = (String.IsNullOrEmpty(pageString)) ? 1 : Int32.Parse(pageString);
            if (page > 1)
            {
            
        
            
            
            }               
            else
            return View("Search");*/
            return View();
        }



           [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Search(MvcIMO4.ViewModel.ImovelViewModel imo)
        {

            ViewData["Categorias"] = new SelectList(catRepository.FindAllCategoriasByIdioma(LanguageCode).AsEnumerable(), "classe", "nome", 0);
            ViewData["Tipologias"] = new SelectList(tipoRepository.FindAllTipologias().AsEnumerable(), "id", "nome", 0);
            ViewData["Estados"] = new SelectList(estadoRepository.FindAllEstadosByIdioma(LanguageCode).AsEnumerable(), "id", "estado1", 0);
            ViewData["Objectivos"] = new SelectList(objectivoRepository.FindAllTiposNegocioLang(LanguageCode).AsEnumerable(), "id", "tipo_negocio", 0);

            string pageString = "";

            try
            {
                pageString = Request.Url.Segments[3];
            }
            catch (Exception)
            {
                pageString = null;
            }

 

            int page = (String.IsNullOrEmpty(pageString)) ? 1 : Int32.Parse(pageString);

          /*  if (page == 1)
            {
                flag = 1;
                if (flag > 0)
                {
                    flag = 0;
                }
                //return View("Search");
            }*/


  

  

            var imoresulttotal = imoRepository.FindImoveisByPesquisaTotalRows(imo.imovel);

   



      



            var imoresult = imoRepository.FindImoveisByPesquisa(imo.imovel).ToList();

            ViewData["title"] = "";
            ViewData["totalUsers"] = imoresulttotal.Count();
            ViewData["users"] = imoresult;
 

            return View("SearchIndex", imoresult);

        }

        //////////////////////////////////////////
        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult PorAprovar()
        {

            string pageString = "";

            try
            {
                pageString = Request.Url.Segments[3];
            }
            catch (Exception)
            {
                pageString = null;
            }

            int page = (String.IsNullOrEmpty(pageString)) ? 1 : Int32.Parse(pageString);

            //UserModel userModel = new UserModel();

            int totalUsers = imoRepository.GetTotalImoveisAprovar();

            Pagination pagination = new Pagination(true);

            pagination.BaseUrl = "/Imovel/PorAprovar/";
            pagination.TotalRows = totalUsers;
            pagination.CurPage = page;
            pagination.PerPage = 10;

            pagination.PrevLink = "Anteriores";
            pagination.NextLink = "Proximos";

            string pageLinks = pagination.GetPageLinks();

            int start = (page - 1) * pagination.PerPage;
            int offset = pagination.PerPage;

            var imo = imoRepository.FindAllImoveisPorAprovar(start, offset).ToList();

            ViewData["title"] = "Por Aprovar Imoveis";
            ViewData["totalUsers"] = totalUsers;
            ViewData["users"] = imo;
            ViewData["pageLinks"] = pageLinks;

            return View("AdminAprovar", imo);
        }

        [Authorize(Roles = "admin")]
        [ValidateInput(false)]
        public ActionResult Aprovar(int id)
        {

            imovel imo = imoRepository.GetImovel(id);
            if (imo == null)
                return View("NaoEncontrado");

            try
            {

                imo.status = Convert.ToInt32(AdStatus.Activated);
                imo.data_aprovacao = DateTime.Now;
                imo.data_expira = imo.data_aprovacao.Value.AddMonths(imo.subscrico.numeromeses);
               

                UpdateModel(imo);

                imoRepository.Save();

                return RedirectToAction("Detalhes", new { id = imo.id });
            }
            catch
            {
                return View("AdminAprovar", imo);
            }
        }



        public ActionResult Suporte()
        {

            return View("Contacto");

        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult Suporte(string name, string email, string comments)
        {


            const string emailregex = @"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
            var result = false;

            ViewData["name"] = name;
            ViewData["email"] = email;
            ViewData["comments"] = comments;


            if (string.IsNullOrEmpty(name))
                ViewData.ModelState.AddModelError("name",ViewRes.ImovelStrings.porfavornome);
            if (string.IsNullOrEmpty(email))
                ViewData.ModelState.AddModelError("email", ViewRes.ImovelStrings.porfavoremail);
            if (!string.IsNullOrEmpty(email) && !Regex.IsMatch(email, emailregex))
                ViewData.ModelState.AddModelError("email", ViewRes.ImovelStrings.validemail);
            if (string.IsNullOrEmpty(comments))
                ViewData.ModelState.AddModelError("comments", ViewRes.ImovelStrings.porfavormensagem);

            if (!ViewData.ModelState.IsValid)
                return View("Contacto");

            string body = "";
            body = comments;

            result = Utils.sendSimpleEmail("pedro@dinispt.com", name, email, "IMO4 -- Contacto/Suporte", body);

            return result ? View("Enviado") : View("NaoEncontrado");
        }

        public ActionResult Contacto(int id)
        {

            imovel imo = imoRepository.GetImovel(id);
            if (imo == null)
                return View("NaoEncontrado");


            return View("Contacto");

        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult Contacto(string name, string email, string comments, int id = 0)
        {

            imovel imo = imoRepository.GetImovel(id);
            if (imo == null)
                return View("NaoEncontrado");

            MembershipUser u = Membership.GetUser(imo.identidade);

            const string emailregex = @"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
            var result = false;

            ViewData["name"] = name;
            ViewData["email"] = email;
            ViewData["comments"] = "Imovel com id=" + id + "\n Categoria : " + imo.Categoria.nome + "\n" + comments;


            if (string.IsNullOrEmpty(name))
                ViewData.ModelState.AddModelError("name", "Por favor insira o seu nome!");
            if (string.IsNullOrEmpty(email))
                ViewData.ModelState.AddModelError("email", "Por favor insira o seu e-mail!");
            if (!string.IsNullOrEmpty(email) && !Regex.IsMatch(email, emailregex))
                ViewData.ModelState.AddModelError("email", "Por favor insira um e-mail valido!");
            if (string.IsNullOrEmpty(comments))
                ViewData.ModelState.AddModelError("comments", "Por favor insira uma mensagem!");

            if (!ViewData.ModelState.IsValid)
                return View();

            string body = "";
            body = "Imovel com id=" + id + "\n Categoria : " + imo.Categoria.nome + "\n" + " Valor : " + imo.preco + "\n" + " Tipologia : " + imo.tipologia.nome + "\n" + " Tipo Negocio : " + imo.objectivo.tipo_negocio + "\n" + "Mensagem :" + comments;

            result = Utils.sendSimpleEmail(u.Email, name, email, "IMO4 -- Resposta a Anuncio de Imovel", body);

            return result ? View("Enviado") : View("ErroEmail");
        }
        public bool ValidaImovel(imovel imo)
        {



            bool result = false;

            if (string.IsNullOrEmpty(imo.categoria_id.ToString()))
                ViewData.ModelState.AddModelError("Categoria", "Por Favor Seleccione a Categoria!");
            if (string.IsNullOrEmpty(imo.estado_id.ToString()))
                ViewData.ModelState.AddModelError("Estado Do Imovel", "Por Favor Seleccione o estado do Imovel!");
            if (string.IsNullOrEmpty(imo.tipologia_id.ToString()))
                ViewData.ModelState.AddModelError("Tipo de Negocio", "Por favor insira a Tipologia!");
            if (string.IsNullOrEmpty(imo.objectivo_id.ToString()))
                ViewData.ModelState.AddModelError("Tipo de Negocio", "Por favor insira o tipo de negocio!");
            if (string.IsNullOrEmpty(imo.pais))
                ViewData.ModelState.AddModelError("Pais", "Por favor insira o Pais!");
            if (string.IsNullOrEmpty(imo.distrito))
                ViewData.ModelState.AddModelError("Distrito", "Por favor insira o Distrito!");
            if (string.IsNullOrEmpty(imo.concelho))
                ViewData.ModelState.AddModelError("Concelho", "Por favor insira o Concelho!");
            if (string.IsNullOrEmpty(imo.freguesia))
                ViewData.ModelState.AddModelError("Freguesia", "Por favor insira a freguesia!");
            if (string.IsNullOrEmpty(imo.preco.ToString()))
                ViewData.ModelState.AddModelError("Valor", "Por favor insira o valor!");

            if (!ViewData.ModelState.IsValid)
                return result=false;

            return result = true;

            
        }


  

    
    }
}
