package model.bean;

import java.sql.*;
import java.util.*;

public class ChiTietNoiDung extends BaseBean {
    private String maCT;
    private String maNDu;
    private String moTa;
    private String loaiCT;
    private String viTri;
    private NoiDung noiDung;
    private int slNDC;
    private ArrayList<ChiTietKetQua> listChiTietKetQua = new ArrayList<ChiTietKetQua>();
    private ArrayList<NoiDungCon> listNoiDungCon = new ArrayList<NoiDungCon>();

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public String getMaNDu() {
        return maNDu;
    }

    public void setMaNDu(String maNDu) {
        this.maNDu = maNDu;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getLoaiCT() {
        return loaiCT;
    }

    public void setLoaiCT(String loaiCT) {
        this.loaiCT = loaiCT;
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }

    public NoiDung getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(NoiDung noiDung) {
        this.noiDung = noiDung;
    }

    public ArrayList<ChiTietKetQua> getListChiTietKetQua() {
        return listChiTietKetQua;
    }

    public void setListChiTietKetQua(ArrayList<ChiTietKetQua> listChiTietKetQua) {
        this.listChiTietKetQua = listChiTietKetQua;
    }

    public ArrayList<NoiDungCon> getListNoiDungCon() {
        return listNoiDungCon;
    }

    public void setListNoiDungCon(ArrayList<NoiDungCon> listNoiDungCon) {
        this.listNoiDungCon = listNoiDungCon;
    }

    public ChiTietNoiDung() {
    }

    public ChiTietNoiDung(String maNDu, String moTa, String loaiCT, String viTri) {
        this.maNDu = maNDu;
        this.moTa = moTa;
        this.loaiCT = loaiCT;
        this.viTri = viTri;
    }

    public ChiTietNoiDung(String maCT, String maNDu, String moTa,
            String loaiCT, String viTri) {
        this.maCT = maCT;
        this.maNDu = maNDu;
        this.moTa = moTa;
        this.loaiCT = loaiCT;
        this.viTri = viTri;
    }

    @SuppressWarnings("unchecked")
    public ChiTietNoiDung convert(ResultSet rs) {
        try {
            String maCTo = rs.getString("MaCT") == null ? "" : rs
                    .getString("MaCT");
            String maNDuo = rs.getString("MaNDu") == null ? "" : rs
                    .getString("MaNDu");
            String moTao = rs.getString("MoTa") == null ? "" : rs
                    .getString("MoTa");
            String loaiCTo = rs.getString("LoaiCT") == null ? "" : rs
                    .getString("LoaiCT");
            String viTrio = rs.getString("ViTri") == null ? "" : rs
                    .getString("ViTri");
            return new ChiTietNoiDung(maCTo, maNDuo, moTao, loaiCTo, viTrio);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(maNDu);
        addValue(moTa);
        addValue(loaiCT);
        addValue(viTri);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaCT", maCT);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("MaNDu", maNDu);
        addValue("MoTa", moTa);
        addValue("LoaiCT", loaiCT);
        addValue("ViTri", viTri);
        return toStringArgs();
    }

    public void includeNoiDung(ArrayList<NoiDung> noiDungl) {
        for (NoiDung ob : noiDungl) {
            if (getMaNDu().equals(ob.getMaNDu())) {
                setNoiDung(ob);
                break;
            }
        }
    }

    public void includeChiTietKetQua(ArrayList<ChiTietKetQua> chiTietKetQual) {
        for (ChiTietKetQua ob : chiTietKetQual) {
            if (getMaCT().equals(ob.getMaCT())) {
                getListChiTietKetQua().add(ob);
            }
        }
    }

    public void includeNoiDungCon(ArrayList<NoiDungCon> noiDungConl) {
        for (NoiDungCon ob : noiDungConl) {
            if (getMaCT().equals(ob.getMaCT())) {
                getListNoiDungCon().add(ob);
            }
        }
        SapXepNoiDungCon();
    }

    private void SapXepNoiDungCon(){
    for(int i = 0; i < listNoiDungCon.size() ; i++){
        for(int j = 0; j < listNoiDungCon.size() ; j++){
            if(Integer.valueOf(listNoiDungCon.get(i).getViTri()) < Integer.valueOf(listNoiDungCon.get(j).getViTri())){
                NoiDungCon tam = listNoiDungCon.get(i);
                listNoiDungCon.set(i, listNoiDungCon.get(j));
                listNoiDungCon.set(j, tam);
            }
        }
    }
}

    public int getSlNDC() {
        return slNDC;
    }

    public void setSlNDC(int slNDC) {
        this.slNDC = listNoiDungCon.size();
    }
}
