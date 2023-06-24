<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="background:black;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
	 <link rel="stylesheet" href="css/styleLogin.css">
	<title>Đăng nhập hệ thống</title>
</head>
<body>
	<div class="wrapper">
	
		<div class="container">
		<img src="Images/logo_itfac.jpg" width="100" style="margin-top:-50px;" class="img-thumbnail" />
		<h3>DLU- CNTT</h3>
		<html:form action="/login_form" method="post" styleClass="form">
		<div style="width: 900px;display: inline-block;height: auto;" class="text-center">
			<div style="float:left;margin-left:175px;">
				<html:text property="userName" styleId="userNamePH" />
			</div>
			<div style="float:left;" class="hidden" id="idUserNameErr" >
				 <i class="glyphicon glyphicon-triangle-left" style="float:left;font-size:30px;margin-top:10px;"></i>
				 <div class="alert" style="height:48px;float:left;background:rgba(255, 255, 255, 0.2);border:1px solid white;">
				 	<div id="idUserName"><html:errors property="userName" /></div>
			 	</div>
			</div>
		</div>
		<div style="clear:both;"></div>
		<div style="width: 900px;display: inline-block;height: auto;" class="text-center">
			<div style="float:left;margin-left:175px;">
				<html:password property="password"  styleId="PasswordPH" /> 
			</div>
			<div style="float:left;" class="hidden" id="idPasswordErr">
				<i class="glyphicon glyphicon-triangle-left" style="float:left;font-size:30px;margin-top:10px;"></i>
				<div class="alert" style="height:48px;float:left;background:rgba(255, 255, 255, 0.2);border:1px solid white;">
					<div id="idPassword"><html:errors property="password" /></div>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div> 
		<div style="width: 900px;display: inline-block;height: auto;" class="text-center">
			<div style="float:left;margin-left:175px;">
				<html:submit property="submit" value="Đăng nhập"/>
			</div>
			<div style="float:left;" class="hidden" id="idLoginErr" >
					 <i class="glyphicon glyphicon-triangle-left" style="float:left;font-size:30px;margin-top:10px;"></i>
					 <div class="alert" style="height:48px;float:left;background:rgba(255, 255, 255, 0.2);border:1px solid white;">
					 	<div id="idLogin">
					 		<logic:notEmpty name="errorLogin" scope="request" >
					 				<strong style='color:red;'><bean:write name="errorLogin" scope="request" /></strong>
					 		</logic:notEmpty>
					 	</div>
				 	</div>
			</div>
		</div>
		</html:form>	
		
			
		<div style="position:absolute;top:375px;right:60px;"><span style="color:red;"><b>Quên mật khẩu</b></span>. Liên hệ: <b style="color:red;">chicky.master.ctk35@gmail.com (01677722105)</b></div>
 	</div>
	
	<ul class="bg-bubbles">
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
		<li></li><li></li><li></li>
	</ul>
</div>
</body>
<script src="js/jquery-2.1.3.js"></script>
<script>
	$('#userNamePH').attr('placeholder','Tài khoản');
	$('#PasswordPH').attr('placeholder','Mật khẩu');
	var x = $('#idUserName').text().trim();
	if(x!=""){
		$('#idUserNameErr').toggleClass("hidden");
	}
	var y = $('#idPassword').text().trim();
	if(y!=""){
		$('#idPasswordErr').toggleClass("hidden");
	}
	
	var z = $('#idLogin').text().trim();
	if(z!=""){
		$('#idLoginErr').toggleClass("hidden");
	}
	
</script>
</html>
