package action.back;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bean.PhieuDanhGia;
import model.bo.*;

import org.apache.struts.action.*;

import com.google.gson.Gson;

import model.form.*;

public class LayDanhSachPhieuCopyAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
     
        DanhSachPhieuDanhGiaForm frm = (DanhSachPhieuDanhGiaForm)form;
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String maLoai = frm.getMaLoai();
        BO bo = new BO();
        ArrayList<PhieuDanhGia> pdgl = bo.phieuDanhGia.where("where loaiP = '"+maLoai+"'"); 
        
        out.print(new Gson().toJson(pdgl));
        return null;
       
    }
}