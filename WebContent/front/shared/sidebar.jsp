<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<style>
	ol {
	    counter-reset: li; /* Initiate a counter */
	    list-style: none; /* Remove default numbering */
	    *list-style: decimal; /* Keep using default numbering for IE6/7 */
	    font: 15px 'trebuchet MS', 'lucida sans';
	    padding: 0;
	    /*margin-bottom: 4em;*/
	    text-shadow: 0 1px 0 rgba(255,255,255,.5);
	}
	
	ol ol {
	    margin: 0 0 0 2em; /* Add some left margin for inner lists */
	}
	
	.rounded-list a{
	    position: relative;
	    display: block;
	    padding: .4em .4em .4em 2em;
	    *padding: .4em;
	    margin: .5em 0;
	    background: #e5ede8;
	    color: #0d8ba1;
	    text-decoration: none;
	    border-radius: .3em;
	    transition: all .3s ease-out;   
	    border:1px solid #d0d1d5;
	}
	
	.rounded-list a:hover{
	    background: #eee;
	}
	
	.rounded-list li {
		padding-left:10px;
	}
	
	.rounded-list a:hover:before{
	    transform: rotate(360deg);  
	}
	
	.rounded-list a:before{
	    content: counter(li);
	    counter-increment: li;
	    position: absolute; 
	    left: -1.3em;
	    top: 50%;
	    margin-top: -1.3em;
	    background: #87ceeb;
	    height: 2em;
	    width: 2em;
	    line-height: 2em;
	    border: .3em solid #fff;
	    text-align: center;
	    font-weight: bold;
	    border-radius: 2em;
	    transition: all .3s ease-out;
	}
	
	.rectangle-list a{
	    position: relative;
	    display: block;
	    padding: .4em .4em .4em .8em;
	    *padding: .4em;
	    margin: .5em 0 .5em 2.5em;
	    background: #e5ede8;
	    color: #0d8ba1;
	    text-decoration: none;
	    transition: all .3s ease-out;
	    border:1px solid #d0d1d5;
	    border-radius: .3em;   
	}
	
	.rectangle-list a:hover{
	    background: #eee;
	    color:black!important;
	}   
	
	.rectangle-list a:before{
	    content: counter(li);
	    counter-increment: li;
	    position: absolute; 
	    left: -2.5em;
	    top: 50%;
	    margin-top: -1em;
	    background: #fa8072;
	    height: 2em;
	    width: 2em;
	    line-height: 2em;
	    text-align: center;
	    font-weight: bold;
	}
	
	.rectangle-list a:after{
	    position: absolute; 
	    content: '';
	    border: .5em solid transparent;
	    left: -1em;
	    top: 50%;
	    margin-top: -.5em;
	    transition: all .3s ease-out;               
	}
	
	.rectangle-list a:hover:after{
	    left: -.5em;
	    border-left-color: #fa8072;             
	}
	
	.divSB {
    	background:white!important;
    	font-family:helvetica, arial, sans-serif!important;
    	padding:6px!important;
    	border-radius:3px!important;
    	margin:0px 0px 5px 10px!important;
    	border:1px solid #d0d1d5;
    }
	
</style>
		<div class="sidebar">
			<div class="divSB">
				<h3>Tìm kiếm</h3>
				<form action="" onSubmit="return false;">
					<input type="text" class="form-control" id="txtFind" style="border:1px solid silver;width:285px;margin-left:5px;">
					<a href="#" id="submitFind" style="position: absolute;top:79px;right:45px;"><i class="fa fa-search"></i></a>
				</form>
			</div>
			<div class="blog-categories divSB">
				<h3 style="border:1px solid black; background:#353a4a;color:white;padding:5px;"> <i class="fa fa-server"></i> Loại phiếu</h3>
				<ol class="rectangle-list">
				<logic:notEmpty name="sideBarForm" property="dsLoaiPhieu">
					<li>
						<p><a href="dsPhieuDanhGia.do">Mới nhất</a></p>
					</li>
					<logic:iterate id="lp" name="sideBarForm" property="dsLoaiPhieu">
						<bean:define id="tenLP" name="lp" property="ten"/>
						<bean:define id="maLoaiP" name="lp" property="loaiP"/>
						<li>
							<p><a href="dsPhieuDanhGia.do?loaiP=${maLoaiP}">${tenLP}</a></p>
						</li>
					</logic:iterate>
				</logic:notEmpty>
				<logic:empty name="sideBarForm" property="dsLoaiPhieu">
					<li>Chưa có loại phiếu nào</li>
				</logic:empty>
				</ol>
			</div>
			
			<div class="section divSB">
				<h3 style="border:1px solid black; background:#353a4a;color:white;padding:5px;"> <i class="fa fa-eye"></i> Các phiếu bạn đã đánh</h3>
				<ol class="rounded-list">
				<logic:iterate id="ketQua" name="sideBarForm" 	 property="dsPhieuDanhGiaDGNhieu">
					<bean:define id="maKQ"					name="ketQua"	 property="maKQ"/>
					<bean:define id="pdgNDGN"				name="ketQua"	 property="phieuDanhGia"/>
						<bean:define id="maDG" 					name="pdgNDGN" 	 property="maDG"/>
						<bean:define id="tieuDe" 				name="pdgNDGN"	 property="tieuDe"/>
						<bean:define id="thoiGianDang" 			name="pdgNDGN" 	 property="thoiGianDang"/>
						<bean:define id="soLanDG" 				name="pdgNDGN" 	 property="soLanDG"/>
						<bean:define id="loaiP" 				name="pdgNDGN" 	 property="loaiP"/>
						
						<bean:define id="nguoiDung" 			name="pdgNDGN" 	 property="nguoiDung" />
							<bean:define id="hoTenND" 				name="nguoiDung" property="hoTen" />
							<bean:define id="maDNND" 				name="nguoiDung" property="maDN" />
							
						<bean:define id="loaiPhieu"				name="pdgNDGN"	 property="loaiPhieu"/>
							<bean:define id="tenLoaiPhieu"					name="loaiPhieu"	 property="ten"/>
					<li>
						<a href="xemKetQua.do?maKQ=${maKQ}" style="padding-bottom:22px;padding-bottom:22px;"><b>${tieuDe}</b>
							 <br/><span style="font-size:11px;float:right;margin-top:8px;color:#9197a3;">
							 	<i class="fa fa-user-secret"></i> ${maDNND} &nbsp &nbsp 
							 	<i class="fa fa-pencil-square-o"></i> ${soLanDG}</span>
						</a>
					</li>
				</logic:iterate>
				</ol>
			</div>
		</div>
<script>
	$('#submitFind').click(function(){
		var noiDung = $('#txtFind').val();
		location.href="dsPhieuDanhGia.do?find="+noiDung;
	});
</script>