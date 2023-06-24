package model.bean;

import java.util.ArrayList;

public class DKHPSupport {
    private ArrayList<GiangDay> dsMonHoc = new ArrayList<GiangDay>();
    private ArrayList<GiangDay> dsDKHP = new ArrayList<GiangDay>();
    private ArrayList<GiangDay> dsDKHPSS = new ArrayList<GiangDay>();

    public ArrayList<GiangDay> getDsMonHoc() {
        return dsMonHoc;
    }

    public void setDsMonHoc(ArrayList<GiangDay> dsMonHoc) {
        this.dsMonHoc = dsMonHoc;
    }

    public ArrayList<GiangDay> getDsDKHP() {
        return dsDKHP;
    }

    public void setDsDKHP(ArrayList<GiangDay> dsDKHP) {
        this.dsDKHP = dsDKHP;
    }

    public ArrayList<GiangDay> getDsDKHPSS() {
        return dsDKHPSS;
    }

    public void setDsDKHPSS(ArrayList<GiangDay> dsDKHPSS) {
        this.dsDKHPSS = dsDKHPSS;
    }

    public DKHPSupport(ArrayList<GiangDay> dsMonHoc,
            ArrayList<GiangDay> dsDKHP, ArrayList<GiangDay> dsDKHPSS) {
        super();
        this.dsMonHoc = dsMonHoc;
        this.dsDKHP = dsDKHP;
        this.dsDKHPSS = dsDKHPSS;
    }
    
}