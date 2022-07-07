using btlweb3.Helper;
using btlweb3.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace btlweb3.Areas.Admin.Controllers
{
    public class SanPhamController : Controller
    {
        Ban_GiayEntities db = new Ban_GiayEntities();
        // GET: Admin/SanPham
        public ActionResult Index()
        {
            return View();
        }

        // lấy tất cả bản ghi khách hàng, k phân trang
        public JsonResult GetAll()
        {
            return Json(db.SanPhams, JsonRequestBehavior.AllowGet);
        }

        // hàm getdata để lấy dữ liệu theo số trang mà bên angularjs gửi sang
        public JsonResult GetData(int page, int pageSize)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var result = Pagination.GetPaged(db.SanPhams, page, pageSize);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // hàm thêm nhận dữ liệu ng dùng nhập bên angularjs rồi thêm vào csdl
        public JsonResult Them(SanPham model)
        {
            var rootPath = Server.MapPath("~/Assets/Uploads/");

            model.HinhAnh = "error.jpg";
            foreach (string key in Request.Files) // duyệt qua ảnh ng dùng upload
            {
                HttpPostedFileBase file = Request.Files[key];
                string fileExtension = Path.GetExtension(file.FileName);
                string fileName = Guid.NewGuid() + fileExtension; // tạo tên mới là chuỗi ngẫu nhiên
                file.SaveAs(rootPath + fileName);

                model.HinhAnh = fileName;
            }

            db.SanPhams.Add(model);
            db.SaveChanges();

            return Json(model);
        }

        // hàm sửa nhận dữ liệu ng dùng nhập bên angularjs rồi thay đổi trong csdl
        public JsonResult Sua(SanPham model)
        {
            var rootPath = Server.MapPath("~/Assets/Uploads/");

            foreach (string key in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[key];
                string fileExtension = Path.GetExtension(file.FileName);
                string fileName = Guid.NewGuid() + fileExtension; // tạo tên mới là chuỗi ngẫu nhiên
                file.SaveAs(rootPath + fileName);

                model.HinhAnh = fileName;
            }

            db.SanPhams.AddOrUpdate(model);
            db.SaveChanges();
            return Json(model);
        }

        public JsonResult Xoa(int id)
        {
            var model = db.SanPhams.Find(id);

            db.SanPhams.Remove(model);
            db.SaveChanges();

            return Json(model);
        }
    }
}