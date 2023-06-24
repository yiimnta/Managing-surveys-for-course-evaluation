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
<title>Quản lý hệ thống- Đánh giá dạy và học khoa CNTT</title>
<link rel="stylesheet" href="css/bootstrap-3.3.0.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/AdmSite.css">
<link rel="stylesheet" href="css/AdmGrid.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.dataTables.css">
<link rel="stylesheet" href="css/plugins/chosen/chosen.css">
<link rel="stylesheet" href="css/plugins/iCheck/custom.css">
<script type="text/javascript" src="js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="js/cheapdeal.js"></script>
<script type="text/javascript" src="js/respond.js"></script>
<script type="text/javascript"
	src="js/plugins/metismenu/jquery.metisMenu.js"></script>
<script type="text/javascript"
	src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="js/plugins/chosen/chosen.jquery.js"></script>
</head>
<logic:empty name="userLogin" scope="session">
	 <script>
	 	location.href="login_form.do";
	 </script>
</logic:empty>
<body>
	<div id="wrapper">
		<!-- inlude navigation -->
			<tiles:insert attribute="navigation" />
		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<!-- include navbarheader -->
				<tiles:insert attribute="navBarHeader" />
			</div>

			<div class="row wrapper border-bottom white-bg page-heading">
				<tiles:insert attribute="pageHeader" />
			</div>
			<div class=" wrapper wrapper-content">
				<tiles:insert attribute="body" />
			</div>
			<footer> <tiles:insert attribute="footer" /> </footer>
		</div>
	</div>
</body>
<!-- <script type="text/javascript">
$('.i-check').iCheck({
	checkboxClass: 'icheckbox_square-green'
})

window.setInterval(function(){loadReportcomment()}, 15000);

function loadReportcomment(){
	$.post('loadReportComment.do',function(args){
		var data = args.split('$%$');
		var numberComment = data[0];
		
		$('#numberCommentNew').html(numberComment);
		
		var contentComment = '';
			for(var i=1; i< data.length -1 ; i++){
				var dataSP = data[i].split('!@#');
				contentComment+=''
					+'<li><div class="dropdown-messages-box">'
					+'<a href="showListComment.do?productId='+dataSP[0]+'" class="pull-left">'
						+'<img class="img-circle" src="'+dataSP[1]+'">'
					+'</a>'
					+'<div class="media-body">'
						+'<small class="pull-right">'+dataSP[2]+' phút trước </small>'
						+'<strong>'+dataSP[3]+'</strong><br/> '+dataSP[4]+' <br/>'
						+'<strong>Nội dung:</strong> '+dataSP[5]+''
						+'<br />'
					+'</div></div>'
				+'</li>'
				+'<li class="divider"></li>';
			}
		contentComment+='<li><div class="text-center link-block">'
						+'<i class="fa fa-envelope"></i><strong> Các tin nhắn mới nhất'
						+''
						+'</strong>'
						+'</div>'
					 	+'</li>';
		$('#contentCommentNew').html(contentComment);
	});
}
loadReportcomment();

</script> -->
</html>