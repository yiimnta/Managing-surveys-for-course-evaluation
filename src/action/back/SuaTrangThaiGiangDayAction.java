package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class SuaTrangThaiGiangDayAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        GiangDayForm frm = (GiangDayForm) form;
        BO bo = new BO();
        GiangDay gd = bo.giangDay.find("MaGD = '"+frm.getId()+"'");
        gd.setTrangThai(frm.getTrangThai());
        boolean x = bo.giangDay.update(gd);
        PrintWriter out = response.getWriter();
        out.print(x);
        return null;
    }
}