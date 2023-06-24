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
	 <div class="dropdown profile-element">
		<!--Anh dai dien-->
		<span >
			<img class="img-circle" 
				src="Images/umaru-2.png"
				  width="48px" height="48px">
		</span>

		<!--Ho tên và chức vụ-->
		<a data-toggle="dropdown" class="dropdown-toggle"
		   href="#">
			<span class="clear">
				<span class="block m-t-xs">
					<strong>
						<bean:write name="userLogin" scope="session" property="hoTen" />
					</strong>
				</span>

				<span class="text-muted text-xs block">
					Quản trị hệ thống
				</span>
			</span>
		</a>

		<!--Menu: Xem profile, doi pass, log out....-->
		<ul class="dropdown-menu animated fadeInRight m-t-xs">
			<li>
				<a href="#">Xem Profile</a>
			</li>
			<li>
				<a href="#">Đổi mật khẩu</a>
			</li>
			<li>
				<a href="#">Xem tin nhắn</a>
			</li>
			<li class="divider"></li>
			<li>
				<a href="logOut.do">
					Đăng xuất
				</a>
			</li>
		</ul>
    </div>
	<div class="logo-element">
		Yii
	</div>
</body>
</html>