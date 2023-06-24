<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<div class="row">
	<div class="col-md-12">	
	<div id="main-container" class="container">
	<h3 class="main-heading text-center" style="margin-left:-120px;">
		THÊM NGƯỜI DÙNG MỚI
	</h3>
	<html:form action="/themNguoiDung" method="post">
	<div class="form-horizontal">
		<hr style="border:3px solid black;width:900px;margin-left:50px;">
		<h3 class="panel-heading inner">Thông tin</h3>
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
					<input type="date" name="ngaySinh" class="form-control" />
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
					       <html:select property="maLop" styleClass="form-control">
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
					<html:checkbox property="loaiND" style="height: 30px;"/>
					<html:errors property="loaiND" />
				</div>
		</div>
		
		<hr style="border:3px solid black;width:900px;margin-left:50px;">
		<h3 class="panel-heading inner">Tài khoản</h3>
		<div class="form-group">
			<label class = "col-md-2 control-label">Tài khoản *</label>
			<div class="col-sm-7">
				<html:text property="maDN" styleClass="form-control" />
				<html:errors property="maDN"/>
			</div>
		</div>
		<!-- Password Area Starts -->
		<div class="form-group">
			<label class = "col-md-2 control-label">Mật khẩu *</label>
			<div class="col-sm-7">
				<html:password property="matKhau" styleClass="form-control" />
				<html:errors property="matKhau"/>
			</div>
		</div>
		<div class="form-group">
			<label class = "col-md-2 control-label">Nhập lại mật khẩu *</label>
				<div class="col-sm-7">
					<html:password property="nhapLaiMK" styleClass="form-control" />
					<html:errors property="nhapLaiMK"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-7">
				<button type="submit" name="submit" class="btn" style="background:black;color:white;" value="Đăng ký">
					Thêm mới
				</button>
				<button type="reset" class="btn" style="background:black;color:white;">
					Làm mới
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