using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.BUS
{
    public class InvoiceManager
    {
        DBFoodDataContext db = new DBFoodDataContext();
        //Invoice_DetailManager ID_M = new Invoice_DetailManager();
        public List<Invoice> ListInvoices()
        {
            return db.Invoices.ToList();
        }
        public Models.Invoice Lay1Invoice(int id)
        {
            Invoice item;
            try
            {

                item = db.Invoices.Single((x => x.id == id));

            }
            catch (Exception e)
            {
                //throw e;
                return null;
            }
            return new Models.Invoice(item.id, item.invoice_date, item.Adress, item.id_employee, item.id_user,item.status, item.total);
        }
        public List<Models.Invoice> ListInvoicesModel()
        {
            List<Models.Invoice> ListInvoice = new List<Models.Invoice>();
            foreach (Invoice item in db.Invoices.ToList())
            {
                ListInvoice.Add(new Models.Invoice(item.id, item.invoice_date, item.Adress, item.id_employee, item.id_user, item.status, item.total));
            }
            return ListInvoice;
        }
        public bool KiemTraTrungTonTaiInvoice(int maInvoice)
        {
            foreach (Invoice nv in ListInvoices())
            {
                if (nv.id == maInvoice) return true;
            }
            return false;
        }

        public bool XoaInvoiceWithId(int maInvoice)
        {
            foreach(Invoice inc in ListInvoices())
            {
                if(inc.id == maInvoice)
                {
                    db.Invoices.DeleteOnSubmit(inc);
                    db.SubmitChanges();
                    return true;
                }
            }
            return false;
        }
        public bool XoaInvoice(int maInvoice, DateTime invoiceDate)
        {
            foreach (Invoice inc in ListInvoices())
            {
                if (inc.id == maInvoice && inc.invoice_date == invoiceDate)
                {
                    db.Invoices.DeleteOnSubmit(inc);
                    db.SubmitChanges();
                    return true;
                }
            }
            return false;
        }
        public int ThemInvoiceReID(Invoice Invoice)
        {
            Invoice.id = ListInvoices().Count;
            while (KiemTraTrungTonTaiInvoice(Invoice.id))
            {
                Invoice.id++;
            }

            db.Invoices.InsertOnSubmit(Invoice);
            db.SubmitChanges();
            return Invoice.id;
        }
        public bool ThemInvoice(Invoice Invoice)
        {
            Invoice.id = ListInvoices().Count;
            while (KiemTraTrungTonTaiInvoice(Invoice.id))
            {
                Invoice.id++;
            }

            db.Invoices.InsertOnSubmit(Invoice);
            db.SubmitChanges();
            return true;
        }
        public bool CapNhatInvoice(Invoice nv)
        {
            try
            {
                Invoice a = db.Invoices.SingleOrDefault(x => x.id == nv.id);
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