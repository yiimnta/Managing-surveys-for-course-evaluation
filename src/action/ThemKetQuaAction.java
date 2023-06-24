package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import model.bean.*;
import model.bo.*;

import org.apache.struts.action.*;
import org.codehaus.jackson.map.ObjectMapper;

import Parse.ParseValue;
import model.form.*;

public class ThemKetQuaAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        KetQuaForm frm = (KetQuaForm) form;
        BO bo = new BO();
        ParseValue parse = new ParseValue();
        PrintWriter out = response.getWriter();
        NguoiDung nd = (NguoiDung) request.getSession().getAttribute(
                "userLogin");
        if (!parse.checkEmpty(frm.getMaDG())) {
            if (bo.ketQua.add(new KetQua(frm.getMaDG(), nd.getMaND(),
                    ParseValue.getTimeNow()))) {
                KetQua ketQuaMoi = bo.ketQua.where("order by MaKQ desc").get(0);
                String maKQ = ketQuaMoi.getMaKQ();

                ketQuaMoi.setListChiTietKetQua(bo.chiTietKetQua
                        .where("where MaKQ = '" + maKQ + "'"));
                
                ObjectMapper mapper = new ObjectMapper();
                String listRoute = request.getParameter("listRoute");
                System.out.println(listRoute);

                List<Route> listR = mapper.readValue(
                        listRoute, mapper.getTypeFactory().constructCollectionType(
                                List.class, Route.class));
                int soLuong = 0;
                
                ArrayList<NoiDung> ndl = bo.noiDung.where("where maDG='"+frm.getMaDG()+"'");
                for(NoiDung noiDung: ndl){
                    noiDung.includeChiTietNoiDung(bo.chiTietNoiDung.where("where maNDu='"+noiDung.getMaNDu()+"'"));
                    for(ChiTietNoiDung ctnd: noiDung.getListChiTietNoiDung()){
                        if(!"2".equals(ctnd.getLoaiCT())){
                            soLuong++;
                        }
                    }
                }
                System.out.println(soLuong);
                if(soLuong <= listR.size()){
                    for (Route route : listR) {
                        if (!bo.chiTietKetQua.add(new ChiTietKetQua(maKQ, route
                                .getX(), route.getY()))) {
                            bo.ketQua.remove("MaKQ = '" + maKQ + "'");
                            out.print("false");
                            return null;
                        }
                    }
                    out.print("true");
                }else {
                    out.print("0");
                }
                
            } else {
                out.print("false");
            }
        } else {
            out.print("false");
        }

        return null;
    }
}