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
				<h5>Danh sách Giảng viên</h5>
				<div class="ibox-tools">
					<button type="button" class="btn btn-primary  fa fa-plus" data-toggle="modal" data-target=".bs-example-modal-sm">
						Thêm Giảng viên mới
					</button>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsGiangVienForm" property="dsGiangVien" >
					<h3 style="text-align:center;">Hiện tại chưa có Giảng viên nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsGiangVienForm" property="dsGiangVien" >
				<table id="pageIndex" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Mã</th>
							<th>Thông tin</th>
							<th>Môn học giảng dạy </th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbodyTable">
						<logic:iterate name="dsGiangVienForm" property="dsGiangVien"
							id="ac">
							<bean:define id="maGV" 		name="ac" property="maGV" />
							<bean:define id="hoTen"  	name="ac" property="hoTen" />
							<bean:define id="maDD"  	name="ac" property="maDD" />
							<tr>
								<td>${maGV}</td>
								<td id="row_${maGV}">
									<i class="fa fa-user-secret"></i> <b>Họ tên</b>: ${hoTen}<br />
									<i class="fa fa-crosshairs"></i> <b>Mã định danh</b>: ${maDD}
								</td>
								<td>	
									<logic:notEmpty name="ac" property="listGiangDay">
										<bean:define id="giangDay" name="ac" property="listGiangDay" />									
										<bean:define id="x" value="3" />
										<bean:define id="y" value="0" />
										<logic:iterate id="mh" name="giangDay">
											<bean:define id="mon" name="mh" property="monHoc" />
											<logic:equal value="${x}" name="y">
												<br />
												<bean:define id="x" value="${y+2}" />
											</logic:equal>
												<span><bean:write name="mon" property="ten"/>. </span>
											  <bean:define id="y" value="${y+1}" />
										</logic:iterate>
									</logic:notEmpty>
									<logic:empty name="ac" property="listGiangDay">
										<span>Chưa có môn học nào</span>
									</logic:empty>
								</td>
								<td><a href="#" class="btn-capNhatGV" id="btn-capNhatGV_${maGV}"
											data-id="${maGV}" data-name="${hoTen}" data-maDD="${maDD}" data-toggle="modal" data-target=".frm-sua">
											<span class="glyphicon glyphicon-edit"></span>
										</a>
									<a href="#" class="delete-GV" data-url="xoaGiangVien.do?maGV=${maGV}"
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
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI GIẢNG VIÊN</h4>
    </div>
       
    <div class="modal-body">
       <i class="fa fa-crosshairs"></i> Mã định danh <input type="text" class="form-control" placeholder="Mã định danh Giảng viên" id="maDDThem">
       <br /><i class="fa fa-user-secret"></i> Họ tên <input type="text" class="form-control" placeholder="Họ và Tên giảng viên" id="tenGVThem">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemGV" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themGV"  data-url="themGiangVien.do">Thêm mới</button>
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
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN GIẢNG VIÊN</h4>
    </div>
    <div class="modal-body">
    	<i class="fa fa-crosshairs"></i> Mã định danh <input type="text" class="form-control" placeholder="Mã định danh Giảng viên" id="maDDSua">
       <br /><i class="fa fa-user-secret"></i> Họ tên <input type="text" class="form-control" placeholder="Tên Khóa học" id="tenGVSua">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaGV" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary" id="btn-suaGV"  data-url="suaGiangVien.do" data-id="" >Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->

<!-- End Form sửa -->


<script type="text/javascript">
	function reset(){
		$('#tenGVThem').val("");
		$('#tenGVSua').val("");
		$('#maDDThem').val("");
		$('#maDDSua').val("");
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
		$('.delete-GV').click(function() {
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
	
	$('.btn-themGV').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var maD = $('#maDDThem').val();
		var tenGV = $('#tenGVThem').val();
		$.post(url,{maDD:maD,hoTen:tenGV}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3" && result != "4") {
				if(result !="false"){
					alert("Thêm thành công!");
					var tr = '<tr>'
						+'<td>'+result+'</td>'
						+'<td id="row_'+result+'"><i class="fa fa-user-secret"></i> <b>Họ tên</b>:'+tenGV+'<br/>'
						+'<i class="fa fa-crosshairs"></i><b>Mã định danh</b>: '+maD+'</td>'
						+'<td><span>Chưa có môn học nào</span></td>'
						+'<td><a  class="btn-capNhatGV" '
						+'href="#" data-id="'+result+'" data-name="'+tenGV+'" data-maDD="'+maD+'" data-toggle="modal" data-target=".frm-sua">'
								+'<span class="glyphicon glyphicon-edit"></span>'
								+'</a>'
							+'<a href="#" class="delete-GV" data-url="xoaGiangVien.do?maGV='+result+'"'
								+'style="margin-left: 30px;"> '
								+'<span class="glyphicon glyphicon-trash"></span>'
								+'</a>'
							+'</td>'
					+'</tr>';
					$('#tbodyTable').append(tr);
					loadXoa();
					loadCapNhat();
					$('#btn-closeThemGV').click();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Mã định danh không được để trống!");
				} if(result == "1"){
					alert("Tên Giảng viên không được để trống!");
				} else if(result == "2"){
					alert("Mã định danh đã tồn tại!");
				} else if(result == "3"){
					alert("Tên Giảng viên không đượt vượt quá 50 ký tự");
				} else if(result == "4"){
					alert("Tên Giảng viên sai định dạng");
				}
			}
		});
	});
	function loadCapNhat(){
		$('.btn-capNhatGV').click(function(){
			$('#tenGVSua').val($(this).attr("data-name"));
			$('#maDDSua').val($(this).attr("data-maDD"));
			$('#btn-suaGV').attr("data-id",$(this).attr("data-id"));
		});
	}
	
	$('#btn-suaGV').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var id = $this.attr('data-id');
		var tenGV = $('#tenGVSua').val();
		var maD = $('#maDDSua').val();
		$.post(url,{maGV:id, maDD:maD, hoTen:tenGV}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3" && result != "4") {
				if(result !="false"){
					alert("Cập nhật thành công!");
					var div = '<i class="fa fa-user-secret"></i> <b>Họ tên</b>:'+tenGV+'<br/>'
								+'<i class="fa fa-crosshairs"></i> <b>Mã định danh</b>: '+maD;
					$("#row_"+id).html(div);
					$('#btn-capNhatGV_'+id).attr('data-name',tenGV);
					$('#btn-capNhatGV_'+id).attr('data-maDD',maD);
					$('#btn-closeSuaGV').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Mã định danh không được để trống!");
				} else if(result == "1"){
					alert("Tên Giảng viên không được để trống!");
				} else if(result == "2"){
					alert("Mã định danh đã tồn tại!");
				} else if(result == "3"){
					alert("Tên Giảng viên không đượt vượt quá 50 ký tự");
				} else if(result == "4"){
					alert("Tên Giảng viên sai định dạng");
				}
			}
		});
	});
	loadCapNhat();
	loadXoa();
	taoTable();

	
</script>