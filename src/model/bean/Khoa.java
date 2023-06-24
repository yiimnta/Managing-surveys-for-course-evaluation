package model.bean;

import java.sql.*;
import java.util.*;

public class Khoa extends BaseBean {
    private String maKhoa;
    private String tenKhoa;
    private ArrayList<Lop> listLop =  new ArrayList<Lop>();

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }

    public String getTenKhoa() {
        return tenKhoa;
    }

    public void setTenKhoa(String tenKhoa) {
        this.tenKhoa = tenKhoa;
    }

    public ArrayList<Lop> getListLop() {
        return listLop;
    }

    public void setListLop(ArrayList<Lop> listLop) {
        this.listLop = listLop;
    }

    public Khoa() {
    }

    public Khoa(String tenKhoa) {
        this.tenKhoa = tenKhoa;
    }

    public Khoa(String maKhoa, String tenKhoa) {
        this.maKhoa = maKhoa;
        this.tenKhoa = tenKhoa;
    }

    @SuppressWarnings("unchecked")
    public Khoa convert(ResultSet rs) {
        try {
            String maKhoao = rs.getString("MaKhoa") == null ? "" : rs
                    .getString("MaKhoa");
            String tenKhoao = rs.getString("TenKhoa") == null ? "" : rs
                    .getString("TenKhoa");
            return new Khoa(maKhoao, tenKhoao);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(tenKhoa);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaKhoa", maKhoa);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("TenKhoa", tenKhoa);
        return toStringArgs();
    }

    public void includeLop(ArrayList<Lop> lopl) {
        for (Lop ob : lopl) {
            if (getMaKhoa().equals(ob.getMaKhoa())) {
                getListLop().add(ob);
            }
        }
    }

}