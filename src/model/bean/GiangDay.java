package model.bean;

import java.sql.*;
import java.util.*;

public class GiangDay extends BaseBean {
    private String maGD;
    private String maGV;
    private String maMH;
    private String maLop;
    private String trangThai;
    @SuppressWarnings("unused")
    private String info;
    private GiangVien giangVien;
    private Lop lop;
    private MonHoc monHoc;
    private ArrayList<ChiTietDKHP> listChiTietDKHP = new ArrayList<ChiTietDKHP>();
    private ArrayList<PhieuDanhGia> listPhieuDanhGia = new ArrayList<PhieuDanhGia>();

    public String getMaGD() {
        return maGD;
    }

    public void setMaGD(String maGD) {
        this.maGD = maGD;
    }

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getMaMH() {
        return maMH;
    }

    public void setMaMH(String maMH) {
        this.maMH = maMH;
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

    public GiangVien getGiangVien() {
        return giangVien;
    }

    public void setGiangVien(GiangVien giangVien) {
        this.giangVien = giangVien;
    }

    public Lop getLop() {
        return lop;
    }

    public void setLop(Lop lop) {
        this.lop = lop;
    }

    public MonHoc getMonHoc() {
        return monHoc;
    }

    public void setMonHoc(MonHoc monHoc) {
        this.monHoc = monHoc;
    }

    public ArrayList<ChiTietDKHP> getListChiTietDKHP() {
        return listChiTietDKHP;
    }

    public void setListChiTietDKHP(ArrayList<ChiTietDKHP> listChiTietDKHP) {
        this.listChiTietDKHP = listChiTietDKHP;
    }

    public ArrayList<PhieuDanhGia> getListPhieuDanhGia() {
        return listPhieuDanhGia;
    }

    public void setListPhieuDanhGia(ArrayList<PhieuDanhGia> listPhieuDanhGia) {
        this.listPhieuDanhGia = listPhieuDanhGia;
    }

    public GiangDay() {
    }

    public GiangDay(String maGV, String maMH, String maLop, String trangThai) {
        this.maGV = maGV;
        this.maMH = maMH;
        this.maLop = maLop;
        this.trangThai = trangThai;
    }

    public GiangDay(String maGD, String maGV, String maMH, String maLop,
            String trangThai) {
        this.maGD = maGD;
        this.maGV = maGV;
        this.maMH = maMH;
        this.maLop = maLop;
        this.trangThai = trangThai;
    }

    @SuppressWarnings("unchecked")
    public GiangDay convert(ResultSet rs) {
        try {
            String maGDo = rs.getString("MaGD") == null ? "" : rs
                    .getString("MaGD");
            String maGVo = rs.getString("MaGV") == null ? "" : rs
                    .getString("MaGV");
            String maMHo = rs.getString("MaMH") == null ? "" : rs
                    .getString("MaMH");
            String maLopo = rs.getString("MaLop") == null ? "" : rs
                    .getString("MaLop");
            String trangThaio = rs.getString("TrangThai") == null ? "" : rs
                    .getString("TrangThai");
            return new GiangDay(maGDo, maGVo, maMHo, maLopo, trangThaio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maGV);
        addValue(maMH);
        addValue(maLop);
        addValue(trangThai);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaGD", maGD);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaGV", maGV);
        addValue("MaMH", maMH);
        addValue("MaLop", maLop);
        addValue("TrangThai", trangThai);
        return toStringArgs();
    }

    public void includeGiangVien(ArrayList<GiangVien> giangVienl) {
        for (GiangVien ob : giangVienl) {
            if (getMaGV().equals(ob.getMaGV())) {
                setGiangVien(ob);
                break;
            }
        }
    }

    public void includeLop(ArrayList<Lop> lopl) {
        for (Lop ob : lopl) {
            if (getMaLop().equals(ob.getMaLop())) {
                setLop(ob);
                break;
            }
        }
    }

    public void includeMonHoc(ArrayList<MonHoc> monHocl) {
        for (MonHoc ob : monHocl) {
            if (getMaMH().equals(ob.getMaMH())) {
                setMonHoc(ob);
                break;
            }
        }
    }

    public void includeChiTietDKHP(ArrayList<ChiTietDKHP> chiTietDKHPl) {
        for (ChiTietDKHP ob : chiTietDKHPl) {
            if (getMaGD().equals(ob.getMaGD())) {
                getListChiTietDKHP().add(ob);
            }
        }
    }

    public void includePhieuDanhGia(ArrayList<PhieuDanhGia> phieuDanhGial) {
        for (PhieuDanhGia ob : phieuDanhGial) {
            if (getMaGD().equals(ob.getMaGD())) {
                getListPhieuDanhGia().add(ob);
            }
        }
    }

    public String getInfo() {
        return info = String.format("%-40s, GV: %-40s, Lớp: %s",
                monHoc.getTen(), giangVien.getHoTen(), lop.getTen());
    }

    public void setInfo(String info) {
        this.info = info;
    }

}
