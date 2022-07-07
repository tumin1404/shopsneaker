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
    public class NhaCungCapController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();
        // GET: Admin/NhaCungCap
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetAll()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return Json(db.NhaCungCaps, JsonRequestBehavior.AllowGet);
        }

        // hàm getdata để lấy dữ liệu theo số trang mà bên angularjs gửi sang
        public JsonResult GetData(int page, int pageSize)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var result = Pagination.GetPaged(db.NhaCungCaps, page, pageSize);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // hàm thêm nhận dữ liệu ng dùng nhập bên angularjs rồi thêm vào csdl
        public JsonResult Them(NhaCungCap model)
        {
            db.NhaCungCaps.Add(model);
            db.SaveChanges();
            return Json(model);
        }

        // hàm sửa nhận dữ liệu ng dùng nhập bên angularjs rồi thay đổi trong csdl
        public JsonResult Sua(NhaCungCap model)
        {
            db.NhaCungCaps.AddOrUpdate(model);
            db.SaveChanges();
            return Json(model);
        }

        // hàm xóa nhận id là mã loại muốn xóa
        public JsonResult Xoa(int id)
        {
            var model = db.NhaCungCaps.Find(id);
            db.NhaCungCaps.Remove(model);
            db.SaveChanges();
            return Json(model);
        }
    }
}