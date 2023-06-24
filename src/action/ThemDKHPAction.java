package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import model.form.*;

public class ThemDKHPAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ChiTietDKHPForm frm = (ChiTietDKHPForm) form;
        PrintWriter out = response.getWriter();
        @SuppressWarnings("unchecked")
        ArrayList<String> dsDK = (ArrayList<String>)request.getSession().getAttribute("dkhp");
        if(dsDK.contains(frm.getMaGD())){
            out.print("1");
        }else {
            out.print(dsDK.add(frm.getMaGD()));
            request.getSession().setAttribute("dkhp",dsDK);
        }
        //out.print(bo.chiTietDKHP.add(new ChiTietDKHP(frm.getMaGD(), dkhp.getMaDK(), ParseValue.getTimeNow(), "1")));
        return null;
    }
}