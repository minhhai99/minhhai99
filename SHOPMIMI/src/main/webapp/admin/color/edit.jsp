<%@page import="model.bean.Meaning"%>
<%@page import="model.bean.Color"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa màu sắc hoa</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        @SuppressWarnings("unchecked")
        	ArrayList<Meaning> meanings = (ArrayList<Meaning>) request.getAttribute("meanings");
        String name = request.getParameter("name");
        String catId = request.getParameter("category");
        Color color = (Color) request.getAttribute("color");
        String picture = "";
        String pag =(String) session.getAttribute("pag");
        if(color != null){
        	name = color.getName();
        	catId = String.valueOf(color.getMeaning().getId());
        	picture = color.getPicture();
        }
        String err = request.getParameter("err");
        
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        %>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form action="" role="form" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên màu sắc</label>
                                        <input type="text" id="name" value="<% if(name != null) out.print(name); %>" name="name" class="form-control" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục loài hoa</label>
                                        <select id="category" name="category" class="form-control" required="required">
                                        <%
                                        	if(meanings != null && meanings.size() > 0){
                                        		for(Meaning item : meanings){
                                        %>
	                                        <option <% if(catId != null && catId.equals(String.valueOf(item.getId()))) out.print(" selected"); %> value="<%=item.getId() %>"><%=item.getName() %></option>
											
											<%}} %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                        <%
                                        	if(!picture.isEmpty()){
                                        %>
                                        <br />
                                        <img width="200 px" height="200 px" alt="Ảnh" src="<%=request.getContextPath() %>/files/<%=picture %>">
                                        <%} %>
                                    </div>
                                    
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
	$().ready(function(){
		// validate the form when it is submit
		var validator =$("#form").validate({
			// hiển thị ra thông báo
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id")+ "']").append(error);
			},
			errorElement: "span",
			messages: {
				name:{
					required: "(tên màu hoa không được trống)",
				},
				category:{
					required: "(chọn danh mục hoa)",
				},
			}
		});
	});
</script>
<script>
    document.getElementById("color").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>