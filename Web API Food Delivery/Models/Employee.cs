using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.Models
{
    public class Employee
    {
        public Employee()
        {

        }
        public Employee(int id, DateTime hire_date, decimal? base_salary, string role)
        {
            this.id = id;
            this.hire_date = hire_date;
            this.base_salary = base_salary;
            this.role = role;
        }

        public int id { get; set; }

        public System.DateTime hire_date { get; set; }

        public System.Nullable<decimal> base_salary { get; set; }

        public string role { get; set; }
    }
}