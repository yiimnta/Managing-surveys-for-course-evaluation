package action;

import java.util.*;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;
import org.codehaus.jackson.map.ObjectMapper;

import Parse.ParseValue;
import action.back.AdmAction;

public class LuuDKHPAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	    BO bo = new BO();
	    NguoiDung sessionLogin = (NguoiDung)request.getSession().getAttribute("userLogin");
	    
	    String delArr = request.getParameter("deleleArray");
	    System.out.println(delArr);
	    ObjectMapper mapper = new ObjectMapper();
	    
	    List<Integer> deleteArray = mapper.readValue(delArr, mapper.getTypeFactory().constructCollectionType(List.class, Integer.class));
	    
	    @SuppressWarnings("unchecked")
        ArrayList<String> dsdkhpss = (ArrayList<String>)request.getSession().getAttribute("dkhp");
	    DangKyHocPhan dkhp = bo.dangKyHocPhan.find("MaND='"+sessionLogin.getMaND()+"'");
	    
	    StringBuffer queryIn = new StringBuffer();
        for(Integer pt:deleteArray){
            queryIn.append(pt);
            queryIn.append(",");
        }
	    
	    ArrayList<ChiTietDKHP> delCTDK = bo.chiTietDKHP.getList("select ct.* from ChiTietDKHP ct join DangKyHocPhan dk on"
	            + " (ct.MaDK = dk.MaDK and dk.MaND='"+sessionLogin.getMaND()+"') where ct.MaGD in ("+queryIn.toString()+"'') and TrangThai = '1'");
	    
	    for(ChiTietDKHP ct : delCTDK){
	        bo.chiTietDKHP.remove(ct);
	    }
	    
	    for(String pt: dsdkhpss){
	        bo.chiTietDKHP.add(new ChiTietDKHP(pt, dkhp.getMaDK(), ParseValue.getTimeNow(), "1"));
	    }
	    
	    return null;
	}
}