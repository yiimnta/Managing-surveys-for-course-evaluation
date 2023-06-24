package action.back;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsLopAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if (!"".equals(testAdm(request))) {
            return mapping.findForward(url);
        }
        DanhSachLopForm frm = (DanhSachLopForm) form;
        BO bo = new BO();
        frm.setDsLop(bo.lop.getList());

        ArrayList<Khoa> khoal = bo.khoa.getList();
        for (Lop lop : frm.getDsLop()) {
            lop.includeKhoa(khoal);
        }
        frm.setDsKhoa(khoal);
        return mapping.findForward("list");
    }
}