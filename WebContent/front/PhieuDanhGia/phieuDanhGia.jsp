<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<style>
	.liDef{
		border-bottom: 1px solid #e2d4b1;
    	padding: 29px 0 20px;
    }
    
    #list6 { font-family: 'Trebuchet MS', 'Lucida Grande', Verdana, Lucida, Geneva, Helvetica, Arial, sans-serif; }
	#list6 ol { list-style-type: upper-roman; font-size:14px; list-style-position: inside; }
	#list6 ol li { }
	
	.divPDG {
    	background:white!important;
    	font-family:helvetica, arial, sans-serif;
    	padding:6px!important;
    	border-radius:3px!important;
    	/*margin:0px 0px 5px 10px!important;*/
    	border:1px solid #d0d1d5;
    }
</style>
<div class="content-blog">
	<div>
		<div>
			<bean:define id="phieuDanhGia" 		name="frontDsPhieuDanhGiaForm" property="phieuDanhGia" />
				<bean:define id="maDG" 				name="phieuDanhGia" property="maDG" />
				<bean:define id="tieuDe" 			name="phieuDanhGia" property="tieuDe" />
				<bean:define id="thoiGianDang"  	name="phieuDanhGia" property="thoiGianDang" />
				<bean:define id="trangThai"  		name="phieuDanhGia" property="trangThai" />
				<bean:define id="loaiP" 			name="phieuDanhGia" property="loaiP" />
					
				<!-- Kết thúc định nghĩa -->
				
			<!-- Nếu loại phiếu là phiếu đánh giá Môn học -->
			
				<logic:notEmpty name="phieuDanhGia" property="giangDay">
					<bean:define id="gd"				name="phieuDanhGia" property="giangDay"/>
					<!-- Định nghĩa các biến giảng dạy -->
				<bean:define id="hocKy"  			name="phieuDanhGia" property="hocKy" />
				<bean:define id="nienKhoa"  		name="phieuDanhGia" property="nienKhoa" />
					<bean:define id="giangVien" 		name="gd" property="giangVien" />
					<bean:define id="monHoc"  			name="gd" property="monHoc" />
					<bean:define id="lop"  				name="gd" property="lop" />
					
						<bean:define id="maGV" 			name="giangVien" property="maGV" />
						<bean:define id="maDD" 			name="giangVien" property="maDD" />
						<bean:define id="hoTenGV" 		name="giangVien" property="hoTen" />
						
						<bean:define id="maMH" 			name="monHoc" property="maMH" />
						<bean:define id="tenMH" 		name="monHoc" property="ten" />
						<bean:define id="soTC" 			name="monHoc" property="soTC" />
						<bean:define id="loaiMH" 		name="monHoc" property="loaiMH" />
					
						<bean:define id="maLop" 		name="lop" property="maLop" />
						<bean:define id="tenLop" 		name="lop" property="ten" />
					
					<!-- kết thúc định nghĩa giảng dạy -->
				</logic:notEmpty>
				
			<!-- Kết thúc phiếu đánh giá Môn học -->
			
			
			<!-- Nếu loại phiếu là phiếu đánh giá Giảng Viên -->
			
				<logic:notEmpty name="phieuDanhGia" property="giangVien">
					<bean:define id="giangVien"				name="phieuDanhGia" property="giangVien"/>
					<!-- Định nghĩa các biến giảng dạy -->
						<bean:define id="maGV" 			name="giangVien" property="maGV" />
						<bean:define id="maDD" 			name="giangVien" property="maDD" />
						<bean:define id="hoTen" 		name="giangVien" property="hoTen" />
					
					<!-- kết thúc định nghĩa Giảng Viên -->
				</logic:notEmpty>
				
			<!-- Kết thúc phiếu đánh giá Giảng Viên -->
			
			<!-- Nếu loại phiếu là phiếu đánh giá Khóa học -->
			
				<logic:notEmpty name="phieuDanhGia" property="khoaHoc">
					<bean:define id="khoaHoc"				name="phieuDanhGia" property="khoaHoc"/>
					<!-- Định nghĩa các biến giảng dạy -->
						<bean:define id="maKhoa" 			name="khoaHoc" property="maKhoa" />
						<bean:define id="tenKhoa" 				name="khoaHoc" property="tenKhoa" />
					
					<!-- kết thúc định nghĩa Giảng Viên -->
				</logic:notEmpty>
				
			<!-- Kết thúc phiếu đánh giá Giảng Viên -->
		
			<div class="divPDG" style="margin-bottom:5px;">
				<h3 style="margin:0px;color:#3b5998;padding-left:20px;text-transform:uppercase;" id="pdgMain" data-id="${maDG}"><b>${tieuDe}</b></h3>
			</div>
			<div id="list6" class="divPDG">
				<img src="Images/pdgIndex.jpg" alt="">
				<hr/>
				<logic:notEmpty name="phieuDanhGia" property="giangDay">
					<h4 style="text-transform:uppercase;">HỌC PHẦN KHẢO SÁT:${tenMH}; GIẢNG VIÊN: ${hoTenGV} </h4>
					<h5>HỌC KỲ: ${hocKy}; NĂM HỌC: ${nienKhoa}</h5>
				</logic:notEmpty>
				<logic:notEmpty name="phieuDanhGia" property="giangVien">
					<h4 style="text-transform:uppercase;">GIẢNG VIÊN: ${hoTen}</h4>
				</logic:notEmpty>
				<logic:notEmpty name="phieuDanhGia" property="khoaHoc">
					<h4 style="text-transform:uppercase;">KHÓA HỌC: ${tenKhoa}</h4>
				</logic:notEmpty>
				
				<logic:equal value="1" name="frontDsPhieuDanhGiaForm" property="choPhepDanhGia">
				<span style="color:red;">* Bắt buộc</span>
				<ol>
					<bean:define id="stt" value="1" />
					<logic:notEmpty name="phieuDanhGia" property="listNoiDung">
						<logic:iterate id="noiDung" 	name="phieuDanhGia" property="listNoiDung">
							<bean:define id="tieuDeND"  name="noiDung" property="tieuDe" />
							<bean:define id="maNDu" 		name="noiDung" property="maNDu" />
							<li style="margin-bottom:15px;">
								<b> ${tieuDeND}</b><span style="color:red;"> * </span>
								<logic:notEmpty name="noiDung" property="listChiTietNoiDung">
									<ul>
										<logic:iterate id="chiTietNoiDung" name="noiDung" property="listChiTietNoiDung">
											<bean:define id="moTa" 		name="chiTietNoiDung" property="moTa" />
											<bean:define id="loaiCT" 	name="chiTietNoiDung" property="loaiCT" />
											<bean:define id="maCT" 	name="chiTietNoiDung" property="maCT" />				
											<li class="liDef ChiTietND" data-id="${maCT}" data-type="${loaiCT}">
												&nbsp;&nbsp;&#9679;  ${moTa}<br/>
												<logic:notEmpty name="chiTietNoiDung" property="listNoiDungCon">
													<logic:iterate id="noiDungCon" name="chiTietNoiDung" property="listNoiDungCon">
														<bean:define id="maNDC" name="noiDungCon" property="maNDC" />
														<bean:define id="tieuDeNDC" name="noiDungCon" property="tieuDe" />
														<logic:equal value="0" name="loaiCT">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="NDR_${maCT}" data-idct="${maCT}" data-content="${tieuDeNDC}" class="maCT_${maCT}" />${tieuDeNDC}<br/>
														</logic:equal>
														<logic:equal value="1" name="loaiCT">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkBox" class="maCT_${maCT}" />${tieuDeNDC}<br/>
														</logic:equal>
														<logic:equal value="2" name="loaiCT">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tieuDeNDC}<br/>
															<textarea rows="5" cols="60"  class="maCT_${maCT}" data-idct="${maCT}" ></textarea>
														</logic:equal>
													</logic:iterate>
												</logic:notEmpty>
											</li>
										</logic:iterate>
									</ul>
								</logic:notEmpty>
							</li>
						</logic:iterate>
						<button class="btn" style="background:black;color:white;float:right;margin:5px 20px 5px 0;" id="btnSubmit">Gửi kết quả</button>
						
							<script>
								$('#btnSubmit').click(function(){
									var array = [];
									
									$('.ChiTietND').each(function(){
										$this = $(this);
										var id = $this.data('id');
										var type = $this.data('type');
										var obj = null;
										//khởi tạo array
										switch(type){
											case 0:
												$('.maCT_'+id).each(function(){
													if($(this).prop('checked')){
														obj = new Object();
														obj.x =$(this).data('idct');
														obj.y =$(this).data('content');
													}
												});
												break;
											case 1:
												$('.maCT_'+id).each(function(){
													obj = new Object();
													obj.x =$(this).data('idct');
													if($(this).prop('checked')){
														obj.y+=$(this).data('content')+',';
													}
												});
												break;
											case 2:
												$('.maCT_'+id).each(function(){
													obj = new Object();
													obj.x=$(this).data('idct');
													obj.y =$(this).val();
												});
												
												break;
											default:
												alert('không tìm thấy loại chi tiết');
												break;
										}
										if(obj!=null){
											array.push(obj);
										}
									});
								
									var maPhieu =  $('#pdgMain').data('id');
										
										$.ajax({
												url:"themKetQua.do",
												data:{maDG:maPhieu, listRoute: JSON.stringify(array)},
												typeData:'json',
												type:'POST',
												success:function(test){
													if(test == "true"){
														alert('Gửi kết quả đánh giá thành công! Về lại trang danh sách Phiếu ^ ^');
														location.href="dsPhieuDanhGia.do";
													}else if(test == "false"){
														alert("Gửi kết quả thất bại!");
													} else {
														alert('Vui lòng check đầy đủ');
													}
												}
										});
								});
							</script>
					</logic:notEmpty>
				</ol>
				
				
				</logic:equal>
				<logic:equal value="0" name="frontDsPhieuDanhGiaForm" property="choPhepDanhGia">
					<br/><h4 style="color:red;">Xin lỗi! Bạn đã đánh giá rồi!</h4>
				</logic:equal>
			</div>
		</div>
		<jsp:include page="/sideBar.do" />
	</div>
</div>