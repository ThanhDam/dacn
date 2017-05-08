using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GiaiDapWeb.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
       
        public ActionResult DangNhap()
        {
            return View();
        }
       
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string username = f["txtUsername"].ToString();
            string matkhau = f["txtMatkhau"].ToString();
            if (checktaikhoan(username, matkhau))
            {
                Session["maTaiKhoan"] = username;
                HttpCookie ck = new HttpCookie("myCookies");
                ck["name"] = username;
                Response.Cookies.Add(ck);
                ck.Expires = DateTime.Now.AddDays(3);
                RedirectToAction("Index", "Home");
            }
            else
            {

                //return JavaScript("alert('Khong Dung Tai Khoan');");
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không đúng !";
            }
            return RedirectToAction("Index", "Home");
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
            return Redirect(strURL);
        }
        private bool checktaikhoan(string username, string matkhau)
        {
            var kq = db.DangNhaps.Where(t => t.Username == username && t.MatKhau == matkhau).ToList<DangNhap>();
            if (kq.Count > 0)
                return true;
            return false;
        }
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(DangNhap dn)
        {
            var hinh = Request.Files["myfileImage"];
            var pathhinh = Server.MapPath("~/Images/" + hinh.FileName);
            hinh.SaveAs(pathhinh);

            string path = Server.MapPath("~/UploadInfo.txt");
            string[] info = { hinh.FileName, "" };
            System.IO.File.WriteAllLines(path, info);

            dn.HinhAnh = hinh.FileName;
            db.DangNhaps.Add(dn);
            db.SaveChanges();
            ViewBag.DangKy = "Đăng ký thành công";

            return View();
        }
    }
}