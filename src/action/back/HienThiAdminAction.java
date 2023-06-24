package action.back;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public class HienThiAdminAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        return mapping.findForward("admin");
    }
}