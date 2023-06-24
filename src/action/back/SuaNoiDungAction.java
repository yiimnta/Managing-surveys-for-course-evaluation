package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        NoiDungForm frm = (NoiDungForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        NoiDung old = bo.noiDung.find("MaNDu='"+frm.getMaNDu()+"'");
        if("".equals(frm.getTieuDe().trim())){
        	out.print("0");
        } else if (parse.checkExist("NoiDung", "MaDG='"+frm.getMaDG()+"' and MaNDu!='"+frm.getMaNDu()+"' and TieuDe", frm.getTieuDe())){
        	out.print("1");
        } else {
            old.setTieuDe(frm.getTieuDe());
        	out.print(bo.noiDung.update(old));
        }
        return null;
    }
}