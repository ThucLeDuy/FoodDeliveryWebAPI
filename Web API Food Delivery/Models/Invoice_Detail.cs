using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Invoice_Detail
    {
        public Invoice_Detail(int id, int? id_product, int? quantity)
        {
            this.id = id;
            this.id_product = id_product;
            this.quantity = quantity;
        }
        public Invoice_Detail(int id_product, int quantity)
        {
            this.id_product = id_product;
            this.quantity = quantity;
        }
        public int id { get; set; }

        public int? id_product { get; set; }

        public int? quantity { get; set; }
        public Invoice_Detail()
        {

        }
    }
}