using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel;
using ViewRes;
using MvcIMO4.Helpers;

namespace MvcIMO4.Models
{
    [MetadataType(typeof(OrderMetadata))]
    public partial class OrdemdeCompra
    {
        // Validation rules for the Order class

        [Bind(Exclude = "OrderId")]
        public class OrderMetadata
        {
            //[Required(ErrorMessage = "First Name is required")]
            [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
            [LocalizedDisplayName("OrdFirstName", NameResourceType = typeof(Names))]
            // [DisplayName("First Name")]
            [StringLength(160)]
            public object FirstName { get; set; }

            [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
            [LocalizedDisplayName("OrdLastName", NameResourceType = typeof(Names))]
           // [Required(ErrorMessage = "Last Name is required")]
            //[DisplayName("Last Name")]
            [StringLength(160)]
            public object LastName { get; set; }

            //[Required(ErrorMessage = "Invoice Info is required")]
 
            [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
            [LocalizedDisplayName("OrdInvoice", NameResourceType = typeof(Names))]
            public object InvoiceInfo { get; set; }

            [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
           // [Required(ErrorMessage = "Phone is required")]
            [LocalizedDisplayName("OrdPhone", NameResourceType = typeof(Names))]
            [StringLength(24)]
            public object Phone { get; set; }


             [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
             [LocalizedDisplayName("RegEmail", NameResourceType = typeof(Names))]
           // [Required(ErrorMessage = "Email Address is required")]
            //[DisplayName("Email Address")]
            [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", ErrorMessage = "Email is is not valid.")]
            [DataType(DataType.EmailAddress)]
            public object Email { get; set; }

            [ScaffoldColumn(false)]
            public object OrderId { get; set; }

            [ScaffoldColumn(false)]
            public object OrderDate { get; set; }

            [ScaffoldColumn(false)]
            public object Username { get; set; }

            [ScaffoldColumn(false)]
            public object Total { get; set; }
        }
    }
}