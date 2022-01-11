<%@page import="model.bean.Category"%>
<%@page import="model.bean.Flower"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
<!-- 
Body Section 
-->
<!--
Three column view
-->
		  <h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/chu_de.png">Danh mục chủ đề </h3>
		<ul class="thumbnails">
		<%
@SuppressWarnings("unchecked")
		ArrayList<TypeFlower> typeFlowers = (ArrayList<TypeFlower>) request.getAttribute("typeFlowers");
			if(typeFlowers.size() >0){
				for(TypeFlower item : typeFlowers){
%>
			<li class="span3">
			  <div class="thumbnail">
				<h3 style="" align="center"><a href="<%=request.getContextPath() %>/type?id=<%=item.getId() %>" title=""><img src="<%=request.getContextPath() %>/templates/public/assets/img/icon1.jpg" alt=""> <%=item.getName() %></a></h3>
				<a href="product_details.html" class="overlay"></a>
				<a href="<%=request.getContextPath() %>/type?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileTypes/<%=item.getPicture_type() %>" alt="<%=item.getName() %>"></a>
			  </div>
			</li>
			<%}} %>
		  </ul>
		  <script>
    document.getElementById("category").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
