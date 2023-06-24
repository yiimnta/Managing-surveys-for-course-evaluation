package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;
import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaKhoaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        KhoaHocForm frm = (KhoaHocForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        Khoa old = bo.khoa.find("MaKhoa='"+frm.getMaKhoa()+"'");
        if("".equals(frm.getTenKhoa().trim())){
        	out.print("0");
        } else if(frm.getTenKhoa().trim().length() > 50){
            out.print("2");
        } else if(parse.checkNotSpecialChar(frm.getTenKhoa().trim()) == false){
            out.print("3");
        }  else if (parse.checkExist("KhoaHoc", "maKhoa!='"+frm.getMaKhoa()+"' and TenKhoa", frm.getTenKhoa())){
        	out.print("1");
        } else {
            old.setTenKhoa(frm.getTenKhoa());
        	out.print(bo.khoa.update(old));
        }
        return null;
    }
}