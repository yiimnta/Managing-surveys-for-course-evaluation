USE [DGDayHoc]
GO
CREATE TABLE [dbo].[ChiTietDKHP](
	[MaCTDK] [int] IDENTITY(1,1) NOT NULL,
	[MaGD] [int] NULL,
	[MaDK] [int] NULL,
	[NgayGio] [datetime] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_ChiTietDKHP] PRIMARY KEY CLUSTERED 
(
	[MaCTDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietKetQua]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKetQua](
	[MaCTKQ] [int] IDENTITY(1,1) NOT NULL,
	[MaKQ] [int] NULL,
	[MaCT] [int] NULL,
	[KetQuaDG] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChiTietKetQua] PRIMARY KEY CLUSTERED 
(
	[MaCTKQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietNoiDung]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietNoiDung](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaNDu] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[LoaiCT] [int] NULL,
	[ViTri] [int] NULL,
 CONSTRAINT [PK_ChiTietNoiDung] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangKyHocPhan]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyHocPhan](
	[MaDK] [int] IDENTITY(1,1) NOT NULL,
	[MaND] [int] NULL,
 CONSTRAINT [PK_DangKyHocPhan] PRIMARY KEY CLUSTERED 
(
	[MaDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiangDay]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangDay](
	[MaGD] [int] IDENTITY(1,1) NOT NULL,
	[MaGV] [int] NOT NULL,
	[MaMH] [int] NOT NULL,
	[MaLop] [int] NOT NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_GiangDay_1] PRIMARY KEY CLUSTERED 
(
	[MaGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [int] IDENTITY(1,1) NOT NULL,
	[MaDD] [nvarchar](max) NULL,
	[HoTen] [nvarchar](max) NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GopY]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [int] IDENTITY(1,1) NOT NULL,
	[MaND] [int] NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaKQ] [int] IDENTITY(1,1) NOT NULL,
	[MaDG] [int] NULL,
	[MaND] [int] NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_KetQua] PRIMARY KEY CLUSTERED 
(
	[MaKQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[MaKhoa] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiPhieu]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhieu](
	[LoaiP] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_LoaiPhieu] PRIMARY KEY CLUSTERED 
