//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace btlweb3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChiTietHDN
    {
        public int MaCT { get; set; }
        public Nullable<int> MaHDN { get; set; }
        public Nullable<int> MaSP { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<int> DonGia { get; set; }
    
        public virtual HoaDonNhap HoaDonNhap { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}
