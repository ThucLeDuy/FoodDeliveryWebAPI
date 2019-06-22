using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class Product_CategoryController : Controller
    {
        // GET: Product_Category
        Product_CategoryManager PM = new Product_CategoryManager();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public string GetProduct_CategoryLists()//IHttpActionResult GetProduct_CategoryLists()
        {
            return JsonConvert.SerializeObject(PM.ListProduct_CategorysModel());
        }

        [HttpGet]
        public string GetProduct_Category(int id)
        {
            return JsonConvert.SerializeObject(PM.Lay1ProductCategory(id));
        }

        [HttpPost]
        public bool InsertNewProduct_Category(string name, string description)
        {
            try
            {

                Product_Category Product_Category = new Product_Category();
                Product_Category.name = name;
                Product_Category.description = description;
                return PM.ThemProduct_Category(Product_Category);
            }
            catch
            {
                return false;
            }
        }


        [HttpPut]
        public bool UpdateProduct_Category(int id, string name, string description)
        {

            Product_Category Product_Category = new Product_Category();
            Product_Category.id = id;
            Product_Category.name = name;
            Product_Category.description = description;
            return PM.CapNhatProduct_Category(Product_Category);
        }

        [HttpDelete]
        public bool DeleteProduct_Category(int id)
        {

            return PM.XoaProduct_Category(id);
        }
    }
}