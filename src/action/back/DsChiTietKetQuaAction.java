package action.back;

import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsChiTietKetQuaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if (!"".equals(testAdm(request))) {
            return mapping.findForward(url);
        }

        DanhSachChiTietKetQuaForm frm = (DanhSachChiTietKetQuaForm) form;
        BO bo = new BO();
        String maKQ = frm.getMaKQ().trim();

        if ("".equals(maKQ) || maKQ == null) {
            return mapping.findForward("notFound");
        }
        
        KetQua kq = bo.ketQua.find("MaKQ = '" + maKQ + "'");
        ArrayList<NoiDung> ndl = bo.noiDung.where("where MaDG = '" + kq.getMaDG() + "'");
        ArrayList<ChiTietNoiDung> ctndl = bo.chiTietNoiDung.getList();
        ArrayList<ChiTietKetQua> ctkql = bo.chiTietKetQua.where("where MaKQ = '" + maKQ + "'");
        
        PhieuDanhGia pdg = bo.phieuDanhGia.find("MaDG = '" + kq.getMaDG() + "'");
        pdg.setNguoiDung(bo.nguoiDung.find("MaND = '" + pdg.getMaNguoiTao() + "'"));
        
        
        for(NoiDung nd: ndl){
            nd.includeChiTietNoiDung(ctndl);
            for(ChiTietNoiDung ctnd: nd.getListChiTietNoiDung()){
                ctnd.includeChiTietKetQua(ctkql);
                for(ChiTietKetQua ctkq: ctnd.getListChiTietKetQua()){
                    if(testExist(ctkq.getKetQuaDG(), frm.getDsThongKe()) == false){
                        frm.getDsThongKe().add(new Route(ctkq.getKetQuaDG(),"0"));
                    }
                }
            }
            
        }
        
        frm.setDsNoiDung(ndl);
        frm.setPhieuDanhGia(pdg);
        
        return mapping.findForward("list");
    }
    
    private boolean testExist(String x, ArrayList<Route> routeL){
        for(Route route : routeL){
            if(x.equals(route.getX())){
                route.setY((Integer.parseInt(route.getY())+1)+"");
                return true;
            }
        }
        return false;
    }
}