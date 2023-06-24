<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<style>
	.liDef {
		border-bottom: 1px solid #e2d4b1;
    	padding: 29px 0 20px;
    }
    
    .divD {
    	background:white!important;
    	font-family:helvetica, arial, sans-serif;
    	padding:6px!important;
    	border-radius:3px!important;
    	margin:0px 0px 5px 0px!important;
    	border:1px solid #d0d1d5;
    }
</style>

<div class="content-blog">
	<div>
		<div>
			<div class="divD">
				<h3 style="margin:0px;color:#3b5998;padding-left:20px;"><b>Phiếu đánh giá <bean:write name="loaiP" scope="request" /></b></h3>
			</div>
			<img src="Images/pdgIndex.jpg" alt="" style="border-radius:3px;">
			<hr style="margin:5px;"/>
			<ul>
			<logic:notEmpty name="frontDsPhieuDanhGiaForm" 	 property="dsPhieuDanhGia">
				<bean:define id="loaiP" name="frontDsPhieuDanhGiaForm" 	 property="loaiP"/>
				<logic:iterate id="pdg" name="frontDsPhieuDanhGiaForm" 	 property="dsPhieuDanhGia">
					<bean:define id="maDG" 					name="pdg" 	 property="maDG"/>
					<bean:define id="tieuDe" 				name="pdg"	 property="tieuDe"/>
					<bean:define id="thoiGianDang" 			name="pdg" 	 property="thoiGianDang"/>
					<bean:define id="soLanDG" 				name="pdg" 	 property="soLanDG"/>
					<bean:define id="maLoaiP" 				name="pdg" 	 property="loaiP"/>
					<bean:define id="flag" 					name="pdg" 	 property="flag" />
					
					<bean:define id="nguoiDung" 			name="pdg" 	 property="nguoiDung" />
					<bean:define id="hoTenND" 				name="nguoiDung" property="hoTen" />
					<bean:define id="maDNND" 				name="nguoiDung" property="maDN" />
					
					<bean:define id="loaiPhieu"				name="pdg"	 property="loaiPhieu"/>
					<bean:define id="tenLoaiPhieu"					name="loaiPhieu"	 property="ten"/>
					<li class="liDef divD">
						<div style="padding-right:15px;border-bottom: 1px solid #e5e5e5;">
							<span class="btn lpdgNew" data-lp="${maLoaiP}" style="padding:5px; color:white;margin-bottom:8px;">${tenLoaiPhieu}</span>
							<h4 style="float:left; margin:10px 0 0 5px;">
								<a href="phieuDanhGia.do?maDG=${maDG}" style="color:#3b5998;">${tieuDe}</a>
							</h4>
						</div>
						<div style="padding-right:15px;">
							<span><i class="fa fa-calendar"></i> Thời gian đăng <a href="#">${thoiGianDang}</a><br/>
							<i class="fa fa-user-secret"></i> Người đăng: <a href="#"> ${maDNND}</a></span>
							<span><i class="fa fa-pencil-square-o"></i><a href="#"> ${soLanDG} đánh giá</a></span>
						</div>
						<logic:equal name="flag" value="0">
							<i class="fa fa-share"></i><a href="phieuDanhGia.do?maDG=${maDG}" style="text-transform:none;"> Đánh giá...</a>
						</logic:equal>
						<logic:notEqual name="flag" value="0">
							<i class="fa fa-file-text-o"></i><a href="xemKetQua.do?maKQ=${flag}" style="text-transform:none;"> Xem kết quả...</a>
							<img src="Images/logodadanhgia.gif" style="margin-left:230px;"/>
						</logic:notEqual>
					</li>
				</logic:iterate>
			</logic:notEmpty>
			<logic:empty name="frontDsPhieuDanhGiaForm" 	 property="dsPhieuDanhGia">
				<li>Chưa có phiếu đánh giá nào</li>
			</logic:empty>
			</ul>
			<script>
					$('.lpdgNew').each(function(){
						switch($(this).data('lp')){
							case 1:
								$(this).toggleClass('btn-info');
								break;
							case 2:
								$(this).toggleClass('btn-success');
								break;
							case 3:
								$(this).toggleClass('btn-danger');
								break;
							default: break;
						}
					});
				</script>
			<logic:notEmpty name="frontDsPhieuDanhGiaForm" property="listPage">
			<div class="paging">
				<ul>
					<bean:define id="curPage" name="frontDsPhieuDanhGiaForm" property="curPage" />
					<bean:define id="maxPage" name="frontDsPhieuDanhGiaForm" property="maxPage" />
					<logic:notEqual value="1" name="curPage">
							<li class="">
								<a href="dsPhieuDanhGia.do?curPage=1&loaiP=${loaiP}" style="width:50px;"> Đầu </a>
							</li>
							<li class="">
								<a href="dsPhieuDanhGia.do?curPage=${curPage -1}&loaiP=${loaiP}"> < </a>
							</li>
					</logic:notEqual>
					<logic:iterate id="pageP" name="frontDsPhieuDanhGiaForm" property="listPage">
						<logic:equal value="${curPage}" name="pageP">
							<li class="selected">
								<a href="#">${pageP}</a>
							</li>
						</logic:equal>
						<logic:notEqual value="${curPage}" name="pageP">
							<li>
								<a href="dsPhieuDanhGia.do?curPage=${pageP}&loaiP=${loaiP}">${pageP}</a>
							</li>
						</logic:notEqual>
					</logic:iterate>
					<logic:notEqual value="${maxPage}" name="curPage">
							<li class="">
								<a href="dsPhieuDanhGia.do?curPage=${curPage +1}&loaiP=${loaiP}"> > </a>
							</li>
							<li class="">
								<a href="dsPhieuDanhGia.do?curPage=${maxPage}&loaiP=${loaiP}" style="width:50px;"> Cuối </a>
							</li>
					</logic:notEqual>
				</ul>
				<span>Trang ${curPage} của tổng ${maxPage}</span>
			</div>
			</logic:notEmpty>
		</div>
		<jsp:include page="/sideBar.do" />
	</div>
</div>