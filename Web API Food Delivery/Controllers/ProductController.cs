using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class ProductController : Controller
    {
        ProductManager pm = new ProductManager();
        InvoiceManager IM = new InvoiceManager();
        Invoice_DetailManager IdM = new Invoice_DetailManager();
        // GET: Product
        public ActionResult Product()
        {
            ViewBag.Catalog = "Catalog";
            ViewData["Cata"] = "Catalog2";
            return View();
        }

        // GET: Product/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Product/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Product/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Product/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        //[HttpGet]
        //public String GhiFile()
        //{
        //    ProductManager pm = new ProductManager();
        //    string[] lines = System.IO.File.ReadAllLines(@"F:\SalePriceForDiliverFood.txt");
        //    //foreach (string s in lines)
        //    //{
        //    //    Console.WriteLine(s);
        //    //}

        //    DBFoodDataContext db = new DBFoodDataContext();
        //    for (int i = 0; i < pm.ListProducts().Count;i++)
        //    {
        //        Product a = pm.ListProducts()[i];
        //        a.salePrice = Convert.ToDecimal(lines[i]);
        //        pm.CapNhatProduct(a);


        //    }



        //    return "GhiFiled";
        //}

        [HttpPost]
        public String ORDER(List<Models.Product> p, int id_user, string address)//IHttpActionResult GetProductLists()
        {
            Invoice i = new Invoice();
            Invoice_Detail ivoiceD;
            decimal total = 0;
            try
            {
                
                i.Adress = address;
                i.id_user = id_user;
                i.invoice_date = DateTime.Now;

                int id_invoice = IM.ThemInvoiceReID(i);
                
                foreach (Models.Product item in p)
                {
                    ivoiceD = new Invoice_Detail();
                    ivoiceD.id_product = item.id;
                    ivoiceD.quantity = item.quantity;
                    ivoiceD.id = id_invoice;
                    //total += Convert.ToDecimal(item.salePrice * item.quantity);
                    IdM.ThemInvoice_Detail(ivoiceD);
                }
                //i.total = total;
                total = IdM.TinhTongTienHoaDon(id_invoice);
            }
            catch (Exception e)
            {

                throw e;
            }

            return Newtonsoft.Json.JsonConvert.SerializeObject(new Models.Invoice(i.id, i.invoice_date, i.Adress, 0, i.id_user, i.status, total));
        }
        [HttpGet]
        public String GetProductLists()//IHttpActionResult GetProductLists()
        {

            return Newtonsoft.Json.JsonConvert.SerializeObject(pm.ListProductsModel());

        }
        [HttpGet]
        public String GetProductListsWithCategory([System.Web.Http.FromUri]int id_cate)//IHttpActionResult GetProductLists()
        {

            return Newtonsoft.Json.JsonConvert.SerializeObject(pm.LayProductTheoCatagory(id_cate));

        }
        [HttpGet]
        public String Get15_ProductWithHighestTimesBookListsList()//IHttpActionResult GetProductLists()
        {

            return Newtonsoft.Json.JsonConvert.SerializeObject(pm.Lay15_ProductTimeBookedCaoNhat());

        }
        [HttpGet]
        public String GetProduct(int id)//IHttpActionResult GetProductLists()
        {

            return Newtonsoft.Json.JsonConvert.SerializeObject(pm.Lay1Product(id));

        }
        [HttpPost]
        public bool InsertNewProduct(int categoryId, string name, string image, string description, decimal salePrice, int timesBooked)
        {
            try
            {

                Product Product = new Product();
                Product.categoryId = categoryId;
                Product.name = name;
                Product.image = image;
                Product.description = description;
                Product.salePrice = salePrice;
                Product.timesBooked = timesBooked;

                return pm.ThemProduct(Product);
            }
            catch
            {
                return false;
            }
        }


        [HttpPut]
        public bool UpdateProduct(int id, int categoryId, string name, string image, string description, decimal price)
        {

            Product Product = new Product();
            Product.id = id;
            Product.categoryId = categoryId;
            Product.name = name;
            Product.image = image;
            Product.description = description;

            Product.salePrice = price;

            return pm.CapNhatProduct(Product);
        }

        [HttpDelete]
        public bool DeleteProduct(int id)
        {

            return pm.XoaProduct(id);
        }
        // GET: Product/Delete/5
        [HttpPost]
        public ActionResult DeleteProductWithAction(int id)
        {
            pm.XoaProduct(id);
            return RedirectToAction("Product");
        }

        // POST: Product/Delete/5
        [HttpPost]
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
    }
}
