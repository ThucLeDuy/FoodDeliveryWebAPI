using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Web_API_Services_1.BUS;
using System.IO;
using System.Text;
using Web_API_Services_1;

namespace UnitTestAPI_service
{
    [TestClass]
    public class UnitTest1
    {
        EmployeeManager s;
       
        [TestMethod]
        public void TestMethod1()
        {
            
            Console.Write("test");
            GhiFile();
            Assert.AreEqual(4, 4);
        }
        public void GhiFile()
        {
            ProductManager pm = new ProductManager();
            String filepath = "F:\\SalePriceForDiliverFood.txt";// đường dẫn của file muốn tạo
            FileStream fs = new FileStream(filepath, FileMode.Create);//Tạo file mới tên là test.txt            
            StreamWriter sWriter = new StreamWriter(fs, Encoding.UTF8);//fs là 1 FileStream 

            foreach(Product p in pm.ListProducts())
            {
                //sWriter.WriteLine(p.salePrice.ToString());
            }

            
            // Ghi và đóng file
            sWriter.Flush();
            fs.Close();
        }
    }
}
