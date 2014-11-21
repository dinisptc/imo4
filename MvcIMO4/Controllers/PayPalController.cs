using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcIMO4.Models;
using System.Net;
using System.Text;
using System.IO;
using MvcIMO4.Models.PayPalRepositorio;
using NLog;

namespace MvcIMO4.Controllers
{

    public class PayPalController : Controller
    {


        PayPalRepositorio paycnt = new PayPalRepositorio();

        private imo4Entities storeDB = new imo4Entities();

        //ICMSRepository _cmsRepository;
        //ICustomerRepository _customerRepository;
        //IObjectStore _objectStore;

        /*public PayPalController(ICustomerRepository customerRepository,
            ICMSRepository cmsRepository,
            IObjectStore objectStore) : base(customerRepository,objectStore,cmsRepository) {
            
            _cmsRepository = cmsRepository;
            _objectStore = objectStore;
            _customerRepository = customerRepository;
            this.ThemeName = "Admin";
        }*/

       private static Logger _logger = LogManager.GetCurrentClassLogger();



        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IPN()
        {

            var formVals = new Dictionary<string, string>();
            formVals.Add("cmd", "_notify-validate");

            string response = GetPayPalResponse(formVals, true);

            if (response == "VERIFIED")
            {

                string transactionID = Request["txn_id"];
                string sAmountPaid = Request["mc_gross"];
                string orderID = Request["custom"];

                _logger.Info("IPN Verified for order :" + orderID);

                //validate the order
                Decimal amountPaid = 0;
                Decimal.TryParse(sAmountPaid, out amountPaid);

                //Order order = _orderService.GetOrder(new Guid(orderID));

                OrdemdeCompra order = null;


                //check the amount paid
                 _logger.Info("IPN Verified for order :" + orderID);
                if (AmountPaidIsValid(order, amountPaid))
                {




                    //process it
                    try
                    {
                        //_pipeline.AcceptPalPayment(order, transactionID, amountPaid);
                        _logger.Info("IPN Order successfully transacted: " + orderID);


                        return RedirectToAction("Recibo", "PayPal", new { id = orderID });
                    }
                    catch
                    {
                        _logger.Warn("Catch IPN ERROR " + orderID);
                        //HandleProcessingError(order, x);
                        return View();
                    }
                }
                else
                {
                    //let fail - this is the IPN so there is no viewer
                }
            }



            return View();
        }

