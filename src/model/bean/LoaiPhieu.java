package model.bean;

import java.sql.*;
import java.util.*;

public class LoaiPhieu extends BaseBean {
    private String loaiP;
    private String ten;
    private String trangThai;
    private ArrayList<PhieuDanhGia> listPhieuDanhGia = new ArrayList<PhieuDanhGia>();

    public String getLoaiP() {
        return loaiP;
    }

    public void setLoaiP(String loaiP) {
        this.loaiP = loaiP;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public ArrayList<PhieuDanhGia> getListPhieuDanhGia() {
        return listPhieuDanhGia;
    }

    public void setListPhieuDanhGia(ArrayList<PhieuDanhGia> listPhieuDanhGia) {
        this.listPhieuDanhGia = listPhieuDanhGia;
    }

    public LoaiPhieu() {
    }

    public LoaiPhieu(String ten, String trangThai) {
        this.ten = ten;
        this.trangThai = trangThai;
    }

    public LoaiPhieu(String loaiP, String ten, String trangThai) {
        this.loaiP = loaiP;
        this.ten = ten;
        this.trangThai = trangThai;
    }

    @SuppressWarnings("unchecked")
    public LoaiPhieu convert(ResultSet rs) {
        try {
            String loaiPo = rs.getString("LoaiP") == null ? "" : rs
                    .getString("LoaiP");
            String teno = rs.getString("Ten") == null ? "" : rs
                    .getString("Ten");
            String trangThaio = rs.getString("TrangThai") == null ? "" : rs
                    .getString("TrangThai");
            return new LoaiPhieu(loaiPo, teno, trangThaio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(ten);
        addValue(trangThai);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("LoaiP", loaiP);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("Ten", ten);
        addValue("TrangThai", trangThai);
        return toStringArgs();
    }

    public void includePhieuDanhGia(ArrayList<PhieuDanhGia> phieuDanhGial) {
        for (PhieuDanhGia ob : phieuDanhGial) {
            if (getLoaiP().equals(ob.getLoaiP())) {
                getListPhieuDanhGia().add(ob);
            }
        }
    }

}