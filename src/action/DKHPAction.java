package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import com.google.gson.Gson;

import action.back.AdmAction;
import model.form.*;

public class DKHPAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	    DKHPForm frm = (DKHPForm) form;
        BO bo = new BO();
        
        NguoiDung sessionLogin = (NguoiDung)request.getSession().getAttribute("userLogin");
        NguoiDung nd = bo.nguoiDung.find("MaND = '"+sessionLogin.getMaND()+"'");
        frm.setDsLop(bo.lop.getList());
        
        if(!"".equals(frm.getSubmit())){
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            
            
            @SuppressWarnings("unchecked")
            ArrayList<String> dsdkhpss = (ArrayList<String>)request.getSession().getAttribute("dkhp");
            StringBuffer buffer = new StringBuffer("select * from GiangDay where MaGD in (");
            for(String dkhp: dsdkhpss){
                buffer.append(dkhp);
                buffer.append(",");
            }
            
            buffer.append("'') and TrangThai = '1'");
            ArrayList<GiangDay> dsgdss = bo.giangDay.getList(buffer.toString());
            for(GiangDay gd: dsgdss){
                gd.setMonHoc(bo.monHoc.find("maMH='"+gd.getMaMH()+"'"));
            }
            
            ArrayList<GiangDay> gdl = bo.giangDay.where(" where maLop='"+frm.getMaLop()+"' and TrangThai='1' and MaGD not in("
                    + " select gd.MaGD from (GiangDay gd join ChiTietDKHP"
                    + " ct on gd.MaGD = ct.MaGD) join DangKyHocPhan dk on (dk.MaDK = ct.MaDK and dk.MaND='"+sessionLogin.getMaND()+"') "
                    + " and gd.trangThai='1' and ct.trangThai='1'"
                    + ")");
            
            ArrayList<GiangDay> gdSub = new ArrayList<GiangDay>();
            for(GiangDay gd: gdl){
                if(!testExist(gd, dsgdss)){
                    gdSub.add(gd);
                }
            }
            
            for(GiangDay gd: gdSub){
               gd.setMonHoc(bo.monHoc.find("maMH='"+gd.getMaMH()+"'"));
            }
            
            ArrayList<GiangDay> dsgddkhp = bo.giangDay.getList("select gd.* from (GiangDay gd join ChiTietDKHP"
                    + " ct on gd.MaGD = ct.MaGD) join DangKyHocPhan dk on (dk.MaDK = ct.MaDK and dk.MaND='"+sessionLogin.getMaND()+"') "
                    + " and gd.trangThai='1' and ct.trangThai='1' ");
            
            for(GiangDay gd: dsgddkhp){
                gd.setMonHoc(bo.monHoc.find("maMH='"+gd.getMaMH()+"'"));
            }
            
            out.print(new Gson().toJson(new DKHPSupport(gdSub, dsgddkhp,dsgdss)));
            
            return null;
        }else {
           frm.setMaLop(nd.getMaLop()); 
        }
        
        return mapping.findForward("dkhp");
	}
	
	private boolean testExist(GiangDay gd, ArrayList<GiangDay> gdl)
	{
	    for(GiangDay g:gdl){
	        if(gd.getMaGD().equals(g.getMaGD())){
	            return true;
	        }
	    }
	    return false;
	}
	       
}