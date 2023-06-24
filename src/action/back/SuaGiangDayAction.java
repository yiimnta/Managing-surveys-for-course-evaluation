package action.back;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class SuaGiangDayAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        GiangDayForm frm = (GiangDayForm) form;
        BO bo = new BO();
        GiangDay gd = bo.giangDay.find("MaGD = '"+frm.getId()+"'");
        if ("".equals(frm.getSubmit().trim())) {
            frm.setMaGV(gd.getMaGV());
           
            frm.setMaMH(gd.getMaMH());
            frm.setMaLop(gd.getMaLop());
            
            frm.setTrangThai(gd.getTrangThai());
            frm.setOld(gd);
            return mapping.findForward("update");
        } else {
            gd.setMaGV(frm.getMaGV());
            gd.setMaLop(frm.getMaLop());
            gd.setMaMH(frm.getMaMH());
            gd.setTrangThai(frm.getTrangThai().equals("on")?"1":"0");
            boolean x = bo.giangDay.update(gd);
            if(x){
                return mapping.findForward("list");
            }else {
                request.setAttribute("pageReturn", "qlGiangDay.do");
                return mapping.findForward("error");
            }
        }
    }
}