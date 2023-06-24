package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachGiangDayForm extends ActionForm {
	private ArrayList<GiangDay> dsGiangDay;

    public ArrayList<GiangDay> getDsGiangDay() {
        return dsGiangDay;
    }

    public void setDsGiangDay(ArrayList<GiangDay> dsGiangDay) {
        this.dsGiangDay = dsGiangDay;
    }
	
}
