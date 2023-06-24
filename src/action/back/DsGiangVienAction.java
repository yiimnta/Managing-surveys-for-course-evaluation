package action.back;


import java.util.*;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsGiangVienAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DanhSachGiangVienForm frm = (DanhSachGiangVienForm)form;
        BO bo = new BO();
        frm.setDsGiangVien(bo.giangVien.getList());
        ArrayList<MonHoc> monHocl = bo.monHoc.getList();
        ArrayList<GiangDay> giangDayl = bo.giangDay.getList();
        for(GiangDay gd : giangDayl){
            gd.includeMonHoc(monHocl);
        }
        for(GiangVien gv : frm.getDsGiangVien()){
            gv.includeGiangDayDistinct(giangDayl);
        }
        return mapping.findForward("list");
    }
}