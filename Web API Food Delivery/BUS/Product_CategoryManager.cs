using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace Web_API_Services_1.BUS
{
    public class Product_CategoryManager
    {
        DBFoodDataContext db = new DBFoodDataContext();
        public static int globalProduct_catalogID = 0;
        public List<Product_Category> ListProduct_Categorys()
        {
            return db.Product_Categories.ToList();
        }
        public List<Models.Product_Category> ListProduct_CategorysModel()
        {
            List<Models.Product_Category> ListProduct_Category = new List<Models.Product_Category>();
            foreach (Product_Category item in db.Product_Categories.ToList())
            {
                ListProduct_Category.Add(new Models.Product_Category(item.id, item.name, item.description));
            }
            return ListProduct_Category;
        }
        public bool KiemTraTrungTonTaiProduct_Category(int maProduct_Category)
        {
            foreach (Product_Category nv in ListProduct_Categorys())
            {
                if (nv.id == maProduct_Category) return true;
            }
            return false;
        }
        public Models.Product_Category Lay1ProductCategory(int id)
        {
            Product_Category item;
            try
            {

                item = db.Product_Categories.Single((x => x.id == id));

            }
            catch (Exception e)
            {
                //throw e;
                return null;
            }
            return new Models.Product_Category(item.id, item.name, item.description);

        }
        public bool XoaProduct_Category(int maProduct_Category)
        {
            Product_Category Product_Category = db.Product_Categories.Single(x => x.id == maProduct_Category);
            db.Product_Categories.DeleteOnSubmit(Product_Category);
            db.SubmitChanges();
            return true;
        }
        public bool ThemProduct_Category(Product_Category Product_Category)
        {
            Product_Category.id = ListProduct_Categorys().Count;

            while (KiemTraTrungTonTaiProduct_Category(Product_Category.id))
            {
                Product_Category.id++;
            }
            db.Product_Categories.InsertOnSubmit(Product_Category);
            db.SubmitChanges();
            return true;
        }
        public bool CapNhatProduct_Category(Product_Category nv)
        {
            XoaProduct_Category(nv.id);
            db.Product_Categories.InsertOnSubmit(nv);
            db.SubmitChanges();
            return true;
        }
    }
}