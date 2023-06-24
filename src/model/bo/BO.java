package model.bo;

import model.bean.*;
import model.dao.DAO;

public class BO {
	
	/*
	 * Từ khóa
	 * T: đại diện cho 1 lớp vd: YeuCau, TaiKhoan, .v..v
	 * 
	 * Cách sử dụng:
	 * Chỉ cần tạo 1 đối tượng DbSet<T> là sử dụng được
	 * cú pháp
	 * -------------------------------------------------------- 
	 * 1 | public DbSet<T> <<Tên biến>> = new DbSet<T>(T.class); | 
	 * ---------------------------------------------------------
	 *  -------------------------------------------------------- 
	 * 2 | public DbSet<T> <<Tên biến>> = new DbSet<T>(T.class, <tên bảng trong database>); | 
	 * ---------------------------------------------------------
	 * vd: public DbSet<YeuCau> yeuCau = new DbSet<YeuCau>(YeuCau.class); 
	 * 		public DbSet<NguoiDung> nguoiDung = new DbSet<NguoiDung>(NguoiDung.class, "NguoiDung");
	 * 
	 * Các method hiện tại có thể sử dụng:
	 * getList() : trả về danh sách (ArrayList<T>)
	 * add(object): thêm 1 đối tượng. return boolean
	 * remove(object) : xóa 1 đối tượng. return boolean
	 * remove(condition):  xóa 1 đối tượng theo 1 điều kiện condition. return boolean
	 * update(object): cập nhật thông tin cho đối tượng object
	 * include(ArrayList<Object>)
	 * 
	 * Lưu ý (Cực quan trọng)
	 * 
	 * Với cách khởi tạo thể hiện DbSet 1 thì Tên lớp (T) phải giống như tên bảng trong database
	 * Vì thế sẽ có 1 số tên bảng không thể sử dụng được.
	 * vd: Account, ...
	 * 
	 * Còn với cách tạo 2 thì thoải mái
	 * 
	 */
	
	//---chính
	public DbSet<NguoiDung> nguoiDung = new DbSet<NguoiDung>(NguoiDung.class, "NguoiDung");
	public DbSet<Khoa> khoa = new DbSet<Khoa>(Khoa.class, "KhoaHoc");
	public DbSet<Lop> lop = new DbSet<Lop>(Lop.class, "Lop");
	public DbSet<GiangVien> giangVien = new DbSet<GiangVien>(GiangVien.class, "GiangVien");
	public DbSet<GiangDay> giangDay = new DbSet<GiangDay>(GiangDay.class, "GiangDay");
	public DbSet<MonHoc> monHoc = new DbSet<MonHoc>(MonHoc.class, "MonHoc");
	public DbSet<PhieuDanhGia> phieuDanhGia = new DbSet<PhieuDanhGia>(PhieuDanhGia.class, "PhieuDanhGia");
	public DbSet<NoiDung> noiDung = new DbSet<NoiDung>(NoiDung.class, "NoiDung");
	public DbSet<ChiTietNoiDung> chiTietNoiDung = new DbSet<ChiTietNoiDung>(ChiTietNoiDung.class, "ChiTietNoiDung");
	public DbSet<KetQua> ketQua = new DbSet<KetQua>(KetQua.class, "KetQua");
	public DbSet<ChiTietKetQua> chiTietKetQua = new DbSet<ChiTietKetQua>(ChiTietKetQua.class, "ChiTietKetQua");
	public DbSet<LoaiPhieu> loaiPhieu = new DbSet<LoaiPhieu>(LoaiPhieu.class, "LoaiPhieu");
	public DbSet<NoiDungCon> noiDungCon = new DbSet<NoiDungCon>(NoiDungCon.class, "NoiDungCon");
	public DbSet<GopY> gopY = new DbSet<GopY>(GopY.class, "GopY");
	public DbSet<DangKyHocPhan> dangKyHocPhan = new DbSet<DangKyHocPhan>(DangKyHocPhan.class, "DangKyHocPhan");
	public DbSet<ChiTietDKHP> chiTietDKHP = new DbSet<ChiTietDKHP>(ChiTietDKHP.class, "ChiTietDKHP");
	//---end chính
	
	public static boolean executeSqlUpdate(String query){
	    return DAO.executeUpdate(query);
	}
	
}

