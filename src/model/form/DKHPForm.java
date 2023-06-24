package model.form;

import java.util.ArrayList;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DKHPForm extends ActionForm {
    private String tenLop = "";
    private String maLop = "";
    private ArrayList<Lop> dsLop = new ArrayList<Lop>();
    private ArrayList<GiangDay> dsGiangDay = new ArrayList<GiangDay>();
    private String submit = "";
    public ArrayList<Lop> getDsLop() {
        return dsLop;
    }
    public void setDsLop(ArrayList<Lop> dsLop) {
        this.dsLop = dsLop;
    }
    public ArrayList<GiangDay> getDsGiangDay() {
        return dsGiangDay;
    }
    public void setDsGiangDay(ArrayList<GiangDay> dsGiangDay) {
        this.dsGiangDay = dsGiangDay;
    }
    public String getMaLop() {
        return maLop;
    }
    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }
    public String getTenLop() {
        return tenLop;
    }
    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }
    public String getSubmit() {
        return submit;
    }
    public void setSubmit(String submit) {
        this.submit = submit;
    }
}
