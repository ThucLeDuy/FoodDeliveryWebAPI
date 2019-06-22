using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class TestJson
    {
        
        public int id_product { get; set; }
        public string name { get; set; }

        public TestJson(int id_product, string name)
        {
            this.id_product = id_product;
            this.name = name;
        }
    }
}