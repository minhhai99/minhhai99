<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
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
<%
Locale locale = new Locale("vi", "VN");
NumberFormat format = NumberFormat.getCurrencyInstance(locale);
	TypeFlower typeFlower =(TypeFlower) request.getAttribute("typeFlower");
if(typeFlower != null){
%>
<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/index">Home</a> <span class="divider">/</span></li>
		<li class="active"><%=typeFlower.getName() %></li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/foder.png"> <%=typeFlower.getName() %> </h3>
	<%} %>
		<ul class="thumbnails">
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Flower> flowerType =(ArrayList<Flower>) request.getAttribute("flowerType");
		if(flowerType != null && flowerType.size() > 0){
			for(Flower item : flowerType){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"> <%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}else{ %>
			<p align="center">Chưa có sản phẩm nào!</p>
			<%} %>
		  </ul>

		</div>
		</div>
		<script>
    document.getElementById("category").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>