using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Store_User
    {
        public Store_User(int id, string email, string password, string name, int? gender, DateTime? dob, string phonenumber, string address, string image)
        {
            this.id = id;
            this.email = email;
            this.password = password;
            this.name = name;
            this.gender = gender;
            this.dob = dob;
            this.phonenumber = phonenumber;
            this.address = address;
            this.image = image;
        }

        public Store_User()
        {
        }

        public int id { get; set; }

        public string email { get; set; }

        public string password { get; set; }

        public string name { get; set; }

        public System.Nullable<int> gender { get; set; }

        public System.Nullable<System.DateTime> dob { get; set; }

        public string phonenumber { get; set; }

        public string address { get; set; }

        public string image { get; set; }


    }
}