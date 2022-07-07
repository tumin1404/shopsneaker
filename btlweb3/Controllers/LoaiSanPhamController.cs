using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using btlweb3.Models;
using btlweb3.Helper;

namespace btlweb3.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();
        // GET: LoaiSanPham
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAll()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.LoaiSanPhams.ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetLoaiSanPham(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return Json(db.LoaiSanPhams.Find(id), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetSanPham(int id, int page, int pageSize)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.SanPhams.Where(sp => sp.MaLoai == id);
            var result = Pagination.GetPaged(list, page, pageSize);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

    }
}