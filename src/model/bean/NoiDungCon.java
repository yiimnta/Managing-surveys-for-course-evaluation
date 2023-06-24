package model.bean;

import java.sql.*;
import java.util.*;

public class NoiDungCon extends BaseBean {
    private String maNDC;
    private String maCT;
    private String tieuDe;
    private String viTri;
    private int soBinhChon = 0;
    private ChiTietNoiDung chiTietNoiDung;

    public String getMaNDC() {
        return maNDC;
    }

    public void setMaNDC(String maNDC) {
        this.maNDC = maNDC;
    }

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }

    public ChiTietNoiDung getChiTietNoiDung() {
        return chiTietNoiDung;
    }

    public void setChiTietNoiDung(ChiTietNoiDung chiTietNoiDung) {
        this.chiTietNoiDung = chiTietNoiDung;
    }

    public NoiDungCon() {
    }

    public NoiDungCon(String maCT, String tieuDe, String viTri) {
        this.maCT = maCT;
        this.tieuDe = tieuDe;
        this.viTri = viTri;
    }

    public NoiDungCon(String maNDC, String maCT, String tieuDe, String viTri) {
        this.maNDC = maNDC;
        this.maCT = maCT;
        this.tieuDe = tieuDe;
        this.viTri = viTri;
    }

    @SuppressWarnings("unchecked")
    public NoiDungCon convert(ResultSet rs) {
        try {
            String maNDCo = rs.getString("MaNDC") == null ? "" : rs
                    .getString("MaNDC");
            String maCTo = rs.getString("MaCT") == null ? "" : rs
                    .getString("MaCT");
            String tieuDeo = rs.getString("TieuDe") == null ? "" : rs
                    .getString("TieuDe");
            String viTrio = rs.getString("ViTri") == null ? "" : rs
                    .getString("ViTri");
            return new NoiDungCon(maNDCo, maCTo, tieuDeo, viTrio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maCT);
        addValue(tieuDe);
        addValue(viTri);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaNDC", maNDC);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaCT", maCT);
        addValue("TieuDe", tieuDe);
        addValue("ViTri", viTri);
        return toStringArgs();
    }

    public void includeChiTietNoiDung(ArrayList<ChiTietNoiDung> chiTietNoiDungl) {
        for (ChiTietNoiDung ob : chiTietNoiDungl) {
            if (getMaCT().equals(ob.getMaCT())) {
                setChiTietNoiDung(ob);
                break;
            }
        }
    }

    public int getSoBinhChon() {
        return soBinhChon;
    }

    public void setSoBinhChon(int soBinhChon) {
        this.soBinhChon = soBinhChon;
    }

}