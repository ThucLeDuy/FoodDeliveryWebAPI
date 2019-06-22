using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Web_API_Services_1.BUS
{
    public class Store_UsersManager
    {
        DBFoodDataContext db = new DBFoodDataContext();
        public List<Store_User> ListStore_Users()
        {
            return db.Store_Users.ToList();
        }
        public List<Models.Store_User> ListStore_UsersModel()
        {
            List<Models.Store_User> ListStore_User = new List<Models.Store_User>();
            foreach (Store_User item in db.Store_Users.ToList())
            {
                ListStore_User.Add(new Models.Store_User(item.id, item.email, item.password, item.name,
                    item.gender, item.dob, item.phonenumber, item.address, item.image));
            }
            return ListStore_User;
        }
        public Models.Store_User Lay1Store_User(int id)
        {
            Store_User item;
            try
            {

                item = db.Store_Users.Single((x => x.id == id));
                
            }
            catch (Exception e)
            {
                //throw e;
                return null;
            }
            return new Models.Store_User(item.id, item.email, item.password, item.name,
                    item.gender, item.dob, item.phonenumber, item.address, item.image);
        }
        public bool Login(string email, string password)
        {
            Store_User item;
            try
            {

                item = db.Store_Users.Single((x => x.email == email && x.password == password));

            }
            catch (Exception e)
            {
                //throw e;
                return false;
            }
            return true;
        }
        public Models.Store_User Login_Model(string email, string password)
        {
            Store_User item;
            try
            {

                item = db.Store_Users.Single((x => x.email == email && x.password == password));

            }
            catch (Exception e)
            {
                //throw e;
                return null;
            }
            return new Models.Store_User(item.id, item.email, item.password, item.name,
                    item.gender, item.dob, item.phonenumber, item.address, item.image);
        }

        //public bool KiemTraTrungTonTaiUser(int maUser)
        //{
        //    foreach (Employee nv in db.Employees.ToList())
        //    {
        //        if (nv.id == maUser) return true;
        //    }
        //    return false;
        //}
        public bool KiemTraTrungTonTaiUser(int maUser)
        {
            foreach (Store_User nv in db.Store_Users.ToList())
            {
                if (nv.id == maUser) return true;
            }
            return false;
        }
        public static string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }
        public bool XoaStore_User(int maStore_User)
        {
            Store_User Store_User = db.Store_Users.Single(x => x.id == maStore_User);
            db.Store_Users.DeleteOnSubmit(Store_User);
            db.SubmitChanges();
            return true;
        }
        public bool ThemStore_User(Store_User store_User)
        {
            store_User.id = ListStore_Users().Count;
            while (KiemTraTrungTonTaiUser(store_User.id))
            {
                store_User.id++;
            }
            
            db.Store_Users.InsertOnSubmit(store_User);
            db.SubmitChanges();
            
            return true;
        }
        public Models.Store_User ThemStore_UserModel(Store_User store_User)
        {
            store_User.id = ListStore_Users().Count;
            while (KiemTraTrungTonTaiUser(store_User.id))
            {
                store_User.id++;
            }

            db.Store_Users.InsertOnSubmit(store_User);
            db.SubmitChanges();

            return new Models.Store_User(store_User.id, store_User.email, store_User.password, store_User.name,
                    store_User.gender, store_User.dob, store_User.phonenumber, store_User.address, store_User.image);
        }
        //mục đích củaThemStore_UserKoTang là ko tự động tăng, 
        //nhằm khi id đã dc xử lý trước r, vd như ThemEmployeeWithD bên EmployeeManager
        public bool ThemStore_UserKoTang(Store_User Store_User)
        {

            db.Store_Users.InsertOnSubmit(Store_User);
            db.SubmitChanges();

            return true;
        }

        public bool CapNhatStore_User(Store_User nv)
        {
            try
            {
                Store_User a = db.Store_Users.SingleOrDefault(x => x.id == nv.id);
                a = nv;
                db.SubmitChanges();
            }
            catch (Exception)
            {

                return false;
            }

            return true;
        }
        public Models.Store_User CapNhatStore_UserModel(Store_User item)
        {
            try
            {
                Store_User a = db.Store_Users.SingleOrDefault(x => x.id == item.id);
                a = item;
                db.SubmitChanges();
            }
            catch (Exception e)
            {

                return null;
            }

            return (new Models.Store_User(item.id, item.email, item.password, item.name,
                    item.gender, item.dob, item.phonenumber, item.address, item.image));
        }
    }
}