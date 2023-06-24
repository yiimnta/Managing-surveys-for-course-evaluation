package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bean.NguoiDung;
import model.bo.BO;
import model.form.ThayDoiMatKhauForm;

import org.apache.struts.action.*;

public class ThayDoiMatKhauAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ThayDoiMatKhauForm frm = (ThayDoiMatKhauForm) form;
		BO bo = new BO();
		NguoiDung nd = bo.nguoiDung.find("maND = '"+frm.getMaND()+"'");
		String pass = nd.getMatKhau();
		String passOld = frm.getPassOld();
		String passNew = frm.getPassNew();
		String passRetype = frm.getPassRetype();
		String result = "Có lỗi xảy ra";

		if ("".equals(passOld)) {
			result = "Mật khẩu cũ không được để trống";
		} else {
		    if(passOld.trim().length() > 50){
		        result = "Mật khẩu cũ không thể dài hơn 50 ký tự";
		    } else if (!pass.equals(passOld)) {
				result = "Mật khẩu cũ không đúng";
			} else if ("".equals(passNew)) {
				result = "Mật khẩu mới không được để trống";
			}else if (passNew.split(" ").length > 1) {
                result = "Mật khẩu mới không đúng định dạng";
            } else if (passNew.trim().length()< 6 || passNew.trim().length() > 50 ) {
				result = "Mật khẩu mới phải lớn hơn hoặc bằng 6 ký tự và phải bé hơn 50 ký tự";
			} else if ("".equals(passRetype.trim())) {
				result = "Nhập lại Mật khẩu mới không được để trống";
			} else if (!passRetype.trim().equals(passNew.trim())) {
				result = "Mật khẩu mới và nhập lại không khớp";
			} else if(passRetype.trim().equals(passNew.trim())) {
			    nd.setMatKhau(passNew);
			    bo.nguoiDung.update(nd);
				request.getSession().setAttribute("userLogin", nd);
				result = "";
			}else {
			}
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);

		return null;
	}
}
