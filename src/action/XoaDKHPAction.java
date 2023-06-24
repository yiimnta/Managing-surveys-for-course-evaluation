package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import model.form.*;

public class XoaDKHPAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ChiTietDKHPForm frm = (ChiTietDKHPForm) form;
        PrintWriter out = response.getWriter();
        @SuppressWarnings("unchecked")
        ArrayList<String> dsDK = (ArrayList<String>)request.getSession().getAttribute("dkhp");
        out.print(dsDK.remove(frm.getMaGD()));
        request.getSession().setAttribute("dkhp",dsDK);
        return null;
    }
}