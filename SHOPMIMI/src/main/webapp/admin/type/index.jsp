<%@page import="model.bean.TypeFlower"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý chủ đề</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        String pag = request.getParameter("page");
        session.setAttribute("pag", pag);
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thêm danh mục thành công!</span>");
    	}
        if("2".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Sửa danh mục thành công!</span>");
    	}
        if("3".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Xoá danh mục thành công!</span>");
    	}
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">ID không tồn tại!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("3".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập Thêm!</span>");
    	}
        if("4".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập Sửa!</span>");
    	}
        if("5".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập xoá!</span>");
    	}
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
                                <%
                                if("admin".equals(userLogin.getApiUser().getName()) || "supper mod".equals(userLogin.getApiUser().getName())){
                                        %>
                                    <a href="<%=request.getContextPath() %>/admin/type/add" class="btn btn-success btn-md">Thêm</a>
                                <%} %>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" class="form-control input-sm" placeholder="Nhập tên chủ đề" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>

                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Chủ đề</th>
                                        <th>Hình ảnh</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                @SuppressWarnings("unchecked")
                                	ArrayList<TypeFlower> typeFlowers =(ArrayList<TypeFlower>) request.getAttribute("typeFlowers");
                                	if(typeFlowers != null && typeFlowers.size() > 0){
                                		for(TypeFlower items : typeFlowers){
                                %>
                                    <tr>
                                        <td><%=items.getId() %></td>
                                        <td class="center"><%=items.getName() %></td>
                                        <td class="center">
                                        <%
                                        	if(items.getPicture_type().isEmpty()){
                                        %>
                                        Chưa có hình ảnh!
                                        <%}else{ %>
											<img width="200 px" height="200 px" src="<%=request.getContextPath() %>/fileTypes/<%=items.getPicture_type() %>" alt="Anh"/>
                                        <%} %>
                                        </td>
                                        <td class="center">
                                        <%
                                        if("admin".equals(userLogin.getApiUser().getName()) || "supper mod".equals(userLogin.getApiUser().getName())){
                                        %>
                                            <a href="<%=request.getContextPath() %>/admin/type/edit?id=<%=items.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=request.getContextPath() %>/admin/type/del?id=<%=items.getId() %>" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá?');"><i class="fa fa-pencil"></i> Xóa</a>
                                       <%} %>
                                        </td>
                                    </tr>
                                    <%}}else{ %>
                                    	<tr><td colspan="2" align="center">chưa có chủ đề nào!</td></tr>
                                    <%} %>
                                </tbody>
                            </table>
                            <%
                            int numberOfPages = (Integer) request.getAttribute("numberOfPages");
                            int currentPage = (Integer) request.getAttribute("currentPage");
                            int numberOfItems = (Integer) request.getAttribute("numberOfItems");
                            int offset = (Integer) request.getAttribute("offset");
                            if(typeFlowers != null && typeFlowers.size() > 0){
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
                                            <li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath() %>/admin/types?page=<%=currentPage-1 %>">Trang trước</a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath() %>/admin/types?page=<%=i %>"><%=i %></a></li>
											<%} %>
											<%
											if(currentPage >= numberOfPages){
											%>
                                            <li class="paginate_button previous disabled " aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a>Trang tiếp</a></li>
                                        <%}else{ %>
                                        <li class="paginate_button previous next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath() %>/admin/types?page=<%=currentPage+1 %>">Trang tiếp</a></li>
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
    document.getElementById("typeFlower").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>