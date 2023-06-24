package model.form;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.*;

import Parse.ParseValue;

@SuppressWarnings("serial")
public class GopYForm extends ActionForm {
    private String maGY;
    private String tieuDe;
    private String noiDung;
    private String submit = "";

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getMaGY() {
        return maGY;
    }

    public void setMaGY(String maGY) {
        this.maGY = maGY;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }
    
    @Override
    public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if(!"".equals(submit)){
            ParseValue parse = new ParseValue();
            if(parse.checkEmpty(tieuDe)){
                errors.add("tieuDe",new ActionMessage("error.Empty","Tiêu đề"));
            }
            
            if(parse.checkEmpty(noiDung)){
                errors.add("noiDung",new ActionMessage("error.Empty","Nội dung"));
            }
        }
        return errors;
    }
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        request.setAttribute("typeBackground","lightgreen");
        request.setAttribute("typePage","blog");
        tieuDe = "";
        noiDung = "";
        submit = "";
        super.reset(mapping, request);
    }

}
