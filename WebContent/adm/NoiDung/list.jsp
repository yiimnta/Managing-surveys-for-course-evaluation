<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<link href="css/AdmGrid.css" rel="stylesheet" />
<div class="row">
	<div class="col-md-12">
		<!-- định nghĩa biến -->
			<bean:define id="pdg" name="dsNoiDungForm" property="phieuDanhGia"/>
				<bean:define id="tieuDePDG" name="pdg" property="tieuDe"/>
				<bean:define id="maPDG" name="pdg" property="maDG"/>
			<span id="maPDG" data-id="${maPDG}"></span>
			
		
		<!-- kết thúc định nghĩa -->
			<div class="ibox-title">
	                <h5 style="text-transform:uppercase;">
	                	<bean:write name="pdg" property="tieuDe"/>
	                </h5>
	                <div class="ibox-tools">
	                	<button class="btn btn-primary btn-xs hidden-xs" data-action="expand-all">
	                		<i class="fa fa-arrows-v"></i> Co giãn
	                	</button>
	                	<button class="btn btn-primary btn-xs hidden-xs" data-toggle="modal" data-target=".them-noiDung">
	                		<i class="fa fa-plus"></i> Thêm Nội dung mới
	                	</button>
	                </div>
            </div>
            <div class="ibox-content p-sm">
					<logic:empty name="dsNoiDungForm" property="dsNoiDung">
								Hiện tại chưa có Nội dung nào!
					</logic:empty>
				
					<logic:notEmpty name="dsNoiDungForm" property="dsNoiDung">
					<div class="ibox-content p-sm">
				         <div class="dd" id="noiDungl">
	<!-- Danh sách nội dung -->
				            <ol class="dd-list">
								<logic:iterate id="ac" name="dsNoiDungForm" property="dsNoiDung">
								<bean:define id="tieuDe" name="ac" property="tieuDe" />
								<bean:define id="maNDu" name="ac" property="maNDu" />
								
										<li class="dd-item" data-id="${maNDu}" data-iden="ND">
										        <div class="pull-right td_toggle m-r-md m-t-sm">
										        	<button class="btn btn-warning btn-xs hidden-xs btn-themCTnd" data-toggle="modal" 
										        	 style="margin-top:-10px;" data-target=".them-chiTiet" data-id="${maNDu}">
	                									<i class="fa fa-plus"></i> Chi tiết
	                								</button>
	                								
													 <a href="#" class="btn-capNhatNoiDung" id="btn-capNhatNoiDung_${maNDu}"
																data-id="${maNDu}" data-name="${tieuDe}" data-toggle="modal" 
																data-target=".sua-noiDung"
														style="margin-left: 30px;"> 
														<span class="glyphicon glyphicon-edit"></span>
													</a>
													  
										            <a href="#" class="delete-nd" data-url="xoaNoiDung.do?maNDu=${maNDu}"
														style="margin-left: 30px;"> 
														<span class="glyphicon glyphicon-trash"></span>
													</a>
								                	
								                	<!-- <button class="btn btn-primary btn-xs hidden-xs" data-action="expand-all"
														style="margin-left: 30px;"> 
														<i class="fa fa-arrows-v"></i> Co giãn
													</button> -->
										        </div>
										        <div class="dd-handle">
										            <div style="float:left;height:22px;padding:2px 5px 8px 5px;margin-right:15px;" class="navbar-minimalize btn btn-primary">
										            	<small>ND</small>
										            </div>
										            <small id="rowTDND_${maNDu}">${tieuDe}</small>
										        </div>
									            <logic:notEmpty name="ac" property="listChiTietNoiDung">
		<!-- Danh sách chi tiết nội dung -->							            	
										                <ol class="dd-list">
										                	<logic:iterate id="ctnd" name="ac" property="listChiTietNoiDung">
										                		<bean:define id="maCT" name="ctnd" property="maCT" />
										                		<bean:define id="moTa" name="ctnd" property="moTa" />
										                		<bean:define id="loaiCT" name="ctnd" property="loaiCT" />
										                		<li class="dd-item" data-id="${maCT}" data-iden="CT">
															        <div class="pull-right td_toggle m-r-md m-t-sm">
															        	<select value="${loaiCT}" style="border-radius: 5px;" id="rowLoaiCT_${maCT}" class="choose-type-ct" data-id="${maCT}">
															        		<logic:equal value="0" name="loaiCT">
															        			<option value="0" selected><small> Radio </small></option>
															        			<option value="1"><small> Check</small></option>
															        			<option value="2"><small> Text </small></option>
															        		</logic:equal>
															        		
															        		<logic:equal value="1" name="loaiCT">
															        			<option value="0"><small> Radio </small></option>
															        			<option value="1" selected><small> Check</small></option>
															        			<option value="2"><small> Text </small></option>
															        		</logic:equal>
															        		
															        		<logic:equal value="2" name="loaiCT">
															        			<option value="0"><small> Radio </small></option>
															        			<option value="1"><small> Check</small></option>
															        			<option value="2"  selected><small> Text </small></option>
															        		</logic:equal>
															        		
															        		
															        	</select>
															        		<button class="btn btn-info btn-xs hidden-xs btn-themndc" data-toggle="modal" 
																	        	style="margin-top:-10px;" data-target=".them-noiDungCon" data-idct="${maCT}">
								                									<i class="fa fa-plus"></i> Nội dung con
								                							</button>
															        	
															        	
															              <a href="#" class="btn-capNhatChiTiet" id="btn-capNhatChiTiet_${maCT}"
																						data-id="${maCT}" data-loaict="${loaiCT}" data-name="${moTa}" data-idnd="${maNDu}" data-toggle="modal" 
																						data-target=".sua-chiTiet"
																				style="margin-left: 30px;"> 
																				<span class="glyphicon glyphicon-edit"></span>
																			</a>
																		  
															            <a href="#" class="delete-ctnd" data-url="xoaChiTietNoiDung.do?maCT=${maCT}"
																			style="margin-left: 30px;"> 
																			<span class="glyphicon glyphicon-trash"></span>
																		</a>
															        </div>
															        <div class="dd-handle">
															            <div style="float:left;height:22px;padding:2px 5px 8px 5px;margin-right:15px;" class="navbar-minimalize btn btn-warning">
										            						<small>CTND</small>
										            					</div>
										            					<small id="rowMTCT_${maCT}">${moTa}</small>
															        </div>
		<!-- Danh sách nội dung con -->													        
															        <logic:notEmpty name="ctnd" property="listNoiDungCon">
															                <ol class="dd-list">
															                	<logic:iterate id="ndc" name="ctnd" property="listNoiDungCon">
															                		<bean:define id="maNDC" name="ndc" property="maNDC" />
															                		<bean:define id="tieuDeC" name="ndc" property="tieuDe" />
															                		<li class="dd-item" data-id="${maNDC}" data-iden="NDC">
																				        <div class="pull-right td_toggle m-r-md m-t-sm">
																				             <a href="#" class="btn-capNhatNoiDungCon" id="btn-capNhatNoiDungCon_${maNDC}"
																										data-id="${maNDC}" data-name="${tieuDeC}" data-idct="${maCT}" data-toggle="modal" 
																										data-target=".sua-noiDungCon"
																								style="margin-left: 30px;"> 
																								<span class="glyphicon glyphicon-edit"></span>
																							</a>
																							  
																				            <a href="#" class="delete-ndc" data-url="xoaNoiDungCon.do?maNDC=${maNDC}"
																								style="margin-left: 30px;"> 
																								<span class="glyphicon glyphicon-trash"></span>
																							</a>
																				        </div>
																				        <div class="dd-handle">
																				            <div style="float:left;height:22px;padding:2px 5px 8px 5px;margin-right:15px;" class="navbar-minimalize btn btn-info">
															            						<small>NDC</small>
															            					</div>
															            					<small id="rowTDNDC_${maNDC}">${tieuDeC}</small>
																				        </div>
																					</li>
															                    </logic:iterate>
															                </ol>
														            </logic:notEmpty>
															        
																</li>
										                    </logic:iterate>
										                </ol>
									              
									            </logic:notEmpty>
											</li>
								</logic:iterate>
							</ol>
						</div>
					</div>
				</logic:notEmpty>
		</div>
	</div>
