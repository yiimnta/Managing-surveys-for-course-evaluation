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
				<h5>Danh sách Loại phiếu đánh giá</h5>
				<div class="ibox-tools">
					<!-- <button type="button" class="btn btn-primary  fa fa-plus" data-toggle="modal" data-target=".bs-example-modal-sm">
						Thêm Loại Phiếu đánh giá mới
					</button> -->
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsLoaiPhieuForm" property="dsLoaiPhieu" >
					<h3 style="text-align:center;">Hiện tại chưa có Loại Phiếu đánh giá nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsLoaiPhieuForm" property="dsLoaiPhieu" >
					<table id="pageIndex" class="table table-striped table-hover">
						
						<thead>
							<tr>
								<th>Mã loại</th>
								<th>Tên </th>
								<th>Hiển thị</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbodyTable">
							<logic:iterate name="dsLoaiPhieuForm" property="dsLoaiPhieu"
								id="ac">
								<bean:define id="loaiP" name="ac" property="loaiP" />
								<bean:define id="ten"  name="ac" property="ten" />
								<bean:define id="trangThai"  name="ac" property="trangThai" />
								<tr>
									<td>${loaiP}</td>
									<td id="row_${loaiP}">${ten}</td>
									<td id="rowtt_${loaiP}">
										<logic:equal value="0" name="trangThai">
											Không
										</logic:equal> 
										<logic:equal value="1" name="trangThai">
											Đang hiển thị
										</logic:equal> 
									</td>
									<td><a href="#" class="btn-capNhatLP" id="btn-capNhatLP_${loaiP}"
											data-id="${loaiP}" data-name="${ten}" data-tt="${trangThai}" data-toggle="modal" data-target=".frm-sua">
											<span class="glyphicon glyphicon-edit"></span>
										</a> 
										<%-- <a href="#" class="delete-LP" data-url="xoaLoaiPhieu.do?loaiP=${loaiP}"
											style="margin-left: 30px;"> 
											<span class="glyphicon glyphicon-trash"></span>
										</a> --%>
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
<!-- <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI LOẠI PHIẾU</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên Loại phiếu" id="tenLPThem">
       <input type="checkbox" id="ttLPThem"> Hiển thị
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemLP" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themLP"  data-url="themLoaiPhieu.do">Thêm mới</button>
      </div>
      </div>
    </div>/.modal-content
 </div>/.modal-dialog -->

<!-- End Form thêm -->

<!-- Form sửa -->
<div class="modal fade frm-sua" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN LOẠI PHIẾU</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên Loại phiếu" id="tenLPSua">
       <input type="checkbox" id="ttLPSua"> Hiển thị
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaLP" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary" id="btn-suaLP"  data-url="suaLoaiPhieu.do" data-id="" >Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->

<!-- End Form sửa -->


<script type="text/javascript">
	function reset(){
		$('#tenLPThem').val("");
		$('#tenLPSua').val("");
		$('#ttLPThem').prop('checked',false);
		$('#ttLPSua').prop('checked',false);
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
	
	/* function loadXoa(){
		$('.delete-LP').click(function() {
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
	} */
	
	/* $('.btn-themLP').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tenLPThem').val();
		var tt = "0";
		var trangThai="Không";
		if($('#ttLPThem').is(':checked')){
			tt = "1";
			trangThai = "Đang hiển thị";
		}
		$.post(url,{ten:tenK,trangThai:tt}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Thêm thành công!");
					var tr = '<tr>'
						+'<td>'+result+'</td>'
						+'<td id="row_'+result+'">'+tenK+'</td>'
						+'<td>'+trangThai+'</td>'
						+'<td><a  class="btn-capNhatLP" '
						+'href="#" data-id='+result+'" data-name="'+tenK+'" data-tt="'+tt+'" data-toggle="modal" data-target=".frm-sua">'
								+'<span class="glyphicon glyphicon-edit"></span>'
								+'</a> '
							+'<a href="#" class="delete-LP" data-url="xoaLoaiPhieu.do?loaiP='+result+'"'
								+'style="margin-left: 30px;"> '
								+'<span class="glyphicon glyphicon-trash"></span>'
								+'</a>'
							+'</td>'
					+'</tr>';
					$('#tbodyTable').append(tr);
					loadXoa();
					loadCapNhat();
					$('#btn-closeThemLP').click();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tên Loại phiếu không được để trống!");
				} else if(result == "1"){
					alert("Tên Loại phiếu đã tồn tại!");
				}
			}
		});
	}); */
	function loadCapNhat(){
		$('.btn-capNhatLP').click(function(){
			$('#tenLPSua').val($(this).attr("data-name"));
			$('#btn-suaLP').attr("data-id",$(this).attr("data-id"));
			var test = false;
			if($(this).attr("data-tt") == "1") {
				test = true;
			}
			$('#ttLPSua').prop('checked',test);
		});
	}
	
	$('#btn-suaLP').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var id = $this.attr('data-id');
		var tenK = $('#tenLPSua').val();
		var tt = "0";
		var trangThai="Không";
		if($('#ttLPSua').is(':checked')){
			tt = "1";
			trangThai = "Đang hiển thị";
		}
		$.post(url,{loaiP:id, ten:tenK, trangThai:tt}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false") {
					alert("Cập nhật thành công!");
					$("#row_"+id).html(tenK);
					$("#rowtt_"+id).html(trangThai);
					$('#btn-capNhatLP_'+id).attr('data-name',tenK);
					$('#btn-capNhatLP_'+id).attr('data-tt',tt);
					$('#btn-closeSuaLP').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tên Loại phiếu không được để trống!");
				} else if(result == "1"){
					alert("Tên Loại phiếu đã tồn tại!");
				}
			}
		});
	});
	
	taoTable();
	loadCapNhat();
	//loadXoa();
	
</script>