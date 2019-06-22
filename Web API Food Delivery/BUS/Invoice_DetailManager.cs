using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.BUS
{
    public class Invoice_DetailManager
    {
        DBFoodDataContext db = new DBFoodDataContext();
        ProductManager PM = new ProductManager();
        
        //InvoiceManager IM = new InvoiceManager();
        public List<Invoice_Detail> ListInvoice_Details()
        {
            return db.Invoice_Details.ToList();
        }
        public List<Models.Invoice_DetailWithProducts> LayAllInvoice_DetailOfInvoiceWithProduct(int id)
        {

            List<Models.Invoice_DetailWithProducts> ListInvoice_Detail = new List<Models.Invoice_DetailWithProducts>();
            Models.Product p;
            foreach (Invoice_Detail item in db.Invoice_Details.ToList())
            {
                p = PM.Lay1Product(item.id_product);
                if (item.id == id)
                    ListInvoice_Detail.Add(new Models.Invoice_DetailWithProducts(item.id_product, p.categoryId, p.name, p.image, p.description, p.salePrice, p.timesBooked, item.quantity));
            }
            return ListInvoice_Detail;
        }
        public List<Models.Invoice_Detail> LayAllInvoice_DetailOfInvoice(int id)
        {

            List<Models.Invoice_Detail> ListInvoice_Detail = new List<Models.Invoice_Detail>();
            foreach (Invoice_Detail item in db.Invoice_Details.ToList())
            {
                if(item.id == id)
                    ListInvoice_Detail.Add(new Models.Invoice_Detail(item.id, item.id_product, item.quantity));
            }
            return ListInvoice_Detail;
        }
        public List<Models.Invoice_DetailNotID> LayAllInvoice_DetailOfInvoiceWithoutID(int id)
        {
            List<Models.Invoice_DetailNotID> ListInvoice_Detail = new List<Models.Invoice_DetailNotID>();
            foreach (Invoice_Detail item in db.Invoice_Details.ToList())
            {
                if (item.id == id)
                    ListInvoice_Detail.Add(new Models.Invoice_DetailNotID(item.id_product, Convert.ToInt32(item.quantity)));
            }
            return ListInvoice_Detail;
        }
        public List<Invoice_Detail> LayAllInvoice_DetailOfInvoiceNotModel(int id)
        {
            List<Invoice_Detail> ListInvoice_Detail = new List<Invoice_Detail>();
            foreach (Invoice_Detail item in db.Invoice_Details.ToList())
            {
                if (item.id == id)
                    ListInvoice_Detail.Add(item);
            }
            return ListInvoice_Detail;
        }

        public Models.InvoiceForUser LayAllInvoice_DetailOneUser(int id_user)
        {
            Models.InvoiceForUser InvoiceForUser;
            //List<Models.Invoice_Detail> ListInvoice_Detail = new List<Models.Invoice_Detail>();
            List<Models.Invoice> invoices = new List<Models.Invoice>();
            Models.Invoice invoice;
            foreach (Invoice item in db.Invoices.ToList())
            {
                if(item.id_user == id_user)
                {
                    invoice = new Models.Invoice(item.id, item.invoice_date, item.Adress, item.id_employee, item.status, item.total, LayAllInvoice_DetailOfInvoiceWithoutID(item.id));
                    invoices.Add(invoice);
                }
            }
            InvoiceForUser = new Models.InvoiceForUser(id_user, invoices);
            if (invoices.Count == 0)
                return null;
            return InvoiceForUser;
        }

        public List<Models.Invoice_Detail> ListInvoice_DetailModel()
        {
            List<Models.Invoice_Detail> ListInvoice_Detail = new List<Models.Invoice_Detail>();
            foreach (Invoice_Detail item in db.Invoice_Details.ToList())
            {
                ListInvoice_Detail.Add(new Models.Invoice_Detail(item.id, item.id_product, item.quantity));
            }
            return ListInvoice_Detail;
        }
        public bool KiemTraTrungTonTaiInvoice_Detail(int maInvoice_Detail)
        {
            foreach (Invoice_Detail nv in ListInvoice_Details())
            {
                if (nv.id == maInvoice_Detail) return true;
            }
            return false;
        }
        public Models.Invoice_Detail Lay1Invoice_Detail(int id, int id_product)
        {
            Invoice_Detail item = null;
            try
            {
                foreach (Invoice_Detail nv in ListInvoice_Details())
                {
                    if (nv.id == id && nv.id_product == id_product)
                    {
                        item = nv;
                        break;
                    }
                }

                //item = db.Invoice_Details.Single((x => x.id == id));
                return new Models.Invoice_Detail(item.id, item.id_product, item.quantity);
            }
            catch (Exception e)
            {
                //throw e;
                return null;
            }
            

        }

        public bool XoaOneInvoice_Detail(int maInvoice_Detail, int id_product)
        {
            try
            {
                foreach (Invoice_Detail nv in ListInvoice_Details())
                {
                    if (nv.id == maInvoice_Detail && nv.id_product == id_product)
                    {
                        db.Invoice_Details.DeleteOnSubmit(nv);
                        db.SubmitChanges();
                        TinhTongTienHoaDon(maInvoice_Detail);
                        return true;
                    }
                        
                }
                return false;
            }
            catch (Exception e)
            {
                //throw e;
                return false;
            }
            
        }
        public bool XoaAllInvoice_DetailOfInvoice(int maInvoice_Detail)
        {
            try
            {
                foreach (Invoice_Detail nv in ListInvoice_Details())
                {
                    if (nv.id == maInvoice_Detail)
                    {
                        db.Invoice_Details.DeleteOnSubmit(nv);
                        db.SubmitChanges();
                        TinhTongTienHoaDon(maInvoice_Detail);
                        return true;
                    }

                }
                return false;
            }
            catch (Exception e)
            {
                //throw e;
                return false;
            }

        }
        public bool ThemInvoice_Detail(Invoice_Detail invoice)
        {
            Product p = db.Products.Single(x => x.id == invoice.id_product);
            p.timesBooked++;
            PM.CapNhatProduct(p);
            db.Invoice_Details.InsertOnSubmit(invoice);
            db.SubmitChanges();
            //TinhTongTienHoaDon(invoice.id);
            return true;
        }
        public bool CapNhatInvoice_Detail(Invoice_Detail nv)
        {
            try
            {
                Invoice_Detail a = db.Invoice_Details.SingleOrDefault(x => x.id == nv.id && nv.id_product == x.id_product);
                a.quantity = nv.quantity;
                db.SubmitChanges();
            }
            catch (Exception)
            {

                return false;
            }

            TinhTongTienHoaDon(nv.id);
            return true;
        }
        public decimal TinhTongTienHoaDon(int id_invoice)
        {
            Invoice i = db.Invoices.Single(x => x.id == id_invoice);

            decimal totalPrice = 0;
            foreach (Invoice_Detail invoice_dtl in ListInvoice_Details())
            {
                if (id_invoice == invoice_dtl.id)
                    totalPrice = totalPrice + Convert.ToDecimal(db.Products.Single(x => x.id == invoice_dtl.id_product).salePrice * invoice_dtl.quantity);
            }
            i.total = totalPrice;
            CapNhatInvoice(i);
            return totalPrice;
        }
        public bool CapNhatInvoice(Invoice nv)
        {
            try
            {
                Invoice a = db.Invoices.SingleOrDefault(x => x.id == nv.id);
                a.total = nv.total;
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