package action.back;


import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsKhoaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DanhSachKhoaForm frm = (DanhSachKhoaForm)form;
        BO bo = new BO();
        frm.setDsKhoa(bo.khoa.getList());
        return mapping.findForward("list");
    }
}