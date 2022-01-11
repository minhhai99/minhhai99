<%@page import="model.bean.Meaning"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>
	</div>
<div class="span9">
<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/icon-sport-org.png"> Ý nghĩa các loại hoa </h3>
<div class="well well-small">
<%
		@SuppressWarnings("unchecked")
			ArrayList<Meaning> meanings =(ArrayList<Meaning>) request.getAttribute("meanings");
		if(meanings != null && meanings.size() > 0){
			for(Meaning item : meanings){
		%>
		<br />
	<div class="row-fluid">	
		<div class="span2">
			<a href="<%=request.getContextPath() %>/meaning/detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="<%=item.getName() %>"></a>
		</div>
		<div class="span6">
			<h5><a href="<%=request.getContextPath() %>/meaning/detail?id=<%=item.getId() %>"> <%=item.getName() %> </a></h5>
			<p>
			<%=item.getPreview() %>
			</p>
		</div>
		<div class="span4 alignR">
		<form class="form-horizontal qtyFrm">
		<div class="btn-group">
		  <a href="<%=request.getContextPath() %>/meaning/detail?id=<%=item.getId() %>" class="defaultBtn"><span class=" icon-shopping-cart"></span> VIEW</a>
		  <a href="<%=request.getContextPath() %>/meaning/detail?id=<%=item.getId() %>" class="shopBtn"> Ý nghĩa</a>
		 </div>
			</form>
		</div>
	</div>
	<hr class="soften">
	<%}} %>
</div>
</div>
</div>
<script>
    document.getElementById("meaning").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>