package action.back;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemGiangVienAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        GiangVienForm frm = (GiangVienForm) form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if("".equals(frm.getMaDD().trim())){
            out.print("0");
        } else if("".equals(frm.getHoTen().trim())){
            out.print("1");
        } else if(frm.getHoTen().trim().length() > 50){
            out.print("3");
        } else if(!parse.checkVN(frm.getHoTen().trim())){
            out.print("4");
        } else if (parse.checkExist("GiangVien", "MaDD", frm.getMaDD())){
            out.print("2");
        } else {
            if(bo.giangVien.add(new GiangVien(frm.getMaDD(), frm.getHoTen()))){
                ArrayList<GiangVien> lgv = bo.giangVien.getList();
                out.print(lgv.get(lgv.size()-1).getMaGV());
            }else {
                out.print("false");
            }
        }
        
        return null;
    }
    
}