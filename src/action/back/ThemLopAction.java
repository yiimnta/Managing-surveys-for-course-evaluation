package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemLopAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LopForm frm = (LopForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if("".equals(frm.getTenLop().trim())){
        	out.print("0");
        } else if(frm.getTenLop().trim().length() > 50){
            out.print("2");
        } else if(!parse.checkVN(frm.getTenLop().trim())){
            out.print("3");
        }  else if (parse.checkExist("Lop", "Ten", frm.getTenLop())){
        	out.print("1");
        } else {
        	if(bo.lop.add(new Lop(frm.getTenLop(),frm.getMaKhoa()))){
        		out.print(bo.lop.find("Ten = '"+frm.getTenLop()+"'").getMaLop());
        	}else {
        		out.print("false");
        	}
        }
        
        return null;
    }
}