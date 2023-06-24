package action.back;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import model.form.*;

public class SuaPhieuDanhGiaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }

        PhieuDanhGiaForm frm = (PhieuDanhGiaForm) form;
        BO bo = new BO();
        String submit = frm.getSubmit().trim();
        PhieuDanhGia pdg = bo.phieuDanhGia.find("MaDG = '"+frm.getMaDG()+"'");
        if ("".equals(submit)) {
            ArrayList<GiangVien> gvl = bo.giangVien.getList();
            ArrayList<MonHoc> mhl = bo.monHoc.getList();
            ArrayList<Lop> lopl = bo.lop.getList();
            ArrayList<GiangDay> gdl = bo.giangDay.getList();

            for (GiangDay gd : gdl) {
                gd.includeGiangVien(gvl);
                gd.includeLop(lopl);
                gd.includeMonHoc(mhl);
            }

            frm.setListGiangVien(gvl);
            frm.setListGiangDay(gdl);
            frm.setListKhoa(bo.khoa.getList());
            frm.setListLoaiPhieu(bo.loaiPhieu.getList());
            
            frm.setMaDG(pdg.getMaDG());
            frm.setMaGD(pdg.getMaGD());
            frm.setMaGV(pdg.getMaGV());
            frm.setMaKhoa(pdg.getMaKhoa());
            frm.setThoiGianDang(pdg.getThoiGianDang());
            frm.setTieuDe(pdg.getTieuDe());
            frm.setTrangThai(pdg.getTrangThai());
            if(!"".equals(pdg.getNienKhoa())){
                frm.setNienKhoa(pdg.getNienKhoa());
                frm.setHocKy(pdg.getHocKy());
                frm.setNamT(pdg.getNienKhoa().split("-")[0]);
                frm.setNamS(pdg.getNienKhoa().split("-")[1]);
            }
            frm.setLoaiP(pdg.getLoaiP());
            
            return mapping.findForward("update");
        } else {
            boolean x = false;
            pdg.setMaGD(null);
            pdg.setMaGV(null);
            pdg.setMaKhoa(null);
            pdg.setLoaiP(frm.getLoaiP());
            pdg.setTieuDe(frm.getTieuDe());
            pdg.setTrangThai(frm.getTrangThai().equals("on")?"1":"0");
            pdg.setHocKy("");
            pdg.setNienKhoa("");
            
            if ("GD_aaa".equals(submit)) {
                pdg.setMaGD(frm.getMaGD());
                pdg.setHocKy(frm.getHocKy());
                pdg.setNienKhoa( frm.getNienKhoaSub());
            } else if ("GV_aaa".equals(submit)) {
                pdg.setMaGV(frm.getMaGV());
            } else if ("KH_aaa".equals(submit)) {
                pdg.setMaKhoa(frm.getMaKhoa());
            }
            x = bo.phieuDanhGia.update(pdg);
            
            String maCopy = frm.getMaCopy();
            
            //Nếu mã copy khác rỗng. Thì tiến hành copy phiếu
            
            if("".equals(maCopy) != true && x == true){
                //Xóa tất cả nội dung, chi tiết nd, nội dung con hiện tại
                
                bo.noiDung.remove("maDG = '"+pdg.getMaDG()+"'");
                
                //Lấy phiếu muốn copy
                PhieuDanhGia pdgCopy = bo.phieuDanhGia.find("maDG = '"+maCopy+"'");
                
                if(pdgCopy!=null){
                    ArrayList<NoiDung> ndCopy = bo.noiDung.where("where maDG = '"+pdgCopy.getMaDG()+"'");
                    
                    for(NoiDung nd : ndCopy){
                        
                        if(x == false){
                            break;
                        } else {
                            
                        //Copy nội dung
                        x = bo.noiDung.add(new NoiDung(pdg.getMaDG(), nd.getTieuDe(), nd.getViTri()));
                        if(x == false){
                            break;
                        } else {
                            
                            //Lấy nội dung vừa thêm
                            NoiDung ndThem = bo.noiDung.where("order by MaNDu desc").get(0);
                            
                            ArrayList<ChiTietNoiDung> ctndCopy = bo.chiTietNoiDung.where("where maNDu = '"+nd.getMaNDu()+"'");
                            
                            for(ChiTietNoiDung ctnd : ctndCopy){
                                
                                //Copy chi tiết nội dung
                              x =  bo.chiTietNoiDung.add(new ChiTietNoiDung(ndThem.getMaNDu(), ctnd.getMoTa(), ctnd.getLoaiCT(), ctnd.getViTri()));
                              if(x == false){
                                  break;
                              } else {
                                //Lấy chi tiết nội dung vừa thêm
                                ChiTietNoiDung ctndThem = bo.chiTietNoiDung.where("order by MaCT desc").get(0);
                                
                                ArrayList<NoiDungCon> ndcCopy = bo.noiDungCon.where("where maCT = '"+ctnd.getMaCT()+"'");
                                
                                for(NoiDungCon ndc : ndcCopy){
                                    
                                    //Copy nội dung con
                                     x = bo.noiDungCon.add(new NoiDungCon(ctndThem.getMaCT(), ndc.getTieuDe(), ndc.getViTri()));
                                     if(x == false){
                                         break;
                                     }
                                 }
                               }
                             }
                          }
                       }
                   }
                    if(x == false){
                        //Trong quá trình xảy ra lỗi
                       bo.noiDung.remove("maDG = '"+pdg.getMaDG()+"'");
                    }
                }
            }
            
            
            if (x) {
                return mapping.findForward("list");
            } else {
                request.setAttribute("pageReturn", "qlPhieuDanhGia.do");
                return mapping.findForward("error");
            }

        }
    }
}