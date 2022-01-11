<%@page import="model.bean.OrderDetail"%>
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
		<li class="active">Thông tin Đơn hàng đã đặt</li>
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
		<h1>Thông tin đơn hàng đã đặt <small class="pull-right"> </small></h1>
	<hr class="soften"/>
	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Sản phẩm</th>
                  <th>Tên sản phẩm</th>
                  <th>Đơn giá</th>
                  <th>Số lượng </th>
                  <th>Giá</th>
				</tr>
              </thead>
              <tbody>	
	<%
	@SuppressWarnings("unchecked")
	ArrayList<OrderDetail> orderDetails =(ArrayList<OrderDetail>) request.getAttribute("orderDetail");
	if(orderDetails != null){
		for(OrderDetail item : orderDetails){
	%>
	<tr>
                  <td><img width="100" src="<%=request.getContextPath() %>/fileFlowers/<%=item.getFlower().getPicture() %>" alt=""></td>
                  <td><%=item.getFlower().getName() %> </td>
                  <td><%=format.format((long)item.getFlower().getPrice()) %> </td>
                  <td><%=item.getQuanty() %> </td>
                  <td><%=format.format((long)item.getTotal()) %> </td>
                </tr>
            <%}}else{ %>
                <tr><td colspan="5" style=" background: yellow; color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</td></tr>
                <%} %>
</tbody>
				
            </table><br/>
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
		  
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
