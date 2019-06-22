using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_API_Services_1.BUS
{
    public class EmployeeManager
    {
        DBFoodDataContext db = new DBFoodDataContext();
        Store_UsersManager suMana = new Store_UsersManager();
        public List<Employee> ListEmployees()
        {
            return db.Employees.ToList();
        }
        public List<Models.Employee> ListEmployeesModel()
        {
            List<Models.Employee> ListEmployee = new List<Models.Employee>();
            foreach (Employee item in db.Employees.ToList())
            {
                ListEmployee.Add(new Models.Employee(item.id, item.hire_date, item.base_salary, item.role));
            }
            return ListEmployee;
        }
        public bool KiemTraTrungTonTaiEmployee(int maEmployee)
        {
            foreach (Employee nv in ListEmployees())
            {
                if (nv.id == maEmployee) return true;
            }
            return false;
        }
        public bool KiemTraTrungTonTaiUser(int maUser)
        {
            foreach (Store_User nv in db.Store_Users.ToList())
            {
                if (nv.id == maUser) return true;
            }
            return false;
        }
        public Models.Employee Lay1Employee(int id)
        {
            Employee item;
            try
            {

                item = db.Employees.Single((x => x.id == id));

            }
            catch (Exception e)
            {
                return null;
                throw e;
            }
            return new Models.Employee(item.id, item.hire_date, item.base_salary, item.role);
        }
        public bool XoaEmployee(int maEmployee)
        {
            
            Employee employee = db.Employees.Single(x => x.id == maEmployee);
            db.Employees.DeleteOnSubmit(employee);
            db.SubmitChanges();
            suMana.XoaStore_User(maEmployee);
            return true;
        }
        public bool ThemEmployeeWithDeitailUser(Employee nv, Store_User user)
        {

            nv.id = suMana.ListStore_Users().Count;

            while (KiemTraTrungTonTaiUser(nv.id))
            {
                nv.id++;
            }
            db.Employees.InsertOnSubmit(nv);
            db.SubmitChanges();
            user.id = nv.id;
            suMana.ThemStore_UserKoTang(user);
            return true;
        }
        public bool ThemEmployee(Employee nv)
        {

            nv.id = suMana.ListStore_Users().Count;

            while (KiemTraTrungTonTaiUser(nv.id))
            {
                nv.id++;
            }
            db.Employees.InsertOnSubmit(nv);
            db.SubmitChanges();
            Store_User su = new Store_User();
            su.id = nv.id;
            suMana.ThemStore_UserKoTang(su);
            return true;
        }

        public bool CapNhatEmployee(Employee nv)
        {
            Employee Employee = db.Employees.Single(x => x.id == nv.id);
            db.Employees.DeleteOnSubmit(Employee);
            db.SubmitChanges();

            db.Employees.InsertOnSubmit(nv);
            db.SubmitChanges();
            return true;
        }
    }
}