package action.back;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemChiTietNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ChiTietNoiDungForm frm = (ChiTietNoiDungForm)form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        if("".equals(frm.getMoTa().trim())){
        	out.print("0");
        } else if (parse.checkExist("ChiTietNoiDung", "MaNDu='"+frm.getMaNDu()+"' and MoTa", frm.getMoTa())){
        	out.print("1");
        } else {
            ArrayList<ChiTietNoiDung> ctndLQ = bo.chiTietNoiDung.where("where MaNDu='"+frm.getMaNDu()+"' order by ViTri desc");
        	if(bo.chiTietNoiDung.add(new ChiTietNoiDung(frm.getMaNDu(),frm.getMoTa(), frm.getLoaiCT(), ctndLQ.size()== 0?"1":(Integer.parseInt(ctndLQ.get(0).getViTri()) + 1)+""))){
        		out.print("true");
        	}else {
        		out.print("false");
        	}
        }
        
        return null;
    }
}