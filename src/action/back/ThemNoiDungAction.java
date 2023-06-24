package action.back;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        NoiDungForm frm = (NoiDungForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if("".equals(frm.getTieuDe().trim())){
        	out.print("0");
        } else if (parse.checkExist("NoiDung","MaDG='"+frm.getMaDG()+"' and TieuDe", frm.getTieuDe())){
        	out.print("1");
        } else {
            ArrayList<NoiDung> ndLQ = bo.noiDung.where("where MaDG='"+frm.getMaDG()+"' order by ViTri desc");
        	if(bo.noiDung.add(new NoiDung(frm.getMaDG(),frm.getTieuDe(),ndLQ.size()== 0?"1":(Integer.parseInt(ndLQ.get(0).getViTri()) + 1)+""))){
        	    out.print("true");
        	}else {
        		out.print("false");
        	}
        }
        
        return null;
    }
}