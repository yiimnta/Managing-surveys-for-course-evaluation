package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaLoaiPhieuAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LoaiPhieuForm frm = (LoaiPhieuForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        LoaiPhieu old = bo.loaiPhieu.find("LoaiP='"+frm.getLoaiP()+"'");
        if(parse.checkEmpty(frm.getTen())){
        	out.print("0");
        } else if (!old.getTen().equals(frm.getTen()) && parse.checkExist("LoaiPhieu", "LoaiP!='"+frm.getLoaiP()+"' and Ten", frm.getTen())){
        	out.print("1");
        } else {
            old.setTen(frm.getTen());
            old.setTrangThai(frm.getTrangThai());
        	out.print(bo.loaiPhieu.update(old));
        }
        return null;
    }
}