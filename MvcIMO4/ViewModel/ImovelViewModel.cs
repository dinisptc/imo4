using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcIMO4.ViewModel
{
    public class ImovelViewModel
    {
        public MvcIMO4.Models.imovel imovel { get; set; }
        public string descricao { get; set; }      
        public MvcIMO4.Models.Idioma idioma { get; set; }
    } 

}