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
		THÊM GIẢNG DẠY MỚI
	</h3>
	<html:errors property="exist"/>
	<html:form action="/themGiangDay" method="post">
	<div class="form-horizontal">
		<hr style="border:3px solid black;width:900px;margin-left:50px;">
		<h3 class="panel-heading inner">Thông tin</h3>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Giảng viên * </label>
				<div class="col-sm-7">
						<logic:notEmpty  name="giangDayForm" property="listGiangVien">
					       <html:select property="maGV" styleClass="form-control">
								<html:option value="">--- Chọn Giảng viên ---</html:option>
								<html:optionsCollection name="giangDayForm" property="listGiangVien" label="hoTen" value="maGV" />
							</html:select>
				        </logic:notEmpty>
				        <logic:empty  name="giangDayForm" property="listGiangVien">
				        	<span>Hiện tại chưa có Giảng viện nào!<br/>
				        	Vui lòng thêm mới Giảng viện tại </span><a href="qlGiangVien.do">đây</a>
				        </logic:empty>
						<html:errors property="maGV" />
				</div>
				
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Môn học * </label>
				<div class="col-sm-7">
						<logic:notEmpty  name="giangDayForm" property="listMonHoc">
					       <html:select property="maMH" styleClass="form-control">
								<html:option value="">--- Chọn Môn học ---</html:option>
								<html:optionsCollection name="giangDayForm" property="listMonHoc" label="ten" value="maMH" />
							</html:select>
				        </logic:notEmpty>
				        <logic:empty  name="giangDayForm" property="listMonHoc">
				        	<span>Hiện tại chưa có Môn học nào!<br/>
				        	Vui lòng thêm mới Môn học tại </span><a href="qlMonHoc.do">đây</a>
				        </logic:empty>
						<html:errors property="maMH" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Lớp * </label>
				<div class="col-sm-7">
						<logic:notEmpty  name="giangDayForm" property="listLop">
					       <html:select property="maLop" styleClass="form-control">
								<html:option value="">--- Chọn Lớp học ---</html:option>
								<html:optionsCollection name="giangDayForm" property="listLop" label="ten" value="maLop" />
							</html:select>
				        </logic:notEmpty>
				        <logic:empty  name="giangDayForm" property="listLop">
				        	<span>Hiện tại chưa có Lớp học nào!<br/>
				        	Vui lòng thêm mới Lớp học tại </span><a href="qlLop.do">đây</a>
				        </logic:empty>
						<html:errors property="maLop" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Mở HP </label>
				<div class="col-sm-7">
					<html:checkbox property="trangThai" style="height: 30px;"/>
					<html:errors property="trangThai" />
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
				<a class="btn btn-primary" href="qlGiangDay.do">
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
