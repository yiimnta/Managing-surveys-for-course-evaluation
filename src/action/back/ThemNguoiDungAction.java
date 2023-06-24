package action.back;


import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class ThemNguoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
       
        NguoiDungForm frm = (NguoiDungForm) form;
        BO bo = new BO();
        if ("".equals(frm.getSubmit().trim())) {
            frm.setDsLop(bo.lop.getList());
            return mapping.findForward("add");
        } else {
            boolean x = bo.nguoiDung.add(new NguoiDung(frm.getHoTen(), frm.getDiaChi(), frm
                    .getNgaySinh(), frm.getEmail(), frm.getSdt(),
                    frm.getMaDN(), frm.getMatKhau(), frm.getMaLop(), "0", frm
                            .getLoaiND().equals("on")?"1":"0"));
            bo.dangKyHocPhan.add(new DangKyHocPhan(bo.nguoiDung.getObjectEndList().getMaND()));
            if(x){
                return mapping.findForward("list");
            }else {
                request.setAttribute("pageReturn", "qlNguoiDung.do");
                return mapping.findForward("error");
            }
        }
    }
}