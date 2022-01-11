<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.Flower"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>
<div class="well np">
		<div id="myCarousel" class="carousel slide homCar">
            <div class="carousel-inner">
			  <div class="item">
                <img style="width:100%" src="<%=request.getContextPath() %>/templates/public/assets/img/wedding5.jpg" alt="Ảnh">
                <div class="carousel-caption">
                      <h4>Giao hàng toàn quốc</h4>
                      <p><span>Đảm bảo uy tín, chất lượng</span></p>
                </div>
              </div>
			  <div class="item">
                <img style="width:100%" src="<%=request.getContextPath() %>/templates/public/assets/img/giao_hoa.png" alt="bootstrap ecommerce templates">
                <div class="carousel-caption">
                      <h4> Giao nhanh 60 phút </h4>
                      <p><span>Nội thành Đà Nẵng</span></p>
                </div>
              </div>
			  <div class="item active">
                <img style="width:100%" src="<%=request.getContextPath() %>/templates/public/assets/img/looo.png" alt="bootstrap ecommerce templates">
                <div class="carousel-caption">
                      <h4>Cam kết 100% hài lòng</h4>
                      <p><span>Nếu không chúng tôi sẽ hoàn tiền lại cho bạn.</span></p>
                </div>
              </div>
              <div class="item">
                <img style="width:100%" src="<%=request.getContextPath() %>/templates/public/assets/img/hoa-hoi-nghi.png" alt="bootstrap templates">
                <div class="carousel-caption">
                      <h4>Một đoá hoa đẹp</h4>
                      <p><span>=1 vạn lời chúc hay</span></p>
                </div>
              </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
          </div>
        </div>
<!--
New Products
-->
<%
	Locale locale = new Locale("vi", "VN");
