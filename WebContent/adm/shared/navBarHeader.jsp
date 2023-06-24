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
</head>
<body>
	<bean:define id="fullName" name="userLogin" scope="session" property="hoTen" />
	<nav class="navbar navbar-static-top"
		 role="navigation" style="margin-bottom: 0;">
		<div class="navbar-header">
			<a href="#" class="navbar-minimalize minimalize-styl-2 btn btn-primary">
				<i class="fa fa-bars" ></i>
			</a>
			<!-- Lam tim kiem o day -->
		</div>
		<!--Hop thu thong bao, link dang xuat-->
		<ul class="nav navbar-top-links navbar-right" >
			<!--loi chao-->
			<li>
				<span class="m-r-sm text-muted welcome-message">
					Xin chào <strong>${fullName}</strong>
				</span>
			</li>

				<!--Thống kê các hoạt động-->
				<li class="dropdown">
				<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
					<i class="fa fa-envelope" ></i>
					<span class="label label-warning" id="numberCommentNew">Loading....</span>
				</a>
				<ul class="dropdown-menu dropdown-messages" id="contentCommentNew">
					
				</ul>
				</li>
					<!--Nút đăng xuất-->
				<li>
						<a href="logOut.do">Đăng xuất</a>
				</li>
			</ul>
		</nav>
</body>
</html>