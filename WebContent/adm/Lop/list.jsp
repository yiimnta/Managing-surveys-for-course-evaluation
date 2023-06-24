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
				<h5>Danh sách lớp</h5>
				<div class="ibox-tools">
					<button type="button" class="btn btn-primary  fa fa-plus" data-toggle="modal" data-target=".bs-example-modal-sm">
						Thêm lớp mới
					</button>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsLopForm" property="dsLop" >
					<h3 style="text-align:center;">Hiện tại chưa có Lớp nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsLopForm" property="dsLop" >
					<table id="pageIndex" class="table table-striped table-hover">
						
						<thead>
							<tr>
								<th>Mã lớp</th>
								<th>Tên lớp</th>
								<th>Khóa học</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbodyTable">
							<logic:iterate name="dsLopForm" property="dsLop"
								id="ac">
								<bean:define id="maLop" name="ac" property="maLop" />
								<bean:define id="ten"  name="ac" property="ten" />
								<bean:define id="maKhoa"  name="ac" property="maKhoa" />
								<bean:define id="khoa"  name="ac" property="khoa" />
									<bean:define id="tenKhoa"  name="khoa" property="tenKhoa" />
								<tr>
									<td>${maLop}</td>
									<td id="rowTen_${maLop}">${ten}</td>
									<td id="rowKhoa_${maLop}">${tenKhoa}</td>
									<td><a href="#" class="btn-capNhatLop" id="btn-capNhatLop_${maLop}"
											data-id="${maLop}" data-name="${ten}" data-maK="${maKhoa}" data-toggle="modal" data-target=".frm-sua">
											<span class="glyphicon glyphicon-edit"></span>
										</a> 
										<a href="#" class="delete-khoa" data-url="xoaLopHoc.do?maLop=${maLop}"
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
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI LỚP</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên Lớp học" id="tenLopThem"><br/>
       Chọn Khóa học 
       <logic:notEmpty name="dsLopForm" property="dsKhoa">
	       <html:select name="dsLopForm" property="maKhoaThem" styleId="maKhoaThem" styleClass="form-control">
	        	<html:optionsCollection name="dsLopForm" property="dsKhoa" label="tenKhoa" value="maKhoa" />
	        </html:select>
        </logic:notEmpty>
        <logic:empty name="dsLopForm" property="dsKhoa">
        	<span>Hiện tại chưa có khóa học nào!<br/>
        	Vui lòng thêm mới Khoa tại </span><a href="qlKhoaHoc.do">đây</a>
        </logic:empty>
       
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemLop" onclick="reset()">Đóng</button>
        
        <button type="button" class="btn btn-primary btn-themLop"  data-url="themLopHoc.do">Thêm mới</button>
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
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN LỚP</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên lớp" id="tenLopSua"><br/>
       <logic:notEmpty name="dsLopForm" property="dsKhoa">
	       <html:select name="dsLopForm" property="maKhoaSua" styleId="maKhoaSua" styleClass="form-control">
	        	<html:optionsCollection name="dsLopForm" property="dsKhoa" label="tenKhoa" value="maKhoa" />
	        </html:select>
        </logic:notEmpty>
        <logic:empty name="dsLopForm" property="dsKhoa">
        	<span>Hiện tại chưa có khóa học nào!<br/>
        	Vui lòng thêm mới Khoa tại </span><a href="qlKhoaHoc.do">đây</a>
        </logic:empty>
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaLop" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary" id="btn-suaLop"  data-url="suaLopHoc.do" data-id="" >Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->

<!-- End Form sửa -->


<script type="text/javascript">
	function reset(){
		$('#tenLopThem').val("");
		$('#tenLopSua').val("");
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
	
	$('.btn-themLop').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tenLopThem').val();
		var maK =  $('#maKhoaThem').val();
		var tenKhoa = $('#maKhoaThem').find("option[value='"+maK+"']").text();
		$.post(url,{tenLop:tenK,maKhoa:maK}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3") {
				if(result !="false"){
					alert("Thêm thành công!");
					var tr = '<tr>'
						+'<td>'+result+'</td>'
						+'<td id="rowTen_'+result+'">'+tenK+'</td>'
						+'<td id="rowKhoa_'+result+'">'+tenKhoa+'</td>'
						+'<td><a  class="btn-capNhatLop" id="btn-capNhatLop_'+result+'" '
						+'href="#" data-id='+result+'" data-name="'+tenK+'" data-maK="'+maK+'" data-toggle="modal" data-target=".frm-sua">'
								+'<span class="glyphicon glyphicon-edit"></span>'
								+'</a> '
							+'<a href="#" class="delete-khoa" data-url="xoaLopHoc.do?maLop='+result+'"'
								+'style="margin-left: 30px;"> '
								+'<span class="glyphicon glyphicon-trash"></span>'
								+'</a>'
							+'</td>'
					+'</tr>';
					$('#tbodyTable').append(tr);
					loadXoa();
					loadCapNhat();
					$('#btn-closeThemLop').click();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tên lớp không được để trống!");
				} else if(result == "1"){
					alert("Tên lớp đã tồn tại!");
				} else if(result == "2"){
					alert("Tên lớp không đượt vượt quá 50 ký tự");
				}  else if(result == "3"){
					alert("Tên lớp sai định dạng");
				}
			}
		});
	});
	function loadCapNhat(){
		$('.btn-capNhatLop').click(function(){
			$('#tenLopSua').val($(this).attr("data-name"));
			$('#maKhoaSua').val($(this).attr("data-maK"));
			$('#btn-suaLop').attr("data-id",$(this).attr("data-id"));
		});
	}
	
	$('#btn-suaLop').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var id = $this.attr('data-id');
		var tenK = $('#tenLopSua').val();
		var maK =  $('#maKhoaSua').val();
		var tenKhoa = $('#maKhoaSua').find("option[value='"+maK+"']").text();
		$.post(url,{maLop:id, tenLop:tenK, maKhoa:maK}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3") {
				if(result !="false"){
					alert("Cập nhật thành công!");
					$("#rowTen_"+id).html(tenK);
					$("#rowKhoa_"+id).html(tenKhoa);
					$('#btn-capNhatLop_'+id).attr('data-name',tenK);
					$('#btn-capNhatLop_'+id).attr('data-maK',maK);
					$('#btn-closeSuaLop').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tên lớp không được để trống!");
				} else if(result == "1"){
					alert("Tên lớp đã tồn tại!");
				} else if(result == "2"){
					alert("Tên lớp không đượt vượt quá 50 ký tự");
				} else if(result == "3"){
					alert("Tên lớp sai định dạng");
				}
			}
		});
	});
	loadCapNhat();
	loadXoa();
	taoTable();
	
	
</script>