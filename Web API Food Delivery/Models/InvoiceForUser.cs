using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class InvoiceForUser
    {

        public int id_user { get; set; }
        public List<Models.Invoice> invoices { get; set; }
        public InvoiceForUser(int id_user, List<Models.Invoice> invoices)
        {
            this.id_user = id_user;
            this.invoices = invoices;
        }

        public InvoiceForUser()
        {

        }
    }
}