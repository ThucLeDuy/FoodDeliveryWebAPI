using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class Store_UserController : Controller
    {
        Store_UsersManager sm = new Store_UsersManager();
        // GET: Store_User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public string Get_UsersLists()//IHttpActionResult GetProduct_CategoryLists()
        {
            return JsonConvert.SerializeObject(sm.ListStore_UsersModel());
        }

        [HttpGet]
        public string Get_User(int id)
        {
            return JsonConvert.SerializeObject(sm.Lay1Store_User(id));
        }

        [HttpPost]
        public bool AddUser(string email, string password, string name, int gender, DateTime dob, string phonenumber, string address, string image)
        {
            try
            {

                Store_User user = new Store_User();
                user.email = email;
                user.password = password;
                user.name = name;
                user.gender = gender;
                user.dob = dob;
                user.phonenumber = phonenumber;
                user.address = address;
                user.image = image;
                return sm.ThemStore_User(user);
            }
            catch
            {
                return false;
            }
        }
        [HttpPost]
        public string AddUserNotParaments(Store_User user)
        {
            try
            {


                return JsonConvert.SerializeObject(sm.ThemStore_UserModel(user));
            }
            catch(Exception e)
            {
                return e.ToString();
            }
        }


        [HttpPut]
        public bool Update_User(int id, string email, string password, string name, int gender, DateTime dob, string phonenumber, string address, string image)
        {
            try
            {

                Store_User user = new Store_User();
                user.id = id;
                user.email = email;
                user.password = password;
                user.name = name;
                user.gender = gender;
                user.dob = dob;
                user.phonenumber = phonenumber;
                user.address = address;
                user.image = image;
                return sm.CapNhatStore_User(user);
            }
            catch
            {
                return false;
            }
        }
        [HttpPut]
        public string Update_UserNotParaments(Store_User user)
        {
            try
            {
                return JsonConvert.SerializeObject(sm.CapNhatStore_UserModel(user));
            }
            catch(Exception e)
            {
                return e.ToString();
            }
        }
        [HttpDelete]
        public bool Delete_User(int id)
        {

            return sm.XoaStore_User(id);
        }

        [HttpPost]
        public string UserLogin(string email, string password)
        {
            return JsonConvert.SerializeObject(sm.Login_Model(email, password));
        }
        [HttpPost]
        public bool UserLoginNotModel(string email, string password)
        {
            return sm.Login(email, password);
        }
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            if (sm.Login(email, password))
            {

                FormsAuthentication.SetAuthCookie(email, true);
                return RedirectToAction("Index", "Home");


            }
            return View(); ;
        }
        [HttpPost]
        public ActionResult Login(Models.Store_Users user)
        {
            if (ModelState.IsValid)
            {
                if (user.IsValid(user.UserName, user.Password))
                {
                    FormsAuthentication.SetAuthCookie(user.UserName, user.RememberMe);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Login data is incorrect!");
                }
            }
            return View(user);
        }
        
    }
}