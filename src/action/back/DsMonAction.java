package action.back;


import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsMonAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DanhSachMonForm frm = (DanhSachMonForm)form;
        BO bo = new BO();
        frm.setDsMon(bo.monHoc.getList());
        return mapping.findForward("list");
    }
}