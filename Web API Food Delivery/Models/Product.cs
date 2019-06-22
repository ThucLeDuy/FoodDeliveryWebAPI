using System;

namespace Web_API_Services_1.Models
{
    public class Product
    {
        
        public int id { get; set; }

        public System.Nullable<int> categoryId { get; set; }

        public string name { get; set; }

        public string image { get; set; }

        public string description { get; set; }

        public System.Nullable<decimal> salePrice { get; set; }

        public System.Nullable<int> timesBooked { get; set; }

        public int quantity { get; set; }
        

        public Product(int id, int? categoryId, string name, string image, string description, decimal? salePrice, int? timesBooked)
        {
            this.id = id;
            this.categoryId = categoryId;
            this.name = name;
            this.image = image;
            this.description = description;
            this.salePrice = salePrice;
            this.timesBooked = timesBooked;
        }
        public Product(int id, int quantity)
        {
            this.id = id;
            this.quantity = quantity;
        }
        public Product()
        {

        }
    }
}