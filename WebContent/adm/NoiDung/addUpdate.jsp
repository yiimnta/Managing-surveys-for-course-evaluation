<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!-- Form thêm nội dung-->
<div class="modal fade them-noiDung" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI NỘI DUNG</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tiêu đề" id="tieuDeNDThem">
       
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemNoiDung" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themNoiDung"  data-url="themNoiDung.do">Thêm mới</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
 
<!-- kết thúc form thêm nội dung -->

<!-- Form cập nhật nội dung-->
<div class="modal fade sua-noiDung" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN NỘI DUNG</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tiêu đề" id="tieuDeNDSua">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaNoiDung" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-suaNoiDung"  data-url="suaNoiDung.do" data-id="">Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
 
<!-- kết thúc form cập nhật nội dung -->


<!-- Form thêm chi tiết nội dung-->
<div class="modal fade them-chiTiet" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI CHI TIẾT NỘI DUNG</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tiêu đề" id="tieuDeCTThem"><br />
       Loại chi tiết: <select style="border-radius: 5px;" id="loaiCTThem">
		        		<option value="0"><small> Radio </small></option>
		        		<option value="1"><small> Check</small></option>
		        		<option value="2"><small> Text </small></option>
		        	 </select>
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemChiTiet" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themChiTiet"  data-url="themChiTietNoiDung.do" data-id="">Thêm mới</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
 
<!-- kết thúc form thêm chi tiết nội dung -->

<!-- Form cập nhật chi tiết nội dung-->
<div class="modal fade sua-chiTiet" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN CHI TIẾT NỘI DUNG</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tiêu đề" id="tieuDeCTSua"><br />
       Loại chi tiết: <select style="border-radius: 5px;" id="loaiCTSua">
		        		<option value="0"><small> Radio </small></option>
		        		<option value="1"><small> Check</small></option>
		        		<option value="2"><small> Text </small></option>
		        	 </select>
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaChiTiet" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-suaChiTiet"  data-url="suaChiTietNoiDung.do" data-id="" data-idct="">Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
 
<!-- kết thúc form cập nhật chi tiết nội dung -->

<!-- Form thêm nội dung Con-->
<div class="modal fade them-noiDungCon" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">THÊM MỚI NỘI DUNG CON</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tiêu đề" id="tieuDeNDConThem">
       
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeThemNoiDung" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-themNoiDungCon"  data-url="themNoiDungCon.do" data-idct="">Thêm mới</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
 
<!-- kết thúc form thêm nội dung Con -->

<!-- Form cập nhật nội dung-->
<div class="modal fade sua-noiDungCon" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header" style="text-align:center;">
    	<h4 class="modal-title" id="gridSystemModalLabel">CẬP NHẬT THÔNG TIN NỘI DUNG CON</h4>
    </div>
    <div class="modal-body">
       <input type="text" class="form-control" placeholder="Tiêu đề" id="tieuDeNDConSua">
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-closeSuaNoiDungCon" onclick="reset()">Đóng</button>
        <button type="button" class="btn btn-primary btn-suaNoiDungCon"  data-url="suaNoiDungCon.do" data-id="" data-idct="">Cập nhật</button>
      </div>
      </div>
    </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
 
<!-- kết thúc form cập nhật nội dung Con -->