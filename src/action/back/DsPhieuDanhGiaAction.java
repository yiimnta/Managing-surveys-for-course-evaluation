package action.back;


import java.util.*;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsPhieuDanhGiaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DanhSachPhieuDanhGiaForm frm = (DanhSachPhieuDanhGiaForm)form;
        
        BO bo = new BO();
        
        frm.setDsPhieuDanhGia(bo.phieuDanhGia.getList());
        ArrayList<GiangDay> gdl = bo.giangDay.getList();
        ArrayList<NoiDung> ndl = bo.noiDung.getList();
        ArrayList<GiangVien> gvl = bo.giangVien.getList();
        ArrayList<MonHoc> mhl = bo.monHoc.getList();
        ArrayList<Lop> lopl = bo.lop.getList();
        ArrayList<Khoa> khoal = bo.khoa.getList();
        ArrayList<LoaiPhieu> lpl = bo.loaiPhieu.getList();
        ArrayList<NguoiDung> adml = bo.nguoiDung.getList();
        
        for(PhieuDanhGia dg : frm.getDsPhieuDanhGia()){
             dg.includeNoiDung(ndl);
             dg.includeLoaiPhieu(lpl);
             if(!"".equals(dg.getMaKhoa())){
                 dg.includeKhoaHoc(khoal);
             }else if(!"".equals(dg.getMaGV())){
                 dg.includeGiangVien(gvl);
             }else if(!"".equals(dg.getMaGD())){
                 dg.includeGiangDay(gdl);
                 dg.getGiangDay().includeGiangVien(gvl);
                 dg.getGiangDay().includeLop(lopl);
                 dg.getGiangDay().includeMonHoc(mhl);
             }
             dg.includeNguoiDung(adml);
        }
        
        return mapping.findForward("list");
    }
}