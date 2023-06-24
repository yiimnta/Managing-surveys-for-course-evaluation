package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaMonAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        MonHocForm frm = (MonHocForm)form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        boolean test = bo.giangDay.removeForeign("MaMH = '"+frm.getMaMon()+"'");
        if(test){
            out.print(bo.monHoc.remove("MaMH = '"+frm.getMaMon()+"'"));
        }
        return null;
    }
}

