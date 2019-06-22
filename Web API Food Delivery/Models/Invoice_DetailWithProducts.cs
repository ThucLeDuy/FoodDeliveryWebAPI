using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Invoice_DetailWithProducts
    {

        public int id_product { get; set; }

        public System.Nullable<int> categoryId { get; set; }

        public string name { get; set; }

        public string image { get; set; }

        public string description { get; set; }

        public System.Nullable<decimal> salePrice { get; set; }

        public System.Nullable<int> timesBooked { get; set; }

        public System.Nullable<int> quantity { get; set; }
        public Invoice_DetailWithProducts()
        {

        }

        public Invoice_DetailWithProducts(int id_product, int? categoryId, string name, string image, string description, decimal? salePrice, int? timesBooked, int? quantity)
        {
            this.id_product = id_product;
            this.categoryId = categoryId;
            this.name = name;
            this.image = image;
            this.description = description;
            this.salePrice = salePrice;
            this.timesBooked = timesBooked;
            this.quantity = quantity;
        }
    }
}