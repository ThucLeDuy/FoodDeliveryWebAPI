using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Product_Category
    {
        public int id { get; set; }

        public string name { get; set; }

        public string description { get; set; }

        public Product_Category(int id, string name, string description)
        {
            this.id = id;
            this.name = name;
            this.description = description;
        }
    }
}