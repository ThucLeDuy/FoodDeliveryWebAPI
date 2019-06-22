using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class ProductApiController : ApiController
    {
        ProductManager PM = new ProductManager();
        //Store_UsersManager SU = new Store_UsersManager();
        [HttpGet]
        public List<Product> GetProductLists()//IHttpActionResult GetProductLists()
        {

            return PM.ListProducts();

        }

        [HttpGet]
        public Models.Product GetProduct(int id)
        {
            return PM.Lay1Product(id);
        }

        [HttpPost]
        public bool InsertNewProduct(int categoryId, string name, string image, string description, decimal price, DateTime created_at, DateTime updated_at)
        {
            try
            {

                Product Product = new Product();
                Product.categoryId = categoryId;
                Product.name = name;
                Product.image = image;
                Product.description = description;

                Product.salePrice = price;

                return PM.ThemProduct(Product);
            }
            catch
            {
                return false;
            }
        }


        [HttpPut]
        public bool UpdateProduct(int id, int categoryId, string name, string image, string description, decimal price, DateTime created_at, DateTime updated_at)
        {

            Product Product = new Product();
            Product.id = id;
            Product.categoryId = categoryId;
            Product.name = name;
            Product.image = image;
            Product.description = description;

            Product.salePrice = price;

            return PM.CapNhatProduct(Product);
        }

        [HttpDelete]
        public bool DeleteProduct(int id)
        {

            return PM.XoaProduct(id);
        }
    }
}
