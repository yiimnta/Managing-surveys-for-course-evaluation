package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class SuaChiTietNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ChiTietNoiDungForm frm = (ChiTietNoiDungForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        ChiTietNoiDung old = bo.chiTietNoiDung.find("MaCT='"+frm.getMaCT()+"'");
        if("".equals(frm.getMoTa().trim())){
        	out.print("0");
        } else if (parse.checkExist("ChiTietNoiDung", "MaCT!='"+frm.getMaCT()+"' and MaNDu='"+frm.getMaNDu()+"' and MoTa", frm.getMoTa())){
        	out.print("1");
        } else {
            old.setMoTa(frm.getMoTa());
            old.setLoaiCT(frm.getLoaiCT());
        	out.print(bo.chiTietNoiDung.update(old));
        }
        return null;
    }
}