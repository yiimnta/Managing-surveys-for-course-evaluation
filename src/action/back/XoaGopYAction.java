package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaGopYAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        GopYForm frm = (GopYForm) form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        out.print(bo.gopY.remove("maGY = '" + frm.getMaGY() + "'"));
        return null;
    }
}