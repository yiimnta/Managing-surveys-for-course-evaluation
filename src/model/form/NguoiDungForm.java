package model.form;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import model.bean.*;
import model.bo.BO;

import org.apache.struts.action.*;

import Parse.ParseValue;

@SuppressWarnings("serial")
public class NguoiDungForm extends ActionForm {
    private String maND;
    private String hoTen;
    private String diaChi;
    private String ngaySinh;
    private String email;
    private String sdt;
    private String maDN;
    private String matKhau;
    private String maLop;
    private String trangThai;
    private String loaiND;
    private String submit = "";
    private String nhapLaiMK;
    private ArrayList<Lop> dsLop = new ArrayList<Lop>();
    
    public String getMaND() {
        return maND;
    }

    public void setMaND(String maND) {
        this.maND = maND;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getMaDN() {
        return maDN;
    }

    public void setMaDN(String maDN) {
        this.maDN = maDN;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getMaLop() {
        return maLop;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getLoaiND() {
        return loaiND;
    }

    public void setLoaiND(String loaiND) {
        this.loaiND = loaiND;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }
    public String getNhapLaiMK() {
        return nhapLaiMK;
    }

    public void setNhapLaiMK(String nhapLaiMK) {
        this.nhapLaiMK = nhapLaiMK;
    }

    public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors actionErrors = new ActionErrors();
        if (!"".equals(submit)) {
            ParseValue parse = new ParseValue();
            System.out.println(submit);
            if("aaainfo".equals(submit)){
                maND = ((NguoiDung)request.getSession().getAttribute("userLogin")).getMaND();
            }
            if(!submit.contains("aaa")){
                // check user
                if (parse.checkEmpty(maDN)) {
                    actionErrors.add("maDN", new ActionMessage("error.Empty",
                            "Tài khoản"));
                } else if (maDN.trim().split(" ").length > 1) {
                    actionErrors.add("maDN", new ActionMessage("error.space",
                            "Tài khoản"));
                } else if (parse.checkNotSpecialChar(maDN)  == false) {
                    actionErrors.add("maDN", new ActionMessage(
                            "error.specialchar", "Tài Khoản"));
                } else if (parse.checkExist("NguoiDung", "maDN", maDN)) {
                    actionErrors.add("maDN", new ActionMessage("error.Exist",
                            "Tài khoản"));
                }  else if (!parse.checkLength(maDN,6, 50)) {
                    actionErrors.add("maDN", new ActionMessage("error.LengthFormat",
                            "Tài khoản", 6, 50));
                }
    
                // check password
                if (parse.checkEmpty(matKhau)) {
                    actionErrors.add("matKhau", new ActionMessage("error.Empty",
                            "Mật khẩu"));
                } else if (parse.checkNotSpecialChar(matKhau)  == false) {
                    actionErrors.add("matKhau", new ActionMessage(
                            "error.specialchar", "Mật khẩu"));
                } else if (!parse.checkLength(matKhau,6, 50)) {
                    actionErrors.add("matKhau", new ActionMessage("error.LengthFormat",
                            "Mật khẩu", 6, 50));
                }
    
                // check confirm password
                if (parse.checkEmpty(nhapLaiMK)) {
                    actionErrors.add("nhapLaiMK", new ActionMessage(
                            "error.Empty", "Xác nhận Mật khẩu"));
                } else {
                    if (!nhapLaiMK.equals(matKhau)) {
                        actionErrors.add("nhapLaiMK", new ActionMessage(
                                "error.Correct", "Xác nhận Mật khẩu"));
                    }
                }
            }

            // check hoTen
            if (parse.checkEmpty(hoTen)) {
                actionErrors.add("hoTen", new ActionMessage("error.Empty",
                        "Họ tên"));
            } else if (!parse.checkLength(hoTen, 50)) {
                actionErrors.add("hoTen", new ActionMessage("error.length",
                        "Họ tên", 50));
            } else if (!parse.checkVN(hoTen)) {
                actionErrors.add("hoTen", new ActionMessage("error.Format",
                        "Họ tên", ""));
            }

            // check email
            if (parse.checkEmpty(email)) {
                actionErrors.add("email", new ActionMessage("error.Empty",
                        "Email"));
            } else if (!parse.checkEmail(email)) {
                actionErrors.add("email", new ActionMessage("error.Format",
                        "Email", "Email"));
            } else if (parse.checkExist("NguoiDung", "Email", email) && !submit.contains("aaa")) {
                actionErrors.add("email", new ActionMessage("error.Exist",
                        "Email"));
            } else if (submit.contains("aaa") && parse.checkExist("NguoiDung", "Email", email)) {
                BO bo =  new BO();
                NguoiDung nd = bo.nguoiDung.find("maND = '"+maND+"'");
                if(!email.equals(nd.getEmail())){
                    actionErrors.add("email", new ActionMessage("error.Exist",
                        "Email"));
                }
            }else if (!parse.checkLength(email, 50)) {
                actionErrors.add("email", new ActionMessage("error.length",
                        "Email", 50));
            }

            // check birth
            if (parse.checkEmpty(ngaySinh)) {
                actionErrors.add("ngaySinh", new ActionMessage("error.Empty",
                        "Ngày sinh"));
            } else if (!parse.checkDate(ngaySinh)) {
                actionErrors.add("ngaySinh", new ActionMessage("error.Format",
                        "Ngày sinh", "yyyy-MM-dd"));
            }else {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date x = formatter.parse(ngaySinh);
                    Date y = new Date();
                    if(y.before(x)){
                        actionErrors.add("ngaySinh", new ActionMessage("error.Format",
                                "Ngày sinh", ":  Người dùng đến từ tương lai?"));
                    }
                    
                } catch (Exception e) {
                    System.out.println("K parse ve date duoc");
                }
            }

            // check Phone
            if (parse.checkEmpty(sdt)) {
                actionErrors.add("sdt", new ActionMessage("error.Empty",
                        "Số Điện thoại"));
            } else if (!parse.checkNumber(sdt)) {
                actionErrors.add("sdt", new ActionMessage("error.Number",
                        "Số Điện thoại"));
            } else if (sdt.length() > 11 || sdt.length() < 10) {
                actionErrors.add("sdt", new ActionMessage(
                        "error.LengthFormat", "Số Điện thoại", "10", "11"));
            }

            // check address
            if (parse.checkEmpty(diaChi)) {
                actionErrors.add("diaChi", new ActionMessage("error.Empty",
                        "Địa chỉ"));
            } else if (!parse.checkLength(diaChi, 500)) {
                actionErrors.add("diaChi", new ActionMessage("error.length",
                        "Địa chỉ", 500));
            }
        }
        return actionErrors;
    }
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        this.hoTen = "";
        this.diaChi = "";
        this.ngaySinh = "";
        this.email = "";
        this.sdt = "";
        this.maDN = "";
        this.matKhau = "";
        this.maLop = "";
        this.trangThai = "";
        request.setAttribute("typeBackground","yellow");
        request.setAttribute("typePage","about");
        this.nhapLaiMK = "";
        this.submit= "";
    }

    public ArrayList<Lop> getDsLop() {
        return dsLop;
    }

    public void setDsLop(ArrayList<Lop> dsLop) {
        this.dsLop = dsLop;
    }

}
