<%@page import="model.bean.Flower"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
    <%@ include file="/templates/public/inc/leftbar.jsp" %>
<!--
New Products
-->
	<div class="well well-small">
	<h3>Sản phẩm của chúng tôi </h3>
		<div class="row-fluid">
		  <ul class="thumbnails">
		  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowers =(ArrayList<Flower>) request.getAttribute("flowers");
		  if(flowers != null && flowers.size() > 0){
			  for(Flower item : flowers){
		  %>
			<li class="span4">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt=""></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong> $<%=item.getPrice() %></strong></p>
					<h4><a class="shopBtn" href="#" title="add to cart"> Thêm vào giỏ hàng </a></h4>
				</div>
			  </div>
			</li>
			
			<%}} %>
		  </ul>
		  
		</div>
	</div>
	</div>
	</div>
	<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>