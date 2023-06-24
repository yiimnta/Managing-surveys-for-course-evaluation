package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaNoiDungAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        NoiDungForm frm = (NoiDungForm) form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        out.print(bo.noiDung.remove("maNDu = '" + frm.getMaNDu() + "'"));
        return null;
    }
}