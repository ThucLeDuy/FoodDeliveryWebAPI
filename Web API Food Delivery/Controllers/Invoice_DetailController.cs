using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class Invoice_DetailController : Controller
    {
        // GET: Invoice_Detail_Detail
        Invoice_DetailManager IdM = new Invoice_DetailManager();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public string GetInvoice_DetailLists()//IHttpActionResult GetInvoice_DetailLists()
        {
            return JsonConvert.SerializeObject(IdM.ListInvoice_DetailModel());
        }
        //[Route("api/Invoice_Detail/{id}/{id_product}")]
        [HttpGet]
        public string GetOneInvoice_Detail(int id, int id_product)
        {
            return JsonConvert.SerializeObject(IdM.Lay1Invoice_Detail(id, id_product));
        }
        [HttpGet]
        public string GetAllInvoice_DetailOfInvoiceWithProduct(int id)
        {
            return JsonConvert.SerializeObject(IdM.LayAllInvoice_DetailOfInvoiceWithProduct(id));
        }
        [HttpGet]
        public string GetAllInvoice_DetailOfInvoice(int id)
        {
            return JsonConvert.SerializeObject(IdM.LayAllInvoice_DetailOfInvoice(id));
        }
        [HttpGet]
        public string GetAllInvoice_DetailOneUser([System.Web.Http.FromUri]int id_user)
        {
            try
            {
                return JsonConvert.SerializeObject(IdM.LayAllInvoice_DetailOneUser(id_user));
            }
            catch (Exception e)
            {

                return e.ToString();
            }
            
        }
        [HttpPost]
        public bool InsertNewInvoice_Detail(int id_invoice, int id_product, int quantity)
        {
            try
            {

                Invoice_Detail Invoice_Detail = new Invoice_Detail();
                Invoice_Detail.id = id_invoice;
                Invoice_Detail.id_product = id_product;
                Invoice_Detail.quantity = quantity;
                return IdM.ThemInvoice_Detail(Invoice_Detail);
            }
            catch
            {
                return false;
            }
        }

        //[Route("api/YOURCONTROLLER/{paramOne}/{paramTwo}")]
        [HttpPut]
        public bool UpdateInvoice_Detail(int id_invoice, int id_product, int quantity)
        {

            Invoice_Detail Invoice_Detail = new Invoice_Detail();
            Invoice_Detail.id = id_invoice;
            Invoice_Detail.id_product = id_product;
            Invoice_Detail.quantity = quantity;
            return IdM.CapNhatInvoice_Detail(Invoice_Detail);
        }

        [HttpDelete]
        public bool DeleteOneInvoice_Detail(int id_invoice, int id_product)
        {

            return IdM.XoaOneInvoice_Detail(id_invoice, id_product);
        }
        [HttpDelete]
        public bool DeleteAllInvoice_DetailOfInvoice(int id_invoice)
        {

            return IdM.XoaAllInvoice_DetailOfInvoice(id_invoice);
        }
    }
}