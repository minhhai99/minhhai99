<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>TRANG QUẢN TRỊ VIÊN</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        int numberOfType = (Integer) request.getAttribute("numberOfType");
        int numberOfItemsUser = (Integer) request.getAttribute("numberOfItemsUser");
        int numberOfFlower = (Integer) request.getAttribute("numberOfFlower");
        int numberOfMeaning = (Integer) request.getAttribute("numberOfMeaning");
        int numberOfOrder = (Integer) request.getAttribute("numberOfOrder");
        int numberOfContact = (Integer) request.getAttribute("numberOfContact");
        
        %>
        <hr />
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-bars"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/types" title="">Quản lý danh mục</a></p>
                        <p class="text-muted">Có <%=numberOfType %> danh mục</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-blue set-icon">
                    <i class="fa fa-bell-o"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/flowers" title="">Quản lý Sản phẩm</a></p>
                        <p class="text-muted">Có <%=numberOfFlower %> sản phẩm</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-blue set-icon">
                    <i class="fa fa-rocket"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/meanings" title="">Quản lý ý nghĩa hoa</a></p>
                        <p class="text-muted">Có <%=numberOfMeaning %> loài hoa</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-bars"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/orders" title="">Quản lý đơn hàng</a></p>
                        <p class="text-muted">Có <%=numberOfOrder %> đơn hàng</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-brown set-icon">
                    <i class="fa fa-rocket"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/users" title="">Quản lý người dùng</a></p>
                        <p class="text-muted">Có <%=numberOfItemsUser %> người dùng</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-bell-o"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/contacts" title="">Quản lý liên hệ</a></p>
                        <p class="text-muted">Có <%=numberOfContact %> phản hồi</p>
                    </div>
                </div>
            </div>
             
        </div>

    </div>
</div>

<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>