<%@page import="model.bean.Flower"%>
<%@page import="model.dao.FlowerDAO"%>
<%@page import="model.bean.TypeFlower"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.TypeFlowerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <!-- 
Body Section 
-->
	<div class="row">
<div id="sidebar" class="span3">
<div class="well well-small">
	<ul class="nav nav-list">
	<%
		TypeFlowerDAO typeFlowerDAO = new TypeFlowerDAO();
	ArrayList<TypeFlower> typeFlowers =  typeFlowerDAO.getItems();
	if(typeFlowers.size() > 0){
		for(TypeFlower items : typeFlowers){
	%>
		<li><a href="<%=request.getContextPath() %>/type?id=<%=items.getId() %>"><span class="icon-chevron-right"></span><%=items.getName() %></a></li>
		<%}} %>
		<li style="border:0"> &nbsp;</li>
	</ul>
</div>

			  <div class="well well-small alert alert-warning cntr">
				  <h2>Giảm giá 50% </h2>
				  <p> 
					 chỉ có giá trị cho đặt hàng trực tuyến. <br><br><a class="defaultBtn" href="<%=request.getContextPath() %>/list-product">Click here </a>
				  </p>
			  </div>
			  <div class="well well-small" ><a href="<%=request.getContextPath() %>/carts"><img src="<%=request.getContextPath() %>/templates/public/assets/img/paypal.jpg" alt="payment method paypal"></a></div>
			
			<a class="shopBtn btn-block" href="<%=request.getContextPath() %>/list-product">Sản phẩm mới ra mắt <br><small>Click to view</small></a>
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			
			<li>
			  <div class="thumbnail">
				<a  href="product_details.html" title="add to cart">
				<img src="<%=request.getContextPath() %>/templates/public/assets/img/gioithieu.jpg" alt="shopping cart template"></a>
				<div class="caption">
				  <a style="background: purple; color: white; font-weight: bold; padding: 5px;"  href="<%=request.getContextPath() %>/introducts" title="giới thiệu">Giới thiệu</a> <br /><br />
				  <p style=" text-align: left ;">Tuy chúng tôi là một trong những nhân tố mới trong làng hoa, nhưng với đội ngũ nhân viên chuyên nghiệp, cách làm việc uy tín, trách nhiệm, sản phẩm đa dạng, mẫu mã sang trọng.Hiện nay,...<a href="<%=request.getContextPath() %>/introducts" title="giới thiệu" ><strong>xem thêm</strong></a></p>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a  href="product_details.html" title="add to cart">
				<img src="<%=request.getContextPath() %>/templates/public/assets/img/nu_cuoi .jpg" alt="shopping cart template"></a>
				<div class="caption">
				  <a style="background: purple; color: white; font-weight: bold; padding: 5px;"  href="<%=request.getContextPath() %>/list-product" title="nụ cười khách ha">Nụ cười khách hàng</a> <br /><br />
				  <p style=" text-align: left ;">Sự hài lòng của khách hàng là sự thành công của chúng tôi !<br />
Niềm hạnh phúc của khách hàng là niềm tự hào của chúng tôi !<br />
Chăm chút từng cảm nhận nhỏ nhất của khách hàng là điều mà chúng tôi luôn luôn theo đuổi và cố gắng nổ lực để hoàn thiện.<br />
Chính vì điều đó <a href="<%=request.getContextPath() %>/home"  title="Shop hoa Mimi" ><strong style="color: red; ">Shop hoa Mimi</strong></a> luôn luôn quan niệm: " sự hài lòng đến từ cảm nhận khách hàng và chúng tôi chăm chút cho từng cảm nhận đó".</p>
				</div>
			  </div>
			</li>
		  </ul>

	</div>
	<div class="span9">
	