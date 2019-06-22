using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.BUS
{
    public class ProductManager
    {
        DBFoodDataContext db = new DBFoodDataContext();
        public List<Models.Product> ListProductsModel()
        {
            List<Models.Product> listProduct = new List<Models.Product>();
            foreach(Product item in db.Products.ToList())
            {
                listProduct.Add(new Models.Product(item.id, Convert.ToInt32(item.categoryId), item.name, item.image, item.description, item.salePrice, item.timesBooked));
            }
            return listProduct;
        }
        public List<Product> ListProducts()
        {
            return db.Products.ToList();
        }
        public List<Models.Product> Lay15_ProductTimeBookedCaoNhat()
        {
            List<Models.Product> listProduct = new List<Models.Product>();
            int i = 0;
            foreach (Product item in db.Products.ToList())
            {
                if (i < 15)
                {
                    i++;
                    listProduct.Add(new Models.Product(item.id, Convert.ToInt32(item.categoryId), item.name, item.image, item.description, item.salePrice, item.timesBooked));
                }
                else { break; }
            }
            List<Models.Product> listOrdered = listProduct.OrderByDescending(x => x.timesBooked).ToList();
            return listOrdered;
        }
        public List<Models.Product> LayProductTheoCatagory(int id_cate)
        {
            List<Models.Product> listProductCata = new List<Models.Product>();
            foreach (Product item in db.Products.ToList())
            {
                if (id_cate == item.categoryId)
                {
                    listProductCata.Add(new Models.Product(item.id, item.categoryId, item.name, item.image, item.description, item.salePrice, item.timesBooked));
                }
                
            }
            return listProductCata;

        }
        public Models.Product Lay1Product(int id)
        {
            Product item;
            try
            {

                item = db.Products.Single((x => x.id == id));

            }
            catch (Exception e)
            {
                //throw e;
                return null;
            }
            return new Models.Product(item.id, Convert.ToInt32(item.categoryId), item.name, item.image, item.description, item.salePrice, item.timesBooked);

        }
        public bool KiemTraTrungTonTaiProduct(int maProduct)
        {
            foreach (Product nv in ListProducts())
            {
                if (nv.id == maProduct) return true;
            }
            return false;
        }
        
        public bool XoaProduct(int maProduct)
        {
            Product Product = db.Products.Single(x => x.id == maProduct);
            db.Products.DeleteOnSubmit(Product);
            db.SubmitChanges();
            return true;
        }
        
        public bool ThemProduct(Product Product)
        {
            Product.id = ListProducts().Count;

            while (KiemTraTrungTonTaiProduct(Product.id))
            {
                Product.id++;
            }
            //Product.id = ListProducts()[ListProducts().Count].id + 1;
            db.Products.InsertOnSubmit(Product);
            db.SubmitChanges();
            return true;
        }
        public bool CapNhatProduct(Product nv)
        {
            //XoaProduct(nv.id);
            try
            {
                Product a = db.Products.SingleOrDefault(x => x.id == nv.id);
                a = nv;
                db.SubmitChanges();
            }
            catch (Exception)
            {

                return false;
            }
            
            return true;
        }

    }
}