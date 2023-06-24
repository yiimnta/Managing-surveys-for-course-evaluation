package action;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import action.back.AdmAction;
import model.form.*;

public class PhieuDanhGiaAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    
	    request.setAttribute("typeBackground","lightyellow");
	    request.setAttribute("typePage","project");
	    
	    FrontDanhSachPhieuDanhGiaForm frm = (FrontDanhSachPhieuDanhGiaForm)form;
	    BO bo = new BO();
	    
	    PhieuDanhGia pdg = bo.phieuDanhGia.find("maDG='"+frm.getMaDG()+"'");
	    pdg.includeNoiDung(bo.noiDung.getList());
	    ArrayList<GiangVien> gvl = bo.giangVien.getList();
	    ArrayList<GiangDay> gdl = bo.giangDay.getList();
	    ArrayList<Lop> lopl = bo.lop.getList();
	    ArrayList<MonHoc> mhl = bo.monHoc.getList();
	    ArrayList<Khoa> khoal = bo.khoa.getList();
        
        if(!"".equals(pdg.getMaGD())){
            pdg.includeGiangDay(gdl);
            pdg.getGiangDay().includeGiangVien(gvl);
            pdg.getGiangDay().includeLop(lopl);
            pdg.getGiangDay().includeMonHoc(mhl);
        } else  if(!"".equals(pdg.getMaGV())){
            pdg.includeGiangVien(gvl);
        } else  if(!"".equals(pdg.getMaKhoa())){
            pdg.includeKhoaHoc(khoal);
        } 
        
        ArrayList<ChiTietNoiDung> ctndl = bo.chiTietNoiDung.getList();
        ArrayList<NoiDungCon> ndcl = bo.noiDungCon.getList();
        
        for(NoiDung nd : pdg.getListNoiDung()){
            nd.includeChiTietNoiDung(ctndl);
            for(ChiTietNoiDung ctnd: nd.getListChiTietNoiDung()){
                ctnd.includeNoiDungCon(ndcl);
            }
        }
        
	    NguoiDung nguoiDung = (NguoiDung)request.getSession().getAttribute("userLogin");
	    if(bo.ketQua.find(" MaND = '"+nguoiDung.getMaND()+"' and MaDG='"+frm.getMaDG()+"'") != null){
	        frm.setChoPhepDanhGia("0");
	    }else {
	        frm.setChoPhepDanhGia("1");
	    }
	    
	    frm.setPhieuDanhGia(pdg);
	    
		return mapping.findForward("pdg");
	}
	
}