(
	[LoaiP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[MaKhoa] [int] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[SoTC] [int] NULL,
	[LoaiMH] [bit] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[NgaySinh] [date] NULL,
	[Email] [nvarchar](max) NULL,
	[Sdt] [nvarchar](max) NULL,
	[MaDN] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[MaLop] [int] NULL,
	[TrangThai] [int] NULL,
	[LoaiND] [bit] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoiDung]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDung](
	[MaNDu] [int] IDENTITY(1,1) NOT NULL,
	[MaDG] [int] NULL,
	[TieuDe] [nvarchar](max) NULL,
	[ViTri] [int] NULL,
 CONSTRAINT [PK_NoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNDu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoiDungCon]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDungCon](
	[MaNDC] [int] IDENTITY(1,1) NOT NULL,
	[MaCT] [int] NULL,
	[TieuDe] [nvarchar](max) NULL,
	[ViTri] [int] NULL,
 CONSTRAINT [PK_NoiDungCon] PRIMARY KEY CLUSTERED 
(
	[MaNDC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuDanhGia]    Script Date: 12/12/2015 10:00:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDanhGia](
	[MaDG] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[MaGD] [int] NULL,
	[MaGV] [int] NULL,
	[MaKhoa] [int] NULL,
	[ThoiGianDang] [datetime] NULL,
	[TrangThai] [int] NULL,
	[LoaiP] [int] NULL,
	[MaNguoiTao] [int] NULL,
	[nienKhoa] [nvarchar](max) NULL,
	[hocKy] [int] NULL,
 CONSTRAINT [PK_PhieuDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietDKHP] ON 

INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (4, 2, 1, CAST(0x0000A55500B2CB18 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (5, 8, 3, CAST(0x0000A55E00832764 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (6, 1, 3, CAST(0x0000A55E00832764 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (7, 8, 1, CAST(0x0000A56400D4EC98 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (8, 3, 1, CAST(0x0000A566009B22D8 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (9, 1, 2, CAST(0x0000A569008F7B40 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (10, 8, 2, CAST(0x0000A569008F7B40 AS DateTime), 1)
INSERT [dbo].[ChiTietDKHP] ([MaCTDK], [MaGD], [MaDK], [NgayGio], [TrangThai]) VALUES (11, 3, 2, CAST(0x0000A569008F7B40 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ChiTietDKHP] OFF
SET IDENTITY_INSERT [dbo].[ChiTietKetQua] ON 

INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (185, 16, 39, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (186, 16, 40, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (187, 16, 41, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (188, 16, 42, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (189, 16, 43, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (190, 16, 44, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (191, 16, 45, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (192, 16, 46, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (193, 16, 47, N'Phân vân')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (194, 16, 48, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (195, 16, 49, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (196, 16, 50, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (197, 16, 51, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (198, 16, 52, N'Phân vân')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (199, 16, 53, N'aaaaa')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (200, 19, 89, N'Tự chọn')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (201, 19, 91, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (202, 19, 93, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (203, 19, 90, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (204, 19, 92, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (205, 19, 94, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (206, 19, 95, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (207, 19, 96, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (208, 19, 97, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (209, 19, 98, N'Phân vân')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (210, 19, 99, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (211, 19, 104, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (212, 19, 100, N'Phân vân')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (213, 19, 101, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (214, 19, 102, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (215, 19, 103, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (216, 19, 105, N'alooo')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (217, 20, 39, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (218, 20, 40, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (219, 20, 41, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (220, 20, 42, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (221, 20, 43, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (222, 20, 44, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (223, 20, 46, N'Không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (224, 20, 47, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (225, 20, 48, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (226, 20, 49, N'Rất đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (227, 20, 50, N'Hoàn toàn không đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (228, 20, 51, N'Phân vân')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (229, 20, 52, N'Đồng ý')
INSERT [dbo].[ChiTietKetQua] ([MaCTKQ], [MaKQ], [MaCT], [KetQuaDG]) VALUES (230, 20, 53, N'sadzsdsd')
SET IDENTITY_INSERT [dbo].[ChiTietKetQua] OFF
SET IDENTITY_INSERT [dbo].[ChiTietNoiDung] ON 

INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (1, 1, N'Loại môn học', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (2, 2, N'Giảng viên (GV) phổ biến đầy đủ mục đích, yêu cầu học phần cho sinh viên (SV', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (3, 2, N'Anh/Chị có kiến nghị gì để việc giảng dạy của môn học tốt hơn?', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (4, 2, N'GV hướng dẫn SV phương pháp tự học, nghiên cứu tài liệu', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (5, 2, N'GV truyền đạt nội dung của học phần đầy đủ, chính xác', 0, 4)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (6, 2, N'GV có quan tâm đến việc cập nhật kiến thức mới vào nội dung bài giảng', 0, 5)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (7, 2, N'GV có phương pháp giảng dạy phù hợp giúp SV hiểu rõ nội dung bài giảng', 0, 6)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (8, 2, N'GV có biện pháp phát huy sự chủ động và kỹ năng giải quyết vấn đề của SV', 0, 7)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (9, 2, N'GV sử dụng các phương tiện hỗ trợ giảng dạy hiệu quả.', 0, 8)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (10, 2, N'GV giải đáp thắc mắc của SV về kiến thức của học phần đầy đủ và thỏa đáng.', 0, 9)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (11, 2, N'GV quan tâm khuyến khích và hướng dẫn SV rèn luyện các kỹ năng, thái độ cần thiết cho nghề nghiệp và cuộc sống thông qua các hình thức tổ chức lớp học.', 0, 10)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (12, 2, N'GV sử dụng nhiều hình thức kiểm tra, đánh giá kết quả học tập của SV.', 0, 12)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (13, 2, N'GV tổ chức kiểm tra, đánh giá khách quan, công bằng.', 0, 13)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (14, 2, N'Kết quả kiểm tra, đánh giá đúng thực chất năng lực học tập, rèn luyện của SV.', 0, 14)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (15, 2, N'GV thực hiện đầy đủ giờ lên lớp theo đúng kế hoạch giảng dạy.	
', 0, 15)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (16, 2, N'Quá trình giảng dạy của GV thật sự tạo động lực học tập, rèn luyện đối với SV.	
', 0, 11)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (17, 3, N'Anh/Chị có kiến nghị gì để việc giảng dạy của môn học tốt hơn?', 2, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (24, 11, N'Anh/Chị được thông tin rõ mục tiêu, nội dung và yêu cầu môn học.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (25, 11, N'Anh/Chị được giảng viên cung cấp đầy đủ thông tin về lịch trình/kế hoạch giảng dạy và tiêu chí đánh giá kết quả học tập.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (26, 11, N'Anh/Chị được giảng viên cung cấp đầy đủ thông tin về tài liệu học tập và các phương tiện hỗ trợ phục vụ môn học.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (27, 12, N'Nội dung giảng dạy được cập nhật, đổi mới.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (28, 12, N'Nội dung giảng dạy thiết thực, hữu ích.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (29, 12, N'Nội dung giảng dạy vừa sức đối với anh/chị.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (30, 13, N'Giảng viên có kiến thức sâu rộng về môn học.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (31, 13, N'Giảng viên đảm bảo thời gian giảng dạy trên lớp.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (32, 13, N'Giảng viên đảm bảo được tiến độ giảng dạy theo thời lượng phân bố.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (33, 14, N'Giảng viên sử dụng các hình thức kiểm tra đánh giá kết quả học tập khác nhau để tăng độ chính xác trong đánh giá. ', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (34, 14, N'Việc đánh giá được thực hiện công bằng và phản ánh đúng năng lực của anh/chị.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (35, 15, N'Khả năng tiếp thu nội dung môn học qua giảng dạy của giảng viên.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (36, 15, N'Môn học giúp anh/chị hình thành, phát triển thế giới quan, phương pháp luận khoa học, kiến thức và kỹ năng cần thiết cho chuyên môn, nghiệp vụ và thực tiễn cuộc sống.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (37, 15, N'Anh/chị thích được học môn học này do giảng viên giảng dạy.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (38, 16, N'Ý kiến cá nhân', 2, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (39, 17, N'Anh/Chị được thông tin rõ mục tiêu, nội dung và yêu cầu môn học.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (40, 17, N'Anh/Chị được giảng viên cung cấp đầy đủ thông tin về lịch trình/kế hoạch giảng dạy và tiêu chí đánh giá kết quả học tập.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (41, 17, N'Anh/Chị được giảng viên cung cấp đầy đủ thông tin về tài liệu học tập và các phương tiện hỗ trợ phục vụ môn học.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (42, 18, N'Nội dung giảng dạy được cập nhật, đổi mới.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (43, 18, N'Nội dung giảng dạy thiết thực, hữu ích.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (44, 18, N'Nội dung giảng dạy vừa sức đối với anh/chị.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (45, 19, N'Giảng viên có kiến thức sâu rộng về môn học.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (46, 19, N'Giảng viên đảm bảo thời gian giảng dạy trên lớp.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (47, 19, N'Giảng viên đảm bảo được tiến độ giảng dạy theo thời lượng phân bố.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (48, 20, N'Giảng viên sử dụng các hình thức kiểm tra đánh giá kết quả học tập khác nhau để tăng độ chính xác trong đánh giá. ', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (49, 20, N'Việc đánh giá được thực hiện công bằng và phản ánh đúng năng lực của anh/chị.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (50, 21, N'Khả năng tiếp thu nội dung môn học qua giảng dạy của giảng viên.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (51, 21, N'Môn học giúp anh/chị hình thành, phát triển thế giới quan, phương pháp luận khoa học, kiến thức và kỹ năng cần thiết cho chuyên môn, nghiệp vụ và thực tiễn cuộc sống.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (52, 21, N'Anh/chị thích được học môn học này do giảng viên giảng dạy.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (53, 22, N'Ý kiến cá nhân', 2, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (89, 34, N'Loại môn học', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (90, 35, N'Giảng viên (GV) phổ biến đầy đủ mục đích, yêu cầu học phần cho sinh viên (SV', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (91, 35, N'Anh/Chị có kiến nghị gì để việc giảng dạy của môn học tốt hơn?', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (92, 35, N'GV hướng dẫn SV phương pháp tự học, nghiên cứu tài liệu', 0, 4)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (93, 35, N'GV truyền đạt nội dung của học phần đầy đủ, chính xác', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (94, 35, N'GV có quan tâm đến việc cập nhật kiến thức mới vào nội dung bài giảng', 0, 5)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (95, 35, N'GV có phương pháp giảng dạy phù hợp giúp SV hiểu rõ nội dung bài giảng', 0, 6)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (96, 35, N'GV có biện pháp phát huy sự chủ động và kỹ năng giải quyết vấn đề của SV', 0, 7)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (97, 35, N'GV sử dụng các phương tiện hỗ trợ giảng dạy hiệu quả.', 0, 8)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (98, 35, N'GV giải đáp thắc mắc của SV về kiến thức của học phần đầy đủ và thỏa đáng.', 0, 9)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (99, 35, N'GV quan tâm khuyến khích và hướng dẫn SV rèn luyện các kỹ năng, thái độ cần thiết cho nghề nghiệp và cuộc sống thông qua các hình thức tổ chức lớp học.', 0, 10)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (100, 35, N'GV sử dụng nhiều hình thức kiểm tra, đánh giá kết quả học tập của SV.', 0, 12)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (101, 35, N'GV tổ chức kiểm tra, đánh giá khách quan, công bằng.', 0, 13)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (102, 35, N'Kết quả kiểm tra, đánh giá đúng thực chất năng lực học tập, rèn luyện của SV.', 0, 14)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (103, 35, N'GV thực hiện đầy đủ giờ lên lớp theo đúng kế hoạch giảng dạy.	
', 0, 15)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (104, 35, N'Quá trình giảng dạy của GV thật sự tạo động lực học tập, rèn luyện đối với SV.	
', 0, 11)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (105, 36, N'Anh/Chị có kiến nghị gì để việc giảng dạy của môn học tốt hơn?', 2, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (106, 37, N'Anh/Chị được thông tin rõ mục tiêu, nội dung và yêu cầu môn học.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (107, 37, N'Anh/Chị được giảng viên cung cấp đầy đủ thông tin về lịch trình/kế hoạch giảng dạy và tiêu chí đánh giá kết quả học tập.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (108, 37, N'Anh/Chị được giảng viên cung cấp đầy đủ thông tin về tài liệu học tập và các phương tiện hỗ trợ phục vụ môn học.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (109, 38, N'Nội dung giảng dạy được cập nhật, đổi mới.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (110, 38, N'Nội dung giảng dạy thiết thực, hữu ích.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (111, 38, N'Nội dung giảng dạy vừa sức đối với anh/chị.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (112, 39, N'Giảng viên có kiến thức sâu rộng về môn học.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (113, 39, N'Giảng viên đảm bảo thời gian giảng dạy trên lớp.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (114, 39, N'Giảng viên đảm bảo được tiến độ giảng dạy theo thời lượng phân bố.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (115, 40, N'Giảng viên sử dụng các hình thức kiểm tra đánh giá kết quả học tập khác nhau để tăng độ chính xác trong đánh giá. ', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (116, 40, N'Việc đánh giá được thực hiện công bằng và phản ánh đúng năng lực của anh/chị.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (117, 41, N'Khả năng tiếp thu nội dung môn học qua giảng dạy của giảng viên.', 0, 1)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (118, 41, N'Môn học giúp anh/chị hình thành, phát triển thế giới quan, phương pháp luận khoa học, kiến thức và kỹ năng cần thiết cho chuyên môn, nghiệp vụ và thực tiễn cuộc sống.', 0, 2)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (119, 41, N'Anh/chị thích được học môn học này do giảng viên giảng dạy.', 0, 3)
INSERT [dbo].[ChiTietNoiDung] ([MaCT], [MaNDu], [MoTa], [LoaiCT], [ViTri]) VALUES (120, 42, N'Ý kiến cá nhân', 2, 1)
SET IDENTITY_INSERT [dbo].[ChiTietNoiDung] OFF
SET IDENTITY_INSERT [dbo].[DangKyHocPhan] ON 

INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (1, 1)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (2, 2)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (3, 3)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (5, 5)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (6, 6)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (7, 7)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (8, 9)
INSERT [dbo].[DangKyHocPhan] ([MaDK], [MaND]) VALUES (9, 10)
SET IDENTITY_INSERT [dbo].[DangKyHocPhan] OFF
SET IDENTITY_INSERT [dbo].[GiangDay] ON 

INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (2, 5, 1, 5, 1)
INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (3, 5, 3, 3, 1)
INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (4, 7, 2, 3, 0)
INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (6, 5, 2, 3, 0)
INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (7, 8, 3, 6, 0)
INSERT [dbo].[GiangDay] ([MaGD], [MaGV], [MaMH], [MaLop], [TrangThai]) VALUES (8, 4, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[GiangDay] OFF
SET IDENTITY_INSERT [dbo].[GiangVien] ON 

INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (1, N'GVA', N'Mai Văn Bình')
INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (2, N'GVB', N'Nguyễn Trường An')
INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (3, N'GVC', N'Lý Thiên Quốc')
INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (4, N'GVT', N'Nguyễn Văn Thông')
INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (5, N'GV-03', N'Hồ Huy Thạch')
INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (7, N'GV-01', N'Hạ Sỹ Toàn Thắng')
INSERT [dbo].[GiangVien] ([MaGV], [MaDD], [HoTen]) VALUES (8, N'GV-02', N'Nguyễn Bá')
SET IDENTITY_INSERT [dbo].[GiangVien] OFF
SET IDENTITY_INSERT [dbo].[GopY] ON 

INSERT [dbo].[GopY] ([MaGY], [MaND], [TieuDe], [NoiDung], [ThoiGian]) VALUES (1, 1, N'Đánh giá giảng viên Lê Na', N'czCzxczxczx', CAST(0x0000A530009D43C4 AS DateTime))
SET IDENTITY_INSERT [dbo].[GopY] OFF
SET IDENTITY_INSERT [dbo].[KetQua] ON 

INSERT [dbo].[KetQua] ([MaKQ], [MaDG], [MaND], [ThoiGian]) VALUES (16, 11, 1, CAST(0x0000A55600275718 AS DateTime))
INSERT [dbo].[KetQua] ([MaKQ], [MaDG], [MaND], [ThoiGian]) VALUES (17, 1, 1, CAST(0x0000A55E00823E30 AS DateTime))
INSERT [dbo].[KetQua] ([MaKQ], [MaDG], [MaND], [ThoiGian]) VALUES (18, 4, 3, CAST(0x0000A55E0083043C AS DateTime))
INSERT [dbo].[KetQua] ([MaKQ], [MaDG], [MaND], [ThoiGian]) VALUES (19, 12, 2, CAST(0x0000A569008F9C10 AS DateTime))
INSERT [dbo].[KetQua] ([MaKQ], [MaDG], [MaND], [ThoiGian]) VALUES (20, 11, 2, CAST(0x0000A569008FBBB4 AS DateTime))
SET IDENTITY_INSERT [dbo].[KetQua] OFF
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (1, N'K35')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (2, N'K36')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (3, N'K37')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (7, N'K39')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (8, N'K52')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (9, N'34123123')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (10, N'333')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (11, N'35353')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (12, N'343535')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (13, N'3453466')
INSERT [dbo].[KhoaHoc] ([MaKhoa], [TenKhoa]) VALUES (14, N'3243252534')
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
SET IDENTITY_INSERT [dbo].[LoaiPhieu] ON 

INSERT [dbo].[LoaiPhieu] ([LoaiP], [Ten], [TrangThai]) VALUES (1, N'Giảng Viên', 1)
INSERT [dbo].[LoaiPhieu] ([LoaiP], [Ten], [TrangThai]) VALUES (2, N'Môn học', 1)
INSERT [dbo].[LoaiPhieu] ([LoaiP], [Ten], [TrangThai]) VALUES (3, N'Khóa học', 1)
SET IDENTITY_INSERT [dbo].[LoaiPhieu] OFF
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([MaLop], [Ten], [MaKhoa]) VALUES (1, N'CTK35', 1)
INSERT [dbo].[Lop] ([MaLop], [Ten], [MaKhoa]) VALUES (2, N'CTK35CD', 1)
INSERT [dbo].[Lop] ([MaLop], [Ten], [MaKhoa]) VALUES (3, N'CTK36', 2)
INSERT [dbo].[Lop] ([MaLop], [Ten], [MaKhoa]) VALUES (4, N'CTK36CD', 2)
INSERT [dbo].[Lop] ([MaLop], [Ten], [MaKhoa]) VALUES (5, N'CTK37', 3)
INSERT [dbo].[Lop] ([MaLop], [Ten], [MaKhoa]) VALUES (6, N'CTK37CD', 3)
SET IDENTITY_INSERT [dbo].[Lop] OFF
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (1, N'Java', 4, 1, 1)
INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (2, N'Android', 3, 0, 1)
INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (3, N'PHP', 2, 1, 1)
INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (4, N'Lập trình hướng đối tượng', 4, 1, 1)
INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (5, N'Chuyên đề cơ sở', 2, 1, 1)
INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (6, N'Kỹ thuật phần mềm', 3, 1, 1)
INSERT [dbo].[MonHoc] ([MaMH], [Ten], [SoTC], [LoaiMH], [TrangThai]) VALUES (7, N'Công Nghệ phần mềm', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (1, N'Nguyễn Trường An', N'Trần Khánh Dư', CAST(0x2E1B0B00 AS Date), N'chicky.master.ctk35@gmail.com', N'01677722105', N'admin', N'123456', NULL, 1, 1)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (2, N'Na Béo', N'Hà Tinh', CAST(0x8B1A0B00 AS Date), N'lena@gmail.com', N'0987667420', N'1110113', N'123456', 1, 1, 1)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (3, N'Mai Văn Bình', N'Đồi Trà', CAST(0x9B1A0B00 AS Date), N'coci@gmail.com', N'0917225104', N'1110114', N'123456', 2, 0, 0)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (5, N'Ô la lá', N'Đồi Trà', CAST(0x6D3A0B00 AS Date), N'mywifeishinata@yahoo.com', N'01677722105', N'admin2', N'123456', 4, 0, 1)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (6, N'Nguyễn Trường Tộ', N'Đồi Trà', CAST(0x613A0B00 AS Date), N'mywifeishinat2a@yahoo.com', N'01677722105', N'1110115', N'123456', 6, 0, 0)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (7, N'Nguyễn La An', N'Đồi Trà', CAST(0x643A0B00 AS Date), N'mywifeishinatar@yahoo.com', N'01677722105', N'1110116', N'123456', 1, 0, 0)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (9, N'Trần Thị Muội', N'Đồi Trà', CAST(0x653A0B00 AS Date), N'mywifeishinatae4@yahoo.com', N'01677722105', N'1110118', N'123456', 4, 0, 1)
INSERT [dbo].[NguoiDung] ([MaND], [HoTen], [DiaChi], [NgaySinh], [Email], [Sdt], [MaDN], [MatKhau], [MaLop], [TrangThai], [LoaiND]) VALUES (10, N'Hồ Huy Thạch', N'Đồi Trà', CAST(0x653A0B00 AS Date), N'mywifeishinatdda@yahoo.com', N'01677722105', N'1110119', NULL, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[NoiDung] ON 

INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (1, 1, N'THÔNG TIN CHUNG', 1)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (2, 1, N'NỘI DUNG', 2)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (3, 1, N'Ý KIẾN KHÁC', 3)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (4, 2, N'Nội dung', 1)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (5, 2, N'Ý kiến', 2)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (11, 3, N'Thông tin về môn học và tài liệu phục vụ giảng dạy', 1)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (12, 3, N'Nội dung giảng dạy', 2)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (13, 3, N'Hoạt động giảng dạy ', 3)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (14, 3, N'Kiểm tra - đánh giá sinh viên', 4)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (15, 3, N'Cảm nhận về kết quả đạt được', 5)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (16, 3, N'Các ý kiến khác đối với giảng viên', 6)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (17, 11, N'Thông tin về môn học và tài liệu phục vụ giảng dạy', 1)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (18, 11, N'Nội dung giảng dạy', 2)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (19, 11, N'Hoạt động giảng dạy ', 3)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (20, 11, N'Kiểm tra - đánh giá sinh viên', 4)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (21, 11, N'Cảm nhận về kết quả đạt được', 5)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (22, 11, N'Các ý kiến khác đối với giảng viên', 6)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (34, 12, N'THÔNG TIN CHUNG', 1)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (35, 12, N'NỘI DUNG', 2)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (36, 12, N'Ý KIẾN KHÁC', 3)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (37, 14, N'Thông tin về môn học và tài liệu phục vụ giảng dạy', 1)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (38, 14, N'Nội dung giảng dạy', 2)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (39, 14, N'Hoạt động giảng dạy ', 3)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (40, 14, N'Kiểm tra - đánh giá sinh viên', 4)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (41, 14, N'Cảm nhận về kết quả đạt được', 5)
INSERT [dbo].[NoiDung] ([MaNDu], [MaDG], [TieuDe], [ViTri]) VALUES (42, 14, N'Các ý kiến khác đối với giảng viên', 6)
SET IDENTITY_INSERT [dbo].[NoiDung] OFF
SET IDENTITY_INSERT [dbo].[NoiDungCon] ON 

INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (1, 1, N'Bắt buộc', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (2, 1, N'Tự chọn', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (3, 2, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (4, 2, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (5, 2, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (6, 2, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (7, 2, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (9, 3, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (10, 3, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (11, 3, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (12, 3, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (13, 3, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (14, 4, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (15, 4, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (16, 4, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (17, 4, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (18, 4, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (19, 5, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (20, 5, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (21, 5, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (22, 5, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (23, 5, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (24, 6, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (25, 6, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (26, 6, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (27, 6, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (28, 6, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (29, 7, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (30, 7, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (31, 7, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (32, 7, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (33, 7, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (34, 8, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (35, 8, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (36, 8, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (37, 8, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (38, 8, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (39, 9, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (40, 9, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (41, 9, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (42, 9, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (43, 9, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (45, 10, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (46, 10, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (47, 10, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (48, 10, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (49, 11, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (50, 11, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (51, 11, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (52, 11, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (53, 11, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (54, 12, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (55, 12, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (56, 12, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (57, 12, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (58, 12, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (59, 13, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (60, 13, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (61, 13, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (62, 13, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (63, 13, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (64, 14, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (65, 14, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (66, 14, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (67, 14, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (68, 14, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (69, 15, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (70, 15, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (71, 15, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (72, 15, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (73, 15, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (74, 16, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (75, 16, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (76, 16, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (77, 16, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (78, 16, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (79, 17, N'Nội dung', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (84, 10, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (92, 24, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (93, 24, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (94, 24, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (95, 24, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (96, 24, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (97, 25, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (98, 25, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (99, 25, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (100, 25, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (101, 25, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (102, 26, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (103, 26, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (104, 26, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (105, 26, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (106, 26, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (107, 27, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (108, 27, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (109, 27, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (110, 27, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (111, 27, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (112, 28, N'Hoàn toàn không đồng ý', 1)
GO
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (113, 28, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (114, 28, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (115, 28, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (116, 28, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (117, 29, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (118, 29, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (119, 29, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (120, 29, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (121, 29, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (122, 30, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (123, 30, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (124, 30, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (125, 30, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (126, 30, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (127, 31, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (128, 31, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (129, 31, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (130, 31, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (131, 31, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (132, 32, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (133, 32, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (134, 32, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (135, 32, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (136, 32, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (137, 33, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (138, 33, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (139, 33, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (140, 33, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (141, 33, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (142, 34, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (143, 34, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (144, 34, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (145, 34, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (146, 34, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (147, 35, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (148, 35, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (149, 35, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (150, 35, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (151, 35, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (152, 36, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (153, 36, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (154, 36, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (155, 36, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (156, 36, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (157, 37, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (158, 37, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (159, 37, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (160, 37, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (161, 37, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (162, 38, N'Nêu ý kiến', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (163, 39, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (164, 39, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (165, 39, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (166, 39, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (167, 39, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (168, 40, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (169, 40, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (170, 40, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (171, 40, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (172, 40, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (173, 41, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (174, 41, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (175, 41, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (176, 41, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (177, 41, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (178, 42, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (179, 42, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (180, 42, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (181, 42, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (182, 42, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (183, 43, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (184, 43, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (185, 43, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (186, 43, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (187, 43, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (188, 44, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (189, 44, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (190, 44, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (191, 44, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (192, 44, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (193, 45, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (194, 45, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (195, 45, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (196, 45, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (197, 45, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (198, 46, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (199, 46, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (200, 46, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (201, 46, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (202, 46, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (203, 47, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (204, 47, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (205, 47, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (206, 47, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (207, 47, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (208, 48, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (209, 48, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (210, 48, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (211, 48, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (212, 48, N'Rất đồng ý', 5)
GO
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (213, 49, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (214, 49, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (215, 49, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (216, 49, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (217, 49, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (218, 50, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (219, 50, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (220, 50, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (221, 50, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (222, 50, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (223, 51, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (224, 51, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (225, 51, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (226, 51, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (227, 51, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (228, 52, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (229, 52, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (230, 52, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (231, 52, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (232, 52, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (233, 53, N'Nêu ý kiến', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (390, 89, N'Bắt buộc', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (391, 89, N'Tự chọn', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (392, 90, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (393, 90, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (394, 90, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (395, 90, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (396, 90, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (397, 91, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (398, 91, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (399, 91, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (400, 91, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (401, 91, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (402, 92, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (403, 92, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (404, 92, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (405, 92, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (406, 92, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (407, 93, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (408, 93, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (409, 93, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (410, 93, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (411, 93, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (412, 94, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (413, 94, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (414, 94, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (415, 94, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (416, 94, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (417, 95, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (418, 95, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (419, 95, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (420, 95, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (421, 95, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (422, 96, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (423, 96, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (424, 96, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (425, 96, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (426, 96, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (427, 97, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (428, 97, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (429, 97, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (430, 97, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (431, 97, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (432, 98, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (433, 98, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (434, 98, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (435, 98, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (436, 98, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (437, 99, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (438, 99, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (439, 99, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (440, 99, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (441, 99, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (442, 100, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (443, 100, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (444, 100, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (445, 100, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (446, 100, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (447, 101, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (448, 101, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (449, 101, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (450, 101, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (451, 101, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (452, 102, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (453, 102, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (454, 102, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (455, 102, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (456, 102, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (457, 103, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (458, 103, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (459, 103, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (460, 103, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (461, 103, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (462, 104, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (463, 104, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (464, 104, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (465, 104, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (466, 104, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (467, 105, N'Nội dung', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (468, 106, N'Hoàn toàn không đồng ý', 1)
GO
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (469, 106, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (470, 106, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (471, 106, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (472, 106, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (473, 107, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (474, 107, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (475, 107, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (476, 107, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (477, 107, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (478, 108, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (479, 108, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (480, 108, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (481, 108, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (482, 108, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (483, 109, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (484, 109, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (485, 109, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (486, 109, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (487, 109, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (488, 110, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (489, 110, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (490, 110, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (491, 110, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (492, 110, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (493, 111, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (494, 111, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (495, 111, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (496, 111, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (497, 111, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (498, 112, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (499, 112, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (500, 112, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (501, 112, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (502, 112, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (503, 113, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (504, 113, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (505, 113, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (506, 113, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (507, 113, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (508, 114, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (509, 114, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (510, 114, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (511, 114, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (512, 114, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (513, 115, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (514, 115, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (515, 115, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (516, 115, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (517, 115, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (518, 116, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (519, 116, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (520, 116, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (521, 116, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (522, 116, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (523, 117, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (524, 117, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (525, 117, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (526, 117, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (527, 117, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (528, 118, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (529, 118, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (530, 118, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (531, 118, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (532, 118, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (533, 119, N'Hoàn toàn không đồng ý', 1)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (534, 119, N'Không đồng ý', 2)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (535, 119, N'Phân vân', 3)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (536, 119, N'Đồng ý', 4)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (537, 119, N'Rất đồng ý', 5)
INSERT [dbo].[NoiDungCon] ([MaNDC], [MaCT], [TieuDe], [ViTri]) VALUES (538, 120, N'Nêu ý kiến', 1)
SET IDENTITY_INSERT [dbo].[NoiDungCon] OFF
SET IDENTITY_INSERT [dbo].[PhieuDanhGia] ON 

INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (1, N'Đánh giá dạy và học môn JAVA', 1, NULL, NULL, CAST(0x0000A51A00000000 AS DateTime), 1, 2, 1, N'2015-2016', 1)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (2, N'Đánh giá dạy và học môn PHP', 2, NULL, NULL, CAST(0x0000A51A00000000 AS DateTime), 1, 2, 1, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (3, N'Đánh giá giáo viên Lê Na', NULL, 7, NULL, CAST(0x0000A51A00000000 AS DateTime), 1, 1, 2, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (4, N'Đánh giá cuối Khóa học K35', NULL, NULL, 1, CAST(0x0000A51A00000000 AS DateTime), 1, 3, 2, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (11, N'Đánh giá giảng viên Mai Bình', NULL, 5, NULL, CAST(0x0000A51C00B96874 AS DateTime), 1, 1, 5, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (12, N'Đánh giá giảng và dạy môn Học JAVA2', 3, NULL, NULL, CAST(0x0000A51C00B9C184 AS DateTime), 1, 2, 5, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (13, N'234234', 1, NULL, NULL, CAST(0x0000A55E00803BBC AS DateTime), 1, 2, 1, N'2015-2016', 2)
INSERT [dbo].[PhieuDanhGia] ([MaDG], [TieuDe], [MaGD], [MaGV], [MaKhoa], [ThoiGianDang], [TrangThai], [LoaiP], [MaNguoiTao], [nienKhoa], [hocKy]) VALUES (14, N'Đánh giá giảng viên Nguyễn Tộ', NULL, 8, NULL, CAST(0x0000A55F00CEB080 AS DateTime), 1, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhieuDanhGia] OFF
ALTER TABLE [dbo].[ChiTietDKHP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDKHP_DangKyHocPhan] FOREIGN KEY([MaDK])
REFERENCES [dbo].[DangKyHocPhan] ([MaDK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDKHP] CHECK CONSTRAINT [FK_ChiTietDKHP_DangKyHocPhan]
GO
ALTER TABLE [dbo].[ChiTietDKHP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDKHP_GiangDay] FOREIGN KEY([MaGD])
REFERENCES [dbo].[GiangDay] ([MaGD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDKHP] CHECK CONSTRAINT [FK_ChiTietDKHP_GiangDay]
GO
ALTER TABLE [dbo].[ChiTietKetQua]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKetQua_ChiTietNoiDung] FOREIGN KEY([MaCT])
REFERENCES [dbo].[ChiTietNoiDung] ([MaCT])
GO
ALTER TABLE [dbo].[ChiTietKetQua] CHECK CONSTRAINT [FK_ChiTietKetQua_ChiTietNoiDung]
GO
ALTER TABLE [dbo].[ChiTietKetQua]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKetQua_KetQua] FOREIGN KEY([MaKQ])
REFERENCES [dbo].[KetQua] ([MaKQ])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietKetQua] CHECK CONSTRAINT [FK_ChiTietKetQua_KetQua]
GO
ALTER TABLE [dbo].[ChiTietNoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietNoiDung_NoiDung] FOREIGN KEY([MaNDu])
REFERENCES [dbo].[NoiDung] ([MaNDu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietNoiDung] CHECK CONSTRAINT [FK_ChiTietNoiDung_NoiDung]
GO
ALTER TABLE [dbo].[DangKyHocPhan]  WITH CHECK ADD  CONSTRAINT [FK_DangKyHocPhan_NguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKyHocPhan] CHECK CONSTRAINT [FK_DangKyHocPhan_NguoiDung]
GO
ALTER TABLE [dbo].[GiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiangDay_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[GiangDay] CHECK CONSTRAINT [FK_GiangDay_GiangVien]
GO
ALTER TABLE [dbo].[GiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiangDay_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[GiangDay] CHECK CONSTRAINT [FK_GiangDay_Lop]
GO
ALTER TABLE [dbo].[GiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiangDay_MonHoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[GiangDay] CHECK CONSTRAINT [FK_GiangDay_MonHoc]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_NguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_NguoiDung]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_PhieuDanhGia] FOREIGN KEY([MaDG])
REFERENCES [dbo].[PhieuDanhGia] ([MaDG])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_PhieuDanhGia]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_SinhVien] FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_SinhVien]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KhoaHoc] ([MaKhoa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_Khoa]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_SinhVien_Lop]
GO
ALTER TABLE [dbo].[NoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NoiDung_PhieuDanhGia] FOREIGN KEY([MaDG])
REFERENCES [dbo].[PhieuDanhGia] ([MaDG])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NoiDung] CHECK CONSTRAINT [FK_NoiDung_PhieuDanhGia]
GO
ALTER TABLE [dbo].[NoiDungCon]  WITH CHECK ADD  CONSTRAINT [FK_NoiDungCon_ChiTietNoiDung] FOREIGN KEY([MaCT])
REFERENCES [dbo].[ChiTietNoiDung] ([MaCT])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NoiDungCon] CHECK CONSTRAINT [FK_NoiDungCon_ChiTietNoiDung]
GO
ALTER TABLE [dbo].[PhieuDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDanhGia_GiangDay] FOREIGN KEY([MaGD])
REFERENCES [dbo].[GiangDay] ([MaGD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDanhGia] CHECK CONSTRAINT [FK_PhieuDanhGia_GiangDay]
GO
ALTER TABLE [dbo].[PhieuDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDanhGia_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDanhGia] CHECK CONSTRAINT [FK_PhieuDanhGia_GiangVien]
GO
ALTER TABLE [dbo].[PhieuDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDanhGia_KhoaHoc] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KhoaHoc] ([MaKhoa])
GO
ALTER TABLE [dbo].[PhieuDanhGia] CHECK CONSTRAINT [FK_PhieuDanhGia_KhoaHoc]
GO
ALTER TABLE [dbo].[PhieuDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDanhGia_LoaiPhieu] FOREIGN KEY([LoaiP])
REFERENCES [dbo].[LoaiPhieu] ([LoaiP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDanhGia] CHECK CONSTRAINT [FK_PhieuDanhGia_LoaiPhieu]
GO
USE [master]
GO
ALTER DATABASE [DGDayHoc] SET  READ_WRITE 
GO
