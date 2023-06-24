<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
   <div role="tabpanel" class="tab-pane" id="dkhp">
    	<div class="info">
	 <div class="row">
		<div class="col-md-12">	
		<div id="main-container">
			<h3 class="main-heading text-center" style="margin:0 0 0 -130px;">
				ĐĂNG KÝ HỌC PHẦN
			</h3>
			<hr style="border:3px solid black;width:700px;margin-left:50px;">
			<bean:define id="maLop" name="nguoiDungForm" property="maLop" />			
			
			<div>
				<div class="form-group has-success">
					  <label class="control-label" for="inputSuccess1" style="float:left;margin-right:15px;padding-top:5px;">Lớp </label>
					  <bean:define id="maLop" name="dKHPForm" property="maLop"/>
					  <html:select name="dKHPForm" property="maLop" styleClass="form-control" style="width:400px;float:left;" value="${maLop}" styleId="chonLop">
					  		<option value="">---Chọn lớp học---</option>
					  		<html:optionsCollection name="dKHPForm" property="dsLop" label="ten" value="maLop"/>
					  </html:select>
				</div>
				<div style="clear:both;"></div>
				<table class="table table-bordered" style="width:780px;margin-left:20px;margin-top:20px;" id="tableHP">
					<tr>
						<th width="5%">
							DK					
						</th>
						<th width="10%">
							Mã HP					
						</th>
						<th>
							Tên HP					
						</th>
						<th width="10%">
							STC					
						</th>
						<th width="13%">
							HP Bắt buộc					
						</th>
					</tr>
				</table>
			</div>
			
		 </div>
	  </div>
	  <div id="main-container2" style="margin-left:15px;" >
	  		<hr style="border-color:black;">
			<h3 class="main-heading text-center" style="margin:0 0 0 -130px;">
				CÁC MÔN ĐÃ ĐĂNG KÝ
			</h3>
			<hr style="border:3px solid black;width:700px;margin-left:50px;">
			
			<div>
				<table class="table table-bordered" style="width:780px;margin-left:20px;margin-top:20px;" id="tableDK">
					<tr>
						<th width="5%">
							HỦY					
						</th>
						<th width="10%">
							Mã HP					
						</th>
						<th>
							Tên HP					
						</th>
						<th width="10%">
							STC					
						</th>
						<th width="13%">
							HP Bắt buộc					
						</th>
						<th>TT</th>
					</tr>
				</table>
			</div>
			<button id="luuDK" class="btn btn-success" style="float:right;margin-right:20px;">Lưu lại</button>
		 </div>
  </div>
 </div>
</div>
<script type="text/javascript">
	function hienThiDanhMuc(){
		var chon = $('#chonLop').val();
		$('.mh').each(function(){
			$(this).remove();
		});
			$.post('dkhp.do',{submit:'submit',maLop:chon},function(rs){
				var dsMonHoc = rs.dsMonHoc;
				var dsDKHP = rs.dsDKHP;
				for(var i =0; i< dsMonHoc.length; i++){
					var gd = dsMonHoc[i];
					var mh = gd.monHoc;
					var loaiMH = 'x';
					if(mh.loaiMH == 'false'){
						loaiMH='';
					}
					
					$('#tableHP').append('<tr class="mh">'
						+'<td><input type="checkbox" class="cbdkhpds" data-magd="'+gd.maGD+'" /></td>'	
						+'<td>'+gd.maGD+'</td>'
						+'<td>'+mh.ten+'</td>'
						+'<td>'+mh.soTC+'</td>'
						+'<td>'+loaiMH+'</td>'
						+'</tr>');	
				}
				
				for(var i =0; i< dsDKHP.length; i++){
					var gd = dsDKHP[i];
					var mh = gd.monHoc;
					var loaiMH = 'x';
					if(mh.loaiMH == 'false'){
						loaiMH='';
					}
					
					$('#tableDK').append('<tr class="mh">'
						+'<td><input type="checkbox" checked class="cbdkhp" data-magd="'+gd.maGD+'" /></td>'	
						+'<td>'+gd.maGD+'</td>'
						+'<td>'+mh.ten+'</td>'
						+'<td>'+mh.soTC+'</td>'
						+'<td>'+loaiMH+'</td>'
						+'<td>Đã lưu</td>'
						+'</tr>');	
				}
				
				var dsDKHPSS = rs.dsDKHPSS;
				for(var i =0; i< dsDKHPSS.length; i++){
					var gd = dsDKHPSS[i];
					var mh = gd.monHoc;
					var loaiMH = 'x';
					if(mh.loaiMH == 'false'){
						loaiMH='';
					}
					
					$('#tableDK').append('<tr class="mh">'
						+'<td><input type="checkbox" checked class="cbdkhpss" data-magd="'+gd.maGD+'" /></td>'	
						+'<td>'+gd.maGD+'</td>'
						+'<td>'+mh.ten+'</td>'
						+'<td>'+mh.soTC+'</td>'
						+'<td>'+loaiMH+'</td>'
						+'<td>Chưa lưu</td>'
						+'</tr>');	
				}
				
				chonDK();
			});
	}
	
	function chonDK(){
		$('.cbdkhpss, .cbdkhpds ').change(function(){
			var url = "xoadkhp.do";
			if($(this).prop("checked")){
				url = "themdkhp.do";
			}
			var MaGD = $(this).data('magd');
			$.post(url,{maGD:MaGD},function(rs){
				if(rs == "false"){
					alert('Có lỗi xảy ra!');
				}
			});
			hienThiDanhMuc();
		});
	}
	
	hienThiDanhMuc();
	$('#chonLop').change(function(){
		hienThiDanhMuc();
	});
	
	$('#luuDK').click(function(){
		var array = [];
		var element= "";
		$('.cbdkhp').each(function(){
			if($(this).prop("checked") == false){
				element=$(this).data("magd");
				array.push(element);
			}
		});
		
		$.post("luudkhp.do",{deleleArray:JSON.stringify(array)},function(rs){
			if(rs == "false"){
				alert('Có lỗi xảy ra!');
			}else {
				alert('Đã lưu thành công');
				location.reload();
			}
		});
	});
	
</script>