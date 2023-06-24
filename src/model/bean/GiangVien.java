package model.bean;

import java.sql.*;
import java.util.*;

public class GiangVien extends BaseBean {
    private String maGV;
    private String hoTen;
    private String maDD;
    private ArrayList<GiangDay> listGiangDay = new ArrayList<GiangDay>();

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getMaDD() {
        return maDD;
    }

    public void setMaDD(String maDD) {
        this.maDD = maDD;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public ArrayList<GiangDay> getListGiangDay() {
        return listGiangDay;
    }

    public void setListGiangDay(ArrayList<GiangDay> listGiangDay) {
        this.listGiangDay = listGiangDay;
    }

    public GiangVien() {
    }

    public GiangVien(String maDD,String hoTen) {
        this.hoTen = hoTen;
        this.maDD = maDD;
    }

    public GiangVien(String maGV, String maDDo, String hoTen) {
        this.maGV = maGV;
        this.hoTen = hoTen;
        this.maDD = maDDo;
    }

    @SuppressWarnings("unchecked")
    public GiangVien convert(ResultSet rs) {
        try {
            String maGVo = rs.getString("MaGV") == null ? "" : rs
                    .getString("MaGV");
            String hoTeno = rs.getString("HoTen") == null ? "" : rs
                    .getString("HoTen");
            String maDDo = rs.getString("MaDD") == null ? "" : rs
                    .getString("MaDD");
            return new GiangVien(maGVo, maDDo, hoTeno);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(hoTen);
        addValue(maDD);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaGV", maGV);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("HoTen", hoTen);
        addValue("MaDD", maDD);
        return toStringArgs();
    }

    public void includeGiangDay(ArrayList<GiangDay> giangDayl) {
        for (GiangDay ob : giangDayl) {
            if (getMaGV().equals(ob.getMaGV())) {
                getListGiangDay().add(ob);
            }
        }
    }
    
    public void includeGiangDayDistinct(ArrayList<GiangDay> giangDayl) {
        for (GiangDay ob : giangDayl) {
            if (getMaGV().equals(ob.getMaGV()) && !testExist(ob, getListGiangDay())) {
                getListGiangDay().add(ob);
            }
        }
    }
    
    private boolean testExist(GiangDay gd, ArrayList<GiangDay> giangDayl){
        for(GiangDay ob: giangDayl){
            if (gd.getMaGV().equals(ob.getMaGV()) && gd.getMaMH().equals(ob.getMaMH())) {
                return true;
            }
        }
        return false;
    }


}