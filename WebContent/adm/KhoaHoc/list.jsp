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
				<h5>Danh sách Khóa học</h5>
				<div class="ibox-tools">
					<button type="button" class="btn btn-primary  fa fa-plus" data-toggle="modal" data-target=".bs-example-modal-sm">
						Thêm khóa học
					</button>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsKhoaHocForm" property="dsKhoa" >
					<h3 style="text-align:center;">Hiện tại chưa có Khóa học nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsKhoaHocForm" property="dsKhoa" >
					<table id="pageIndex" class="table table-striped table-hover">
						
						<thead>
							<tr>
								<th>Mã khóa</th>
								<th width="50%">Tên khóa</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbodyTable">
							<logic:iterate name="dsKhoaHocForm" property="dsKhoa"
								id="ac">
								<bean:define id="maKhoa" name="ac" property="maKhoa" />
								<bean:define id="tenKhoa"  name="ac" property="tenKhoa" />
								<tr>
									<td>${maKhoa}</td>
									<td id="row_${maKhoa}">${tenKhoa}</td>
									<td><a href="#" class="btn-capNhatKhoa" id="btn-capNhatKhoa_${maKhoa}"
											data-id="${maKhoa}" data-name="${tenKhoa}" data-toggle="modal" data-target=".frm-sua">
											<span class="glyphicon glyphicon-edit"></span>
										</a> 
										<a href="#" class="delete-khoa" data-url="xoaKhoaHoc.do?maKhoa=${maKhoa}"
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

<!-- Form thêm -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI KHÓA HỌC</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên Khóa học" id="tenKhoaHocThem">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemKhoa" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themKhoa"  data-url="themKhoaHoc.do">Thêm mới</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->

<!-- End Form thêm -->

<!-- Form sửa -->
<div class="modal fade frm-sua" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN KHÓA HỌC</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên Khóa học" id="tenKhoaHocSua">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaKhoa" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary" id="btn-suaKhoa"  data-url="suaKhoaHoc.do" data-id="" >Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->

<!-- End Form sửa -->


<script type="text/javascript">
	function reset(){
		$('#tenKhoaHocThem').val("");
		$('#tenKhoaHocSua').val("");
	}
	
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
		$('.delete-khoa').click(function() {
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
	
	$('.btn-themKhoa').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tenKhoaHocThem').val();
		$.post(url,{tenKhoa:tenK}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3") {
				if(result !="false"){
					alert("Thêm thành công!");
					var tr = '<tr>'
						+'<td>'+result+'</td>'
						+'<td id="row_'+result+'">'+tenK+'</td>'
						+'<td><a  class="btn-capNhatKhoa" '
						+'href="#" data-id='+result+' data-name="'+tenK+'" data-toggle="modal" data-target=".frm-sua">'
								+'<span class="glyphicon glyphicon-edit"></span>'
								+'</a> '
							+'<a href="#" class="delete-khoa" data-url="xoaKhoaHoc.do?maKhoa='+result+'"'
								+' style="margin-left:30px;"> '
								+'<span class="glyphicon glyphicon-trash"></span>'
								+'</a>'
							+'</td>'
					+'</tr>';
					$('#tbodyTable').append(tr);
					loadXoa();
					loadCapNhat();
					$('#btn-closeThemKhoa').click();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tên khóa học không được để trống!");
				} else if(result == "1"){
					alert("Tên khóa học đã tồn tại!");
				} else if(result == "2"){
					alert("Tên khóa học không đượt vượt quá 50 ký tự");
				} else if(result == "3"){
					alert("Tên khóa học sai định dạng");
				}
			}
		});
	});
	function loadCapNhat(){
		$('.btn-capNhatKhoa').click(function(){
			$('#tenKhoaHocSua').val($(this).attr("data-name"));
			$('#btn-suaKhoa').attr("data-id",$(this).attr("data-id"));
		});
	}
	
	$('#btn-suaKhoa').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var id = $this.attr('data-id');
		var tenK = $('#tenKhoaHocSua').val();
		$.post(url,{maKhoa:id, tenKhoa:tenK}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3") {
				if(result !="false"){
					alert("Cập nhật thành công!");
					$("#row_"+id).html(tenK);
					$('#btn-capNhatKhoa_'+id).attr('data-name',tenK);
					$('#btn-closeSuaKhoa').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tên khóa học không được để trống!");
				} else if(result == "1"){
					alert("Tên khóa học đã tồn tại!");
				} else if(result == "2"){
					alert("Tên khóa học không đượt vượt quá 50 ký tự");
				} else if(result == "3"){
					alert("Tên khóa học sai định dạng");
				}
			}
		});
	});
	loadCapNhat();
	loadXoa();
	taoTable();
	
	
</script>