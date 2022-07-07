using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using btlweb3.Helper;
using btlweb3.Models;

namespace btlweb3.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        public Ban_GiayEntities db = new Ban_GiayEntities();

        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }

        // hàm thêm sản phẩm vào giỏ hàng
        public JsonResult ThemVaoGio(int MaSP)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<SanPham> gioHang = new List<SanPham>();

            if (Session["GioHang"] != null)
            {
                gioHang = (List<SanPham>)Session["GioHang"];
            }

            var sanPham = gioHang.Find(sp => sp.MaSP == MaSP);

            if (sanPham == null)
            {
                // lấy về sản phẩm có mã như vậy trong csdl
                var getSP = db.SanPhams.Find(MaSP);
                getSP.SoLuong = 1;
                gioHang.Add(getSP);
            }
            else
            {
                sanPham.SoLuong++;
            }

            Session["giohang"] = gioHang;

            var tongTien = gioHang.Sum(sp => sp.SoLuong * sp.DonGia);

            var soLuong = gioHang.Sum(sp => sp.SoLuong);
            return Json(new
            {
                gioHang,
                soLuong,
                tongTien
            }, JsonRequestBehavior.AllowGet);
        }

        // hàm lấy dữ liệu giỏ hàng
        public JsonResult GetGioHang()
        {

            List<SanPham> gioHang = new List<SanPham>();

            if (Session["GioHang"] != null)
            {
                gioHang = (List<SanPham>)Session["GioHang"];
            }

            var tongTien = gioHang.Sum(sp => sp.SoLuong * sp.DonGia);

            var soLuong = gioHang.Sum(sp => sp.SoLuong);

            return Json(new
            {
                gioHang,
                soLuong,
                tongTien
            }, JsonRequestBehavior.AllowGet);
        }

        // hàm xóa sản phẩm trong giỏ hàng
        public JsonResult XoaKhoiGio(int MaSP)
        {
            // nhận vào mã sp là mã của sp mà ng dùng muốn xoá
            List<SanPham> gioHang = new List<SanPham>();

            if (Session["GioHang"] != null)
            {
                gioHang = (List<SanPham>)Session["GioHang"];
            }


            // xoá sản phẩm có mã là mã đc truyền vào
            gioHang.Remove(gioHang.Find(sp => sp.MaSP == MaSP));

            // cập nhật lại giỏ hàng vào session
            Session["giohang"] = gioHang;

            var tongTien = gioHang.Sum(sp => sp.SoLuong * sp.DonGia);

            var soLuong = gioHang.Sum(sp => sp.SoLuong);

            return Json(new
            {
                gioHang,
                soLuong,
                tongTien
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ThanhToan()
        {
            return View();
        }

        // hàm nhận thông tin khách hàng khi ấn thanh toán
        public JsonResult ThanhToan(KhachHang khachHang)
        {
            List<SanPham> gioHang = new List<SanPham>();

            if (Session["GioHang"] != null)
            {
                // get giỏ hàng từ sessionm
                gioHang = (List<SanPham>)Session["GioHang"];
            }

            if (gioHang.Count <= 0)
            {
                return Json(false);
            }

            // thêm khách hàng vào csdl
            db.KhachHangs.Add(khachHang);
            db.SaveChanges();

            HoaDonBan hd = new HoaDonBan();
            hd.MaKH = khachHang.MaKH;
            hd.NgayTao = DateTime.Now;
            db.HoaDonBans.Add(hd);
            db.SaveChanges();

            foreach (var item in gioHang)
            {
                // duyệt qua giỏ hàng rồi lưu lại từng sp trong giỏ vào chi tiết của đơn hàng trên
                ChiTietHDB ct = new ChiTietHDB();
                ct.MaHDB = hd.MaHDB;
                ct.MaSP = item.MaSP;
                ct.SoLuong = item.SoLuong;
                ct.DonGia = item.DonGia;
                db.ChiTietHDBs.Add(ct);
                db.SaveChanges();
            }

            Session.Remove("GioHang");

            return Json(true);
        }
    }
}