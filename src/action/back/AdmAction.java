package action.back;

import javax.servlet.http.*;

import model.bean.*;

import org.apache.struts.action.*;

public class AdmAction extends Action {
    public String url ="";
    
    public String testAdm(HttpServletRequest request)
            throws Exception {

        if (request.getSession().getAttribute("userLogin") != null) {
            NguoiDung nd = (NguoiDung)request.getSession().getAttribute("userLogin");
            if("0".equals(nd.getLoaiND())){
                url = "notFound";
            }
        }else {
            url = "login";
        }
        return url;
    }
}