        /// <summary>
        /// Handles the PDT Response from PayPal
        /// </summary>
        /// <returns></returns>
        public ActionResult PDT()
        {

            //4djw0iqV33H0AGP7hJYD09V_SaHyvk5QASwy0_Bg-DzY0sGWNJXtnWEDW_q

            _logger.Info("PDT Invoked");
            _logger.Info("PDT Invoked");
            _logger.Info("PDT Invoked");
            _logger.Info("PDT Invoked");
            string transactionID = Request.QueryString["tx"];
            string sAmountPaid = Request.QueryString["amt"];
            string orderID = Request.QueryString["cm"];
            _logger.Info("PDT Invoked Request.QueryStr transaction" + transactionID);
            _logger.Info("PDT Invoked Request.QueryStr amountpaid" + sAmountPaid);
            _logger.Info("PDT Invoked");
           

            _logger.Info("PDT  Request.QueryStr order " + orderID);

            Dictionary<string, string> formVals = new Dictionary<string, string>();
            formVals.Add("cmd", "_notify-synch");
            formVals.Add("at", "4djw0iqV33H0AGP7hJYD09V_SaHyvk5QASwy0_Bg-DzY0sGWNJXtnWEDW_q");
            formVals.Add("tx", transactionID);

            _logger.Info("PDT transactionID" + transactionID);

            string response = GetPayPalResponse(formVals, true);
            _logger.Info("PDT Response received: " + response);
            if (response.StartsWith("SUCCESS"))
            {
                _logger.Info("PDT Response received for order " + orderID);

                //validate the order
                Decimal amountPaid = 0;
                Decimal.TryParse(sAmountPaid, out amountPaid);




                OrdemdeCompra order = null;
                _logger.Info("PDT info on order");

                if (AmountPaidIsValid(order, amountPaid))
                {





                    //process it
                    try
                    {
                        // _pipeline.AcceptPalPayment(order, transactionID, amountPaid);
                        _logger.Info("PDT Order successfully transacted: " + orderID);
                        return RedirectToAction("Recibo", "PayPal", new { id = orderID });
                    }
                    catch (Exception ex)
                    {

                        _logger.Info("Erro ",ex.Message);

                        
                        return View("Error");
                    }

                }
                else
                {
                    //Payment amount is off
                    //this can happen if you have a Gift cert at PayPal
                    //be careful of this!
                    //HandleProcessingError(order, new InvalidOperationException("Amount paid (" + amountPaid.ToString("C") + ") was below the order total"));
                    return RedirectToAction("Recibo", "PayPal", new { id = orderID });
                }
            }
            else
            {
                ViewData["message"] = "Your payment was not successful with PayPal";
                _logger.Info("Response" + response);
                _logger.Info("Your payment was not successful with PayPal");
                return View("Error");
            }
        }
        /// <summary>
        /// Utility method for handling PayPal Responses
        /// </summary>
        string GetPayPalResponse(Dictionary<string, string> formVals, bool useSandbox)
        {

            string paypalUrl = useSandbox ? "https://www.sandbox.paypal.com/cgi-bin/webscr"
                : "https://www.paypal.com/cgi-bin/webscr";


            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(paypalUrl);

            // Set values for the request back
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";

            byte[] param = Request.BinaryRead(Request.ContentLength);
            string strRequest = Encoding.ASCII.GetString(param);

            StringBuilder sb = new StringBuilder();
            sb.Append(strRequest);

            foreach (string key in formVals.Keys)
            {
                sb.AppendFormat("&{0}={1}", key, formVals[key]);
            }
            strRequest += sb.ToString();
            req.ContentLength = strRequest.Length;

            //for proxy
            //WebProxy proxy = new WebProxy(new Uri("http://urlort#");
            //req.Proxy = proxy;
            //Send the request to PayPal and get the response
            string response = "";
            using (StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII))
            {

                streamOut.Write(strRequest);
                streamOut.Close();
                using (StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream()))
                {
                    response = streamIn.ReadToEnd();
                }
            }
            _logger.Info("Response"+response);
            return response;
        }
        bool AmountPaidIsValid(OrdemdeCompra order, decimal amountPaid)
        {

            //pull the order
            bool result = true;

            if (order != null)
            {
                if (order.Total > amountPaid)
                {
                    _logger.Warn("Invalid order amount to PDT/IPN: " + order.OrderId + "; Actual: " + amountPaid.ToString("C") + "; Should be: " + order.Total.ToString("C") + "user IP is " + Request.UserHostAddress);
                    result = false;
                }
            }
            else
            {
                _logger.Warn("Invalid order ID passed to PDT/IPN; user IP is " + Request.UserHostAddress);
            }
            return result;

        }
        string GetPDTValue(string pdt, string key)
        {

            string[] keys = pdt.Split('\n');
            string thisVal = "";
            string thisKey = "";
            foreach (string s in keys)
            {
                string[] bits = s.Split('=');
                if (bits.Length > 1)
                {
                    thisVal = bits[1];
                    thisKey = bits[0];
                    if (thisKey.Equals(key, StringComparison.InvariantCultureIgnoreCase))
                        break;
                }
            }
            return thisVal;


        }


        public ActionResult Recibo(int id)
        {

            // Validate customer owns this order
            bool isValid = storeDB.OrdemdeCompras.Any(
              o => o.OrderId == id &&
              o.Username == User.Identity.Name);

            var orderi = (from order in storeDB.OrdemdeCompras
                          where order.OrderId == id
                          select order).SingleOrDefault();

            if (isValid)
            {
                var subsid = (from subs in orderi.OrderDetails
                              select subs).SingleOrDefault();

               

                subscrico sb = new subscrico();

                sb = subsid.subscrico;

                sb.pago = true;

                storeDB.SaveChanges();

                return View("Recibo", Convert.ToInt32(id)); 

      

            }
            else
            {
                return View("Error");
            }




        }
    }
    
}
