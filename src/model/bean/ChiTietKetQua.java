package model.bean;

import java.sql.*;
import java.util.*;

public class ChiTietKetQua extends BaseBean {
    private String maCTKQ;
    private String maKQ;
    private String maCT;
    private String ketQuaDG;
    private ChiTietNoiDung chiTietNoiDung;
    private KetQua ketQua;

    public String getMaCTKQ() {
        return maCTKQ;
    }

    public void setMaCTKQ(String maCTKQ) {
        this.maCTKQ = maCTKQ;
    }

    public String getMaKQ() {
        return maKQ;
    }

    public void setMaKQ(String maKQ) {
        this.maKQ = maKQ;
    }

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public String getKetQuaDG() {
        return ketQuaDG;
    }

    public void setKetQuaDG(String ketQuaDG) {
        this.ketQuaDG = ketQuaDG;
    }

    public ChiTietNoiDung getChiTietNoiDung() {
        return chiTietNoiDung;
    }

    public void setChiTietNoiDung(ChiTietNoiDung chiTietNoiDung) {
        this.chiTietNoiDung = chiTietNoiDung;
    }

    public KetQua getKetQua() {
        return ketQua;
    }

    public void setKetQua(KetQua ketQua) {
        this.ketQua = ketQua;
    }

    public ChiTietKetQua() {
    }

    public ChiTietKetQua(String maKQ, String maCT, String ketQuaDG) {
        this.maKQ = maKQ;
        this.maCT = maCT;
        this.ketQuaDG = ketQuaDG;
    }

    public ChiTietKetQua(String maCTKQ, String maKQ, String maCT,
            String ketQuaDG) {
        this.maCTKQ = maCTKQ;
        this.maKQ = maKQ;
        this.maCT = maCT;
        this.ketQuaDG = ketQuaDG;
    }
    
    @SuppressWarnings("unchecked")
    public ChiTietKetQua convert(ResultSet rs) {
        try {
            String maCTKQo = rs.getString("MaCTKQ") == null ? "" : rs
                    .getString("MaCTKQ");
            String maKQo = rs.getString("MaKQ") == null ? "" : rs
                    .getString("MaKQ");
            String maCTo = rs.getString("MaCT") == null ? "" : rs
                    .getString("MaCT");
            String ketQuaDGo = rs.getString("KetQuaDG") == null ? "" : rs
                    .getString("KetQuaDG");
            return new ChiTietKetQua(maCTKQo, maKQo, maCTo, ketQuaDGo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maKQ);
        addValue(maCT);
        addValue(ketQuaDG);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaCTKQ", maCTKQ);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaKQ", maKQ);
        addValue("MaCT", maCT);
        addValue("KetQuaDG", ketQuaDG);
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

    public void includeKetQua(ArrayList<KetQua> ketQual) {
        for (KetQua ob : ketQual) {
            if (getMaKQ().equals(ob.getMaKQ())) {
                setKetQua(ob);
                break;
            }
        }
    }

}