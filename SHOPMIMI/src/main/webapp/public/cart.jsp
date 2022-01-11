<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.ProductCart"%>
<%@page import="model.bean.Flower"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
Body Section 
-->
<% 
	@SuppressWarnings("unchecked")
		 //ArrayList<ProductCart> listHoa =(ArrayList<ProductCart>) session.getAttribute("listHoa");
		String soluong1 = request.getParameter("soluonga");
        String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thêm thành công!</span>");
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
	<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/index"><span class="icon-home"></span> Home</a> <span class="divider">/</span></li>
		<li class="active">Giỏ hàng</li>
    </ul>
	<div class="well well-small">
		<h1>Thủ tục thanh toán <small class="pull-right"> Sản phẩm trong giỏ hàng </small></h1>
	<hr class="soften"/>	

	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Sản phẩm</th>
                  <th>Tên sản phẩm</th>
				  <th>Tham khảo </th>
                  <th>Có sẵn</th>
                  <th>Đơn giá</th>
                  <th>Số lượng </th>
                  <th>Giá</th>
				</tr>
              </thead>
              <tbody>
              <%
              int j=0;
              float tongTien =0.0f;
              float sale = 0.0f;
             int soluong = 1;
             float ship = 30000.0f;
              if(listHoa != null && listHoa.size() > 0){
            	 
              for(ProductCart item : listHoa){
            	  j++;
            	  tongTien += item.getFlower().getPrice() * item.getQuanty();
              %>
                <tr>
                 <td><a href="<%=request.getContextPath() %>/product-detail?id=<%=item.getFlower().getId() %>" ><img width="100" src="<%=request.getContextPath() %>/fileFlowers/<%=item.getFlower().getPicture() %>" alt="VIEW"></a></td>
                  <td><%=item.getFlower().getName() %> </td>
                  <td> - </td>
                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
                  <td><%=format.format((long)item.getFlower().getPrice()) %> </td>
                  <td>
				 	<%if(item.getQuanty() > 1){ %>
                  	<input class="span1" name="soluonga" style="max-width:34px" placeholder="1" id="soluonga" size="16" type="text" value="<%=item.getQuanty() %>">
				  <div class="input-append">
					<a href="<%=request.getContextPath() %>/cart/reduce?id=<%=j-1 %>" class="btn btn-mini" type="button">-</a>
					<a href="<%=request.getContextPath() %>/cart/increase?id=<%=j-1 %>" class="btn btn-mini" type="button" onclick="return getAdd1()"> + </a><a href="<%=request.getContextPath() %>/cart/del?id=<%=j-1 %>" class="btn btn-mini btn-danger" onclick="return confirm('Bạn có chắc muốn xoá sản phẩm!');" ><span class="icon-remove"></span></a>
				</div>
					<%}else{ %>
					<input class="span1" name="soluonga" style="max-width:34px" placeholder="1" id="soluonga" size="16" type="text" value="1">
					<div class="input-append">
					<a href="<%=request.getContextPath() %>/cart/del?id=<%=j-1 %>" class="btn btn-mini" type="button">-</a>
					<a href="<%=request.getContextPath() %>/cart/increase?id=<%=j-1 %>" class="btn btn-mini" type="button" onclick="return getAdd1()"> + </a><a href="<%=request.getContextPath() %>/cart/del?id=<%=j-1 %>" class="btn btn-mini btn-danger" onclick="return confirm('Bạn có chắc muốn xoá sản phẩm!');" ><span class="icon-remove"></span></a>
				</div>
				  <%} %>
				
				</td>
				
                  <td><%=format.format((long)item.getFlower().getPrice() * item.getQuanty()) %> </td>
                </tr>
                <%} %>
                <tr>
                  <td colspan="6" class="alignR">Tạm tính:	</td>
                  <td> <%=format.format((double)tongTien) %> </td>
                </tr>
                <%
                if(tongTien >= 1000000){
                	sale = 20000;
                %>
                <tr>
               <td colspan="6" class="alignR">Giảm giá (Áp dụng với các hoá đơn trên 1.000.000 vnđ):	</td>
				 <td> -<%=format.format((float)sale) %> </td>
                </tr>
                <tr>
                  <td colspan="6" class="alignR">Phí vận chuyển (Áp dụng phí ship này toàn quốc):	</td>
                  <td> <%=format.format((float)ship) %> </td>
                </tr>
				 <tr>
                  <td colspan="6" class="alignR">Tổng tiền:	</td>
                  <td class="label label-primary"> <%=format.format((double)tongTien - sale + ship) %> </td>
                </tr>
                <% }else{
                	sale = 0;
                %>
                <tr>
               <td colspan="6" class="alignR">Giảm giá (Áp dụng với các hoá đơn trên 1.000.000 vnđ) :	</td>
				 <td> <%=format.format((float)sale) %> </td>
                </tr>
                <tr>
                  <td colspan="6" class="alignR">Phí vận chuyển (Áp dụng phí ship này toàn quốc):	</td>
                  <td> <%=format.format((float)ship) %> </td>
                </tr>
                <tr>
                  <td colspan="6" class="alignR">Tổng tiền:	</td>
                  <td class="label label-primary"> <%=format.format((double)tongTien - sale + ship) %> </td>
                </tr>
                <%} %>
                <%
                session.setAttribute("j", j);
                session.setAttribute("soluong", soluong);
                session.setAttribute("tongTien", tongTien);
                %>
				</tbody>
				
            </table><br/>
						<a href="<%=request.getContextPath() %>/orders" class="shopBtn btn-large pull-right">Thanh toán</a>
            <table class="table table-bordered">
            <%}else{ %>
            <tr><td colspan="7" style=" background: yellow; color: red; font-weight: bold;" align="center">Chưa có sản phẩm nào!</td></tr>
            <%} %>
			<tbody>
				 
				
			</tbody>
				</table>
	<a href="<%=request.getContextPath() %>/index" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Quay lại </a>

</div>
</div>
</div>
<script>
    document.getElementById("cart").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
