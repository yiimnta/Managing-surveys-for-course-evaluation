package model.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.*;

import Parse.ParseValue;


public class LoginForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private String submit = "";
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
		    
		    if(parse.checkEmpty(userName)){
		        errors.add("userName", new ActionMessage("error.Empty","Tài khoản"));
		    }
		    
		    if(parse.checkEmpty(password)|| password.split(" ").length > 1) {
                errors.add("password", new ActionMessage("error.Empty","Mật khẩu"));
            }
		}
		return errors;
	}
	
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		super.reset(mapping, request);
	}
}
