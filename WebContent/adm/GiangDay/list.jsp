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
				<h5>Danh sách Giảng dạy</h5>
				<div class="ibox-tools">
					<a href="themGiangDay.do" class="btn btn-primary  fa fa-plus">
						Thêm Giảng dạy mới
					</a>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsGiangDayForm" property="dsGiangDay" >
					<h3 style="text-align:center;">Hiện tại chưa có mục Giảng dạy nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsGiangDayForm" property="dsGiangDay" >
				<table id="pageIndex" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Mã HP</th>
							<th>Lớp</th>
							<th>Môn học</th>
							<th>Thông tin</th>
							<th>Mở GD </th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbodyTable">
						<logic:iterate name="dsGiangDayForm" property="dsGiangDay"
							id="ac">
							<bean:define id="id" 				name="ac" property="maGD" />
							
							<bean:define id="giangVien" 		name="ac" property="giangVien" />
								<bean:define id="maGV" 			name="giangVien" property="maGV" />
								<bean:define id="maDD" 			name="giangVien" property="maDD" />
								<bean:define id="hoTen" 		name="giangVien" property="hoTen" />
								
							<bean:define id="monHoc"  			name="ac" property="monHoc" />
								<bean:define id="maMH" 			name="monHoc" property="maMH" />
								<bean:define id="tenMH" 			name="monHoc" property="ten" />
								<bean:define id="soTC" 			name="monHoc" property="soTC" />
								<bean:define id="loaiMH" 		name="monHoc" property="loaiMH" />
								
							<bean:define id="lop"  				name="ac" property="lop" />
								<bean:define id="maLop" 			name="lop" property="maLop" />
								<bean:define id="tenLop" 			name="lop" property="ten" />
								
							<bean:define id="trangThai"  		name="ac" property="trangThai" />
							
							<tr>
								<td>${id}</td>
								<td>${tenLop}</td>
								<td><b>Tên( Mã môn) : </b> ${tenMH} ( ${maMH} )<br/> 
									<b>Số TC: </b> ${soTC} <br/>
									<b>Loại HP: </b> 
									<logic:equal value="1" name="loaiMH" >
										Bắt buộc
									</logic:equal>
									<logic:equal value="0" name="loaiMH" >
										Tự chọn
									</logic:equal>
								</td>
								<td>
									<b>Giảng viên (Mã)</b>: ${hoTen} ( ${maDD} )<br/>
								</td>
								<td>
									<logic:equal value="0" name="trangThai">
										<input type="checkbox" name="trangThai" class="cbTrangThai" data-id="${id}"/>
									</logic:equal>
									<logic:equal value="1" name="trangThai">
										<input type="checkbox" name="trangThai" class="cbTrangThai"  data-id="${id}" checked/>
									</logic:equal>
								</td>
								<td><a href="suaGiangDay.do?id=${id}">
										<span class="glyphicon glyphicon-edit"></span>
									</a>
									<a href="#" class="delete-nd" data-url="xoaGiangDay.do?id=${id}"
										style="margin-left: 30px;"> 
										<span class="glyphicon glyphicon-trash"></span>
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
		
		$('.cbTrangThai').click(function(){
			var check = $(this).prop('checked');
			var ida = $(this).data('id');
			$this = $(this);
			$.post('suaTrangThaiGiangDay.do',{id:ida,trangThai:check},function(rs){
				if(rs == "false"){
					alert('Cập nhật trạng thái thất bại');
					if(check){
						$this.prop('checked','false');
					}else {
						$this.prop('checked','true');
					}
				}
			});
		});
	}
	
	
	
	loadXoa();
	taoTable();
	
	
</script>