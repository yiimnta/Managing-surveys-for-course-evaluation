package action.back;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;
import model.bean.*;

public class XoaKhoaAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        KhoaHocForm frm = (KhoaHocForm) form;
        BO bo = new BO();
        PrintWriter out = response.getWriter();
        boolean test = bo.phieuDanhGia.removeForeign("MaKhoa = '"
                + frm.getMaKhoa() + "'");
        if (test) {
            Khoa khoa = bo.khoa.find("maKhoa='" + frm.getMaKhoa() + "'");
            khoa.includeLop(bo.lop.getList());
            ArrayList<NguoiDung> ndl = bo.nguoiDung.getList();
            for (Lop l : khoa.getListLop()) {
                bo.giangDay.remove("maLop='" + l.getMaLop() + "'");
                l.includeNguoiDung(ndl);
                for(NguoiDung nd : l.getListNguoiDung()){
                    bo.phieuDanhGia.removeForeign("MaNguoiTao='"+nd.getMaND()+"'");
                }
            }
            out.print(bo.khoa.remove("maKhoa = '" + frm.getMaKhoa() + "'"));
        }
        return null;
    }
}