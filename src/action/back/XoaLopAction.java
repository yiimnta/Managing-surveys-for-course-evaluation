package action.back;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

import model.bean.*;

public class XoaLopAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LopForm frm = (LopForm)form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        boolean test  = bo.giangDay.removeForeign("MaLop = '"+frm.getMaLop()+"'");
        if(test){
            ArrayList<NguoiDung> ndl = bo.nguoiDung.where("MaLop = '"+frm.getMaLop()+"'");
            for(NguoiDung nd : ndl){
                bo.phieuDanhGia.removeForeign("MaNguoiTao='"+nd.getMaND()+"'");
            }
            out.print(bo.lop.remove("maLop = '"+frm.getMaLop()+"'"));
        }
        return null;
    }
}