package action.back;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;
import model.bean.*;

import org.apache.struts.action.*;

import Parse.ParseValue;
import model.form.*;

public class ThemPhieuDanhGiaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }

        PhieuDanhGiaForm frm = (PhieuDanhGiaForm) form;
        BO bo = new BO();
        String submit = frm.getSubmit().trim();
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
            
            return mapping.findForward("add");
        } else {
            
            boolean x = false;
            NguoiDung currentUser = (NguoiDung)request.getSession().getAttribute("userLogin");
            PhieuDanhGia addObj = new PhieuDanhGia(frm.getTieuDe(),null, null, null, ParseValue.getTimeNow(),
                    frm.getTrangThai().equals("on") ? "1" : "0", frm
                            .getLoaiP(), currentUser.getMaND(), null, null);
            
            if ("GD".equals(submit)) {
                addObj.setMaGD(frm.getMaGD());
                addObj.setNienKhoa(frm.getNienKhoaSub());
                addObj.setHocKy(frm.getHocKy());
            } else if ("GV".equals(submit)) {
                addObj.setMaGV(frm.getMaGV());
            } else if ("KH".equals(submit)) {
                addObj.setMaKhoa(frm.getMaKhoa());
            }
            //Thêm phiếu mới
            x = bo.phieuDanhGia.add(addObj);
            
            
            
            String maCopy = frm.getMaCopy();
            
            //Nếu mã copy khác rỗng. Thì tiến hành copy phiếu
            
            if("".equals(maCopy) != true && x == true){
                
              //Lấy phiếu vừa thêm
                PhieuDanhGia pdgnow = bo.phieuDanhGia.where("order by MaDG desc").get(0);
                
                //Lấy phiếu muốn copy
                PhieuDanhGia pdgCopy = bo.phieuDanhGia.find("maDG = '"+maCopy+"'");
                
                if(pdgCopy!=null){
                    ArrayList<NoiDung> ndCopy = bo.noiDung.where("where maDG = '"+pdgCopy.getMaDG()+"'");
                    
                    for(NoiDung nd : ndCopy){
                        
                        if(x == false){
                            break;
                        } else {
                            
                        //Copy nội dung
                        x = bo.noiDung.add(new NoiDung(pdgnow.getMaDG(), nd.getTieuDe(), nd.getViTri()));
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
                        bo.phieuDanhGia.remove(pdgnow);
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