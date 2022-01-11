<%@page import="model.bean.OrderDetail"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.Order"%>
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
                <h2>Chi tiết đơn hàng </h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        String pag = request.getParameter("page");
        session.setAttribute("pag", pag);
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thêm thông tin đơn hàng thành công!</span>");
    	}
        if("2".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Sửa thông tin đơn hàng thành công!</span>");
    	}
        if("3".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Xoá thông tin đơn hàng thành công!</span>");
    	}
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">ID không tồn tại!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("3".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập sửa!</span>");
    	}
        if("4".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập xoá!</span>");
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
                                        <th>ID khách hàng</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Hình ảnh sản phẩm</th>
                                        <th>số lượng</th>
                                        <th>Đơn giá</th>
                                        <th>Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                @SuppressWarnings("unchecked")
                                	ArrayList<OrderDetail> detailOr = (ArrayList<OrderDetail>) request.getAttribute("detailOr");
                                	if(detailOr != null && detailOr.size() > 0){
                                		for(OrderDetail items : detailOr){
                                %>
                                    <tr>
                                        <td class="center"><%=items.getOrder().getId() %></td>
                                        <td class="center"><%=items.getFlower().getName() %></td>
                                        <td class="center">
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/fileFlowers/<%=items.getFlower().getPicture() %>" alt="Ảnh"/>
                                        </td>
                                        <td class="center"><%=items.getQuanty() %></td>
                                        <td class="center"><%=format.format((long)items.getFlower().getPrice()) %></td>
                                        <td class="center"><%=format.format((double)items.getTotal()) %></td>
                                    </tr>
                                    <%}}else{ %>
                                    	<tr><td colspan="11" align="center">Chưa có Đơn hàng nào!</td></tr>
                                    	<%} %>
                                </tbody>
                            </table>
                            
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("order").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>