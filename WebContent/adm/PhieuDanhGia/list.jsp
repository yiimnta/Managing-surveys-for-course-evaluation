<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<div class="row">
	<div class="col-md-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>Danh sách Phiếu đánh giá</h5>
				<div class="ibox-tools">
					<a href="themPhieuDanhGia.do" class="btn btn-primary  fa fa-plus">
						Thêm Phiếu đánh giá mới
					</a>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsPhieuDanhGiaForm" property="dsPhieuDanhGia" >
					<h3 style="text-align:center;">Hiện tại chưa có Phiếu đánh giá nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsPhieuDanhGiaForm" property="dsPhieuDanhGia" >
				<table id="pageIndex" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Loại Phiếu</th>
							<th>Tiêu đề</th>
							<th>Thông tin</th>
							<th>Hiển thị</th>
							<th>Người tạo</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbodyTable">
						<logic:iterate name="dsPhieuDanhGiaForm" property="dsPhieuDanhGia"
							id="ac">
							<bean:define id="maDG" 				name="ac" property="maDG" />
							<bean:define id="tieuDe"  			name="ac" property="tieuDe" />
							<bean:define id="thoiGianDang"  	name="ac" property="thoiGianDang" />
							<bean:define id="trangThai"  		name="ac" property="trangThai" />
							<bean:define id="loaiP" 			name="ac" property="loaiP" />

							<bean:define id="lp" 				name="ac" property="loaiPhieu" />
							<bean:define id="nguoiDung" 			name="ac" property="nguoiDung" />
								<bean:define id="hoTenND" 			name="nguoiDung" property="hoTen" />
							
							
							<!-- Định nghĩa các biến loại phiếu -->
						
								<bean:define id="tenLP" 		name="lp" property="ten" />
								<bean:define id="trangThaiLP" 	name="lp" property="trangThai" />
								
							<!-- Kết thúc định nghĩa -->
							
						<!-- Nếu loại phiếu là phiếu đánh giá Môn học -->
						
							<logic:notEmpty name="ac" property="giangDay">
							<bean:define id="hocKy"  			name="ac" property="hocKy" />
							<bean:define id="nienKhoa"  		name="ac" property="nienKhoa" />
								<bean:define id="gd"				name="ac" property="giangDay"/>
								<!-- Định nghĩa các biến giảng dạy -->
								<bean:define id="giangVien" 		name="gd" property="giangVien" />
								<bean:define id="monHoc"  			name="gd" property="monHoc" />
								<bean:define id="lop"  				name="gd" property="lop" />
								
									<bean:define id="maGV" 			name="giangVien" property="maGV" />
									<bean:define id="maDD" 			name="giangVien" property="maDD" />
									<bean:define id="hoTen" 		name="giangVien" property="hoTen" />
									
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
						
							<logic:notEmpty name="ac" property="giangVien">
								<bean:define id="giangVien"				name="ac" property="giangVien"/>
								<!-- Định nghĩa các biến giảng dạy -->
									<bean:define id="maGV" 			name="giangVien" property="maGV" />
									<bean:define id="maDD" 			name="giangVien" property="maDD" />
									<bean:define id="hoTen" 		name="giangVien" property="hoTen" />
								
								<!-- kết thúc định nghĩa Giảng Viên -->
							</logic:notEmpty>
							
						<!-- Kết thúc phiếu đánh giá Giảng Viên -->
						
						<!-- Nếu loại phiếu là phiếu đánh giá Khóa học -->
						
							<logic:notEmpty name="ac" property="khoaHoc">
								<bean:define id="khoaHoc"				name="ac" property="khoaHoc"/>
								<!-- Định nghĩa các biến giảng dạy -->
									<bean:define id="maKhoa" 			name="khoaHoc" property="maKhoa" />
									<bean:define id="tenKhoa" 				name="khoaHoc" property="tenKhoa" />
								
								<!-- kết thúc định nghĩa Giảng Viên -->
							</logic:notEmpty>
							
						<!-- Kết thúc phiếu đánh giá Giảng Viên -->
							
							<tr>
								<td>${maDG}</td>
								<td>${tenLP}</td>
								<td>
									 ${tieuDe}
								</td>
								<td>
								<logic:notEmpty name="ac" property="giangDay">
									<b>Tên( Mã môn) : </b> ${tenMH} ( ${maMH} )<br/> 
									<b>Số TC: </b> ${soTC} <br/>
									<b>Loại HP: </b> 
									<logic:equal value="1" name="loaiMH" >
										Bắt buộc
									</logic:equal>
									<logic:equal value="0" name="loaiMH" >
										Tự chọn
									</logic:equal>
									<br/>
									<b>Giảng viên (Mã)</b>: ${hoTen} ( ${maDD} )<br/>
									<b>Lớp </b>: ${tenLop}<br/>
									<b>Học kỳ</b>: ${hocKy} <br/>
									<b>Niên khóa</b>: ${nienKhoa}
								</logic:notEmpty>
								
								<logic:notEmpty name="ac" property="giangVien">
									<b>Giảng viên (Mã)</b>: ${hoTen} ( ${maDD} )<br/>
								</logic:notEmpty>
								
								<logic:notEmpty name="ac" property="khoaHoc">
									<b>Khóa học (Mã)</b>: ${tenKhoa} ( ${maKhoa} )<br/>
								</logic:notEmpty>
								</td>
								<td>
									<logic:equal value="0" name="trangThai">
										Không
									</logic:equal> 
									<logic:equal value="1" name="trangThai">
										Đang hiển thị
									</logic:equal> 
								</td>
								<td>
									${hoTenND}
								</td>
								<td><a href="suaPhieuDanhGia.do?maDG=${maDG}">
										<span class="glyphicon glyphicon-edit"></span>
									</a>
									<a href="#" class="delete-nd" data-url="xoaPhieuDanhGia.do?maDG=${maDG}"
										style="margin-left: 5px;"> 
										<span class="glyphicon glyphicon-trash"></span>
									</a>
									
									<a href="qlNoiDung.do?maDG=${maDG}" style="margin-left: 5px;"> 
										<span class="fa fa-newspaper-o"></span>
									</a>
									
									<a href="xemThongKe.do?maDG=${maDG}" style="margin-left: 5px;"> 
										<span class="fa fa-line-chart"></span>
									</a>
								</td>
							</tr>
						</logic:iterate>
					</tbody>
				</table>
				</logic:notEmpty>
			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
	
	function taoTable(){
		//phan trang, tim kiem		
		$('#pageIndex').DataTable(
				{
					"language" : {
						"sProcessing" : "Đang xử lý...",
						"sLengthMenu" : "Xem _MENU_ mục",
						"sZeroRecords" : "Không tìm thấy dòng nào phù hợp",
						"sInfo" : "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
						"sInfoEmpty" : "Đang xem 0 đến 0 trong tổng số 0 mục",
						"sInfoFiltered" : "(được lọc từ _MAX_ mục)",
						"sInfoPostFix" : "",
						"sSearch" : "Tìm:",
						"sUrl" : "",
						"oPaginate" : {
							"sFirst" : "Đầu",
							"sPrevious" : "Trước",
							"sNext" : "Tiếp",
							"sLast" : "Cuối"
						},
						"pagingType" : "simple"
					}
				});
		$('select[name=productTable_length]').addClass('form-control');
		$('input[type=search]').addClass('form-control');
	}
	
	function loadXoa(){
		$('.delete-nd').click(function() {
			var conf = confirm("Bạn có chắc muốn xóa không ? ");
			if (conf) {
					var url = $(this).attr('data-url');
					var $this = $(this);
					$.post(url, function(result) {
						if (result != "false") {
							alert("Xóa thành công");
							$this.parent().parent().remove();
						}else {
							alert("Xóa thất bại");
						}
					});
				}
		});
	}
	
	loadXoa();
	taoTable();
	
	
</script>