package action;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import action.back.AdmAction;

public class LogOutAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if (request.getSession().getAttribute("userLogin") != null) {
            BO bo = new BO();
            NguoiDung sv = (NguoiDung) request.getSession().getAttribute(
                    "userLogin");
            sv.setTrangThai("0");
            bo.nguoiDung.update(sv);
            request.getSession().removeAttribute("userLogin");
        }
        return mapping.findForward("login");

    }
}