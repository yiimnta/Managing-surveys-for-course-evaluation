package model.bean;

import java.sql.*;
import java.util.*;

public class Lop extends BaseBean {
    private String maLop;
    private String ten;
    private String maKhoa;
    private Khoa khoa;
    private ArrayList<NguoiDung> listNguoiDung =  new ArrayList<NguoiDung>();

    public String getMaLop() {
        return maLop;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }

    public Khoa getKhoa() {
        return khoa;
    }

    public void setKhoa(Khoa khoa) {
        this.khoa = khoa;
    }

    public ArrayList<NguoiDung> getListNguoiDung() {
        return listNguoiDung;
    }

    public void setListNguoiDung(ArrayList<NguoiDung> listNguoiDung) {
        this.listNguoiDung = listNguoiDung;
    }

    public Lop() {
    }

    public Lop(String ten, String maKhoa) {
        this.ten = ten;
        this.maKhoa = maKhoa;
    }

    public Lop(String maLop, String ten, String maKhoa) {
        this.maLop = maLop;
        this.ten = ten;
        this.maKhoa = maKhoa;
    }

    @SuppressWarnings("unchecked")
    public Lop convert(ResultSet rs) {
        try {
            String maLopo = rs.getString("MaLop") == null ? "" : rs
                    .getString("MaLop");
            String teno = rs.getString("Ten") == null ? "" : rs
                    .getString("Ten");
            String maKhoao = rs.getString("MaKhoa") == null ? "" : rs
                    .getString("MaKhoa");
            return new Lop(maLopo, teno, maKhoao);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(ten);
        addValue(maKhoa);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaLop", maLop);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("Ten", ten);
        addValue("MaKhoa", maKhoa);
        return toStringArgs();
    }

    public void includeKhoa(ArrayList<Khoa> khoal) {
        for (Khoa ob : khoal) {
            if (getMaKhoa().equals(ob.getMaKhoa())) {
                setKhoa(ob);
                break;
            }
        }
    }

    public void includeNguoiDung(ArrayList<NguoiDung> nguoiDungl) {
        for (NguoiDung ob : nguoiDungl) {
            if (getMaLop().equals(ob.getMaLop())) {
                getListNguoiDung().add(ob);
            }
        }
    }

}