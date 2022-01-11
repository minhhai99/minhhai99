<%@page import="model.bean.TypeFlower"%>
<%@page import="model.bean.Flower"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/templates/public/inc/header.jsp" %>
     <%@ include file="/templates/public/inc/leftbar.jsp" %>
<!-- 
Body Section 
-->
<!-- 
Three column view
-->
<% int id =(Integer) request.getAttribute("id"); %>

<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/home"><span class="icon-home"></span> Home</a> <span class="divider">/</span></li>
		<% if(id== 1){ %>
		<li class="active">Sản phẩm bán chạy nhất</li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm bán chạy nhất </h3>
		<ul class="thumbnails">
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerCat =(ArrayList<Flower>) request.getAttribute("flowerCat");
		if(flowerCat != null && flowerCat.size() > 0){
			for(Flower item : flowerCat){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong> $<%=item.getPrice() %></strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%}else if(id==2){ %>
		  <li class="active">Sản phẩm được quan tâm nhất</li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm được quan tâm nhất </h3>
		<ul class="thumbnails">
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerMostView =(ArrayList<Flower>) request.getAttribute("flowerMostView");
		if(flowerMostView != null && flowerMostView.size() > 0){
			for(Flower item : flowerMostView){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong> $<%=item.getPrice() %></strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%}else if(id==3){ %>
		  <li class="active">Sản phẩm được phổ biến</li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm phổ biến </h3>
		<ul class="thumbnails">
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerPopular =(ArrayList<Flower>) request.getAttribute("flowerPopular");
		if(flowerPopular != null && flowerPopular.size() > 0){
			for(Flower item : flowerPopular){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong> $<%=item.getPrice() %></strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%} %>

		</div>
		</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>