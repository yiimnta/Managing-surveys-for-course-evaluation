package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaNoiDungConAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        NoiDungConForm frm = (NoiDungConForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        NoiDungCon old = bo.noiDungCon.find("MaNDC='"+frm.getMaNDC()+"'");
        if("".equals(frm.getTieuDe().trim())){
        	out.print("0");
        } else if (parse.checkExist("NoiDungCon", "MaCT='"+frm.getMaCT()+"' and MaNDC!='"+frm.getMaNDC()+"' and TieuDe", frm.getTieuDe())){
        	out.print("1");
        } else {
            old.setTieuDe(frm.getTieuDe());
        	out.print(bo.noiDungCon.update(old));
        }
        return null;
    }
}