<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul id="side-menu" class="nav">
				<li class="nav-header">
					<jsp:include page="profilePartial.jsp"></jsp:include>
				</li>
				<li>
					<a href="home.do">
						<i class="fa fa-th-large"></i>
						<span class="nav-label">Trang chủ</span>
					</a>
				</li>
		<!--Các chức năng -->
				<!--Quản lý khóa học -->
				<li>
					<a href="#">
						<i class="fa fa-cube"></i>
						<span class="nav-label">Quản lý Khóa học</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlKhoaHoc">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Quản lý Lớp học -->
				<li>
					<a href="#">
						<i class="fa fa-briefcase"></i>
						<span class="nav-label">Quản lý Lớp học</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlLop.do">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Quản lý Giảng viên-->
				<li>
					<a href="#">
						<i class="fa fa-user-secret"></i>
						<span class="nav-label">Quản lý Giảng viên</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlGiangVien">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng Giảng viên-->
				
				<!--Quản lý Môn học -->
				<li>
					<a href="#">
						<i class="fa fa-ticket"></i>
						<span class="nav-label">Quản lý Môn học</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlMonHoc">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				
				<!--Quản lý Người dùng -->
				<li>
					<a href="#">
						<i class="fa fa-user"></i>
						<span class="nav-label">Quản lý Người dùng</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlNguoiDung">Xem danh sách</html:link>
						</li>
						<li>
							<html:link action="/themNguoiDung">Thêm Người dùng mới</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Quản lý Giảng dạy -->
				<li>
					<a href="#">
						<i class="fa fa-language"></i>
						<span class="nav-label">Quản lý Giảng dạy</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlGiangDay">Xem danh sách</html:link>
						</li>
						<li>
							<html:link action="/themGiangDay">Thêm Giảng dạy mới</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Quản lý Loại Phiếu đánh giá -->
				<li>
					<a href="#">
						<i class="fa fa-barcode"></i>
						<span class="nav-label">Quản lý Loại Phiếu ĐG</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlLoaiPhieu.do">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Quản lý Phiếu đánh giá -->
				<li>
					<a href="#">
						<i class="fa fa-book"></i>
						<span class="nav-label">Quản lý Phiếu đánh giá</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlPhieuDanhGia.do">Xem danh sách</html:link>
						</li>
						<li>
							<html:link action="/themPhieuDanhGia.do">Thêm phiếu mới</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Quản lý Kết quả -->
				<li>
					<a href="#">
						<i class="fa fa-paper-plane"></i>
						<span class="nav-label">Quản lý Kết quả đánh giá</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlKetQua.do">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
				<!--Thống kê -->
				<li>
					<a href="#">
						<i class="fa fa-line-chart"></i>
						<span class="nav-label">Quản lý Góp ý</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<html:link action="/qlGopY.do">Xem danh sách</html:link>
						</li>
					</ul>
				</li>
				<!--Hết chức năng-->
				
			</ul>
			<!--Hết chức năng-->
		</div>
	</nav>
</body>
</html>