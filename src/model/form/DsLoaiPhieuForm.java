package model.form;

import java.util.ArrayList;

import model.bean.LoaiPhieu;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DsLoaiPhieuForm extends ActionForm {
	private ArrayList<LoaiPhieu> dsLoaiPhieu;

    public ArrayList<LoaiPhieu> getDsLoaiPhieu() {
        return dsLoaiPhieu;
    }

    public void setDsLoaiPhieu(ArrayList<LoaiPhieu> dsLoaiPhieu) {
        this.dsLoaiPhieu = dsLoaiPhieu;
    }
	
}
