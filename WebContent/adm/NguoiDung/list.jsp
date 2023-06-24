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
				<h5>Danh sách Người dùng</h5>
				<div class="ibox-tools">
					<a href="themNguoiDung.do" class="btn btn-primary  fa fa-plus">
						Thêm người dùng mới
					</a>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsNguoiDungForm" property="dsNguoiDung" >
					<h3 style="text-align:center;">Hiện tại chưa có Giảng viên nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsNguoiDungForm" property="dsNguoiDung" >
				<table id="pageIndex" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Mã</th>
							<th>Thông tin</th>
							<th>Trạng thái</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbodyTable">
						<logic:iterate name="dsNguoiDungForm" property="dsNguoiDung"
							id="ac">
							<bean:define id="maND" 		name="ac" property="maND" />
							<bean:define id="hoTen"  	name="ac" property="hoTen" />
							<bean:define id="diaChi"  	name="ac" property="diaChi" />
							<bean:define id="ngaySinh"  name="ac" property="ngaySinh" />
							<bean:define id="email"  	name="ac" property="email" />
							<bean:define id="sdt"  		name="ac" property="sdt" />
							<bean:define id="maDN"  	name="ac" property="maDN" />
							<bean:define id="maLop"  	name="ac" property="maLop" />
							<bean:define id="matKhau"  	name="ac" property="matKhau" />
							<bean:define id="trangThai" name="ac" property="trangThai" />
							<bean:define id="loaiND"  	name="ac" property="loaiND" />
							<bean:define id="emailSub"  name="ac" property="emailSub" />
							<bean:define id="diaChiSub" name="ac" property="diaChiSub" />
							<bean:define id="ngaySinhSub" name="ac" property="ngaySinhSub" />
							<tr>
								<td>${maND}</td>
								<td>
									<table style="border:none;">
										<tr style="background:transparent;">
											<td style="width:300px;"><i class="fa fa-user-secret"></i> <b>Họ tên</b>: ${hoTen}</td>
											<td> 
												<logic:notEmpty name="ac" property="lop">
													<bean:define id="lop" name="ac" property="lop" />
													<i class="fa fa-briefcase"></i> <b>Lớp</b>:
													<bean:write name="lop" property="ten"/>
												</logic:notEmpty>
											</td>
										</tr>
										<tr style="background:transparent;">
											<td><i class="fa fa-birthday-cake"></i> <b>Ngày sinh</b>: ${ngaySinhSub}</td>
											<td><i class="fa fa-user"></i> <b>Mã Đăng nhập</b>: ${maDN}</td>
										</tr>
										<tr style="background:transparent;">
											<td style="word-wrap:break-word;"><i class="fa fa-envelope-o"></i> <b>Email</b>: <span title="${email}">${emailSub}</span></td>
											<td><i class="fa fa-phone-square"></i> <b>Điện thoại</b>: ${sdt}</td>
										</tr>
										<tr style="background:transparent;">
											<td><i class="fa fa-street-view"></i> <b>Địa chỉ</b>: <span title="${diaChi}">${diaChiSub}</span></td>
											<td><i class="fa fa-cogs"></i> <b>Chức vụ</b>:
												<logic:equal value="0" name="loaiND" >
													Sinh viên
												</logic:equal>
												<logic:notEqual value="0" name="loaiND" >
													Quản trị viên
												</logic:notEqual>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<logic:equal value="0" name="trangThai">
											Đăng xuất
									</logic:equal>
									<logic:equal value="1" name="trangThai">
											Đang đăng nhập
									</logic:equal>
									<logic:equal value="2" name="trangThai">
											Bị khóa
									</logic:equal>
								</td>
								
								<td><a href="suaNguoiDung.do?maND=${maND}">
										<span class="glyphicon glyphicon-edit"></span>
									</a>
									<logic:notEqual value="${maDN}" name="userLogin" property="maDN" scope="session" >
										<a href="#" class="delete-nd" data-url="xoaNguoiDung.do?maND=${maND}"
											style="margin-left: 30px;"> 
											<span class="glyphicon glyphicon-trash"></span>
										</a>
									</logic:notEqual>
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