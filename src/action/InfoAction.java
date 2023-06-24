package action;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import action.back.AdmAction;
import model.form.*;

public class InfoAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	/*    if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }*/
	    NguoiDungForm frm = (NguoiDungForm) form;
        BO bo = new BO();
        request.setAttribute("typeBackground","yellow");
        request.setAttribute("typePage","about");
        
        ArrayList<String> dkhp = new ArrayList<String>();
        request.getSession().setAttribute("dkhp",dkhp);
        NguoiDung sessionLogin = (NguoiDung)request.getSession().getAttribute("userLogin");
        NguoiDung nd = bo.nguoiDung.find("MaND = '"+sessionLogin.getMaND()+"'");
        
        if ("".equals(frm.getSubmit().trim())) {
            frm.setMaND(nd.getMaND());
            frm.setHoTen(nd.getHoTen());
            frm.setDiaChi(nd.getDiaChi());
            frm.setNgaySinh(nd.getNgaySinh());
            frm.setEmail(nd.getEmail());
            frm.setSdt(nd.getSdt());
            frm.setMaDN(nd.getMaDN());
            frm.setMatKhau(nd.getMatKhau());
            frm.setMaLop(nd.getMaLop());
        } else {
            nd.setHoTen(frm.getHoTen());
            nd.setDiaChi(frm.getDiaChi());
            nd.setNgaySinh(frm.getNgaySinh());
            nd.setEmail(frm.getEmail());
            nd.setSdt(frm.getSdt());
           
            boolean x = bo.nguoiDung.update(nd);
            if(!x){
                request.setAttribute("pageReturn", "info.do");
                return mapping.findForward("error");
            }else {
            }
        }
        return mapping.findForward("info");
	}
}