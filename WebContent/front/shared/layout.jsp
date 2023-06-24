<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đánh giá dạy và học khoa CNTT</title>
<link rel="stylesheet" href="css/bootstrap-3.3.0.min.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="css/styleFront.css" type="text/css">
<script type="text/javascript" src="js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<logic:empty name="userLogin" scope="session">
	 <script>
	 	location.href="login_form.do";
	 </script>
</logic:empty>
<body>
	<bean:define id="typeBackground" name="typeBackground" scope="request"/>
	<bean:define id="typePage" name="typePage" scope="request"/>
	<div id="background-${typeBackground}">
	</div>
	<div class="page">
		<div class="${typePage}-page">
			<div style="float:right;margin-right:20px;border-radius:3px;color:white;padding:5px;"><span style="color:#26bcb3;">Xin chào </span><b><bean:write name="userLogin" scope="session" property="hoTen" /></b> - <a style="color:orange;" href="logOut.do">Đăng xuất</a>
				<logic:equal value="1" name="userLogin" scope="session" property="loaiND">
					<br/><a href="qlAdmin.do" style="float:right; color:white;"> Quản lý </a>
				</logic:equal>
			</div>
			<tiles:insert attribute="navigation" />
			<div class="body">
				<tiles:insert attribute="body" />
				<tiles:insert attribute="footer" />
			</div>
		</div>
	</div>
</body>
</html>