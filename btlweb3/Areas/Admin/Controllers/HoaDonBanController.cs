using btlweb3.Helper;
using btlweb3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity.Migrations;
using System.IO;
using System.Web;
using System.Web.Mvc;

namespace btlweb3.Areas.Admin.Controllers
{
    public class HoaDonBanController : Controller
    {
        public Ban_GiayEntities db = new Ban_GiayEntities();

        // GET: Admin/HoaDonBan
        public ActionResult Index()
        {
            return View();
        }

        // lấy tất cả bản ghi khách hàng, k phân trang
        public JsonResult GetAllKhachHang()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return Json(db.KhachHangs, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllTenSanPham()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var list = db.SanPhams.ToList();
            return Json(db.SanPhams, JsonRequestBehavior.AllowGet);
        }

        // hàm getdata để lấy dữ liệu theo số trang mà bên angularjs gửi sang
        public JsonResult GetData(int page, int pageSize)
        {
            db.Configuration.ProxyCreationEnabled = false;
            // dùng pagination vừa tạo để phân trang
            var result = Pagination.GetPaged(db.HoaDonBans, page, pageSize);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // lấy hóa đơn theo mã hóa đơn
        public JsonResult ViewHoaDon(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            // lấy hóa đơn theo mã :))
            var onView = db.HoaDonBans.Where(hd => hd.MaHDB == id)
                .Select(hd => new
                {
                    hd.MaHDB,
                    hd.MaKH,
                    khachHang = db.KhachHangs.FirstOrDefault(kh => kh.MaKH == hd.MaKH),
                    chiTiet = db.ChiTietHDBs.Where(ct => ct.MaHDB == hd.MaHDB)
                }).First();

            return Json(onView, JsonRequestBehavior.AllowGet);
        }

        // hàm thêm nhận dữ liệu ng dùng nhập bên angularjs rồi thêm vào csdl
        public JsonResult Them(HoaDonBan model)
        {
            db.Configuration.ProxyCreationEnabled = false;
            db.KhachHangs.Add(model.KhachHang);
            db.SaveChanges();

            HoaDonBan hd = new HoaDonBan();
            hd.MaKH = model.KhachHang.MaKH;
            hd.NgayTao = DateTime.Now;

            db.HoaDonBans.Add(hd);
            db.SaveChanges();

            foreach (var item in model.ChiTietHDBs)
            {
                // duyệt qua giỏ hàng rồi lưu lại từng sp trong giỏ vào chi tiết của đơn hàng trên
                db.Configuration.ProxyCreationEnabled = false;
                ChiTietHDB ct = new ChiTietHDB();
                ct.MaHDB = hd.MaHDB;
                ct.SanPham.TenSP = item.SanPham.TenSP;
                ct.SoLuong = item.SoLuong;
                ct.DonGia = db.SanPhams.Find(item.MaSP).DonGia;
                db.ChiTietHDBs.Add(ct);
                db.SaveChanges();
            }

            return Json(true);
        }

        public JsonResult Xoa(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var model = db.HoaDonBans.Find(id);
            db.HoaDonBans.Remove(model);
            db.SaveChanges();

            return Json(model);
        }
    }
}