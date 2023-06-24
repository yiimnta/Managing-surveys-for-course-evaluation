package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemLoaiPhieuAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LoaiPhieuForm frm = (LoaiPhieuForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if(parse.checkEmpty(frm.getTen())){
        	out.print("0");
        } else if (parse.checkExist("LoaiPhieu", "Ten", frm.getTen())){
        	out.print("1");
        } else {
        	if(bo.loaiPhieu.add(new LoaiPhieu(frm.getTen(),frm.getTrangThai()))){
        		out.print(bo.loaiPhieu.find("Ten = '"+frm.getTen()+"'").getLoaiP());
        	}else {
        		out.print("false");
        	}
        }
        
        return null;
    }
}