package action.back;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class SuaNguoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        NguoiDungForm frm = (NguoiDungForm) form;
        BO bo = new BO();
        NguoiDung nd = bo.nguoiDung.find("MaND = '"+frm.getMaND()+"'");
        if ("".equals(frm.getSubmit().trim())) {
            frm.setDsLop(bo.lop.getList());
            frm.setMaND(nd.getMaND());
            frm.setHoTen(nd.getHoTen());
            frm.setDiaChi(nd.getDiaChi());
            frm.setNgaySinh(nd.getNgaySinh());
            frm.setEmail(nd.getEmail());
            frm.setSdt(nd.getSdt());
            frm.setMaDN(nd.getMaDN());
            frm.setMatKhau(nd.getMatKhau());
            frm.setMaLop(nd.getMaLop());
            frm.setTrangThai(nd.getTrangThai());
            frm.setLoaiND(nd.getLoaiND());
            return mapping.findForward("update");
        } else {
            
            nd.setHoTen(frm.getHoTen());
            nd.setDiaChi(frm.getDiaChi());
            nd.setNgaySinh(frm.getNgaySinh());
            nd.setEmail(frm.getEmail());
            nd.setSdt(frm.getSdt());
            nd.setLoaiND(frm.getLoaiND().equals("on")?"1":"0");
            nd.setMaLop(frm.getMaLop());
            
            boolean x = bo.nguoiDung.update(nd);
            if(x){
                return mapping.findForward("list");
            }else {
                request.setAttribute("pageReturn", "qlNguoiDung.do");
                return mapping.findForward("error");
            }
        }
    }
}