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
				<h5>Danh sách môn học</h5>
				<div class="ibox-tools">
					<button type="button" class="btn btn-primary  fa fa-plus" data-toggle="modal" data-target=".bs-example-modal-sm">
						Thêm môn học mới
					</button>
				</div>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsMonHocForm" property="dsMon" >
					<h3 style="text-align:center;">Hiện tại chưa có môn học nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsMonHocForm" property="dsMon" >
					<table id="pageIndex" class="table table-striped table-hover">
						
						<thead>
							<tr>
								<th>Mã môn học</th>
								<th>Tên môn học</th>
								<th>Số Tín Chỉ</th>
								<th>Loại Môn Học</th>
								<th>Trạng Thái</th>
								<th></th>
							</tr>
						</thead>
						
						<tbody id="tbodyTable">
							<logic:iterate name="dsMonHocForm" property="dsMon" id="ac">
								<bean:define id="maMH" name="ac" property="maMH" />
								<bean:define id="ten"  name="ac" property="ten" />
								<bean:define id="soTC"  name="ac" property="soTC" />
								<bean:define id="loaiMH"  name="ac" property="loaiMH" />
								<bean:define id="trangThai"  name="ac" property="trangThai" />
								<tr>
									<td>${maMH}</td>
									<td id="rowTen_${maMH}">${ten}</td>
									<td id="rowTC_${maMH}">${soTC}</td>
									<td id="rowLM_${maMH}">
										<logic:equal value="1" name="ac" property="loaiMH">
											Bắt buộc
										</logic:equal>
										<logic:equal value="0" name="ac" property="loaiMH">
											Tự chọn
										</logic:equal>
									</td>
									<td id="rowTT_${maMH}">
										<logic:equal value="1" name="ac" property="trangThai">
											Đang mở
										</logic:equal>
										<logic:equal value="0" name="ac" property="trangThai">
											Đóng
										</logic:equal>
									</td>
									<td><a href="#" class="btn-capNhatKhoa" id="btn-capNhatKhoa_${maMH}"
											data-id="${maMH}" data-name="${ten}"
											 data-soTC="${soTC}" data-loaiM="${loaiMH}"
											 data-tt = "${trangThai}"
											 data-toggle="modal" data-target=".frm-sua">
											<span class="glyphicon glyphicon-edit"></span>
										</a> 
										<a href="#" class="delete-khoa" data-url="xoaMonHoc.do?maMon=${maMH}"
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
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI MÔN HỌC</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên môn học" id="tenMonHocThem"><br/>
       <input type="text" class="form-control" placeholder="Số tín chỉ" id="soTCThem"><br/>
       Bắt buộc :<input type="checkbox" id="loaiMHThem"><br/>
       Mở học phần: <input type="checkbox" id="ttThem">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemKhoa" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themKhoa"  data-url="themMonHoc.do">Thêm mới</button>
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
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN MÔN HỌC</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tên môn học" id="tenMonHocSua"><br/>
       <input type="text" class="form-control" placeholder="Số tín chỉ" id="soTCSua"><br/>
       Bắt buộc :<input type="checkbox" id="loaiMHSua"><br/>
       Mở học phần: <input type="checkbox" id="ttSua">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaKhoa" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary" id="btn-suaKhoa"  data-url="suaMonHoc.do" data-id="" >Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->

<!-- End Form sửa -->


