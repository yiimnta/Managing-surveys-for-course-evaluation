<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<style>
	.liDef{
		border-bottom: 1px solid #e2d4b1;
    	padding: 29px 0 20px;
    }
    
    #list6 { font-family: 'Trebuchet MS', 'Lucida Grande', Verdana, Lucida, Geneva, Helvetica, Arial, sans-serif; }
	#list6 ol { list-style-type: upper-roman; font-size:14px; list-style-position: inside; }
	#list6 ol li { }
	
	.divPDG {
    	background:white!important;
    	font-family:helvetica, arial, sans-serif;
    	padding:6px!important;
    	border-radius:3px!important;
    	/*margin:0px 0px 5px 10px!important;*/
    	border:1px solid #d0d1d5;
    }
</style>
<div class="content-blog">
	<div>
		<div>
			<div class="ibox-title">
				<bean:define id="phieuDanhGia" name="dsNoiDungForm" property="phieuDanhGia" />
				<bean:define id="tieuDeDG" name="phieuDanhGia" property="tieuDe" />
				<h5>Thống kê đánh giá phiếu: ${tieuDeDG}</h5>
			</div>
			<div class="ibox-content p-sm" id="productList">
				<logic:empty name="dsNoiDungForm" property="dsNoiDung" >
					<h3 style="text-align:center;">Có lỗi xảy ra vui lòng liên hệ admin</h3>
				</logic:empty>
				<logic:notEmpty name="dsNoiDungForm" property="dsNoiDung" >
				<table id="pageIndex" class="table table-striped table-hover">
					<logic:iterate 	 id="ac" 		name="dsNoiDungForm"  property="dsNoiDung" >
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
					                		<bean:define id="slNDC"			name="ctnd" property="slNDC" />
					                		<tr>
					                		<td width="50%" rowspan="${slNDC}"><b>${stt}.</b> &nbsp;&nbsp; ${moTa}</td>
						                		<logic:notEmpty name="ctnd" property="listNoiDungCon">
							                		<logic:iterate id="ndc" 		name="ctnd" property="listNoiDungCon" >
							                			<bean:define id="tieuDe" 	name="ndc" property="tieuDe" />
							                			<bean:define id="soBinhChon" 	name="ndc" property="soBinhChon" />
									                		
									                			<td>${tieuDe}</td>
									                			<td>${soBinhChon}</td>
									                		
									                		<bean:define id="stt" value="${stt+1}" />
								                	</logic:iterate>
						                		</logic:notEmpty>
					                		</tr>
										</logic:iterate>
									</table>
								</td>
							</tr>
						</logic:notEmpty>
					</logic:iterate>
				</table>
				
				</logic:notEmpty>
			</div>
		</div>
	</div>
</div>