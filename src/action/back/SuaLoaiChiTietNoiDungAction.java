package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class SuaLoaiChiTietNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        PrintWriter out = response.getWriter();
        
        ChiTietNoiDungForm frm = (ChiTietNoiDungForm)form;
        BO bo = new BO();
        
        //tìm kiếm đối tượng Chi tiết cần thay đổi
        ChiTietNoiDung old = bo.chiTietNoiDung.find("maCT = '"+frm.getMaCT()+"'");
        
        //thiết lập lại Loại chi tiết cho ChiTietNoiDung
        old.setLoaiCT(frm.getLoaiCT());
        
        //Cập nhật vào database
    	if(bo.chiTietNoiDung.update(old)){
    		out.print("true");
    	} else {
    		out.print("false");
    	}
    	
        return null;
    }
}