<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li class="text-center">
                <img src="<%=request.getContextPath() %>/templates/admin/assets/img/find_user.png" class="user-image img-responsive" />
            </li>
            <li>
                <a id="index" href="<%=request.getContextPath() %>/admin/index"><i class="fa fa-dashboard fa-3x"></i> Trang chủ</a>
            </li>
            <li>
                <a id="typeFlower" href="<%=request.getContextPath() %>/admin/types"><i class="fa fa-list fa-3x"></i> Quản lý danh mục</a>
            </li>
            <li>
                <a id="flower" href="<%=request.getContextPath() %>/admin/flowers"><i class="fa fa-music fa-3x"></i> Quản lý Sản phẩm</a>
            </li>
            <li>
                <a id="meaning" href="<%=request.getContextPath() %>/admin/meanings"><i class="fa fa-list fa-3x"></i> Quản lý Ý nghĩa</a>
            </li>
            <li>
                <a id="color" href="<%=request.getContextPath() %>/admin/colors"><i class="fa fa-music fa-3x"></i> Quản lý Màu Hoa</a>
            </li>
            <li>
                <a id="order" href="<%=request.getContextPath() %>/admin/orders"><i class="fa fa-list fa-3x"></i> Quản lý đơn hàng</a>
            </li>
            <li>
                <a id="orderDetail" href="<%=request.getContextPath() %>/admin/orderDetails"><i class="fa fa-user fa-3x"></i> Quản lý chi tiết đơn hàng</a>
            </li>
            <li>
                <a id="user" href="<%=request.getContextPath() %>/admin/users"><i class="fa fa-user fa-3x"></i> Quản lý người dùng</a>
            </li>
            <li>
                <a id="contact" href="<%=request.getContextPath() %>/admin/contacts"><i class="fa fa-envelope fa-3x"></i> Quản lý liên hệ</a>
            </li>
        </ul>
    </div>
</nav>
<!-- /. NAV SIDE  -->