NumberFormat format = NumberFormat.getCurrencyInstance(locale);
%>
	<div class="well well-small">
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/icon_list.png"> Sản phẩm mới </h3>
	<hr class="soften"/>
		<div class="row-fluid">
		<div id="newProductCar" class="carousel slide">
            <div class="carousel-inner">
			<div class="item active">
			  <ul class="thumbnails">
			  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowerN1 = (ArrayList<Flower>) request.getAttribute("flowerN1");
		  if(flowerN1 != null && flowerN1.size() >0){
			  for(Flower item5 : flowerN1){
		  %>
				<li class="span3">
				<div class="thumbnail">
					<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item5.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a href="#" class="tag"></a>
					<a href="<%=request.getContextPath() %>/product-detail?id=<%=item5.getId() %>"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item5.getPicture() %>" alt="bootstrap-ring"></a>
				</div>
				</li>
				<%}} %>
			  </ul>
			  </div>
		   <div class="item">
		  <ul class="thumbnails">
		  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowerN2 = (ArrayList<Flower>) request.getAttribute("flowerN2");
		  if(flowerN2 != null && flowerN2.size() >0){
			  for(Flower item6 : flowerN2){
		  %>
			<li class="span3">
			  <div class="thumbnail">
				<a class="zoomTool" href="<%=request.getContextPath() %>/product-detail?id=<%=item6.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item6.getPicture() %>" alt=""></a>
			  </div>
			</li>
			<%}} %>
		  </ul>
		  </div>
		   </div>
		  <a class="left carousel-control" href="#newProductCar" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#newProductCar" data-slide="next">&rsaquo;</a>
		  </div>
		  </div>
		  <hr class="soften"/>
		<div class="row-fluid">
		  <ul class="thumbnails">
		  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowerNew = (ArrayList<Flower>) request.getAttribute("flowerNew");
		  if(flowerNew != null && flowerNew.size() >0){
			  for(Flower item4 : flowerNew){
		  %>
			<li class="span4">
			  <div class="thumbnail">
				 
				<a class="zoomTool" href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item4.getName()) %>-<%=item4.getId() %>.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item4.getName()) %>-<%=item4.getId() %>.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item4.getPicture() %>" alt="<%=item4.getName() %>"></a>
				<div class="caption cntr">
					<p><%=item4.getName() %></p>
					<p><strong style="color: red;"> <%=format.format((long)item4.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item4.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}} %>
		  </ul>
		</div>
	</div>
	
	<div class="well well-small">
	<h3><a class="btn btn-mini pull-right" href="<%=request.getContextPath() %>/list-cat?id=1" title="View more">Xem thêm<span class="icon-plus"></span></a><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/icon_list.png"> Sản phẩm bán chạy nhất  </h3>
	<hr class="soften"/>
		  <div class="row-fluid">
		  <ul class="thumbnails">
		 <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowerSell = (ArrayList<Flower>) request.getAttribute("flowerSell");
		  if(flowerSell != null && flowerSell.size() >0){
			  for(Flower item2 : flowerSell){
		  %>
			<li class="span4">
			  <div class="thumbnail">
				 
				<a class="zoomTool" href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item2.getName()) %>-<%=item2.getId() %>.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item2.getName()) %>-<%=item2.getId() %>.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item2.getPicture() %>" alt="<%=item2.getName() %>"></a>
				<div class="caption cntr">
					<p><%=item2.getName() %></p>
					<p><strong style="color: red;"><%=format.format((long)item2.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item2.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}} %>
			
		  </ul>	
	</div>
	</div>
	<hr>
	<!--
	Sản phẩm nổi bật
	-->
		<div class="well well-small">
		  <h3><a class="btn btn-mini pull-right" href="<%=request.getContextPath() %>/list-cat?id=2" title="View more">Xem thêm<span class="icon-plus"></span></a><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/icon_list.png"> Sản phẩm được quan tâm nhất  </h3>
		  <hr class="soften"/>
		  <div class="row-fluid">
		  <ul class="thumbnails">
		  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowersNB = (ArrayList<Flower>) request.getAttribute("flowersNB");
		  if(flowersNB != null && flowersNB.size() >0){
			  for(Flower item1 : flowersNB){
		  %>
			<li class="span4">
			  <div class="thumbnail">
				 
				<a class="zoomTool" href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item1.getName()) %>-<%=item1.getId() %>.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item1.getName()) %>-<%=item1.getId() %>.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item1.getPicture() %>" alt="<%=item1.getName() %>"></a>
				<div class="caption cntr">
					<p><%=item1.getName() %></p>
					<p><strong style="color: red;"> <%=format.format((long)item1.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="<%=request.getContextPath() %>/cart/add?id=<%=item1.getId() %>" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}} %>
		  </ul>	
	</div>
	</div>
	<div class="well well-small">
	<h3><a class="btn btn-mini pull-right" href="<%=request.getContextPath() %>/list-cat?id=3" title="View more">Xem thêm<span class="icon-plus"></span></a><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/icon_list.png"> Sản phẩm phổ biến  </h3> 
	<hr class="soften"/>
		  <div class="row-fluid">
		  <ul class="thumbnails">
		  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Flower> flowerPB = (ArrayList<Flower>) request.getAttribute("flowerPB");
		  if(flowerPB != null && flowerPB.size() >0){
			  for(Flower item3 : flowerPB){
		  %>
			<li class="span4">
			  <div class="thumbnail">
				 
				<a class="zoomTool" href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item3.getName()) %>-<%=item3.getId() %>.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<%=request.getContextPath() %>/danh-sach-san-pham/<%=StringUtil.makeSlug(item3.getName()) %>-<%=item3.getId() %>.html"><img src="<%=request.getContextPath() %>/fileFlowers/<%=item3.getPicture() %>" alt="<%=item3.getName() %>"></a>
				<div class="caption cntr">
					<p><%=item3.getName() %></p>
					<p><strong style="color: red;"> <%=format.format((long)item3.getPrice()) %> </strong></p>
					<h4><a class="shopBtn" href="#" title="add to cart"> Thêm vào giỏ hàng </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}} %>
		  </ul>	
	</div>
	</div>
	</div>
	</div>
	<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
