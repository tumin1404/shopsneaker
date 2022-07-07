using btlweb3.Helper;
using btlweb3.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace btlweb3.Areas.Admin.Controllers
{
    public class TaiKhoanController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();
        // GET: Admin/TaiKhoan
        public ActionResult Index()
        {
            return View();
        }

        // hàm getdata để lấy dữ liệu theo số trang mà bên angularjs gửi sang
        public JsonResult GetData(int page, int pageSize)
        {
            var result = Pagination.GetPaged(db.TaiKhoans, page, pageSize);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // hàm thêm nhận dữ liệu ng dùng nhập bên angularjs rồi thêm vào csdl
        public JsonResult Them(TaiKhoan model)
        {
            var user = db.TaiKhoans.FirstOrDefault(u => u.Email.Equals(model.Email));
            if (user != null)
            {
                return Json(new { message = "Email này đã tồn tại. Vui lòng sử dụng email khác." });
            }
            model.NgayTao = DateTime.Now;

            db.TaiKhoans.Add(model);
            db.SaveChanges();
            return Json(model);
        }

        // hàm sửa nhận dữ liệu ng dùng nhập bên angularjs rồi thay đổi trong csdl
        public JsonResult Sua(TaiKhoan model)
        {
            // kiểm tra email có ng đăng kí chưa
            var user = db.TaiKhoans.FirstOrDefault(u => u.MaTK != model.MaTK && u.Email.Equals(model.Email));
            if (user != null)
            {
                return Json(new { message = "Email này đã tồn tại. Vui lòng sử dụng email khác." });
            }

            db.TaiKhoans.AddOrUpdate(model);
            db.SaveChanges();
            return Json(model);
        }
    }
}