package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaLopAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LopForm frm = (LopForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        Lop old = bo.lop.find("MaLop='"+frm.getMaLop()+"'");
        if("".equals(frm.getTenLop().trim())){
        	out.print("0");
        } else if(frm.getTenLop().trim().length() > 50){
            out.print("2");
        } else if(!parse.checkVN(frm.getTenLop().trim())){
            out.print("3");
        }  else if (!old.getTen().equals(frm.getTenLop()) && parse.checkExist("Lop", "MaLop!='"+old.getMaLop()+"' and Ten", frm.getTenLop())){
        	out.print("1");
        } else {
            old.setTen(frm.getTenLop());
            old.setMaKhoa(frm.getMaKhoa());
        	out.print(bo.lop.update(old));
        }
        return null;
    }
}