package model.bean;

import java.sql.*;

public class MonHoc extends BaseBean {
    private String maMH;
    private String ten;
    private String soTC;
    private String loaiMH;
    private String trangThai;

    public String getMaMH() {
        return maMH;
    }

    public void setMaMH(String maMH) {
        this.maMH = maMH;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getSoTC() {
        return soTC;
    }

    public void setSoTC(String soTC) {
        this.soTC = soTC;
    }

    public String getLoaiMH() {
        return loaiMH;
    }

    public void setLoaiMH(String loaiMH) {
        this.loaiMH = loaiMH;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public MonHoc() {
    }

    public MonHoc(String ten, String soTC, String loaiMH, String trangThai) {
        this.ten = ten;
        this.soTC = soTC;
        this.loaiMH = loaiMH;
        this.trangThai = trangThai;
    }

    public MonHoc(String maMH, String ten, String soTC, String loaiMH,
            String trangThai) {
        this.maMH = maMH;
        this.ten = ten;
        this.soTC = soTC;
        this.loaiMH = loaiMH;
        this.trangThai = trangThai;
    }

    @SuppressWarnings("unchecked")
    public MonHoc convert(ResultSet rs) {
        try {
            String maMHo = rs.getString("MaMH") == null ? "" : rs
                    .getString("MaMH");
            String teno = rs.getString("Ten") == null ? "" : rs
                    .getString("Ten");
            String soTCo = rs.getString("SoTC") == null ? "" : rs
                    .getString("SoTC");
            String loaiMHo = rs.getString("LoaiMH") == null ? "" : rs
                    .getString("LoaiMH");
            String trangThaio = rs.getString("TrangThai") == null ? "" : rs
                    .getString("TrangThai");
            return new MonHoc(maMHo, teno, soTCo, loaiMHo, trangThaio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(ten);
        addValue(soTC);
        addValue(loaiMH);
        addValue(trangThai);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaMH", maMH);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("Ten", ten);
        addValue("SoTC", soTC);
        addValue("LoaiMH", loaiMH);
        addValue("TrangThai", trangThai);
        return toStringArgs();
    }

}