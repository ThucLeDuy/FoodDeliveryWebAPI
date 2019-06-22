using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Invoice_DetailNotID
    {
        public Invoice_DetailNotID(int id_product, int quantity)
        {
            this.id_product = id_product;
            this.quantity = quantity;
        }

        public int? id_product { get; set; }

        public int? quantity { get; set; }
        public Invoice_DetailNotID()
        {

        }
    }
}