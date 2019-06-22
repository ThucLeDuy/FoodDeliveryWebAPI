using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class HomeController : Controller
    {
        ProductManager pm = new ProductManager();
        EmployeeManager em = new EmployeeManager();
        Store_UsersManager sm = new Store_UsersManager();
        InvoiceManager im = new InvoiceManager();
        Product_CategoryManager pc_m = new Product_CategoryManager();
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }
        
        public ActionResult Login()
        {
            ViewBag.Title = "Login";

            return View();
        }
        public ActionResult Product()
        {

            ViewBag.Title = "Product";
            ViewBag.Products = pm.ListProducts();
            ViewBag.Product_Categorys = pc_m.ListProduct_Categorys();
            return View();
        }
        public ActionResult Users()
        {

            ViewBag.Title = "Users";
            ViewBag.Users = sm.ListStore_Users();
            return View();
        }
        public ActionResult Invoices()
        {

            ViewBag.Title = "Invoices";
            ViewBag.Invoices = im.ListInvoices();
            return View();
        }
        public ActionResult Employee()
        {

            ViewBag.Title = "Employee";
            ViewBag.Employee = em.ListEmployees();
            return View();
        }
        public List<Product> ProductsList()
        {
            //ViewBag.Title = "Product";

            return pm.ListProducts();
        }
    }
}
