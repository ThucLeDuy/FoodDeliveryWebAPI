using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Models
{
    public class Store_Users
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember on this computer")]
        public bool RememberMe { get; set; }



        public bool IsValid(string _username, string _password)
        {
            Store_UsersManager suM = new Store_UsersManager();
            return suM.Login(_username, _password);
        }

    }
}