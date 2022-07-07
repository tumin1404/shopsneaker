using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using btlweb3.Models;
using btlweb3.Helper;

namespace btlweb3.Controllers
{
    public class HomeController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }

        // hàm đăng ký nhận thông tin ng dùng post từ giao diện
        public JsonResult DangKy(TaiKhoan taiKhoan)
        {

            var user = db.TaiKhoans.FirstOrDefault(u => u.Email.Equals(taiKhoan.Email));
            if (user != null)
            {
                return Json(new { message = "Email này đã tồn tại. Vui lòng sử dụng email khác." });
            }
            taiKhoan.NgayTao = DateTime.Now;

            db.TaiKhoans.Add(taiKhoan);
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        //hàm nhận thông tin email, mật khẩu ng dùng post từ trang đăng nhập
        public JsonResult DangNhap(string Email, string MatKhau)
        {
            var user = db.TaiKhoans.FirstOrDefault(u => u.Email.Equals(Email));
            if (user != null)
            {
                Session.Add("UserLogin", user);
                return Json(true);
            }
            return Json(new { message = "Email hoặc mật khẩu không chính xác." });
        }

        // hàm đăng xuất
        public ActionResult DangXuat()
        {
            Session.Remove("UserLogin");
            return Redirect("/");
        }

        // hàm get thông tin ng dùng đã đăng nhập
        public JsonResult GetUserLogin()
        {
            return Json(Session["UserLogin"], JsonRequestBehavior.AllowGet);
        }

        public ActionResult LienHe()
        {
            return View();
        }

        public ActionResult TinTuc()
        {
            return View();
        }

        public ActionResult GioiThieu()
        {
            return View();
        }

        public ActionResult XemAll()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.SanPhams.ToList();
            return View(Json(list, JsonRequestBehavior.AllowGet));
        }
    }
}