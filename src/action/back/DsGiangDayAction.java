package action.back;


import java.util.*;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class DsGiangDayAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(!"".equals(testAdm(request))){
            return mapping.findForward(url);
        }
        DanhSachGiangDayForm frm = (DanhSachGiangDayForm)form;
        BO bo = new BO();
        
        //Lấy danh sách Giang dạy, giảng viên, môn học và Lớp
        ArrayList<GiangDay> gdl = bo.giangDay.where("order by MaGD desc");
        ArrayList<GiangVien> gvl = bo.giangVien.getList();
        ArrayList<MonHoc> mhl = bo.monHoc.getList();
        ArrayList<Lop> lopl = bo.lop.getList();
        
        //Thực hiện include vào đối tượng Giảng dạy
        for(GiangDay gd: gdl){
            gd.includeGiangVien(gvl);
            gd.includeLop(lopl);
            gd.includeMonHoc(mhl);
        }
        
        frm.setDsGiangDay(gdl);
        return mapping.findForward("list");
    }
}