package model.bean;

import java.sql.*;
import java.util.*;

public class GopY extends BaseBean {
    private String maGY;
    private String maND;
    private String tieuDe;
    private String noiDung;
    private String thoiGian;
    private NguoiDung nguoiDung;

    public String getMaGY() {
        return maGY;
    }

    public void setMaGY(String maGY) {
        this.maGY = maGY;
    }

    public String getMaND() {
        return maND;
    }

    public void setMaND(String maND) {
        this.maND = maND;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getThoiGian() {
        return thoiGian;
    }

    public void setThoiGian(String thoiGian) {
        this.thoiGian = thoiGian;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public GopY() {
    }

    public GopY(String maND, String tieuDe, String noiDung, String thoiGian) {
        this.maND = maND;
        this.tieuDe = tieuDe;
        this.noiDung = noiDung;
        this.thoiGian = thoiGian;
    }

    public GopY(String maGY, String maND, String tieuDe, String noiDung,
            String thoiGian) {
        this.maGY = maGY;
        this.maND = maND;
        this.tieuDe = tieuDe;
        this.noiDung = noiDung;
        this.thoiGian = thoiGian;
    }

    @SuppressWarnings("unchecked")
    public GopY convert(ResultSet rs) {
        try {
            String maGYo = rs.getString("MaGY") == null ? "" : rs
                    .getString("MaGY");
            String maNDo = rs.getString("MaND") == null ? "" : rs
                    .getString("MaND");
            String tieuDeo = rs.getString("TieuDe") == null ? "" : rs
                    .getString("TieuDe");
            String noiDungo = rs.getString("NoiDung") == null ? "" : rs
                    .getString("NoiDung");
            String thoiGiano = rs.getString("ThoiGian") == null ? "" : rs
                    .getString("ThoiGian");
            return new GopY(maGYo, maNDo, tieuDeo, noiDungo, thoiGiano);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maND);
        addValue(tieuDe);
        addValue(noiDung);
        addValue(thoiGian);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaGY", maGY);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaND", maND);
        addValue("TieuDe", tieuDe);
        addValue("NoiDung", noiDung);
        addValue("ThoiGian", thoiGian);
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

}