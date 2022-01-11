<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.Order"%>
<%@page import="model.bean.ProductCart"%>
<%@page import="model.bean.Flower"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
Body Section 
-->

	<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/home"><span class="icon-home"></span> Home</a> <span class="divider">/</span></li>
		<li><a href="<%=request.getContextPath() %>/carts"> Giỏ hàng</a> <span class="divider">/</span></li>
		<li class="active">Thông tin thanh toán</li>
    </ul>
    <% 
		@SuppressWarnings("unchecked")
		 //ArrayList<ProductCart> listHoa =(ArrayList<ProductCart>) session.getAttribute("listHoa");
        String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thanh toán thành công!Cảm ơn bạn.</span>");
    	}
        if("2".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Sửa thành công!</span>");
    	}
        if("3".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Xoá thành công!</span>");
    	}
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">ID không tồn tại!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        Locale locale = new Locale("vi", "VN");
        NumberFormat format = NumberFormat.getCurrencyInstance(locale);
       // int jk =(Integer) session.getAttribute("j");
        %>
        <br />
	<div class="well well-small">
		<h1>Thông tin thanh toán <small class="pull-right"> </small></h1>
	<hr class="soften"/>	
	<%
		Order order =(Order) request.getAttribute("order");
	if(order != null){
	%>
	<p>Họ tên: <%=order.getDisplay_name() %> </p>
	<p>Số điện thoại: <%=order.getPhone() %>  </p>
	<p>Địa chỉ E-mail: <%=order.getEmail() %>  </p>
	<p>Địa chỉ: <%=order.getAddress() %>  </p>
	<p>Tổng số sản phẩm: <%=order.getQuanty() %>  </p>
	<p>Tổng số tiền: <%=format.format((double) order.getTotal()) %>  </p>
	<p>Ghi chú: <%=order.getNote() %>  </p>
            <%}else{ %>
                <p style=" background: yellow;color: red; font-weight: bold;">chưa có sản phẩm nào!</p>
                <%} %>

</div>
</div>
</div>
<h3>Có thể bạn cũng thích </h3>
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
		  </div>
		  </div>
		  </div>
		  
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
