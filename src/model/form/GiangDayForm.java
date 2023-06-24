package model.form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import model.bean.*;
import model.bo.BO;

import org.apache.struts.action.*;

import Parse.ParseValue;

@SuppressWarnings("serial")
public class GiangDayForm extends ActionForm {
    private String id;
    private String maGV;
    private String maMH;
    private String maLop;
    private String trangThai="";
    private ArrayList<MonHoc> listMonHoc;
    private ArrayList<GiangVien> listGiangVien;
    private ArrayList<Lop> listLop;
    private String submit = "";
    private GiangDay old = new GiangDay();

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getMaMH() {
        return maMH;
    }

    public void setMaMH(String maMH) {
        this.maMH = maMH;
    }

    public String getMaLop() {
        return maLop;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ArrayList<MonHoc> getListMonHoc() {
        return listMonHoc;
    }

    public void setListMonHoc(ArrayList<MonHoc> listMonHoc) {
        this.listMonHoc = listMonHoc;
    }

    public ArrayList<GiangVien> getListGiangVien() {
        return listGiangVien;
    }

    public void setListGiangVien(ArrayList<GiangVien> listGiangVien) {
        this.listGiangVien = listGiangVien;
    }

    public ArrayList<Lop> getListLop() {
        return listLop;
    }

    public void setListLop(ArrayList<Lop> listLop) {
        this.listLop = listLop;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }
    
    public GiangDay getOld() {
        return old;
    }

    public void setOld(GiangDay old) {
        this.old = old;
    }
    
    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (!"".equals(submit)) {
             ParseValue parse = new ParseValue();
             int tn = 1;

            if (parse.checkEmpty(maMH)) {
                errors.add("maMH", new ActionMessage("error.Select",
                        "ít nhất 1 Môn học", "Giảng dạy"));
                tn=0;
            }
            
            if (parse.checkEmpty(maLop)) {
                errors.add("maLop", new ActionMessage("error.Select",
                        "ít nhất 1 Lớp học", "Giảng dạy"));
                tn=0;
            }
            
            if (parse.checkEmpty(maGV)) {
                errors.add("maGV", new ActionMessage("error.Select",
                        "ít nhất 1 Giảng viên", "Giảng dạy"));
                tn=0;
            }
            
            if(tn==1){
                String condition = "maGV = '" + getMaGV() + "'"
                         + " and maMH = '" + getMaMH() + "'"
                        + " and maLop";
                
                if(!"aaa".equals(submit)) {
                    if (parse.checkExist("GiangDay",condition , getMaLop())){
                        errors.add("exist", new ActionMessage("error.Exist",
                            "Giảng dạy này"));
                    } 
                }else {
                    condition="MaGD !='"+id+"' and "+condition;
                    
                    if (parse.checkExist("GiangDay",condition , getMaLop())){
                        errors.add("exist", new ActionMessage("error.Exist",
                            "Giảng dạy này"));
                    } 
                }
            }
        }
        return errors;
    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        maGV = "";
        maLop = "";
        maMH = "";
        submit = "";
        trangThai="";
        
        BO bo = new BO();
        setListLop(bo.lop.getList());
        setListGiangVien(bo.giangVien.getList());
        setListMonHoc(bo.monHoc.getList());
        super.reset(mapping, request);
    }

}
