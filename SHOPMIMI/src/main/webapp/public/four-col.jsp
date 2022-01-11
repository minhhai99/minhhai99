
<%@page import="model.bean.Meaning"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
Body Section 
-->
<!--
Three column view
-->
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/menu-icon.png">Ý nghĩa các loại hoa </h3>
		<ul class="thumbnails">
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Meaning> meanings =(ArrayList<Meaning>) request.getAttribute("meanings");
		if(meanings != null && meanings.size() > 0){
			for(Meaning items : meanings){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="<%=request.getContextPath() %>/meaning/detail?id=<%=items.getId() %>" class="overlay"></a>
				<a href="<%=request.getContextPath() %>/meaning/detail?id=<%=items.getId() %>"><img src="<%=request.getContextPath() %>/files/<%=items.getPicture() %>" alt="<%=items.getName() %>"></a>
				<div class="caption cntr">
					<p><a style="font-weight: bold;" href="<%=request.getContextPath() %>/public/meaning/detail?id=<%=items.getId() %>" title="add to cart"><%=items.getName() %></a></p>
				</div>
			  </div>
			</li>
			<%}}else{ %>
			Chưa có bài viết nào!
			<%} %>
		  </ul>
<script>
    document.getElementById("meaning").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>