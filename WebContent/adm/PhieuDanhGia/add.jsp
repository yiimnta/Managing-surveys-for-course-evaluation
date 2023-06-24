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
		THÊM PHIẾU ĐÁNH GIÁ MỚI
	</h3>
	<html:errors property="exist"/>
	<html:form action="/themPhieuDanhGia" method="post">
	<div class="form-horizontal">
		<hr style="border:3px solid black;width:900px;margin-left:50px;">
		<h3 class="panel-heading inner">Thông tin</h3>
		
		<div class="form-group">
				<label class = "control-label col-md-2"> Loại Phiếu * </label>
				<div class="col-sm-7">
						<html:select property="loaiP" styleClass="form-control" styleId="chonLoai">
							<html:option value="">--- Chọn Loại phiếu ---</html:option>
							<html:optionsCollection name="phieuDanhGiaForm" property="listLoaiPhieu" label="ten" value="loaiP" />
						</html:select>
						<html:errors property="loaiP" />
				</div>
		</div>
		
		<div class="form-group hidden" id="frmKH">
				<label class = "control-label col-md-2"> Khóa học * </label>
				<div class="col-sm-7">
						<html:select property="maKhoa" styleClass="form-control">
							<html:option value="">--- Chọn Khóa học ---</html:option>
							<html:optionsCollection name="phieuDanhGiaForm" property="listKhoa" label="tenKhoa" value="maKhoa" />
						</html:select>
						<html:errors property="maKhoa" />
				</div>
		</div>
		
		<div class="hidden" id="frmGD">
				<div class="form-group">
					<label class = "control-label col-md-2"> Môn học * </label>
					<div class="col-sm-7">
							<html:select property="maGD" styleClass="form-control">
								<html:option value="">--- Chọn Môn học ---</html:option>
								<html:optionsCollection name="phieuDanhGiaForm" property="listGiangDay" label="info" value="maGD" />
							</html:select>
							<html:errors property="maGD" />
					</div>
				</div>
				<div class="form-group">
					<label class = "control-label col-md-2"> Học kỳ * </label>
					<div class="col-sm-7">
							<html:select property="hocKy" styleClass="form-control">
								<html:option value="">--- Chọn Học kỳ ---</html:option>
								<html:option value="1">1</html:option>
								<html:option value="2">2</html:option>
								<html:option value="3">3</html:option>
							</html:select>
							<html:errors property="hocKy" />
					</div>
				</div>
		
				<div class="form-group">
						<label class = "control-label col-md-2"> Năm học * </label>
						<div class="col-sm-7">
								<input type="number" name="namT" class="form-control" style="width:100px;float:left;margin-right:10px;" placeholder="Từ năm">
								<input type="number" name="namS" class="form-control" style="width:100px;" placeholder="đến năm">
								<html:errors property="nienKhoa" />
						</div>
				</div>
		</div>
		
		<div class="form-group hidden" id="frmGV">
				<label class = "control-label col-md-2"> Giảng viên * </label>
				<div class="col-sm-7">
						<html:select property="maGV" styleClass="form-control">
							<html:option value="">--- Chọn Giảng viên ---</html:option>
							<html:optionsCollection name="phieuDanhGiaForm" property="listGiangVien" label="hoTen" value="maGV" />
						</html:select>
						<html:errors property="maGV" />
				</div>
		</div>
				
		<div class="form-group">
				<label class = "control-label col-md-2">Tiêu đề * </label>
				<div class="col-sm-7">
						<html:text property="tieuDe" styleClass="form-control"/>
						<html:errors property="tieuDe" />
				</div>
		</div>
		
		<div class="form-group">
				<label class = "control-label col-md-2">Hiển thị </label>
				<div class="col-sm-7">
						<html:checkbox property="trangThai" />
						<html:errors property="trangThai" />
				</div>
		</div>
		
		<div class="form-group hidden" id="frmCP">
				<label class = "control-label col-md-2"> Sao chép ND </label>
				<div class="col-sm-7">
						<select name="maCopy" class="form-control">
							<option value="">---Chọn Phiếu muốn copy ---</option>
						</select>
				</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-7">
		       <button type="submit" name="submit" class="btn" id="btnSubmit" style="background:black;color:white;" value="">
					Thêm mới
				</button>
				<button type="reset" class="btn" style="background:black;color:white;">
					Làm mới
				</button>
				<a class="btn btn-primary" href="qlPhieuDanhGia.do">
					Về danh sách
				</a>
				<span style="float:right;" class="control-label"> *: là trường không được để trống</span>
			</div>
		</div>
	</div>
	</html:form>
	</div>
	</div>
</div>
<script>
	var x = "";
	function sadasd(){
		var gt = $('#chonLoai').val();
		if(gt=="2"){
			$('#btnSubmit').val("GD");
			$('#frmGD').toggleClass('hidden');
			if(x=="GV"){
				$('#frmGV').toggleClass('hidden');
			}else if(x == "KH"){
				$('#frmKH').toggleClass('hidden');
			}
			
			x = "GD";
			
		} else if(gt=="1"){
			
			$('#btnSubmit').val("GV");
			$('#frmGV').toggleClass('hidden');
			
			if(x=="GD"){
				$('#frmGD').toggleClass('hidden');
			}else if(x == "KH"){
				$('#frmKH').toggleClass('hidden');
			}
			x = "GV";
			
		} else if(gt=="3"){
			
			$('#btnSubmit').val("KH");
			$('#frmKH').toggleClass('hidden');
			
			if(x=="GV"){
				$('#frmGV').toggleClass('hidden');
			}else if(x == "GD"){
				$('#frmGD').toggleClass('hidden');
			}
			x = "KH";
		} else if(gt == ""){
			$('#btnSubmit').val("");
			if(x=="GV"){
				$('#frmGV').toggleClass('hidden');
			} else if(x == "GD"){
				$('#frmGD').toggleClass('hidden');
			} else if(x == "KH"){
				$('#frmKH').toggleClass('hidden');
			}
			x="";
			
		}
		
		if(gt != "" ){
			$('#frmCP').removeClass('hidden');
			var selectTag =  $('#frmCP').find("select[name='maCopy']");
			$.post('layPhieuDanhGiaCopy.do',{maLoai:gt},function(result){
				 var x = result;
				 for(var i = 0; i< result.length; i ++){
					 selectTag.append(new Option(result[i].tieuDe, result[i].maDG));
				 }
			});
		}else {
			$('#frmCP').addClass('hidden');
		}
	}
	
	$('#chonLoai').change(function(){
		sadasd();
	});
	sadasd();
</script>