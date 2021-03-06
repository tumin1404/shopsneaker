USE [master]
GO
/****** Object:  Database [Ban_Giay]    Script Date: 31/12/2021 14:02:03 ******/
CREATE DATABASE [Ban_Giay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ban_Giay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL\MSSQL\DATA\Ban_Giay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ban_Giay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL\MSSQL\DATA\Ban_Giay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ban_Giay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ban_Giay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ban_Giay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ban_Giay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ban_Giay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ban_Giay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ban_Giay] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ban_Giay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ban_Giay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ban_Giay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ban_Giay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ban_Giay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ban_Giay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ban_Giay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ban_Giay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ban_Giay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ban_Giay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ban_Giay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ban_Giay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ban_Giay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ban_Giay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ban_Giay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ban_Giay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ban_Giay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ban_Giay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ban_Giay] SET  MULTI_USER 
GO
ALTER DATABASE [Ban_Giay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ban_Giay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ban_Giay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ban_Giay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ban_Giay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ban_Giay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ban_Giay] SET QUERY_STORE = OFF
GO
USE [Ban_Giay]
GO
/****** Object:  Table [dbo].[ChiTietHDB]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDB](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHDB] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHDN]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDN](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHDN] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHDN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SDT] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
	[MoTa] [ntext] NULL,
	[MaLoaiCha] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](150) NOT NULL,
	[SDT] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NULL,
	[TenSP] [nvarchar](150) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	[MauSac] [nvarchar](10) NULL,
	[KichThuoc] [nvarchar](10) NULL,
	[HinhAnh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 31/12/2021 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHDB] ON 

INSERT [dbo].[ChiTietHDB] ([MaCT], [MaHDB], [MaSP], [SoLuong], [DonGia]) VALUES (1, 1, 1, 1, 700000)
INSERT [dbo].[ChiTietHDB] ([MaCT], [MaHDB], [MaSP], [SoLuong], [DonGia]) VALUES (2, 2, 1, 1, 700000)
SET IDENTITY_INSERT [dbo].[ChiTietHDB] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] ON 

INSERT [dbo].[HoaDonBan] ([MaHDB], [MaKH], [NgayTao]) VALUES (1, 3, CAST(N'2021-12-07T15:49:53.993' AS DateTime))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaKH], [NgayTao]) VALUES (2, 4, CAST(N'2021-12-30T15:47:05.053' AS DateTime))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaKH], [NgayTao]) VALUES (3, 5, CAST(N'2021-12-31T11:45:56.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[HoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 

INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayTao]) VALUES (1, 1, CAST(N'2021-11-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [Email], [SDT]) VALUES (1, N'Trần Ngọc Tú', N'Trung Hưng-Yên Mỹ-Hưng Yên', N'trantu143444@gmail.com', N'0372082758')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [Email], [SDT]) VALUES (2, N'Nê Thanh Toàn', N'Vĩnh Khúc-Văn Giang-Hưng Yên', N'nethanhtoan@gmail.com', N'0321648729')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [Email], [SDT]) VALUES (3, N'toàn cậu cả', N'Văn Giang', N'toancauca@gmail.com', N'0342168279')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [Email], [SDT]) VALUES (4, N'việt cậu cả', N'Trung Hoà', N'vietvuvo@gmail.com', N'0762349218')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [Email], [SDT]) VALUES (5, N'toàn cậu cả', N'Văn Giang', N'toancauca@gmail.com', N'0762349218')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (1, N'Giày Adidas', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (2, N'Giày Nike', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (3, N'Giày Converse', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (4, N'Giày Vans', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (5, N'Giày Biti''s', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (6, N'Giày Alexander McQueen', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (7, N'Giày Balenciaga', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (10, N'Adidas Stan Smith', NULL, 1)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (11, N'Nike Force 1', NULL, 2)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (12, N'Nike Air Max', NULL, 2)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (13, N'Converse 1970s', NULL, 3)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (14, N'Converse Classic', NULL, 3)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (15, N'Vans Old Skool', NULL, 4)
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai], [MoTa], [MaLoaiCha]) VALUES (16, N'Vans Slip – on', NULL, 4)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1, N'Adidas auth', N'USA', N'0124572346')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (4, N'Giày Quảng Châu', N'Trung Quốc', N'0218346792')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (5, N'Giày Nike', N'USA', N'0861273465')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (1, 2, N'giày 1', 54, 700000, N'trắng', N'41', N'8ff1cb22-8e3d-4695-bb51-4eee89039663.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (2, 10, N'giày 2', 23, 550000, N'đen', N'39', N'b71174cf-4f84-45ea-ab39-82bb272e9937.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (3, 6, N'Giày 3', 76, 1500000, N'Blue', N'40', N'2e4b350c-214b-4dcd-be7f-d6ee9aef6321.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (4, 1, N'Giày Adidas 1', 23, 1200000, N'đen', N'40', N'19f31703-1797-4e3f-8373-2b3de00b6395.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (5, 1, N'Giày Adidas 2', 76, 700000, N'xanh đen', N'41', N'f15fba3c-7235-4af7-83df-c2b658169a4a.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (6, 1, N'Giày Adidas 3', 12, 900000, N'tím đen', N'42', N'8bf9cab2-b2d6-4af6-8517-acfcc2c8b9b6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (7, 1, N'Giày Adidas 4', 22, 900000, N'trắng cam', N'43', N'1f3675dd-3c27-4151-b7ad-0b2962eabf48.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (8, 1, N'Giày Adidas 5', 23, 550000, N'trắng đen', N'40', N'b6a59066-5b3f-4c9b-b9bc-bf2aead87a92.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (9, 1, N'Giày Adidas 6', 11, 900000, N'xanh trắng', N'40', N'256d26a2-b536-47c9-86f9-a66e91666525.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (10, 2, N'Giày Nike 1', 11, 1500000, N'xám', N'41', N'50ebf5cc-a340-40a2-ab35-21be0503fee2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (11, 2, N'Giày Nike 2', 22, 1200000, N'xanh trắng', N'41', N'9332ca51-0430-4147-bce5-4d5fe6a94d77.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (12, 2, N'Giày Nike 3', 12, 1200000, N'trắng xanh', N'39', N'6fc744bb-2b17-4e5a-ba2c-62340c78b013.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (13, 2, N'Giày Nike 4', 11, 1500000, N'xanh đỏ', N'40', N'aef574de-e0a6-443b-ae86-3b75b4809a62.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (14, 2, N'Giày Nike 5', 12, 1200000, N'Blue', N'40', N'698dd4c4-8cb9-4f64-bf42-781e440738df.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (15, 2, N'Giày Nike 6', 22, 1500000, N'nâu trắng', N'40', N'70ba936b-a991-46d2-a51d-29ef48f33d87.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (16, 2, N'Giày Nike 7', 11, 2500000, N'colors', N'41', N'45ae6c0b-fdfc-4100-a8f4-38e5a3f1ce49.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (17, 2, N'Giày Nike 8', 6, 2500000, N'colors', N'41', N'4c59d6fa-1c14-4b12-bfd7-e7c0fe321053.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (18, 2, N'Giày Nike 9', 7, 2500000, N'xanh', N'43', N'5e7453d6-105c-466a-ba5c-33cfaff5c3db.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (19, 3, N'Giày Converse 1', 3, 900000, N'đỏ', N'41', N'1fc14317-ce9b-4b4f-a8e4-9c2128629694.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (20, 3, N'Giày Converse 2', 6, 1200000, N'đen', N'42', N'62204fc8-d1a7-4636-b63a-2847abe7b1cb.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (21, 3, N'Giày Converse 3', 9, 1500000, N'trắng', N'41', N'ce14490f-6fd9-4b96-8e17-b14e1b480449.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (22, 3, N'Giày Converse 4', 5, 1500000, N'xanh', N'41', N'd68de8bd-8e02-4645-b15e-b425faa8c243.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (23, 3, N'Giày Converse 5', 4, 1200000, N'colors', N'42', N'1e9ea3ac-cecf-40c8-9b3b-5e9ce8090c00.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (24, 3, N'Giày Converse 6', 4, 1500000, N'đen trắng', N'43', N'c74aca85-f6ab-4b4e-9856-d70d933613ff.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (25, 3, N'Giày Converse 7', 7, 1500000, N'cam', N'40', N'903fbe65-72fd-4af1-823c-bc68bb6204a9.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (26, 3, N'Giày Converse 8', 8, 1500000, N'tím', N'42', N'f366c2b2-b797-40e1-b740-a2ca061f6ec8.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (27, 3, N'Giày Converse 9', 11, 2500000, N'colors', N'42', N'fa3b0a48-e67a-49e5-869a-150c4e8bfd38.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (28, 4, N'Giày Vans 1', 11, 550000, N'đen', N'43', N'62e87c9b-097b-4608-b19b-9309e3202354.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (29, 4, N'Giày Vans 2', 11, 550000, N'đen', N'42', N'a37c4b9d-d8aa-4047-afbf-3422b538b8a6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (30, 4, N'Giày Vans 3', 22, 900000, N'nâu trắng', N'40', N'5ff235ea-d2c0-478c-977d-d7cb6987cfdd.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (31, 4, N'Giày Vans 4', 12, 700000, N'trắng đen', N'40', N'71adbe75-3ece-42cd-94b2-08b480e4bb17.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (32, 4, N'Giày Vans 5', 11, 550000, N'vàng', N'41', N'0cf4c72a-2cf8-4d65-b609-38ae21bd48e3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (33, 4, N'Giày Vans 6', 11, 900000, N'trắng', N'41', N'cbf2d180-3af4-4400-b0c9-4a0f30de4b8e.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (34, 4, N'Giày Vans 7', 11, 900000, N'trắng xanh', N'40', N'c87e237d-063d-4c4a-991c-0c59cc733415.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (35, 4, N'Giày Vans 8', 12, 1200000, N'xanh đỏ', N'41', N'd339d8ca-c060-41c8-95bc-430a6ee1435e.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (36, 4, N'Giày Vans 9', 11, 1200000, N'đen đỏ', N'41', N'bc29295c-fbf1-4148-82a3-8a588942fdf4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (37, 5, N'Giày Biti''s 1', 11, 1200000, N'đen trắng', N'41', N'037b18f9-39f9-4454-ab39-2865afbce514.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (38, 5, N'Giày Biti''s 2', 54, 1500000, N'trắng xanh', N'42', N'8ddc3547-1099-429d-8ac0-88627aaea009.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (39, 5, N'Giày Biti''s 3', 11, 2500000, N'xanh', N'43', N'7ebe0a3a-60d0-4a93-8adc-e116ab2dd1f7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (40, 5, N'Giày Biti''s 4', 4, 1200000, N'đen trắng', N'40', N'f96c0c21-9882-48e9-aaba-9d13cb4f4c37.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (41, 5, N'Giày Biti''s 5', 4, 1500000, N'đen', N'42', N'1693e140-2c2c-4891-befb-9456ace433f6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (42, 5, N'Giày Biti''s 6', 4, 2500000, N'cam', N'42', N'4079b7ed-2920-4df0-baf3-22bb2038ffdc.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (43, 5, N'Giày Biti''s 7', 23, 2500000, N'xám', N'42', N'c04f2f00-d89e-41ac-a3fa-46b63a6f73fc.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (44, 5, N'Giày Biti''s 8', 5, 2500000, N'đen', N'43', N'e7d59a6d-406e-4969-bdbb-68401f18e82f.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (45, 5, N'Giày Biti''s 9', 4, 2500000, N'colors', N'42', N'69a953d9-2867-449f-ae68-0939b12a2689.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [SoLuong], [DonGia], [MauSac], [KichThuoc], [HinhAnh]) VALUES (46, 5, N'giày 7', 12, 700000, N'đen', N'41', N'59db3dec-05c6-4eef-94cd-286f4005d3e6.jpg')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (4, N'trantu143444@gmail.com', N'123456', N'Trần Ngọc Tú', N'0372082758', NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (10, N'mint78826@gmail.com', N'123456', N'Người dùng 1', N'0365176498', NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (11, N'ntu50648@gmail.com', N'123456', N'Người dùng 2', N'0375891426', NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (12, N'toancauca@gmail.com', N'123456', N'toàn cậu cả', N'0342168279', CAST(N'2021-11-30T13:37:27.520' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (13, N'jgfiyfuykl@gmail.com', N'123456', N'dăng nhập 1', N'0316546792', CAST(N'2021-12-04T08:38:56.333' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (14, N'nguoidung3@gmail.com', N'123456', N'Người Dùng 3', N'0561278346', NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [SDT], [NgayTao]) VALUES (15, N'vietvuvo@gmail.com', N'123', N'việt cậu cả', N'0762349218', CAST(N'2021-12-29T23:10:08.073' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HoaDonBan] ([MaHDB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HoaDonNhap] ([MaHDN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Ban_Giay] SET  READ_WRITE 
GO
