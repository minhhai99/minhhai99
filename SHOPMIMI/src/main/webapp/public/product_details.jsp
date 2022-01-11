<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.Handmade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>

	<div class="span9">
    <ul class="breadcrumb">
    <li><a href="<%=request.getContextPath() %>/index"><span class="icon-home"></span> Home</a> <span class="divider">/</span></li>
    <li><a href="<%=request.getContextPath() %>/list-product">list sản phẩm</a> <span class="divider">/</span></li>
    <li class="active">chi tiết sản phẩm</li>
    </ul>	
	<div class="well well-small">
	<div class="row-fluid">
			<div class="span5">
			<div id="myCarousel" class="carousel slide cntr">
			<%
			Locale locale = new Locale("vi", "VN");
			NumberFormat format = NumberFormat.getCurrencyInstance(locale);
				Flower flowerD = (Flower) request.getAttribute("flowerD");
			if(flowerD != null){
			%>
                <div class="carousel-inner">
                  <div class="item active">
                   <a href="#"> <img src="<%=request.getContextPath() %>/fileFlowers/<%=flowerD.getPicture() %>" alt="" style="width:100%"></a>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>
			</div>
			<div class="span7">
				<h3><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon1.jpg"> <%=flowerD.getName() %></h3>
				<hr class="soft"/>
				
				<form class="form-horizontal qtyFrm">
				  <div class="control-group">
				   
					<label class="control-label"><span style="color: red;"><%=format.format((long)flowerD.getPrice()) %> </span><br />(Giá đã bao gồm 10% VAT)</label>
					
				  </div>
				  <h4><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon4.jpg"> Mô tả</h4>
				  <p><%=flowerD.getPreview_text() %>
				  <p>
				  <br />
				  <a href="<%=request.getContextPath() %>/cart/add?id=<%=flowerD.getId() %>"  type="submit" class="shopBtn"><span class=" icon-shopping-cart"></span> Mua ngay</a>
				</form>
			</div>
			</div>
				<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Thông tin chi tiết</a></li>
              <li class=""><a href="#profile" data-toggle="tab">Sản phẩm liên quan </a></li>
              
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
			  <h4><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon1.jpg"> <%=flowerD.getName() %></h4>
                <table class="table table-striped">
				<tbody>
				<tr class="techSpecRow"><td class="techSpecTD1">Ngày đăng:</td><td class="techSpecTD2"><%=flowerD.getDate_create() %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">lượt xem: </td><td class="techSpecTD2"><%=flowerD.getCounter() %></td></tr>
				</tbody>
				</table>
				<hr class="softn clr"/>
				<p><%=flowerD.getDetail_text() %></p>

			</div>
			<%} %>
			<div class="tab-pane fade" id="profile">
			<%
			@SuppressWarnings("unchecked")
			ArrayList<Flower> relatedFlower = (ArrayList<Flower>) request.getAttribute("relatedFlower");
			if(relatedFlower != null && relatedFlower.size() > 0){
				for(Flower itemRL : relatedFlower){
			%>
			<div class="row-fluid">	  
			<div class="span2">
				<img src="<%=request.getContextPath() %>/fileFlowers/<%=itemRL.getPicture() %>" alt="Ảnh">
			</div>
			<div class="span6">
				<h5><%=itemRL.getName() %> </h5>
				<p>
				<%=itemRL.getPreview_text() %>
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3 style="color: red;"> <%=format.format((long)itemRL.getPrice()) %> </h3>
			<div class="btn-group">
			  <a href="<%=request.getContextPath() %>/cart/add?id=<%=itemRL.getId() %>" class="defaultBtn"><span class=" icon-shopping-cart"></span> Thêm vào giỏ hàng</a>
			  <a href="<%=request.getContextPath() %>/product-detail?id=<%=itemRL.getId() %>" class="shopBtn">VIEW</a>
			 </div>
				</form>
			</div>
		</div>
		<hr class="soft">
			<%}} %>
            </div>

</div>
</div>
</div> <!-- Body wrapper -->
</div>
</div>
<script>
    document.getElementById("product").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>