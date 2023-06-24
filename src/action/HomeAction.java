package action;

import javax.servlet.http.*;


import org.apache.struts.action.*;

import action.back.AdmAction;

public class HomeAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    
	    request.setAttribute("typeBackground","green");
	    request.setAttribute("typePage","home");
	    
		return mapping.findForward("home");
	}
}