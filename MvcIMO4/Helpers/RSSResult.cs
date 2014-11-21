using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel.Syndication;
using System.Web.Mvc;
using System.Xml;
using NerdDinner.Models;
using MvcIMO4.Models;

namespace NerdDinner.Controllers
{
    public class RssResult : FileResult
    {
        public List<imovel> Dinners { get; set; }
        public string Title { get; set; }

        private Uri currentUrl;

        public RssResult() : base("application/rss+xml") { }

        public RssResult(List<imovel> dinners, string title) :this()
        {
            this.Dinners = dinners;
            this.Title = title;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            currentUrl = context.RequestContext.HttpContext.Request.Url;
            base.ExecuteResult(context);
        }
        protected override void WriteFile(System.Web.HttpResponseBase response)
        {
            var items = new List<SyndicationItem>();

            foreach (imovel d in this.Dinners)
            {
                string contentString = String.Format("{0} with {1} on {2:MMM dd, yyyy} at {3}. Where: {4}, {5}",
                            d.id, d.data_criacao, d.data_criacao, d.freguesia, d.concelho);
                
                var item = new SyndicationItem(
                    title: d.Categoria.nome,
                    content: contentString,
                    itemAlternateLink: new Uri("http://nrddnr.com/" + d.id),
                    id: "http://nrddnr.com/" + d.id,
                    lastUpdatedTime: DateTime.Now);
                item.PublishDate = DateTime.Now;
                item.Summary = new TextSyndicationContent(contentString, TextSyndicationContentKind.Plaintext);
                items.Add(item);
            }

            SyndicationFeed feed = new SyndicationFeed(
                this.Title,
                this.Title, //Using Title also as Description 
                currentUrl, 
                items);

            Rss20FeedFormatter formatter = new Rss20FeedFormatter(feed);

            using (XmlWriter writer = XmlWriter.Create(response.Output))
            {
                formatter.WriteTo(writer);
            }

        }
    }
}
