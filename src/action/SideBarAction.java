package action;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import action.back.AdmAction;
import model.form.*;

public class SideBarAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    
	    SideBarForm frm = (SideBarForm)form;
        BO bo = new BO();
        
        NguoiDung userLogin = (NguoiDung)request.getSession().getAttribute("userLogin");
        ArrayList<LoaiPhieu> lpl = bo.loaiPhieu.where("where TrangThai='1'");
        ArrayList<KetQua> kql = bo.ketQua.where("where MaND='"+userLogin.getMaND()+"'");
        ArrayList<PhieuDanhGia> pdgDaDanhl = bo.phieuDanhGia.where("where TrangThai='1'");
        ArrayList<NguoiDung> ndl = bo.nguoiDung.getList();
        
        //Hien thi cac phieu danh gia co loai phieu o trang thai cho phep hien thi 
        for(int i = 0; i< pdgDaDanhl.size(); i++){
            if(checkExist(pdgDaDanhl.get(i).getLoaiP(), lpl)){
                
                //Lay thong tin nguoi tao phieu
                pdgDaDanhl.get(i).includeNguoiDung(ndl);
                
                //Lay thong tin Loai phieu
                pdgDaDanhl.get(i).includeLoaiPhieu(lpl);
            } else {
                pdgDaDanhl.remove(i);
            }
        }
        
        for(KetQua kq: kql){
            kq.includePhieuDanhGia(pdgDaDanhl);
        }
        
        frm.setDsPhieuDanhGiaDGNhieu(new ArrayList<KetQua>(kql.subList(0, kql.size() > 5?5:kql.size())));
	    frm.setDsLoaiPhieu(lpl);
	    
		return mapping.findForward("sidebar");
	}
	
	private boolean checkExist(String ma, ArrayList<LoaiPhieu> lpl){
        for(LoaiPhieu lp: lpl){
            if(lp.getLoaiP().equals(ma)){
                return true;
            } else {
            }
        }
        return false;
    }
}