<script type="text/javascript">
	function reset(){
		$('#tenMonHocThem').val("");
		$('#soTCThem').val("");
		$('#loaiMHThem').prop("checked",false);
		$('#ttThem').prop("checked",false);
		
		$('#tenMonHocSua').val("");
		$('#soTCSua').val("");
		$('#loaiMHSua').prop("checked",false);
		$('#ttSua').prop("checked",false);
		//sửa làm tương tự
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
		var tenK = $('#tenMonHocThem').val();
		var soTCa = $('#soTCThem').val();
		var loaia = $('#loaiMHThem').prop("checked");
		var tta = $('#ttThem').prop("checked");
		var loaiMon = "Bắt buộc";
		var datalm = 1;
		if(!loaia){
			loaiMon="Tự chọn";
			datalm = 0;
		}
		
		var datatt = 1;
		var trangT = "Đang mở";
		if(!tta){
			trangT="Đóng";
			datatt =0;
		}
		$.post(url,{tenMon:tenK,soTC:soTCa,loaiMH:datalm,trangThai:datatt}, function(result) {
			if (result != "0" && result != "1" && result != "2" && result != "3" && result != "4" && result != "5") {
				if(result !="false"){
					alert("Thêm thành công!");
					var tr = '<tr>'
						+'<td>'+result+'</td>'
						+'<td id="rowTen_'+result+'">'+tenK+'</td>'
						+'<td id="rowTC_'+result+'">${soTC}</td>'
						+'<td id="rowLM_'+result+'">'+loaiMon+'</td>'
						+'<td id="rowTT_'+result+'">'+trangT+'</td>'
						+'<td><a  class="btn-capNhatKhoa" '
						+'href="#" data-id='+result+'" data-name="'+tenK+'"'
								+' data-soTC="'+soTCa+'" data-loaiM="'+datalm+'"'
								+' data-tt = "'+datatt+'"'
								+' data-toggle="modal" data-target=".frm-sua">'
								+' <span class="glyphicon glyphicon-edit"></span>'
								+'</a> '
							+'<a href="#" class="delete-khoa" data-url="xoaMonHoc.do?maMon='+result+'"'
								+' style="margin-left: 30px;"> '
								+' <span class="glyphicon glyphicon-trash"></span>'
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
					alert("Tên môn học không được để trống!");
				} else if(result == "1"){
					alert("Tên môn học đã tồn tại!");
				} else if(result == "2"){
					alert("Số tín chỉ phải là số lớn hơn 0!");
				} else if(result == "3"){
					alert("Số tín chỉ phải lớn hơn 0!");
				} else if(result == "4"){
					alert("Tên môn học không đượt vượt quá 50 ký tự");
				} else if(result == "5"){
					alert("Tên môn học sai định dạng");
				}
			}
		});
	});
	
	function loadCapNhat(){
		$('.btn-capNhatKhoa').click(function(){
			$('#tenMonHocSua').val($(this).attr("data-name"));
			$('#btn-suaKhoa').attr("data-id",$(this).attr("data-id"));
			$('#soTCSua').val($(this).attr("data-soTC"));
			if($(this).attr("data-loaiM") == "1"){
				$('#loaiMHSua').prop("checked",true);
			}else {
				$('#loaiMHSua').prop("checked",false);
			}
			if($(this).attr("data-tt") == "1"){
				$('#ttSua').prop("checked",true);
			}else {
				$('#ttSua').prop("checked",false);
			}
		});
	}

	$('#btn-suaKhoa').click(function() {
		
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tenMonHocSua').val();
		var soTCa = $('#soTCSua').val();
		var loaia = $('#loaiMHSua').prop("checked");
		var tta = $('#ttSua').prop("checked");
		
		var loaiMon = "Bắt buộc";
		var datalm = 1;
		if(!loaia){
			loaiMon="Tự chọn";
			datalm = 0;
		}
		
		var datatt = 1;
		var trangT = "Đang mở";
		if(!tta){
			trangT="Đóng";
			datatt =0;
		}
		var id = $this.attr('data-id');
		
	$.post(url,{maMon:id,tenMon:tenK,soTC:soTCa,loaiMH:datalm,trangThai:datatt}, function(result) {
		if (result != "0" && result != "1" && result != "2" && result != "3"  && result != "4" && result != "5") {
			if(result !="false"){
				alert("Cập nhật thành công!");
				$("#rowTen_"+id).html(tenK);
				$("#rowTC_"+id).html(soTCa);
				$("#rowLM_"+id).html(loaiMon);
				$("#rowTT_"+id).html(trangT);
				$('#btn-capNhatKhoa_'+id).attr('data-name',tenK);
				$('#btn-capNhatKhoa_'+id).attr('data-soTC',soTCa);
				$('#btn-capNhatKhoa_'+id).attr('data-loaiM',datalm);
				$('#btn-capNhatKhoa_'+id).attr('data-tt',datatt);
				$('#btn-closeSuaKhoa').click();
			} else {
				alert("Cập nhật thất bại!");
			}
		}else {
			if(result == "0"){
				alert("Tên môn học không được để trống!");
			} else if(result == "1"){
				alert("Tên môn học đã tồn tại!");
			} else if(result == "2"){
				alert("Số tín chỉ phải là số lớn hơn 0!");
			} else if(result == "3"){
				alert("Số tín chỉ phải lớn hơn 0!");
			} else if(result == "4"){
				alert("Tên môn học không đượt vượt quá 50 ký tự");
			} else if(result == "5"){
				alert("Tên môn học sai định dạng");
			}
		}
	});
});
	loadCapNhat();
	loadXoa();
	taoTable();

</script>