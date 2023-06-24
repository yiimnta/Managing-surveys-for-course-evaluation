package action;

import javax.servlet.http.*;


import org.apache.struts.action.*;

import action.back.AdmAction;

public class LienHeAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    
	    request.setAttribute("typeBackground","green2");
	    request.setAttribute("typePage","contact");
	    
		return mapping.findForward("home");
	}
}