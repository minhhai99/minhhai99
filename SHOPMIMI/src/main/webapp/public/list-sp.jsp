<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
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
<%
Locale locale = new Locale("vi", "VN");
NumberFormat format = NumberFormat.getCurrencyInstance(locale);
%>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/menu-icon.png">Sản phẩm của chúng tôi </h3>
		<ul class="thumbnails">
		<%
		String msg = request.getParameter("msg");
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thêm sp vào giỏ hàng thành công!</span>");
    	}
		  @SuppressWarnings("unchecked")
		ArrayList<Flower> flowers = (ArrayList<Flower>) request.getAttribute("flowers");
		  @SuppressWarnings("unchecked")
			ArrayList<Flower> listSearch = (ArrayList<Flower>) request.getAttribute("listSearch");
		  if(flowers != null && flowers.size() > 0){
			  for(Flower item : flowers){
		  %>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item.getName()) %>-<%=item.getId() %>.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item.getName()) %>-<%=item.getId() %>.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt="<%=item.getName() %>"></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"> <%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					
				</div>
			  </div>
			</li>
			<%}}else{ 
				if(listSearch != null && listSearch.size() > 0){
					  for(Flower item : listSearch){
			%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item.getPicture() %>" alt="<%=item.getName() %>"></a>
				<div class="caption cntr">
					<p><%=item.getName() %></p>
					<p><strong style="color: red;"> <%=format.format((long)item.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					
				</div>
			  </div>
			</li>
			<%}}else{ %>
				<p style="background: yellow; color: red; font-weight: bold; padding: 5px;" align="center">Không tìm thấy sản phẩm nào!</p>
			<%}} %>
		  </ul>
<script>
    document.getElementById("product").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>