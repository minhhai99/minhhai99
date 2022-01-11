<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.OrderDetail"%>
<%@page import="model.bean.Order"%>
<%@page import="model.bean.Flower"%>
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý Chi Tiết Đơn hàng </h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thêm chi tiết đơn hàng thành công!</span>");
    	}
        if("2".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Sửa chi tiết đơn hàng thành công!</span>");
    	}
        if("3".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Xoá chi tiết đơn hàng thành công!</span>");
    	}
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">ID không tồn tại!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        Locale locale = new Locale("vi", "VN");
        NumberFormat format = NumberFormat.getCurrencyInstance(locale);
        %>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" class="form-control input-sm" placeholder="Nhập tên người dùng" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>

                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>ID_order</th>
                                        <th>Tên khách hàng</th>
                                        <th>Email </th>
                                        <th>Ảnh sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                @SuppressWarnings("unchecked")
                                	ArrayList<OrderDetail> order = (ArrayList<OrderDetail>) request.getAttribute("order");
                                	if(order != null && order.size() > 0){
                                		for(OrderDetail items : order){
                                %>
                                    <tr>
                                        <td><%=items.getId() %></td>
                                        <td class="center"><%=items.getOrder().getId() %></td>
                                        <td class="center"><%=items.getOrder().getDisplay_name() %></td>
                                        <td class="center"><%=items.getOrder().getEmail() %></td>
                                        <td class="center">
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/fileFlowers/<%=items.getFlower().getPicture() %>" alt="Ảnh"/>
                                        </td>
                                        <td class="center"><%=items.getFlower().getName() %></td>
                                        <td class="center"><%=items.getQuanty() %></td>
                                        <td class="center"><%=format.format((double)items.getTotal()) %></td>
                                    </tr>
                                    <%}}else{ %>
                                    	<tr><td colspan="6" align="center">Chưa có Đơn hàng nào!</td></tr>
                                    	<%} %>
                                </tbody>
                            </table>
                            <%
                            int numberOfPages = (Integer) request.getAttribute("numberOfPages");
                            int currentPage = (Integer) request.getAttribute("currentPage");
                            int numberOfItems = (Integer) request.getAttribute("numberOfItems");
                            int offset = (Integer) request.getAttribute("offset");
                            if(order != null && order.size() > 0){
                            %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <%
                                	int numberP = offset + 5;
                                if(numberP > numberOfItems){
                                	numberP = numberOfItems;
                                
                                %>
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ <%=offset + 1 %> đến <%=numberP %> của <%=numberOfItems %> truyện</div>
                                <%}else{ %>
                                	<div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ <%=offset + 1 %> đến <%=numberP %> của <%=numberOfItems %> truyện</div>
                                <%} %>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                        <% 
                                        	if(currentPage == 1){
                                        %>
                                            <li class="paginate_button previous disabled " aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a>Trang trước</a></li>
                                            <%}else{ %>
                                            <li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath() %>/admin/orderDetails?page=<%=currentPage-1 %>">Trang trước</a></li>
                                            <%} %>
                                            <%
                                            String active ="";
                                            for(int i= 1; i<= numberOfPages; i++){
                                            	if(currentPage == i){
                                        			active =" active";
                                        		}else{
                                        			active ="";
                                        		}
                                            	%>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath() %>/admin/orderDetails?page=<%=i %>"><%=i %></a></li>
											<%} %>
											<%
											if(currentPage >= numberOfPages){
											%>
                                            <li class="paginate_button previous disabled " aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a>Trang tiếp</a></li>
                                        <%}else{ %>
                                        <li class="paginate_button previous next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath() %>/admin/orderDetails?page=<%=currentPage+1 %>">Trang tiếp</a></li>
                                        <%} %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("orderDetail").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>