package action;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class LoginAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		LoginForm frm = (LoginForm) form;
		BO bo = new BO();
		if ("".equals(frm.getSubmit())) {
			return mapping.findForward("login");
		} else {
			String userName = frm.getUserName();
			String password = frm.getPassword();
			NguoiDung sv = bo.nguoiDung.find("MaDN = '"+userName+"' and MatKhau='"+password+"'");
			if( sv != null){
				request.getSession().setAttribute("userLogin", sv);
				sv.setTrangThai("1");
				bo.nguoiDung.update(sv);
				if("1".equals(sv.getLoaiND())){
					return mapping.findForward("admin");
				}else {
					return mapping.findForward("home");
				}
			}else{
			    request.setAttribute("errorLogin", "Error! Sai tài khoản hoặc mật khẩu");
				return mapping.findForward("login");
			}
		}
	}
}