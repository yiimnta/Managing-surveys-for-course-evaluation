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
				<bean:define id="phieuDanhGia" name="dsChiTietKetQuaForm" property="phieuDanhGia" />
				<bean:define id="tieuDeDG" name="phieuDanhGia" property="tieuDe" />
				<bean:define id="nguoiDung" name="phieuDanhGia" property="nguoiDung" />
				<bean:define id="hoTen" name="nguoiDung" property="hoTen" />
				<bean:define id="maDN" name="nguoiDung" property="maDN" />
				<h5>Kết quả đánh giá phiếu: ${tieuDeDG} - &nbsp<i class="fa fa-user"></i>: ${hoTen} &nbsp(<b style="color:red;">${maDN}</b>)  </h5>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsChiTietKetQuaForm" property="dsNoiDung" >
					<h3 style="text-align:center;">Hiện tại chưa có Chi tiết Kết quả đánh giá nào cả</h3>
				</logic:empty>
				<logic:notEmpty name="dsChiTietKetQuaForm" property="dsNoiDung" >
				<table id="pageIndex" class="table table-striped table-hover">
					<logic:iterate 	 id="ac" 		name="dsChiTietKetQuaForm"  property="dsNoiDung" >
						<bean:define id="tieuDe"	name="ac" 					property="tieuDe" />
						<bean:define id="maNDu"		name="ac" 					property="maNDu" />
						<tr>
							<td class="info">${tieuDe}</td>
						</tr>
						<bean:define id="stt" 			value="1" />
						<logic:notEmpty name="ac" property="listChiTietNoiDung">
							<tr>
								<td>
									<table id="pageIndex" class="table table-bordered table-hover">
										<logic:iterate id="ctnd" 			name="ac" 	property="listChiTietNoiDung" >
											<bean:define id="maCT" 			name="ctnd" property="maCT" />
					                		<bean:define id="moTa" 			name="ctnd" property="moTa" />
					                		<bean:define id="loaiCT"		name="ctnd" property="loaiCT" />
					                		
					                		<logic:notEmpty name="ctnd" property="listChiTietKetQua">
						                		<logic:iterate id="ctkq" 		name="ctnd" property="listChiTietKetQua" >
						                			<bean:define id="ketQuaDG" 	name="ctkq" property="ketQuaDG" />
								                		<tr>
								                			<td width="50%"><b>${stt}.</b> &nbsp;&nbsp; ${moTa}</td>
								                			<td>${ketQuaDG}</td>
								                		</tr>
								                		<bean:define id="stt" value="${stt+1}" />
							                	</logic:iterate>
					                		</logic:notEmpty>
										</logic:iterate>
									</table>
								</td>
							</tr>
						</logic:notEmpty>
					</logic:iterate>
				</table>
				<div class="ibox-title">Thống kê
				</div>				
				<table class="table table-bordered table-hover">
					<tr>
						<th>Đánh giá</th>
						<th>Số lần</th>
					</tr>
					<logic:iterate 	 id="tk" 		name="dsChiTietKetQuaForm"  property="dsThongKe" >
						<bean:define id="x" 			name="tk" property="x" />
					     <bean:define id="y" 			name="tk" property="y" />
					     <tr>
								<td>
									${x}
								</td>
								<td>
									${y}
								</td>
						</tr>
					</logic:iterate>
				</table>
				
				</logic:notEmpty>
			</div>
		</div>
	</div>
</div>