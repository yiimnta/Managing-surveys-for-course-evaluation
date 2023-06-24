<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<title>Thông báo</title>
</head>
	<body>
		<strong style="color:red;">Thao tác thất bại!!!</strong>		
		</br>
		<span>Chờ 5 giây để về lại trang quản lý ...</span><span id="sc" value="5">5<span>
		<span id="pageReturn" data-value="<bean:write name="pageReturn" scope="request"/>"></span>
	</body>
	<script>
	
		//setTimeout chạy 1 lần là dừng. Thời gian dc tính theo milisecond nên 5000 = 5s
		//trái vs setInterval là chạy liên tục
		var pageReturn = $('#pageReturn').attr('data-value');
		this.setTimeout(function(){window.location.href=pageReturn;},5000);
		this.setInterval(function(){
			var x = $("#sc").attr("value");
			$("#sc").html(--x);
			$("#sc").attr("value", x);
		},1000);
	</script>
</html>