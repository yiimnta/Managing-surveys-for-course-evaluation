package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class SideBarForm extends ActionForm {
    private ArrayList<KetQua> dsPhieuDanhGiaDGNhieu;
    private ArrayList<LoaiPhieu> dsLoaiPhieu;

    public ArrayList<KetQua> getDsPhieuDanhGiaDGNhieu() {
        return dsPhieuDanhGiaDGNhieu;
    }

    public void setDsPhieuDanhGiaDGNhieu(
            ArrayList<KetQua> dsPhieuDanhGiaDGNhieu) {
        this.dsPhieuDanhGiaDGNhieu = dsPhieuDanhGiaDGNhieu;
    }

    public ArrayList<LoaiPhieu> getDsLoaiPhieu() {
        return dsLoaiPhieu;
    }

    public void setDsLoaiPhieu(ArrayList<LoaiPhieu> dsLoaiPhieu) {
        this.dsLoaiPhieu = dsLoaiPhieu;
    }

}
