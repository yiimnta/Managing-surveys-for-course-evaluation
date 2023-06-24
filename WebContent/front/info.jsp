<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<style>
	.info {
	  font-family:  Helvetica, Arial, "Helvetica Neue","open sans", sans-serif;
	  font-size: 13px;
	  color: #676a6c;
	  overflow-x: hidden;
	  background:white;
	  padding:50px 20px 50px 0;
	  margin-left:15px;
	}
	.form-control, .single-line {
	  background-color: #FFFFFF;
	  background-image: none;
	  border: 1px solid #e5e6e7;
	  border-radius: 1px;
	  color: inherit;
	  display: block;
	  padding: 6px 12px;
	  transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
	  width: 100%;
	  font-size: 14px;
	}
	.form-control:focus, .single-line:focus {
	  border-color: #1ab394;
	}
	.control-label{
		margin-left:40px!important;
	}
</style>

 <ul class="nav nav-tabs info" role="tablist" style="padding:0px;width:277px;overflow-x:visible;">
 	<li role="presentation"  class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Thông tin cá nhân</a></li>
 	 <li role="presentation"><a href="#dkhp" aria-controls="dkhp" role="tab" data-toggle="tab">Đăng ký học phần</a></li>
 </ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="profile">
	<div class="info">
	 <div class="row">
		<div class="col-md-12">	
		<div id="main-container">
		<h3 class="main-heading text-center" style="margin:0 0 0 -120px;">
			THÔNG TIN NGƯỜI DÙNG
		</h3>
		
		<html:form action="/info" method="post">
		<!-- định nghĩa 1 số biến cần thiết -->
		
			<bean:define id="ngaySinh" name="nguoiDungForm" property="ngaySinh" />
			<bean:define id="maLop" name="nguoiDungForm" property="maLop" />
			
		<!-- kết thúc định nghĩa -->
			
		<div class="form-horizontal">
			<hr style="border:3px solid black;width:700px;margin-left:50px;">
			<div class="form-group">
				<label class = "col-md-2 control-label">Tài khoản </label>
				<div class="col-sm-8">
					<html:text property="maDN" styleClass="form-control" readonly="true"/>
				</div>
			</div>
			<div class="form-group">
					<label class = "control-label col-md-2"> Họ tên *</label>
					<div class="col-sm-8">
						<html:text property="hoTen" styleClass="form-control"  />
						<html:errors property="hoTen" />
					</div>
			</div>
			
			<div class="form-group">
					<label class = "control-label col-md-2"> Email *</label>
					<div class="col-sm-8">
						<html:text property="email" styleClass="form-control" />
						<html:errors property="email" />
					</div>
			</div>
			
			<div class="form-group">
					<label class = "control-label col-md-2"> Ngày sinh * </label>
					<div class="col-sm-8">
						<input type="date" name="ngaySinh" class="form-control" value="${ngaySinh}"/>
						<html:errors property="ngaySinh" />
					</div>
			</div>
			
			<div class="form-group">
					<label class = "control-label col-md-2"> Địa chỉ * </label>
					<div class="col-sm-8">
						<html:text property="diaChi" styleClass="form-control"/>
						<html:errors property="diaChi" />
					</div>
			</div>
			
			<div class="form-group">
					<label class = "control-label col-md-2"> SĐT * </label>
					<div class="col-sm-8">
						<html:text property="sdt" styleClass="form-control" />
						<html:errors property="sdt" />
					</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" name="submit" class="btn" style="background:black;color:white;" value="aaainfo">
						Cập nhật
					</button>
					<button type="reset" class="btn" style="background:black;color:white;">
						Làm cũ
					</button>
					<span style="float:right;" class="control-label"> *: là trường không được để trống</span>
				</div>
				
			</div>
			<!-- Modal -->
		</div>
		</html:form>
		</div>
		</div>
	</div>
	</div>
	<!-- pop up  doi mat khau -->
	<div class="bs-example-modal-lg" id="myPass" style="margin-left:15px;" role="dialog">
			<div class="modal-dialog modal-lg" role="document" style="z-index:1000;">
				<div class="modal-content" style="padding:0 50px 0 50px;">
					<div class="modal-header">
						<button type="button" class="close close-popup" data-dismiss="modal"
							aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Thay đổi mật khẩu</h4>
						</div>
				<div class="modal-body" style="width:700px;">
					<div class="form-group has-success">
					  <label class="control-label" for="inputSuccess1">Mật
							khẩu cũ *</label>
					 	<input type="password" id="passOld" class="form-control" />
					</div>
					<div class="form-group has-warning">
					  <label class="control-label" for="inputWarning1">Mật khẩu mới *</label>
					  <input type="password" id="passNew" class="form-control" />
					</div>
					<div class="form-group has-error">
					  <label class="control-label" for="inputError1">Nhập lại mật khẩu *</label>
					 <input type="password" id="passRetype" class="form-control" />
					</div>
				</div>
			
				<div class="modal-footer" style="width:700px;">
					<bean:define id="maND" name="userLogin" property="maND" scope="session"/>
					<button type="button" id="savePass" class="btn btn-warning" style="padding:5px 30px 5px 30px;" data-action="tdPassword.do" data-id="${maND}">Lưu lại</button>
				</div>
			</div>
		</div>
	</div>
  </div>
   <jsp:include page="/dkhp.do"/>
</div>
<script type="text/javascript">
	$('#savePass').click(function(){
		var passOld = $("#passOld").val();
		var passNew = $("#passNew").val();
		var passRetype = $("#passRetype").val();
		var action = $("#savePass").attr("data-action");
		var mnd = $("#savePass").attr("data-id");
		$.post(action+"?maND="+mnd+"&passOld="+passOld+"&passNew="+passNew+"&passRetype="+passRetype, function(result){
			if (result==""){
				$("#passOld").val("");
				$("#passNew").val("");
				$("#passRetype").val("");
				alert("Thay đổi mật khẩu thành công!");
			}else{
				alert(result);
			}
		});
	});
	</script>