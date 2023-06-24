package action;


import javax.servlet.http.*;

import model.bean.GopY;
import model.bean.NguoiDung;
import model.bo.BO;
import model.form.GopYForm;

import org.apache.struts.action.*;

import Parse.ParseValue;
import action.back.AdmAction;

public class GopYAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    
	    request.setAttribute("typeBackground","lightgreen");
	    request.setAttribute("typePage","blog");
	    
	    GopYForm frm = (GopYForm)form;
	    if("".equals(frm.getSubmit())){
	        return mapping.findForward("home");
	    } else {
	      NguoiDung nd = (NguoiDung)request.getSession().getAttribute("userLogin");
	      BO bo = new BO();
	      if(bo.gopY.add(new GopY(nd.getMaND(), frm.getTieuDe(), frm.getNoiDung(), ParseValue.getTimeNow()))){
	          request.setAttribute("success","1");
	          return mapping.findForward("home");
	      }else {
	          return mapping.findForward("error");
	      }
	    }
	}
}