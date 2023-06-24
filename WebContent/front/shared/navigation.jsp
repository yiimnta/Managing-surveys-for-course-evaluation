<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<div class="sidebar">
	<a href="index.html" id="logo"><img src="Images/logo_itfac.png" width="130" style="margin-left:-18px;" alt="logo"></a>
	<ul>
		<li class="home">
			<a href="home.do">Home</a>
		</li>
		<li class="about">
			<a href="info.do">Cá nhân</a>
		</li>
		<li class="projects project">
			<a href="dsPhieuDanhGia.do">Đánh giá</a>
		</li>
		<li class="blog">
			<a href="gopY.do">Góp ý</a>
		</li>
		<li class="contact">
			<a href="lienHe.do">Liên hệ</a>
		</li>
	</ul>
	<div class="connect">
		<a href="https://www.facebook.com/yiii.master" id="fb">facebook</a> <a href="#" id="twitter">twitter</a> <a href="#" id="googleplus">google+</a> <a href="#" id="youtube">youtube</a>
	</div>
	<bean:define id="typePage" name="typePage" scope="request"/>
	<span id="typePage" data-val="${typePage}"></span>
	<script>
		var typePage =$('#typePage').data('val');
		$('.'+typePage).toggleClass('selected');
	</script>
</div>