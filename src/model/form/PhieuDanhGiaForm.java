package model.form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import model.bean.*;
import model.bo.BO;

import org.apache.struts.action.*;

import Parse.ParseValue;

@SuppressWarnings("serial")
public class PhieuDanhGiaForm extends ActionForm {
    private String maDG;
    private String tieuDe;
    private String maGD;
    private String thoiGianDang;
    private String trangThai;
    private String loaiP="";
    private String maKhoa;
    private String maGV;
    private ArrayList<GiangDay> listGiangDay;
    private ArrayList<GiangVien> listGiangVien;
    private ArrayList<Khoa> listKhoa;
    private ArrayList<LoaiPhieu> listLoaiPhieu;
    private String maCopy ="";
    private String nienKhoa="";
    private String namT="";
    private String namS="";
    private String hocKy="";
    
    private String submit="";

    public String getNienKhoa() {
            return nienKhoa;
    }
    
    public String getNienKhoaSub() {
            return namT +"-"+ namS;
    }

    public void setNienKhoa(String nienKhoa) {
        this.nienKhoa = nienKhoa;
    }
    
    public String getNamT() {
        return namT;
    }

    public void setNamT(String namT) {
        this.namT = namT;
    }

    public String getNamS() {
        return namS;
    }

    public void setNamS(String namS) {
        this.namS = namS;
    }
    
    public String getHocKy() {
        return hocKy;
    }

    public void setHocKy(String hocKy) {
        this.hocKy = hocKy;
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

    public String getMaGD() {
        return maGD;
    }

    public void setMaGD(String maGD) {
        this.maGD = maGD;
    }

    public String getThoiGianDang() {
        return thoiGianDang;
    }

    public void setThoiGianDang(String thoiGianDang) {
        this.thoiGianDang = thoiGianDang;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
    public String getLoaiP() {
        return loaiP;
    }

    public void setLoaiP(String loaiP) {
        this.loaiP = loaiP;
    }

    public ArrayList<GiangVien> getListGiangVien() {
        return listGiangVien;
    }

    public void setListGiangVien(ArrayList<GiangVien> listGiangVien) {
        this.listGiangVien = listGiangVien;
    }

    public ArrayList<Khoa> getListKhoa() {
        return listKhoa;
    }

    public void setListKhoa(ArrayList<Khoa> listKhoa) {
        this.listKhoa = listKhoa;
    }

    public ArrayList<LoaiPhieu> getListLoaiPhieu() {
        return listLoaiPhieu;
    }

    public void setListLoaiPhieu(ArrayList<LoaiPhieu> listLoaiPhieu) {
        this.listLoaiPhieu = listLoaiPhieu;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }
    
    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }
    
    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public void setListGiangDay(ArrayList<GiangDay> listGiangDay) {
        this.listGiangDay = listGiangDay;
    }

    public ArrayList<GiangDay> getListGiangDay() {
        return listGiangDay;
    }

    @Override
    public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (!"".equals(submit)) {
             ParseValue parse = new ParseValue();
             int tn = 1;
             
             if (parse.checkEmpty(loaiP)) {
                 errors.add("loaiP", new ActionMessage("error.Select",
                          "Loại phiếu","Phiếu đánh giá"));
                 tn=0;
             }
             
             
            if (parse.checkEmpty(tieuDe)) {
                errors.add("tieuDe", new ActionMessage("error.Empty",
                         "Tiêu đề"));
                tn=0;
            }
            
            if(submit.contains("GD")){
                if (parse.checkEmpty(maGD)) {
                    errors.add("maGD", new ActionMessage("error.Select",
                            "1 Môn học", "Môn học"));
                    tn=0;
                }
                
                if (parse.checkEmpty(hocKy)) {
                    errors.add("hocKy", new ActionMessage("error.Select",
                            "ít nhất 1 Học kỳ", "Giảng dạy"));
                    tn=0;
                }
                
                if (parse.checkEmpty(namS) || parse.checkEmpty(namT)) {
                    errors.add("nienKhoa", new ActionMessage("error.Empty",
                            "Năm niên khóa"));
                    tn=0;
                }else {
                    int namt = Integer.valueOf(namT);
                    int nams = Integer.valueOf(namS);
                    if(namt > nams){
                        errors.add("nienKhoa", new ActionMessage("error.truocSau",
                                "Năm sau", "Năm trước"));
                        tn=0;
                    }
                }
            }
            
            if(submit.contains("GV")){
                if (parse.checkEmpty(maGV)) {
                    errors.add("maGV", new ActionMessage("error.Select",
                            "1 Giảng viên", "Giảng viên"));
                    tn=0;
                }
            }
            
            if(submit.contains("KH")){
                if (parse.checkEmpty(maKhoa)) {
                    errors.add("maKhoa", new ActionMessage("error.Select",
                            "1 Khóa học", "Khóa học"));
                    tn=0;
                }
            }
            
            
            if(tn==1){
                if(submit.contains("aaa") == false) {
                    if (parse.checkExist("PhieuDanhGia","TieuDe" ,tieuDe )){
                        errors.add("tieuDe", new ActionMessage("error.Exist",
                                "Tiêu đề này"));
                    } 
                }else {
                    if (parse.checkExist("PhieuDanhGia","MaDG !='"+maDG+"' and TieuDe", tieuDe)){
                        errors.add("tieuDe", new ActionMessage("error.Exist",
                            "Tiêu đề này"));
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
        
        maGD = "";
        thoiGianDang = "";
        tieuDe = "";
        submit = "";
        maGV = "";
        maKhoa = "";
        loaiP = "";
        nienKhoa ="";
        namT = "";
        namS = "";
        hocKy = "";
        
        BO bo = new BO();
        ArrayList<GiangVien> gvl = bo.giangVien.getList();
        ArrayList<MonHoc> mhl = bo.monHoc.getList();
        ArrayList<Lop> lopl = bo.lop.getList();
        ArrayList<GiangDay> gdl = bo.giangDay.getList();

        for (GiangDay gd : gdl) {
            gd.includeGiangVien(gvl);
            gd.includeLop(lopl);
            gd.includeMonHoc(mhl);
        }

        setListGiangVien(gvl);
        setListGiangDay(gdl);
        setListKhoa(bo.khoa.getList());
        setListLoaiPhieu(bo.loaiPhieu.getList());
        
        super.reset(mapping, request);
    }

    public String getMaCopy() {
        return maCopy;
    }

    public void setMaCopy(String maCopy) {
        this.maCopy = maCopy;
    }

}
