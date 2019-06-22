using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Invoice
    {
        public Invoice(int id_invoice, DateTime invoice_date, string adress, int? id_employee, string status, decimal? total, List<Models.Invoice_DetailNotID> detailProducts)
        {
            this.id_invoice = id_invoice;
            this.invoice_date = invoice_date;
            Adress = adress;
            this.id_employee = id_employee;
            this.total = total;
            this.status = status;
            this.detailProducts = detailProducts;
        }
        public Invoice(int id, DateTime invoice_date, string adress, int? id_employee, int? id_user, string status, decimal? total)
        {
            this.id_invoice = id;
            this.invoice_date = invoice_date;
            Adress = adress;
            this.id_employee = id_employee;
            this.id_user = id_user;
            this.total = total;
            this.status = status;
        }
        public string status { get; set; }
        public int id_invoice { get; set; }

        public System.DateTime invoice_date { get; set; }

        public string Adress { get; set; }

        public System.Nullable<int> id_employee { get; set; }

        public System.Nullable<int> id_user { get; set; }

        public System.Nullable<decimal> total { get; set; }
        public List<Invoice_DetailNotID> detailProducts { get; set; }
    }
}