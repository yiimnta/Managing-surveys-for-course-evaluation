package action.back;


import java.util.*;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
     
        DanhSachNoiDungForm frm = (DanhSachNoiDungForm)form;
        BO bo = new BO();
        frm.setDsNoiDung(bo.noiDung.where("where maDG = '"+frm.getMaDG()+"' order by viTri"));
        ArrayList<ChiTietNoiDung> ctndl = bo.chiTietNoiDung.getList();
        ArrayList<NoiDungCon> ndcl = bo.noiDungCon.getList();
        for(NoiDung nd :  frm.getDsNoiDung()){
            nd.includeChiTietNoiDung(ctndl);
            for(ChiTietNoiDung ctnd: nd.getListChiTietNoiDung()){
                ctnd.includeNoiDungCon(ndcl);
            }
        }
        frm.setPhieuDanhGia(bo.phieuDanhGia.find("maDG = '"+frm.getMaDG()+"'"));
        return mapping.findForward("list");
    }
}