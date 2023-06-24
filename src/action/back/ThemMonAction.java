package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemMonAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        MonHocForm frm = (MonHocForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if("".equals(frm.getTenMon().trim())){
        	out.print("0");
        } else if(frm.getTenMon().trim().length() > 50){
            out.print("4");
        } else if(parse.checkNotSpecialChar(frm.getTenMon().trim()) == false){
            out.print("5");
        } else if (parse.checkExist("MonHoc", "Ten", frm.getTenMon())){
        	out.print("1");
        } else if(!parse.checkNumber(frm.getSoTC())){
            out.print("2");//số tc k đúng dạng số
        } else {
            try {
                int x = Integer.valueOf(frm.getSoTC());
                if(x <= 0){
                    out.print("3");
                }else{
                    if(bo.monHoc.add(new MonHoc(frm.getTenMon(),frm.getSoTC(),frm.getLoaiMH(),frm.getTrangThai()))){
                        out.print(bo.monHoc.find("Ten = '"+frm.getTenMon()+"'").getMaMH());
                    }else {
                        out.print("false");
                    }
                }
            }catch(NumberFormatException e){
                out.print("2");
            }
        	
        }
        return null;
    }
}