<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<style>
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
				<h3 style="margin:0px;color:#3b5998;padding-left:20px;"><b>Góp ý</b></h3>
			</div>
			<div class="divD">
				<img src="Images/gopy.png"  width="450" alt="">
				<form action="gopY.do" method="post">
					<h4>Vui lòng điền đầy đủ thông tin</h4>
					<table>
						<tr>
							<td style="width:70px;vertical-align: top;">Tiêu đề  *</td>
							<td><input type="text" name="tieuDe" class="form-control" style="width:340px;margin-bottom:5px;"/>
								<html:errors property="tieuDe"/>
							</td>
							
						</tr>
						<tr>
							<td style="vertical-align: top;">Nội dung *</td>
							<td>
								<textarea name="noiDung" cols="30" rows="10"  class="form-control"></textarea>
								<html:errors property="noiDung"/>
							</td>
						</tr>
					<tr>
						<td></td>
						<td style="text-align:right;"><input type="submit" name="submit" style="margin-top:10px;width:100px;margin-bottom:20px;" class="btn btn-info" value="Gửi"/></td>
					</tr>
					</table>
				</form>
				<logic:notEmpty name="success" scope="request">
					<script>
						alert('Gửi góp ý thành công! Cám ơn bạn đã góp ý');
					</script>
				</logic:notEmpty>
			</div>
		</div>
		<jsp:include page="/sideBar.do" />
	</div>
</div>