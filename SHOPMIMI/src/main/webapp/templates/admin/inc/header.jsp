<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AdminCP | SHOP HOA MIMI</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- JQUERY -->
	<script src="<%=request.getContextPath() %>/templates/admin/assets/js/jquery-3.2.1.js"></script>
    <!-- JVALIDATE-->
    <script src="<%=request.getContextPath() %>/lib/js/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/lib/ckfinder/ckfinder.js"></script>
    <style type="text/css">
    	#form .form-group label span.error{color: red}
			#form .form-group label {
				width: auto;
				display: block;
				float: none;
				}
    </style>
    
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath() %>/admin/index">SHOP <img alt="" src="<%=request.getContextPath() %>/templates/admin/assets/img/icon1.jpg"> MiMi</a>
            </div>
            <%
            User userLogin =(User) session.getAttribute("userLogin");
            if(userLogin != null){
            %>
            <div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;"> Xin chào, <b><%=userLogin.getName() %></b> &nbsp; <a href="<%=request.getContextPath() %>/logout" class="btn btn-danger square-btn-adjust">Đăng xuất</a> </div>
       <%}else{ %>
       <div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;"> Xin chào, <b>Khách</b> &nbsp; <a href="<%=request.getContextPath() %>/login" class="btn btn-danger square-btn-adjust">Login</a> </div>
       <%} %>
        </nav>
        <!-- /. NAV TOP  -->