package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachKetQuaForm extends ActionForm {
	private ArrayList<KetQua> dsKetQua;

    public ArrayList<KetQua> getDsKetQua() {
        return dsKetQua;
    }

    public void setDsKetQua(ArrayList<KetQua> dsKetQua) {
        this.dsKetQua = dsKetQua;
    }
	
}
