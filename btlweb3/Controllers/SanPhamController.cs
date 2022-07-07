using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using btlweb3.Helper;
using btlweb3.Models;

namespace btlweb3.Controllers
{
    public class SanPhamController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();
        // GET: SanPham
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetSanPham()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.SanPhams.Take(32);
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetSanPhamNoiBat()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.SanPhams.OrderByDescending(sp => sp.DonGia).Take(4);
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ChiTiet()
        {
            return View();
        }

        // lấy chi tiết của sản phẩm có mã = id
        public JsonResult GetSpById(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var item = db.SanPhams.Find(id);
            return Json(item, JsonRequestBehavior.AllowGet);
        }

        // get sản phẩm liên quan là sản phẩm có mã loại = id
        public JsonResult GetSpLienQuan(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.SanPhams.Where(sp => sp.MaLoai == id);
            return Json(list.ToList().Take(8), JsonRequestBehavior.AllowGet);
        }
        public ActionResult ProductAll()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var sanPhamall = db.SanPhams.ToList();
            return Json(sanPhamall, JsonRequestBehavior.AllowGet);
        }
    }
}