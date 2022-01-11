<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.TypeFlower"%>
<%@page import="model.bean.Flower"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
Body Section 
-->
<!-- 
Three column view
-->
<%
Locale locale = new Locale("vi", "VN");
NumberFormat format = NumberFormat.getCurrencyInstance(locale);
int id =(Integer) request.getAttribute("id"); %>
<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/home"><span class="icon-home"></span> Home</a> <span class="divider">/</span></li>
		<li class="active">Mức giá</li>
    </ul>
    <% if(id== 1){ %>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm giá dưới 200.000 vnđ </h3>
		<ul class="thumbnails">
		
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerT =(ArrayList<Flower>) request.getAttribute("flowerT");
		if(flowerT != null && flowerT.size() > 0){
			for(Flower item : flowerT){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"><%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Mua ngay </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p style="color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		<%}else if(id==2){ %>
		<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm giá từ 200.000 - 500.000 vnđ </h3>
		<ul class="thumbnails">
		
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerH =(ArrayList<Flower>) request.getAttribute("flowerH");
		if(flowerH != null && flowerH.size() > 0){
			for(Flower item : flowerH){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"><%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Mua ngay </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p style="color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%}else if(id==3){ %>
		  <h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm giá từ 500.000 - 1.000.000 vnđ </h3>
		<ul class="thumbnails">
		
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerB =(ArrayList<Flower>) request.getAttribute("flowerB");
		if(flowerB != null && flowerB.size() > 0){
			for(Flower item : flowerB){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"><%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Mua ngay </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p style="color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%}else if(id==4){ %>
		  <h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm giá từ 1.000.000 - 2.000.000 vnđ </h3>
		<ul class="thumbnails">
		
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerTW =(ArrayList<Flower>) request.getAttribute("flowerTW");
		if(flowerTW != null && flowerTW.size() > 0){
			for(Flower item : flowerTW){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"><%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Mua ngay </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p style="color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%}else{ %>
		  <h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> Sản phẩm cao cấp - trên 2.000.000 vnđ </h3>
		<ul class="thumbnails">
		
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerF =(ArrayList<Flower>) request.getAttribute("flowerF");
		if(flowerF != null && flowerF.size() > 0){
			for(Flower item : flowerF){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"><%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Mua ngay </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p style="color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>
		  <%} %>
		<script>
    document.getElementById("price").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>