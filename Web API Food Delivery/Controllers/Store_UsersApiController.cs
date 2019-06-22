using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class Store_UsersApiController : ApiController
    {
        Store_UsersManager SU = new Store_UsersManager();
        [HttpGet]
        public List<Store_User> Get_Store_User_Lists()//IHttpActionResult GetStore_UserLists()
        {

            return SU.ListStore_Users();

        }

        [HttpGet]
        public Models.Store_User GetUserInfo(int id)
        {
            return SU.Lay1Store_User(id);
        }

        [HttpPost]
        public bool InsertNewUserInfo(string email, string password, string name, int gender, DateTime dob, string phonenumber, string address, string image, DateTime created_at, DateTime updated_at)
        {

            Store_User Store_User = new Store_User();
            Store_User.email = email;
            Store_User.password = password;
            Store_User.created_at = created_at;
            Store_User.updated_at = updated_at;
            Store_User.name = name;
            Store_User.gender = gender;
            Store_User.dob = dob;
            Store_User.phonenumber = phonenumber;
            Store_User.address = address;
            return SU.ThemStore_User(Store_User);

        }


        [HttpPut]
        public bool UpdateStore_User(int id, string email, string password, string name, int gender, DateTime dob, string phonenumber, string address, string image, DateTime created_at, DateTime updated_at)
        {

            Store_User Store_User = new Store_User();
            Store_User.id = id;
            Store_User.email = email;
            Store_User.password = password;
            Store_User.created_at = created_at;
            Store_User.updated_at = updated_at;
            Store_User.name = name;
            Store_User.gender = gender;
            Store_User.dob = dob;
            Store_User.phonenumber = phonenumber;
            Store_User.address = address;
            return SU.CapNhatStore_User(Store_User);
        }

        [HttpDelete]
        public bool Delete_Store_User(int id)
        {
            return SU.XoaStore_User(id);
        }
    }
}
