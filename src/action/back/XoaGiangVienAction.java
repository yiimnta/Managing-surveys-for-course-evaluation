package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaGiangVienAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        GiangVienForm frm = (GiangVienForm)form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        boolean test = bo.giangDay.removeForeign("maGV = '"+frm.getMaGV()+"'");
        if(test){
            out.print(bo.giangVien.remove("maGV = '"+frm.getMaGV()+"'"));
        }else {
            out.print(test);
        }
        return null;
    }
}