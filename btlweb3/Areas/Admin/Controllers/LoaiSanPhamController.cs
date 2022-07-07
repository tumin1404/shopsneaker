using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using btlweb3.Helper;
using btlweb3.Models;
using System.Data.Entity.Migrations;

namespace btlweb3.Areas.Admin.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();

        // GET: Admin/LoaiSanPham
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAll()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return Json(db.LoaiSanPhams, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetData(int page, int pageSize)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var result = Pagination.GetPaged(db.LoaiSanPhams, page, pageSize);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Them(LoaiSanPham model)
        {
            db.Configuration.ProxyCreationEnabled = false;
            db.LoaiSanPhams.Add(model);
            db.SaveChanges();
            return Json(model);
        }
        public JsonResult Sua(LoaiSanPham model)
        {
            db.Configuration.ProxyCreationEnabled = false;
            db.LoaiSanPhams.AddOrUpdate(model);
            db.SaveChanges();
            return Json(model);
        }
        public JsonResult Xoa(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var model = db.LoaiSanPhams.Find(id);
            db.LoaiSanPhams.Remove(model);
            db.SaveChanges();
            return Json(model);
        }
    }
}