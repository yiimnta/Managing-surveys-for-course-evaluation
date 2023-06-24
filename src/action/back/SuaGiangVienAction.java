package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;
import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaGiangVienAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        GiangVienForm frm = (GiangVienForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        GiangVien old = bo.giangVien.find("MaGV='"+frm.getMaGV()+"'");
        
        if("".equals(frm.getMaDD().trim())){
        	out.print("0");
        } if("".equals(frm.getHoTen().trim())){
            out.print("1");
        } else if(frm.getHoTen().trim().length() > 50){
            out.print("3");
        } else if(!parse.checkVN(frm.getHoTen().trim())){
            out.print("4");
        } else if (!old.getMaDD().equals(frm.getMaDD()) && parse.checkExist("GiangVien", "MaDD!='"+old.getMaDD()+"' and MaDD", frm.getMaDD().trim())){
        	out.print("2");
        } else {
        	out.print(bo.giangVien.update(new GiangVien(frm.getMaGV(), frm.getMaDD(), frm.getHoTen())));
        }
        
        return null;
    }
}