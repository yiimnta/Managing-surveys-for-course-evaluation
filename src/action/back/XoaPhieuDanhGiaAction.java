package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaPhieuDanhGiaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        PhieuDanhGiaForm frm = (PhieuDanhGiaForm) form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        out.print(bo.phieuDanhGia.remove("MaDG ='"+frm.getMaDG()+"'"));
        return null;
    }
}