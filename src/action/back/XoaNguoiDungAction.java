package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaNguoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        NguoiDungForm frm = (NguoiDungForm)form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        bo.phieuDanhGia.removeForeign("MaNguoiTao='"+frm.getMaND()+"'");
        out.print(bo.nguoiDung.remove("maND = '"+frm.getMaND()+"'"));
        return null;
    }
}