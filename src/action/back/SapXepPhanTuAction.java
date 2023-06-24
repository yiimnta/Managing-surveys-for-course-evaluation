package action.back;

import java.io.PrintWriter;

import javax.servlet.http.*;

import model.bo.*;

import org.apache.struts.action.*;

import model.form.*;

public class SapXepPhanTuAction extends AdmAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
     
        DanhSachNoiDungForm frm = (DanhSachNoiDungForm)form;
        StringBuffer query = new StringBuffer();
        String tableName = "NoiDung";
        String columnKey = "MaNDu";
        String pQuery = "";
        
        if("CT".equals(frm.getLoaiSX())){
            tableName = "ChiTietNoiDung";
            columnKey = "MaCT";
            pQuery = ", MaNDu ='"+frm.getParrentId()+"' ";
        }else if("NDC".equals(frm.getLoaiSX())){
            tableName = "NoiDungCon";
            columnKey = "MaNDC";
            pQuery = ", MaCT ='"+frm.getParrentId()+"' ";
        } 
        
        int x = 1;
        for(String ele: frm.getListVitri().split(",")){
            query.append("Update "+tableName+" set ViTri = '"+x+"'"+pQuery+" where "+columnKey+"='"+ele+"' \n");
            x++;
        }
        System.out.println(query.toString());
        PrintWriter out = response.getWriter();
        out.print(BO.executeSqlUpdate(query.toString()));
        return null;
       
    }
}