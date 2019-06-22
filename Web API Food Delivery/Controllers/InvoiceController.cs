using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class InvoiceController : Controller
    {
        // GET: Invoice
        InvoiceManager IM = new InvoiceManager();
        [HttpGet]
        public string GetInvoiceTEST()
        {
            return "test";
        }
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public string GetInvoiceLists()//IHttpActionResult GetInvoiceLists()
        {
            return JsonConvert.SerializeObject(IM.ListInvoicesModel());
        }

        
        [HttpGet]
        public string GetInvoice(int id)
        {
            return JsonConvert.SerializeObject(IM.Lay1Invoice(id));
        }

        [HttpPost]
        public bool InsertNewInvoice(DateTime invoice_date, string adress, int id_employee, int id_user, decimal total)
        {
            try
            {

                Invoice Invoice = new Invoice();
                Invoice.invoice_date = invoice_date;
                Invoice.Adress = adress;
                Invoice.id_employee = id_employee;
                Invoice.id_user = id_user;
                Invoice.total = total;
                return IM.ThemInvoice(Invoice);
            }
            catch
            {
                return false;
            }
        }


        [HttpPut]
        public bool UpdateInvoice(int id, DateTime invoice_date, string adress, int id_employee, int id_user, decimal total)
        {

            Invoice Invoice = new Invoice();
            Invoice.id = id;
            Invoice.invoice_date = invoice_date;
            Invoice.Adress = adress;
            Invoice.id_employee = id_employee;
            Invoice.id_user = id_user;
            Invoice.total = total;
            return IM.CapNhatInvoice(Invoice);
        }

        [HttpDelete]
        public bool DeleteInvoice(int id)
        {

            return IM.XoaInvoiceWithId(id);
        }
    }
}