package model.bean;

import java.sql.*;
import java.util.*;

public class NoiDung extends BaseBean {
    private String maNDu;
    private String maDG;
    private String tieuDe;
    private String viTri;
    private PhieuDanhGia phieuDanhGia;
    private ArrayList<ChiTietNoiDung> listChiTietNoiDung = new ArrayList<ChiTietNoiDung>();

    public String getMaNDu() {
        return maNDu;
    }

    public void setMaNDu(String maNDu) {
        this.maNDu = maNDu;
    }

    public String getMaDG() {
        return maDG;
    }

    public void setMaDG(String maDG) {
        this.maDG = maDG;
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

    public PhieuDanhGia getPhieuDanhGia() {
        return phieuDanhGia;
    }

    public void setPhieuDanhGia(PhieuDanhGia phieuDanhGia) {
        this.phieuDanhGia = phieuDanhGia;
    }

    public ArrayList<ChiTietNoiDung> getListChiTietNoiDung() {
        return listChiTietNoiDung;
    }

    public void setListChiTietNoiDung(
            ArrayList<ChiTietNoiDung> listChiTietNoiDung) {
        this.listChiTietNoiDung = listChiTietNoiDung;
    }

    public NoiDung() {
    }

    public NoiDung(String maDG, String tieuDe, String viTri) {
        this.maDG = maDG;
        this.tieuDe = tieuDe;
        this.viTri = viTri;
    }

    public NoiDung(String maNDu, String maDG, String tieuDe, String viTri) {
        this.maNDu = maNDu;
        this.maDG = maDG;
        this.tieuDe = tieuDe;
        this.viTri = viTri;
    }

    @SuppressWarnings("unchecked")
    public NoiDung convert(ResultSet rs) {
        try {
            String maNDuo = rs.getString("MaNDu") == null ? "" : rs
                    .getString("MaNDu");
            String maDGo = rs.getString("MaDG") == null ? "" : rs
                    .getString("MaDG");
            String tieuDeo = rs.getString("TieuDe") == null ? "" : rs
                    .getString("TieuDe");
            String viTrio = rs.getString("ViTri") == null ? "" : rs
                    .getString("ViTri");
            return new NoiDung(maNDuo, maDGo, tieuDeo, viTrio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maDG);
        addValue(tieuDe);
        addValue(viTri);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaNDu", maNDu);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaDG", maDG);
        addValue("TieuDe", tieuDe);
        addValue("ViTri", viTri);
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

    public void includeChiTietNoiDung(ArrayList<ChiTietNoiDung> chiTietNoiDungl) {
        for (ChiTietNoiDung ob : chiTietNoiDungl) {
            if (getMaNDu().equals(ob.getMaNDu())) {
                getListChiTietNoiDung().add(ob);
            }
        }
        SapXepChiTietNoiDung();
    }
    
    private void SapXepChiTietNoiDung(){
        for(int i = 0; i < listChiTietNoiDung.size() ; i++){
            for(int j = 0; j < listChiTietNoiDung.size() ; j++){
                if(Integer.valueOf(listChiTietNoiDung.get(i).getViTri()) < Integer.valueOf(listChiTietNoiDung.get(j).getViTri())){
                    ChiTietNoiDung tam = listChiTietNoiDung.get(i);
                    listChiTietNoiDung.set(i, listChiTietNoiDung.get(j));
                    listChiTietNoiDung.set(j, tam);
                }
            }
        }
    }

}