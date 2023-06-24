package model.bean;

import java.sql.*;
import java.util.*;

public class ChiTietDKHP extends BaseBean {
    private String maCTDK;
    private String maGD;
    private String maDK;
    private String ngayGio;
    private String trangThai;
    private DangKyHocPhan dangKyHocPhan;
    private GiangDay giangDay;

    public String getMaCTDK() {
        return maCTDK;
    }

    public void setMaCTDK(String maCTDK) {
        this.maCTDK = maCTDK;
    }

    public String getMaGD() {
        return maGD;
    }

    public void setMaGD(String maGD) {
        this.maGD = maGD;
    }

    public String getMaDK() {
        return maDK;
    }

    public void setMaDK(String maDK) {
        this.maDK = maDK;
    }

    public String getNgayGio() {
        return ngayGio;
    }

    public void setNgayGio(String ngayGio) {
        this.ngayGio = ngayGio;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public DangKyHocPhan getDangKyHocPhan() {
        return dangKyHocPhan;
    }

    public void setDangKyHocPhan(DangKyHocPhan dangKyHocPhan) {
        this.dangKyHocPhan = dangKyHocPhan;
    }

    public GiangDay getGiangDay() {
        return giangDay;
    }

    public void setGiangDay(GiangDay giangDay) {
        this.giangDay = giangDay;
    }

    public ChiTietDKHP() {
    }

    public ChiTietDKHP(String maGD, String maDK, String ngayGio,
            String trangThai) {
        this.maGD = maGD;
        this.maDK = maDK;
        this.ngayGio = ngayGio;
        this.trangThai = trangThai;
    }

    public ChiTietDKHP(String maCTDK, String maGD, String maDK, String ngayGio,
            String trangThai) {
        this.maCTDK = maCTDK;
        this.maGD = maGD;
        this.maDK = maDK;
        this.ngayGio = ngayGio;
        this.trangThai = trangThai;
    }

    @SuppressWarnings("unchecked")
    public ChiTietDKHP convert(ResultSet rs) {
        try {
            String maCTDKo = rs.getString("MaCTDK") == null ? "" : rs
                    .getString("MaCTDK");
            String maGDo = rs.getString("MaGD") == null ? "" : rs
                    .getString("MaGD");
            String maDKo = rs.getString("MaDK") == null ? "" : rs
                    .getString("MaDK");
            String ngayGioo = rs.getString("NgayGio") == null ? "" : rs
                    .getString("NgayGio");
            String trangThaio = rs.getString("TrangThai") == null ? "" : rs
                    .getString("TrangThai");
            return new ChiTietDKHP(maCTDKo, maGDo, maDKo, ngayGioo, trangThaio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maGD);
        addValue(maDK);
        addValue(ngayGio);
        addValue(trangThai);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaCTDK", maCTDK);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaGD", maGD);
        addValue("MaDK", maDK);
        addValue("NgayGio", ngayGio);
        addValue("TrangThai", trangThai);
        return toStringArgs();
    }

    public void includeDangKyHocPhan(ArrayList<DangKyHocPhan> dangKyHocPhanl) {
        for (DangKyHocPhan ob : dangKyHocPhanl) {
            if (getMaDK().equals(ob.getMaDK())) {
                setDangKyHocPhan(ob);
                break;
            }
        }
    }

    public void includeGiangDay(ArrayList<GiangDay> giangDayl) {
        for (GiangDay ob : giangDayl) {
            if (getMaGD().equals(ob.getMaGD())) {
                setGiangDay(ob);
                break;
            }
        }
    }

}