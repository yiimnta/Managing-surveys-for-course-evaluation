package model.bean;

import java.sql.*;
import java.util.*;

public class DangKyHocPhan extends BaseBean {
    private String maDK;
    private String maND;
    private NguoiDung nguoiDung;
    private ArrayList<ChiTietDKHP> listChiTietDKHP = new ArrayList<ChiTietDKHP>();

    public String getMaDK() {
        return maDK;
    }

    public void setMaDK(String maDK) {
        this.maDK = maDK;
    }

    public String getMaND() {
        return maND;
    }

    public void setMaND(String maND) {
        this.maND = maND;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public ArrayList<ChiTietDKHP> getListChiTietDKHP() {
        return listChiTietDKHP;
    }

    public void setListChiTietDKHP(ArrayList<ChiTietDKHP> listChiTietDKHP) {
        this.listChiTietDKHP = listChiTietDKHP;
    }

    public DangKyHocPhan() {
    }

    public DangKyHocPhan(String maND) {
        this.maND = maND;
    }

    public DangKyHocPhan(String maDK, String maND) {
        this.maDK = maDK;
        this.maND = maND;
    }

    @SuppressWarnings("unchecked")
    public DangKyHocPhan convert(ResultSet rs) {
        try {
            String maDKo = rs.getString("MaDK") == null ? "" : rs
                    .getString("MaDK");
            String maNDo = rs.getString("MaND") == null ? "" : rs
                    .getString("MaND");
            return new DangKyHocPhan(maDKo, maNDo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maND);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaDK", maDK);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaND", maND);
        return toStringArgs();
    }

    public void includeNguoiDung(ArrayList<NguoiDung> nguoiDungl) {
        for (NguoiDung ob : nguoiDungl) {
            if (getMaND().equals(ob.getMaND())) {
                setNguoiDung(ob);
                break;
            }
        }
    }

    public void includeChiTietDKHP(ArrayList<ChiTietDKHP> chiTietDKHPl) {
        for (ChiTietDKHP ob : chiTietDKHPl) {
            if (getMaDK().equals(ob.getMaDK())) {
                getListChiTietDKHP().add(ob);
            }
        }
    }

}