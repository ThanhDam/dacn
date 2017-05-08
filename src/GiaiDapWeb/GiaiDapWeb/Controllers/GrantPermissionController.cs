using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GiaiDapWeb.Models;

namespace GiaiDapWeb.Controllers
{
    public class GrantPermissionController : Controller
    {
        // GET: GrantPermission
        RequestDBEntities db = new RequestDBEntities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index()
        {
            String username= 
            if (checktaikhoan(username, password))
            {
                Session["maTaiKhoan"] = username;
                HttpCookie ck = new HttpCookie("myCookies");
                ck["name"] = username;
                Response.Cookies.Add(ck);
                ck.Expires = DateTime.Now.AddDays(3);
                RedirectToAction("_Layout", "Shared");
            }
            else
            {

                //return JavaScript("alert('Khong Dung Tai Khoan');");
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không đúng !";
            }
            return RedirectToAction("_Layout", "Shared");
        }
        private bool checktaikhoan(string username, string password)
        {
            var kq = db.Accounts.Where(t => t.username == username && t.password ==password).ToList<Account>();
            if (kq.Count > 0)
                return true;
            return false;
        }
    }
}