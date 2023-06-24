package action.back;


import java.util.*;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsNguoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DanhSachNguoiDungForm frm = (DanhSachNguoiDungForm)form;
        BO bo = new BO();
        frm.setDsNguoiDung(bo.nguoiDung.getList());
        ArrayList<Lop> lopl = bo.lop.getList();
        for(NguoiDung nd : frm.getDsNguoiDung()){
             nd.includeLop(lopl);
        }
        
        return mapping.findForward("list");
    }
}