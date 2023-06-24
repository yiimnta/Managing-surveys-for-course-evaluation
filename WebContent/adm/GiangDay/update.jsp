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
		CẬP NHẬT THÔNG TIN GIẢNG DẠY
	</h3>
	<html:errors property="exist"/>
	<html:form action="/suaGiangDay" method="post">
	<div class="form-horizontal">
		<hr style="border:3px solid black;width:900px;margin-left:50px;">
		<h3 class="panel-heading inner">Thông tin</h3>
		
		<!-- Định nghĩa 1 số biến cần thiết -->
		
		<bean:define id="id" name="giangDayForm" property="id" />
		<bean:define id="maGV" name="giangDayForm" property="maGV" />
		<bean:define id="maMH" name="giangDayForm" property="maMH" />
		<bean:define id="maLop" name="giangDayForm" property="maLop" />
		
		<!-- kết thúc định nghĩa -->
		<html:hidden property="id" value="${id}"/>
		<div class="form-group">
				<label class = "control-label col-md-2"> Giảng viên * </label>
				<div class="col-sm-7">
						<html:select property="maGV" styleClass="form-control" value="${maGV}">
							<html:option value="">--- Chọn Giảng viên ---</html:option>
							<html:optionsCollection name="giangDayForm" property="listGiangVien" label="hoTen" value="maGV" />
						</html:select>
						<html:errors property="maGV" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Môn học * </label>
				<div class="col-sm-7">
						<html:select property="maMH" styleClass="form-control" value="${maMH}">
							<html:option value="">--- Chọn Môn học ---</html:option>
							<html:optionsCollection name="giangDayForm" property="listMonHoc" label="ten" value="maMH" />
						</html:select>
						<html:errors property="maMH" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Lớp * </label>
				<div class="col-sm-7">
						<html:select property="maLop" styleClass="form-control" value="${maLop}">
							<html:option value="">--- Chọn Lớp học ---</html:option>
							<html:optionsCollection name="giangDayForm" property="listLop" label="ten" value="maLop" />
						</html:select>
						<html:errors property="maLop" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Mở HP </label>
				<div class="col-sm-7">
					<logic:equal value="1" name="giangDayForm" property="trangThai" >
						<input type="checkbox" name="trangThai" style="height: 30px;" checked/>
					</logic:equal>
					<logic:equal value="0" name="giangDayForm" property="trangThai" >
						<input type="checkbox" name="trangThai" style="height: 30px;"/>
					</logic:equal>
					<html:errors property="trangThai" />
				</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-7">
				<button type="submit" name="submit" class="btn" style="background:black;color:white;" value="aaa">
					Lưu lại
				</button>
				<button type="reset" class="btn" style="background:black;color:white;">
					Làm mới
				</button>
				<a class="btn btn-primary" href="qlGiangDay.do">
					Về danh sách
				</a>
				<span style="float:right;" class="control-label"> *: là trường không được để trống hoặc bắt buộc phải chọn</span>
			</div>
			
		</div>
		<!-- Modal -->
	</div>
	</html:form>
	</div>
	</div>
</div>
