using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using GiaiDapWeb.Models;
using GiaiDapWeb.ViewModel;

namespace GiaiDapWeb.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        RequestDBEntities db = new RequestDBEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Index3()
        {
            return View(db.Accounts);
        }
       
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(string strURL, FormCollection f)
        {
            string username = f["username"].ToString();
            string matkhau = f["password"].ToString();
            if (checktaikhoan(username, matkhau))
            {
                Session["maTaiKhoan"] = username;
                if (username == "admin") { return RedirectToAction("indexRant3","GrantPermission"); }
                else
                    return RedirectToAction("Index", "Account");
            }
            ViewBag.ThongBao = "Đăng nhập không thành công";
            return RedirectToAction("DangNhap");
        }
        public ActionResult DangXuat(string strURL)
        {
            Session.Abandon();
            if (Request.Cookies["myCookies"] != null)
            {
                HttpCookie ck = new HttpCookie("myCookies");
                ck.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(ck);
            }
            return RedirectToAction("Index");
        }
        private bool checktaikhoan(string username, string password)
        {
            using (var db = new RequestDBEntities())
            {
                //var passMD5 = pass.GetMD5().ToString();
                var kq = db.Accounts.Where(x => x.username == username && x.password == password).ToList<Account>();
                if (kq.Count() > 0)
                {
                    return true;

                }
                return false;
            }
        }
        public ActionResult DangKy()
        {

            return View();
        }

        [HttpPost]
        
        public ActionResult DangKy(UserVM model, FormCollection f)
        {
            
            model.UserName=f["username"].ToString();
            model.Password= f["password"].ToString();
            if (ModelState.IsValid)
            {
                var _OldUserid = db.Accounts.FirstOrDefault(m => m.username == model.UserName);
                if (_OldUserid == null)
                {

                    var _User = new Account { username = model.UserName, password= model.Password, id_role = 1 };
                    db.Accounts.Add(_User);
                    db.SaveChanges();
                    return RedirectToAction("DangNhap");
                    
                }
            }
            ViewBag.Message =  "Tên đăng nhập đã tồn tại"+ model.Password.ToString();

            return View(model);
        }
        [HttpPost]
        //[Authorize(Roles = "admin")]
        public ActionResult Delete(int id)
        {
            var _User = db.Accounts.Find(id);

            db.Accounts.Remove(_User);
            db.SaveChanges();
            return RedirectToAction("Index", "Account");
        }

        public ActionResult DoiMatKhau()
        {
            ViewBag.Message = "";
            return View();
        }
        [HttpPost]
        public ActionResult DoiMatKhau(string username, string strURL, FormCollection f)
        {
            using (var db = new RequestDBEntities())
            {
                string oldPass = f["oldpass"].ToString();
                string newPass = f["newpass"].ToString();

                Account tk = db.Accounts.Where(x => x.username== username && x.password == oldPass).FirstOrDefault();
                if (tk != null)
                {
                    tk.password = newPass;
                    db.SaveChanges();
                    ViewBag.Message = "Đổi mật khẩu thành công!";
                    return RedirectToAction("Index", "Account");
                }
                ViewBag.Message = "Thông tin nhập chưa đúng!!";
                return RedirectToAction("DoiMatKhau");
            }
        }
        //Tìm kiếm theo username
        [HttpPost]
        public ActionResult Search(FormCollection f)
        {
            string s = f["search"];

            if (string.IsNullOrEmpty(s)) return RedirectToAction("Index3", "Account");
            else
            {
                ViewData.Model = db.Accounts.Where(m => m.username.Contains(s)).ToList();
            }
            return View();
        }

    
    }
}