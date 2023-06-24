package model.bean;

import java.sql.*;
import java.util.*;

import Parse.ParseValue;

public class NguoiDung extends BaseBean {
    private String maND;
    private String hoTen;
    private String diaChi;
    private String ngaySinh;
    private String email;
    private String sdt;
    private String maDN;
    private String matKhau;
    private String maLop;
    private String trangThai;
    private String loaiND;
    private Lop lop;
    @SuppressWarnings("unused")
    private String diaChiSub;
    @SuppressWarnings("unused")
    private String emailSub;
    @SuppressWarnings("unused")
    private String ngaySinhSub;

    public String getMaND() {
        return maND;
    }

    public void setMaND(String maND) {
        this.maND = maND;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getMaDN() {
        return maDN;
    }

    public void setMaDN(String maDN) {
        this.maDN = maDN;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getMaLop() {
        return maLop;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getLoaiND() {
        return loaiND;
    }

    public void setLoaiND(String loaiND) {
        this.loaiND = loaiND;
    }

    public Lop getLop() {
        return lop;
    }

    public void setLop(Lop lop) {
        this.lop = lop;
    }
    
    public String getDiaChiSub() {
        return diaChi.length()>50?diaChi.substring(0, 50)+"...":diaChi;
    }

    public void setDiaChiSub(String diaChiSub) {
        this.diaChiSub = diaChiSub;
    }

    public String getEmailSub() {
        return email.length()>30?email.substring(0, 30)+"...":email;
    }

    public void setEmailSub(String emailSub) {
        this.emailSub = emailSub;
    }
    
    public String getNgaySinhSub() {
        return ParseValue.convertDateDDMMYY(ngaySinh);
    }

    public void setNgaySinhSub(String ngaySinhSub) {
        this.ngaySinhSub = ngaySinhSub;
    }

    public NguoiDung() {
    }

    public NguoiDung(String hoTen, String diaChi, String ngaySinh,
            String email, String sdt, String maDN, String matKhau,
            String maLop, String trangThai, String loaiND) {
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.ngaySinh = ngaySinh;
        this.email = email;
        this.sdt = sdt;
        this.maDN = maDN;
        this.matKhau = matKhau;
        this.maLop = maLop;
        this.trangThai = trangThai;
        this.loaiND = loaiND;
    }

    public NguoiDung(String maND, String hoTen, String diaChi, String ngaySinh,
            String email, String sdt, String maDN, String matKhau,
            String maLop, String trangThai, String loaiND) {
        this.maND = maND;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.ngaySinh = ngaySinh;
        this.email = email;
        this.sdt = sdt;
        this.maDN = maDN;
        this.matKhau = matKhau;
        this.maLop = maLop;
        this.trangThai = trangThai;
        this.loaiND = loaiND;
    }

    @SuppressWarnings("unchecked")
    public NguoiDung convert(ResultSet rs) {
        try {
            String maNDo = rs.getString("MaND") == null ? "" : rs
                    .getString("MaND");
            String hoTeno = rs.getString("HoTen") == null ? "" : rs
                    .getString("HoTen");
            String diaChio = rs.getString("DiaChi") == null ? "" : rs
                    .getString("DiaChi");
            String ngaySinho = rs.getString("NgaySinh") == null ? "" : rs
                    .getString("NgaySinh");
            String emailo = rs.getString("Email") == null ? "" : rs
                    .getString("Email");
            String sdto = rs.getString("Sdt") == null ? "" : rs
                    .getString("Sdt");
            String maDNo = rs.getString("MaDN") == null ? "" : rs
                    .getString("MaDN");
            String matKhauo = rs.getString("MatKhau") == null ? "" : rs
                    .getString("MatKhau");
            String maLopo = rs.getString("MaLop") == null ? "" : rs
                    .getString("MaLop");
            String trangThaio = rs.getString("TrangThai") == null ? "" : rs
                    .getString("TrangThai");
            String loaiNDo = rs.getString("LoaiND") == null ? "" : rs
                    .getString("LoaiND");
            return new NguoiDung(maNDo, hoTeno, diaChio, ngaySinho, emailo,
                    sdto, maDNo, matKhauo, maLopo, trangThaio, loaiNDo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(hoTen);
        addValue(diaChi);
        addValue(ngaySinh);
        addValue(email);
        addValue(sdt);
        addValue(maDN);
        addValue(matKhau);
        addValue(maLop);
        addValue(trangThai);
        addValue(loaiND);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaND", maND);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("HoTen", hoTen);
        addValue("DiaChi", diaChi);
        addValue("NgaySinh", ngaySinh);
        addValue("Email", email);
        addValue("Sdt", sdt);
        addValue("MaDN", maDN);
        addValue("MatKhau", matKhau);
        addValue("MaLop", maLop);
        addValue("TrangThai", trangThai);
        addValue("LoaiND", loaiND);
        return toStringArgs();
    }

    public void includeLop(ArrayList<Lop> lopl) {
        for (Lop ob : lopl) {
            if (getMaLop().equals(ob.getMaLop())) {
                setLop(ob);
                break;
            }
        }
    }

}