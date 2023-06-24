package action.back;


import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class ThemGiangDayAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
       
        GiangDayForm frm = (GiangDayForm) form;
        BO bo = new BO();
        if ("".equals(frm.getSubmit().trim())) {
            frm.setListLop(bo.lop.getList());
            frm.setListGiangVien(bo.giangVien.getList());
            frm.setListMonHoc(bo.monHoc.getList());
            return mapping.findForward("add");
        } else {
           
                boolean x = bo.giangDay.add(new GiangDay(frm.getMaGV(), frm.getMaMH(), frm.getMaLop(), frm.getTrangThai().equals("on")?"1":"0"));
                if(x){
                    return mapping.findForward("list");
                }else {
                    request.setAttribute("pageReturn", "qlGiangDay.do");
                    return mapping.findForward("error");
                }
            
        }
    }
}