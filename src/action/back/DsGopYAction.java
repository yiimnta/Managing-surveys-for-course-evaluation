package action.back;


import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsGopYAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        
        DanhSachGopYForm frm = (DanhSachGopYForm)form;
        BO bo = new BO();
        
        ArrayList<GopY> gyl = bo.gopY.where("order by thoiGian desc");
        ArrayList<NguoiDung> ndl = bo.nguoiDung.getList();
        
        for(GopY gy : gyl){
            gy.includeNguoiDung(ndl);
        }
        
        frm.setDsGopY(gyl);
        return mapping.findForward("list");
    }
}