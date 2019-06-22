using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;
using Web_API_Services_1.BUS;

namespace Web_API_Services_1.Controllers
{
    public class EmployeeController : Controller
    {
        EmployeeManager EM = new EmployeeManager();
        Store_UsersManager SU = new Store_UsersManager();
        // GET: EmployeeNotApi
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public string GetEmployeeLists()//IHttpActionResult GetEmployeeLists()
        {

            //return EM.ListEmployees();
            //var response = new HttpResponseMessage(HttpStatusCode.OK);
            string Content = JsonConvert.SerializeObject(EM.ListEmployeesModel());
            //response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            return Content;


        }
        [HttpPost]
        public void InsertNewEmployee2(Models.Employee employee)
        {
            Employee e = new Employee();
            e.id = employee.id;
            e.role = employee.role;
            e.hire_date = employee.hire_date;
            e.base_salary = Convert.ToDecimal(employee.base_salary);
            EM.ThemEmployee(e);
            ///DBFoodDataContext db = new DBFoodDataContext();
            //db.Employees.InsertOnSubmit(e);
            //db.SubmitChanges();

            
        }
        
        [HttpGet]
        public string GetEmployee(int id)
        {
            return JsonConvert.SerializeObject(EM.Lay1Employee(id));
        }

        [HttpPost]
        public bool InsertNewEmployee(DateTime hire_date, decimal base_salary, string role)
        {
            try
            {

                Employee Employee = new Employee();
                Employee.hire_date = hire_date;
                Employee.base_salary = base_salary;
                Employee.role = role;
                EM.ThemEmployee(Employee);
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpPost]
        public bool InsertNewEmployeeWithDetail(Models.Employee e, string email, string password, string name, string gender, string dob, string phonenumber, string address, string image)
        {
            try
            {

                Employee employee = new Employee();
                employee.hire_date = e.hire_date;//Convert.ToDateTime(hire_date);
                employee.base_salary = e.base_salary;// Convert.ToDecimal(base_salary);
                employee.role = e.role;//role;

                Store_User user = new Store_User();
                user.address = address;
                user.dob = Convert.ToDateTime(dob);
                user.email = email;
                user.name = name;
                user.password = password;
                user.gender = 2;//Convert.ToInt32(gender);
                user.image = image;
                user.phonenumber = phonenumber;

                EM.ThemEmployeeWithDeitailUser(employee, user);
                return true;
            }
            catch
            {
                return false;
            }
        }


        [HttpPut]
        public bool UpdateEmployee(int id, DateTime hire_date, decimal base_salary, string role)
        {

            Employee Employee = new Employee();
            Employee.id = id;
            Employee.hire_date = hire_date;
            Employee.base_salary = base_salary;
            Employee.role = role;
            return EM.CapNhatEmployee(Employee);
        }

        [HttpDelete]
        public bool DeleteEmployee(string id)
        {

            return EM.XoaEmployee(Convert.ToInt32(id));
        }
    }
}