package action;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import action.back.AdmAction;
import model.form.*;

public class DsPhieuDanhGiaAction extends AdmAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    
	    request.setAttribute("typeBackground","lightyellow");
	    request.setAttribute("typePage","project");
	    request.setAttribute("loaiP", "MỚI NHẤT");
	    
	    FrontDanhSachPhieuDanhGiaForm frm = (FrontDanhSachPhieuDanhGiaForm)form;
	    BO bo = new BO();
	   
	    // phan quyen
	    //Lay ma nguoi dung
	    NguoiDung userLogin = (NguoiDung)request.getSession().getAttribute("userLogin");
	    
	    //Lay dang ky hoc phan cua dung
	    DangKyHocPhan dkhp = bo.dangKyHocPhan.find("maND = '"+userLogin.getMaND()+"'");
	    
	    //Lay danh sach cac mon ma nguoi dung dki
	    dkhp.includeChiTietDKHP(bo.chiTietDKHP.where("where MaDK = '"+dkhp.getMaDK()+"' and TrangThai='1'"));
	    
	    //Tao 1 chuoi luu danh sach mon dang ky va giang vien phu trach mon dang ky
	    StringBuffer bufferGD = new StringBuffer();
	    StringBuffer bufferGV = new StringBuffer();
	    
	    //Tao 1 danh sach giang day nham de lay MaGV nham de lay danh sach danh theo GIangVien
	    
	    ArrayList<GiangDay> giangDayl = bo.giangDay.where("where TrangThai='1'");
	    
	    for(ChiTietDKHP ct: dkhp.getListChiTietDKHP()){
	        ct.includeGiangDay(giangDayl);
	        bufferGD.append(ct.getMaGD());
	        bufferGD.append(",");
	        
	        if(ct.getGiangDay()!=null){
    	        bufferGV.append(ct.getGiangDay().getMaGV());
                bufferGV.append(",");
	        }
	    }
	    
	    //Lay ma khoa hoc cua nguoi dung
	    String maKH = "";
	    if(!"".equals(userLogin.getMaLop())){
	       maKH = bo.lop.find("MaLop='"+userLogin.getMaLop()+"'").getMaKhoa();
	    }
	    
	    
	    ArrayList<LoaiPhieu> lpl = bo.loaiPhieu.where("where TrangThai='1'");
	    String loaiP = "";
	    String tenloaiP = "";
	    if(!"".equals(frm.getLoaiP()) && frm.getLoaiP() != null){
            if("".equals(tenloaiP = checkExistGetNameLP(frm.getLoaiP(), lpl))){
                return mapping.findForward("notFound");
            } else {
                loaiP = "LoaiP='"+frm.getLoaiP()+"' and ";
                request.setAttribute("loaiP", tenloaiP);
            }
        }
	    ArrayList<KetQua> kql = bo.ketQua.getList();
	    ArrayList<NguoiDung> ndl = bo.nguoiDung.getList();
	    ArrayList<PhieuDanhGia> pdgl = new ArrayList<PhieuDanhGia>();
	    
	    //Lay danh sach phieu danh gia theo tim kiem va phan quyen
	    if("".equals(frm.getFind())){
	        pdgl = bo.phieuDanhGia.where("where "+loaiP+" TrangThai='1' and (MaGD in ("+bufferGD.toString()+"'') or MaGV in ("+bufferGV.toString()+"'') or MaKhoa = '"+maKH+"') order by ThoiGianDang desc");
	    }else {
	        pdgl = bo.phieuDanhGia.where("where TieuDe like '%"+frm.getFind()+"%' and TrangThai='1' and (MaGD in ("+bufferGD.toString()+"'') or MaGV in ("+bufferGV.toString()+"'') or MaKhoa = '"+maKH+"') order by ThoiGianDang desc");
	    }
	    
	    for(int i = 0; i< pdgl.size(); i++){
            if(checkExist(pdgl.get(i).getLoaiP(), lpl)){
                pdgl.get(i).includeKetQua(kql);
                pdgl.get(i).includeNguoiDung(ndl);
                pdgl.get(i).includeLoaiPhieu(lpl);
            } else {
                pdgl.remove(i);
            }
        }
	    
	    double maxPage = 0;
	    if(pdgl.size() != 0){
    	    maxPage = Double.valueOf(pdgl.size())/5;
    	    if(maxPage > (int)maxPage){
    	        maxPage = maxPage + 1;
    	    }
	    } else {
            maxPage = 1;
        }
	    
	    for(int i =1; i <= maxPage; i++){
            frm.getListPage().add(i);
        }
	    
	    if(frm.getCurPage() == null || frm.getCurPage() < 1 || "".equals(frm.getCurPage()) || frm.getCurPage() > (int)maxPage){
	        frm.setCurPage(1);
	    }
	    
	    //lấy danh sách phân trang
        //tính từ phần tử thứ (page - 1)*5 - 1 : *5 là lấy 5 phần tử, -1 là giảm 1 phần tử vì mảng tính từ 0        
        //tính đến phần tử ta thực hiện so sánh
        // nếu số lượng phần tử trong mảng hiện tại > số lượng phần tử cần load trên trang
        // true: ta lấy số trang hiện tại * 5 + 4 (+4 phần tử cần lấy, vì ở trên ta đã lấy trước 1 phần tử rùi)
        // false: lấy luôn kích thước mảng
	    
	    ArrayList<PhieuDanhGia> danhSachPhanTrang = new ArrayList<PhieuDanhGia>(
	            pdgl.subList((frm.getCurPage() - 1)*5,
                        pdgl.size() > (5 * (frm.getCurPage() -1)) +5 ? (frm .getCurPage() -1 )*5 + 5 : pdgl.size()));
        
	  //Kiem tra cac phieu nguoi dung hien tai da danh gia roi
        ArrayList<KetQua> kqdgl = bo.ketQua.where("where MaND='"+userLogin.getMaND()+"'");
        
        //set cờ để phân biệt phiếu nào đã đánh giá 
        for(KetQua kq : kqdgl){
            for(PhieuDanhGia pdg : danhSachPhanTrang){
                if(kq.getMaDG().equals(pdg.getMaDG())){
                    pdg.setFlag(kq.getMaKQ());
                }
            }
        }
	    
	    frm.setMaxPage((int)maxPage);
	    frm.setDsPhieuDanhGia(danhSachPhanTrang);
	    
		return mapping.findForward("dsPdg");
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
	
	private String checkExistGetNameLP(String ma, ArrayList<LoaiPhieu> lpl){
        for(LoaiPhieu lp: lpl){
            if(lp.getLoaiP().equals(ma)){
                return lp.getTen();
            } else {
            }
        }
        return "";
    }
}