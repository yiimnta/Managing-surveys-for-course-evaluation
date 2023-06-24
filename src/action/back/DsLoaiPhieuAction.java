package action.back;


import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsLoaiPhieuAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DsLoaiPhieuForm frm = (DsLoaiPhieuForm)form;
        BO bo = new BO();
        frm.setDsLoaiPhieu(bo.loaiPhieu.getList());
        return mapping.findForward("list");
    }
}