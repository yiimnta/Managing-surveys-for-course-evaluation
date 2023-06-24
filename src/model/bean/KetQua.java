package model.bean;

import java.sql.*;
import java.util.*;

public class KetQua extends BaseBean {
    private String maKQ;
    private String maDG;
    private String maND;
    private String thoiGian;
    private PhieuDanhGia phieuDanhGia;
    private NguoiDung nguoiDung;
    private ArrayList<ChiTietKetQua> listChiTietKetQua = new ArrayList<ChiTietKetQua>();

    public String getMaKQ() {
        return maKQ;
    }

    public void setMaKQ(String maKQ) {
        this.maKQ = maKQ;
    }

    public String getMaDG() {
        return maDG;
    }

    public void setMaDG(String maDG) {
        this.maDG = maDG;
    }

    public String getMaND() {
        return maND;
    }

    public void setMaND(String maND) {
        this.maND = maND;
    }

    public String getThoiGian() {
        return thoiGian;
    }

    public void setThoiGian(String thoiGian) {
        this.thoiGian = thoiGian;
    }

    public PhieuDanhGia getPhieuDanhGia() {
        return phieuDanhGia;
    }

    public void setPhieuDanhGia(PhieuDanhGia phieuDanhGia) {
        this.phieuDanhGia = phieuDanhGia;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public ArrayList<ChiTietKetQua> getListChiTietKetQua() {
        return listChiTietKetQua;
    }

    public void setListChiTietKetQua(ArrayList<ChiTietKetQua> listChiTietKetQua) {
        this.listChiTietKetQua = listChiTietKetQua;
    }

    public KetQua() {
    }

    public KetQua(String maDG, String maND, String thoiGian) {
        this.maDG = maDG;
        this.maND = maND;
        this.thoiGian = thoiGian;
    }

    public KetQua(String maKQ, String maDG, String maND, String thoiGian) {
        this.maKQ = maKQ;
        this.maDG = maDG;
        this.maND = maND;
        this.thoiGian = thoiGian;
    }

    @SuppressWarnings("unchecked")
    public KetQua convert(ResultSet rs) {
        try {
            String maKQo = rs.getString("MaKQ") == null ? "" : rs
                    .getString("MaKQ");
            String maDGo = rs.getString("MaDG") == null ? "" : rs
                    .getString("MaDG");
            String maNDo = rs.getString("MaND") == null ? "" : rs
                    .getString("MaND");
            String thoiGiano = rs.getString("ThoiGian") == null ? "" : rs
                    .getString("ThoiGian");
            return new KetQua(maKQo, maDGo, maNDo, thoiGiano);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maDG);
        addValue(maND);
        addValue(thoiGian);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaKQ", maKQ);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaDG", maDG);
        addValue("MaND", maND);
        addValue("ThoiGian", thoiGian);
        return toStringArgs();
    }

    public void includePhieuDanhGia(ArrayList<PhieuDanhGia> phieuDanhGial) {
        for (PhieuDanhGia ob : phieuDanhGial) {
            if (getMaDG().equals(ob.getMaDG())) {
                setPhieuDanhGia(ob);
                break;
            }
        }
    }

    public void includeNguoiDung(ArrayList<NguoiDung> nguoiDungl) {
        for (NguoiDung ob : nguoiDungl) {
            if (getMaND().equals(ob.getMaND())) {
                setNguoiDung(ob);
                break;
            }
        }
    }

    public void includeChiTietKetQua(ArrayList<ChiTietKetQua> chiTietKetQual) {
        for (ChiTietKetQua ob : chiTietKetQual) {
            if (getMaKQ().equals(ob.getMaKQ())) {
                getListChiTietKetQua().add(ob);
            }
        }
    }

}