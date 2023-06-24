package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemKhoaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        KhoaHocForm frm = (KhoaHocForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if("".equals(frm.getTenKhoa().trim())){
        	out.print("0");
        } else if(frm.getTenKhoa().trim().length() > 50){
            out.print("2");
        } else if(parse.checkNotSpecialChar(frm.getTenKhoa().trim()) == false){
            out.print("3");
        } else if (parse.checkExist("KhoaHoc", "TenKhoa", frm.getTenKhoa())){
        	out.print("1");
        } else {
        	if(bo.khoa.add(new Khoa(frm.getTenKhoa()))){
        		out.print(bo.khoa.find("TenKhoa = '"+frm.getTenKhoa()+"'").getMaKhoa());
        	}else {
        		out.print("false");
        	}
        }
        
        return null;
    }
}