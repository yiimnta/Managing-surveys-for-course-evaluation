package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaLoaiPhieuAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LoaiPhieuForm frm = (LoaiPhieuForm)form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        out.print(bo.loaiPhieu.remove("LoaiP = '"+frm.getLoaiP()+"'"));
        return null;
    }
}