</div>

<jsp:include page="addUpdate.jsp" />


<script src="js/plugins/nestable/jquery.nestable.js"></script>
<script type="text/javascript">
	function reset(){
		$('#tieuDeNDThem').val("");
		$('#tieuDeNDSua').val("");
		$('#tieuDeNDConThem').val("");
		$('#tieuDeNDConSua').val("");
		$('#tieuDeCTSua').val("");
	}
	
	function loadCapNhat(){
		$('.btn-capNhatNoiDung').click(function(){
			$('#tieuDeNDSua').val($(this).attr("data-name"));
			$('.btn-suaNoiDung').attr("data-id",$(this).attr("data-id"));
		});
		
		$('.btn-capNhatNoiDungCon').click(function(){
			$('#tieuDeNDConSua').val($(this).attr("data-name"));
			$('.btn-suaNoiDungCon').attr("data-id",$(this).attr("data-id"));
			$('.btn-suaNoiDungCon').data('idct',$(this).attr("data-idct"));
		});
		
		$('.btn-capNhatChiTiet').click(function(){
			$('#tieuDeCTSua').val($(this).attr("data-name"));
			$('#loaiCTSua').val($(this).attr("data-loaict"));
			$('.btn-suaChiTiet').attr("data-id",$(this).attr("data-id"));
			$('.btn-suaChiTiet').attr("data-idct",$(this).attr("data-idct"));
		});
		
		$('.btn-themndc').click(function(){
			$('.btn-themNoiDungCon').attr('data-idct',$(this).attr("data-idct"));
		});
		
		$('.btn-themCTnd').click(function(){
			$('.btn-themChiTiet').attr("data-id",$(this).attr("data-id"));
		});
	}
	
	$('.btn-suaNoiDung').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var id = $this.attr('data-id');
		var tenK = $('#tieuDeNDSua').val();
		var mapdg = $('#maPDG').attr('data-id');
		$.post(url,{maNDu:id, maDG:mapdg, tieuDe:tenK}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Cập nhật thành công!");
					$("#rowTDND_"+id).html(tenK);
					$('#btn-capNhatNoiDung_'+id).attr('data-name',tenK);
					$('#btn-closeSuaNoiDung').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tiêu đề Nội dung không được để trống!");
				} else if(result == "1"){
					alert("Tiêu đề Nội dung đã tồn tại!");
				}
			}
		});
	});
	
	$('.btn-themNoiDung').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tieuDeNDThem').val();
		var mapdg = $('#maPDG').attr('data-id');
		$.post(url,{maDG:mapdg,tieuDe:tenK}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Thêm thành công!");
					$('.btn-themNoiDung').toggleClass('disabled');
					location.reload();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tiêu đề nội dung không được để trống!");
				} else if(result == "1"){
					alert("Tiêu để nội dung đã tồn tại!");
				}
			}
		});
	});
	
	$('.btn-suaNoiDungCon').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var id = $this.attr('data-id');
		var tenK = $('#tieuDeNDConSua').val();
		var mact = $(this).attr('data-idct');
		$.post(url,{maNDC:id,maCT:mact, tieuDe:tenK}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Cập nhật thành công!");
					$("#rowTDNDC_"+id).html(tenK);
					$('#btn-capNhatNoiDungCon_'+id).attr('data-name',tenK);
					$('#btn-closeSuaNoiDungCon').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tiêu đề Nội dung con không được để trống!");
				} else if(result == "1"){
					alert("Tiêu đề Nội dung con đã tồn tại!");
				}
			}
		});
	});
	
	$('.btn-themNoiDungCon').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tieuDeNDConThem').val();
		var mact = $this.attr('data-idct');
		$.post(url,{maCT:mact,tieuDe:tenK}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Thêm thành công!");
					$('.btn-themNoiDungCon').toggleClass('disabled');
					location.reload();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tiêu đề nội dung con không được để trống!");
				} else if(result == "1"){
					alert("Tiêu để nội dung con đã tồn tại!");
				}
			}
		});
	});
	
	$('.btn-themChiTiet').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tieuDeCTThem').val();
		var mandu = $(this).attr('data-id');
		var loaict = $('#loaiCTThem').val();
		$.post(url,{maNDu:mandu,moTa:tenK,loaiCT:loaict}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Thêm thành công!");
					$('.btn-themChiTiet').toggleClass('disabled');
					location.reload();
				} else {
					alert("Thêm thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tiêu đề Chi tiết nội dung không được để trống!");
				} else if(result == "1"){
					alert("Tiêu để Chi tiết nội dung đã tồn tại!");
				}
			}
		});
	});
	
	$('.btn-suaChiTiet').click(function() {
		var $this = $(this);
		var url = $this.attr('data-url');
		var tenK = $('#tieuDeCTSua').val();
		var loaict = $('#loaiCTSua').val();
		var mact = $(this).attr('data-id');
		var mandu = $(this).attr('data-idnd');
		$.post(url,{maCT:mact,maNDu:mandu, moTa:tenK,loaiCT:loaict}, function(result) {
			if (result != "0" && result != "1") {
				if(result !="false"){
					alert("Cập nhật thành công!");
					$("#rowMTCT_"+mact).html(tenK);
					$("#rowLoaiCT_"+mact).val(loaict);
					$('#btn-capNhatChiTiet_'+mact).attr('data-name',tenK);
					$('#btn-capNhatChiTiet_'+mact).attr('data-loaict',loaict);
					$('#btn-closeSuaChiTiet').click();
				} else {
					alert("Cập nhật thất bại!");
				}
			}else {
				if(result == "0"){
					alert("Tiêu đề Chi tiết Nội dung không được để trống!");
				} else if(result == "1"){
					alert("Tiêu đề Chi tiết Nội dung đã tồn tại!");
				}
			}
		});
	});

	$(document).ready(function () {
	    $('#categories').on("click", "[data-toggle-state=true]", function () {
	        var $this = $(this);
	        var url = $this.attr('data-url');
	        var args = $this.attr('data-args');
	        $.post(url,
	            { "args": args },
	            function (data) {
	                if (data.Result) {
	                    $this.attr('data-args', data.Message);
	                    $this.toggleClass('true');
	                } else {
	                    alert(data.Message);
	                }
	            }
	        );
	    });
		
	    $('.choose-type-ct').change(function(){
	    	var value = $(this).val();
	    	var mact = $(this).data('id');
	    	$.post('suaLoaiChiTietNoiDung.do',{maCT:mact,loaiCT:value},function(result){
	    		if(result=="false"){
	    			alert('Thay đổi thất bại');
	    		}
	    	});
	    });
	    
	    $('#noiDungl').nestable({
	        group: 1,
	        maxDepth: 3, //Toi da la 3 muc
	        dragFinished: function (currentNode, parentNode) {
                var pid = 0;
                var idenC = $(currentNode).data('iden');
                var idenP = "";
                //Xac dinh phan tu cha
                if (parentNode) {
                    parentNode = $(parentNode);
                    pid = parentNode.data('id');
                } else {
                	parentNode = $('#noiDungl');
                };
                idenP = parentNode.data('iden');
                var test =true;
                
               	if(idenC == "ND"){
               		if(idenP == "CT" || idenP == "ND" || idenP == "NDC"){
               			alert('Không thể đặt Nội dung tại đây');
               			test = false;
               		}
               	}else if(idenC =="CT") {
               		if(idenP == null || idenP == "CT" || idenP == "NDC"){
               			alert('Không thể đặt Chi tiết Nội dung tại đây');
               			test = false;
               		}
               	}else if(idenC == "NDC"){
               		if(idenP == null || idenP != "CT"){
               			alert('Không thể đặt Nội dung con tại đây');
               			test = false;
               		}
               	}
               	
               	//lấy id phần tử cha
               	var pid = "";
               	if(idenP != null){
               		pid= parentNode.data('id');
               	}
				
               	if(test){
               		 //Tim cac phan tu li cung cap
	                var list = parentNode.children('ol');
	                var items = $(list).children('li');
	                var listVT="";
	                
	                //Lay id cua tung noi dung, ctnd, ndc trong cac li
	                //Dua vao mang gui len server xu ly
	                items.each(function () {
	                   listVT+=$(this).data('id')+",";
	                });
	                listVT= listVT.substring(0,listVT.length-1);
	                
	                $.post('sapXepPhanTu.do',{listVitri:listVT,loaiSX:idenC,parrentId:pid},function(result){
	                	if(result == "false"){
	                		alert('Cập nhật thất bại!');
	                	}
	                });
               	}else {
               		location.reload();
               	}
	        }
	    },"collapseAll");
	    
	    $('#noiDungl').nestable("collapseAll");
	
	    $('div.ibox-tools').on('click', function (e) {
	        var target = $(e.target),
	            action = target.data('action');
	        if (action === 'expand-all'){
	            $('.dd').nestable('expandAll');
	            target.data('action','collapse-all');
	        }
	        if (action === 'collapse-all') {
	            $('.dd').nestable('collapseAll');
	            target.data('action','expand-all');
	        }
	    })
	    
	});
	function loadXoa(){
		$('.delete-nd, .delete-ctnd, .delete-ndc').click(function() {
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
	loadCapNhat();
	
</script>