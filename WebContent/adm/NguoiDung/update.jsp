<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<div class="row">
	<div class="col-md-12">	
	<div id="main-container" class="container">
	<html:errors/>
	<h3 class="main-heading text-center" style="margin-left:-120px;">
		CẬP NHẬT THÔNG TIN NGƯỜI DÙNG
	</h3>
	
	<html:form action="/suaNguoiDung" method="post">
	<!-- định nghĩa 1 số biến cần thiết -->
	
		<bean:define id="ngaySinh" name="nguoiDungForm" property="ngaySinh" />
		<bean:define id="maLop" name="nguoiDungForm" property="maLop" />
		
	<!-- kết thúc định nghĩa -->
		
	<div class="form-horizontal">
		<hr style="border:3px solid black;width:900px;margin-left:50px;">
		<h3 class="panel-heading inner">Thông tin</h3>
		<div class="form-group">
			<label class = "col-md-2 control-label">Tài khoản </label>
			<div class="col-sm-7">
				<html:text property="maDN" styleClass="form-control" readonly="true"/>
			</div>
		</div>
		<div class="form-group">
				<label class = "control-label col-md-2"> Họ tên *</label>
				<div class="col-sm-7">
					<html:text property="hoTen" styleClass="form-control"  />
					<html:errors property="hoTen" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Email *</label>
				<div class="col-sm-7">
					<html:text property="email" styleClass="form-control" />
					<html:errors property="email" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Ngày sinh * </label>
				<div class="col-sm-7">
					<input type="date" name="ngaySinh" class="form-control" value="${ngaySinh}"/>
					<html:errors property="ngaySinh" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Địa chỉ * </label>
				<div class="col-sm-7">
					<html:text property="diaChi" styleClass="form-control"/>
					<html:errors property="diaChi" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> SĐT * </label>
				<div class="col-sm-7">
					<html:text property="sdt" styleClass="form-control" />
					<html:errors property="sdt" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Lớp </label>
				<div class="col-sm-7">
					<logic:notEmpty  name="nguoiDungForm" property="dsLop">
				       <html:select property="maLop" styleClass="form-control" value="${maLop}">
								<html:option value="">--- Chọn Lớp học ---</html:option>
								<html:optionsCollection name="nguoiDungForm" property="dsLop" label="ten" value="maLop" />
							</html:select>
			        </logic:notEmpty>
			        <logic:empty  name="nguoiDungForm" property="dsLop">
			        	<span>Hiện tại chưa có Lớp học nào!<br/>
			        	Vui lòng thêm mới Lớp học tại </span><a href="qlKhoaHoc.do">đây</a>
			        </logic:empty>
					<html:errors property="maLop" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Admin </label>
				<div class="col-sm-7">
					<logic:equal value="1" name="nguoiDungForm" property="loaiND" >
						<input type="checkbox" name="loaiND" style="height: 30px;" checked/>
					</logic:equal>
					<logic:equal value="0" name="nguoiDungForm" property="loaiND" >
						<input type="checkbox" name="loaiND" style="height: 30px;"/>
					</logic:equal>
					<html:errors property="loaiND" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Mật khẩu </label>
				<div class="col-sm-9">
					<a href="#" data-toggle="modal" data-target="#myPass">[Thay đổi mật khẩu]</a>			
				</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-7">
				<button type="submit" name="submit" class="btn" style="background:black;color:white;" value="aaa">
					Cập nhật
				</button>
				<button type="reset" class="btn" style="background:black;color:white;">
					Làm cũ
				</button>
				<a class="btn btn-primary" href="qlNguoiDung.do">
					Về danh sách
				</a>
				<span style="float:right;" class="control-label"> *: là trường không được để trống</span>
			</div>
			
		</div>
		<!-- Modal -->
	</div>
	</html:form>
	</div>
	</div>
</div>
<!-- pop up  doi mat khau -->
<div class="modal fade bs-example-modal-lg" id="myPass" role="dialog">
		<div class="modal-dialog modal-lg" role="document" style="z-index:10000;">
			<div class="modal-content" style="padding:0 50px 0 50px;">
				<div class="modal-header">
					<button type="button" class="close close-popup" data-dismiss="modal"
						aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Thay đổi mật khẩu</h4>
					</div>
			<div class="modal-body">
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
		
			<div class="modal-footer">
				<bean:define id="maND" name="nguoiDungForm" property="maND" />
				<button type="button" id="savePass" class="btn btn-warning" style="padding:5px 30px 5px 30px;" data-action="tdPassword.do" data-id="${maND}">Lưu lại</button>
				<button type="button" class="btn btn-default" style="padding:5px 30px 5px 30px;" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>
<!-- ket thuc pop up doi mat khau -->
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
				$('.close-popup').click();
				alert("Thay đổi mật khẩu thành công!");
			}else{
				alert(result);
			}
		});
	});
	</script>