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
				<h5>Danh sách Góp ý</h5>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsGopYForm" property="dsGopY" >
					<h3 style="text-align:center;">Hiện tại chưa có Góp ý nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsGopYForm" property="dsGopY" >
					<table id="pageIndex" class="table table-striped table-hover">
						
						<thead>
							<tr>
								<th>Tiêu Đề</th>
								<th>Nội dung</th>
								<th>Người góp ý</th>
								<th>Thời gian</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbodyTable">
							<logic:iterate name="dsGopYForm" property="dsGopY"
								id="ac">
								<bean:define id="maGY" 			name="ac" property="maGY" />
								<bean:define id="maND" 			name="ac" property="maND" />
								<bean:define id="tieuDe" 		name="ac" property="tieuDe" />
								<bean:define id="noiDung" 			name="ac" property="noiDung" />
								<bean:define id="thoiGian"  	name="ac" property="thoiGian" />
							
								<bean:define id="nguoiDung"  	name="ac" property="nguoiDung" />
									<bean:define id="hoTen"  			name="nguoiDung" property="hoTen" />
									<bean:define id="email"  			name="nguoiDung" property="email" />
									<bean:define id="sdt"  				name="nguoiDung" property="sdt" />
									<bean:define id="maDN"  			name="nguoiDung" property="maDN" />
									
								<tr>
									<td>${tieuDe}</td>
									<td>${noiDung}</td>
									<td>
										<b>Họ tên:</b> ${hoTen}<br/>
										<b>Email:</b> ${email}<br/>
										<b>Mã DN:</b> ${maDN}
									</td>
									<td>${thoiGian}</td>
									<td>
										<a href="#" class="delete-gy" data-url="xoaGopY.do?maGY=${maGY}"
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
		$('.delete-gy').click(function() {
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