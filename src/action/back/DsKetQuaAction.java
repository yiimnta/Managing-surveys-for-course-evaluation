package action.back;


import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsKetQuaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        
        DanhSachKetQuaForm frm = (DanhSachKetQuaForm)form;
        BO bo = new BO();
        
        ArrayList<KetQua> kql = bo.ketQua.getList();
        ArrayList<NguoiDung> ndl = bo.nguoiDung.getList();
        ArrayList<PhieuDanhGia> pdgl = bo.phieuDanhGia.getList();
        
        for(KetQua kq : kql){
            kq.includeNguoiDung(ndl);
            kq.includePhieuDanhGia(pdgl);
        }
        
        frm.setDsKetQua(kql);
        
        return mapping.findForward("list");
    }
}