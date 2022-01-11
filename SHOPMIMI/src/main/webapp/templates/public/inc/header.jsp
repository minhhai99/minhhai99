<%@page import="util.StringUtil"%>
<%@page import="model.bean.ProductCart"%>
<%@page import="model.bean.User"%>
<%@page import="model.dao.TypeFlowerDAO"%>
<%@page import="model.bean.TypeFlower"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Shop hoa MiMi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="<%=request.getContextPath() %>/templates/public/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="<%=request.getContextPath() %>/templates/public/assets/css/style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="<%=request.getContextPath() %>/templates/public/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

<!-- JQUERY -->
	<script src="<%=request.getContextPath() %>/templates/public/assets/js/jquery.js"></script>
    <!-- JVALIDATE-->
    <script src="<%=request.getContextPath() %>/lib/js/jquery.validate.min.js"></script>
    
<script src="<%=request.getContextPath()%>/lib/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/lib/ckfinder/ckfinder.js"></script>
	<!-- Favicons -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/templates/public/assets/img/logo.jpg">
  <style type="text/css">
	#formmm fieldset .control-group lable span.error{color: red;}
	#formmm fieldset .control-group lable {
	width: auto;
	display: block;
	float: none;
	}
	#formm .control-group  .control-label span.error{color: red}
	
				#form .control-group  .control-label span.error{color: red}
	#form .control-group  .control-label {
				width: auto;
				display: block;
				float: none;
				}
	 .topNav .container .alignR .active-menu {background:#FAAD3F; color: white}
	 .topNav .container .alignR .active {background:#FAAD3F; color: white}
	 .navbar-inner .container .nav-collapse .nav li .active-menu {background:#FAAD3F; color: white}
</style>
  </head>
<body>
<!-- 
	Upper Header Section 
-->
<%
User userLogin =(User) session.getAttribute("accLogin"); 
	//int sl = (Integer)session.getAttribute("j");
	//int number =(Integer) session.getAttribute("j");
	//float sum = (float) session.getAttribute("tongTien");
	String search = request.getParameter("editbox_search");
%>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
				</div>
				<a id="index" href="<%=request.getContextPath() %>/index"> <span class="icon-home"></span> Home</a> 
				
				<%
				if(userLogin == null){
				%>
				<a href="<%=request.getContextPath() %>/dang-nhap?err=2"><span class="icon-user"></span> Tài khoản của tôi</a> 
				<a id="register" href="<%=request.getContextPath() %>/dang-ky-tai-khoan"><span class="icon-edit"></span> Đăng ký miễn phí </a> 
				<%}else{ %>
				<a id="account" href="<%=request.getContextPath() %>/myAccount"><span class="icon-user"></span> <%=userLogin.getFullname() %></a>
				<%if("admin".equals(userLogin.getApiUser().getName()) || "supper mod".equals(userLogin.getApiUser().getName())){ %>
				<a id="register" href="<%=request.getContextPath() %>/admin/index"><span class="icon-user"></span> Trang quản trị viên</a> 
				<%}} %>
				<a id="contact" href="<%=request.getContextPath() %>/lien-he"><span class="icon-envelope"></span> Liên hệ</a>
				<%
				@SuppressWarnings("unchecked")
				 ArrayList<ProductCart> listHoa =(ArrayList<ProductCart>) session.getAttribute("listHoa");
				int i=0;
				if(listHoa != null && listHoa.size() > 0){
		              for(ProductCart item : listHoa){
		            	  i++;
				%>
				<%}} %>
				<a id="cart" href="<%=request.getContextPath() %>/carts"><span class="icon-shopping-cart"></span> <%=i %> sản phẩm - <span class="badge badge-warning"> vnđ</span></a>
			</div>
		</div>
	</div>
</div>

<!--
Lower Header Section 
-->
<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="<%=request.getContextPath() %>/index"><span>Twitter Bootstrap ecommerce template</span> 
		<img src="<%=request.getContextPath() %>/templates/public/assets/img/ngamimi.png" alt="bootstrap sexy shop">
	</a>
	</h1>
	</div>
	<div class="span4">
	<div class="offerNoteWrapper">
	<h1 class="dotmark">
	<i class="icon-cut"></i>
	<p style="" align="center"> 1 đoá hoa = vạn lời chúc</p>
	</h1>
	</div>
	</div>
	<div class="span4 alignR">
	<p><br> <strong> Hỗ trợ (24/7) :  0905 555522 </strong><br><br></p>
	<%
	int k=0;
	if(listHoa != null && listHoa.size() > 0){
        for(ProductCart item : listHoa){
        	k++;
        
	%>
	<%}} %>
	<a href="<%=request.getContextPath() %>/carts"><span class="btn btn-mini">[ <%=k %> ] <span class="icon-shopping-cart"></span></span></a>
	<span class="btn btn-warning btn-mini">VNĐ</span>
	</div>
</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
			<ul class="nav">
			  <li class="active"><a id="index" href="<%=request.getContextPath() %>/index">Home	</a></li>
			  <li class=""><a id="product" href="<%=request.getContextPath() %>/danh-sach-san-pham">Sản Phẩm</a></li>
			  <li class="dropdown">
                <a id="price" href="<%=request.getContextPath() %>/cat/money?id=1" class="dropdown-toggle" data-toggle="dropdown">Mức giá <b class="caret"></b></a>
                <ul class="dropdown-menu">
               
                  <li><a href="<%=request.getContextPath() %>/danh-muc/muc-gia-1.html" ><span class="icon-chevron-right"></span> Dưới 200.000 vnd</a></li>
                  <li><a href="<%=request.getContextPath() %>/danh-muc/muc-gia-2.html" ><span class="icon-chevron-right"></span> 200.000-500.000 vnd</a></li>
                  <li><a href="<%=request.getContextPath() %>/danh-muc/muc-gia-3.html" ><span class="icon-chevron-right"></span> 500.000-1.000.000 vnd</a></li>
                  <li><a href="<%=request.getContextPath() %>/danh-muc/muc-gia-4.html" ><span class="icon-chevron-right"></span> 1.000.000-2.000.000 vnd</a></li>
                  <li><a href="<%=request.getContextPath() %>/danh-muc/muc-gia-5.html" ><span class="icon-chevron-right"></span> Trên 2.000.000 vnd</a></li>
                  
                </ul>
              </li>
			  <li class=""><a id="category" href="<%=request.getContextPath() %>/danh-muc">Chủ đề</a></li>
			  <li class=""><a id="handmade" href="<%=request.getContextPath() %>/type?id=18">Quà tặng kèm</a></li>
			  <li class=""><a id="meaning" href="<%=request.getContextPath() %>/y-nghia-hoa">Ý nghĩa hoa</a></li>
			</ul>
			<form id="formsearch" action="<%=request.getContextPath() %>/search" method="get" class="navbar-search pull-left">
			  <input type="text" name="editbox_search" placeholder="<% if(search == null) {out.print("Search");}else{ out.print(search);} %>" id="editbox_search" class="search-query span2">
			</form>
			<ul class="nav pull-right">
			<li class="dropdown">
			<%
            if(userLogin != null){
            %>
				<a data-toggle="dropdown" class="dropdown-toggle" href="<%=request.getContextPath() %>/myAccount"><span ></span><img width="20 px" height="20 px" alt="" src="<%=request.getContextPath() %>/templates/admin/assets/img/find_user.png"> <%=userLogin.getName() %> <b class="caret"></b></a>
				<div class="dropdown-menu">
					<p><a href="<%=request.getContextPath() %>/myAccount"> <strong> Tài khoản của tôi</strong></a></p>
					<p><a href="<%=request.getContextPath() %>/bill"><strong> Đơn mua</strong></a></p>
					<P><a href="<%=request.getContextPath() %>/logoutt"><strong> Đăng xuất</strong></a></P>
				  </div>
				<%}else{ %>
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Login <b class="caret"></b></a>
				
				<div class="dropdown-menu">
				<form action="<%=request.getContextPath() %>/loginn" method="post" class="form-horizontal loginFrm">
				  <div class="control-group">
					<input type="text" class="span2" name="email" id="inputEmail" placeholder="Email" >
				  </div>
				  <div class="control-group">
					<input type="password" class="span2" name="password" id="inputPassword" placeholder="Password" >
				  </div>
				  <div class="control-group">
					<label class="checkbox">
					<input type="checkbox"> Remember me
					</label>
					<button type="submit" class="shopBtn btn-block">Sign in</button>
				  </div>
				</form>
				</div>
				<%} %>
			</li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>
