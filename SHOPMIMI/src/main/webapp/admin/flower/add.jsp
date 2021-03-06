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
                <h2>Thêm Sản phẩm</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        String name = request.getParameter("name");
		String price =request.getParameter("price");
		//String catId = request.getParameter("category");
		String typeId = request.getParameter("type");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
        //@SuppressWarnings("unchecked")
        	//ArrayList<Category> categories =(ArrayList<Category>) request.getAttribute("categories");
        @SuppressWarnings("unchecked")
    	ArrayList<TypeFlower> typeFlowers =(ArrayList<TypeFlower>) request.getAttribute("typeFlowers");
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
                                        <label for="name">Tên hoa</label>
                                        <input type="text" id="name" value="<% if(name != null) out.print(name); %>" name="name" class="form-control" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Giá tiền</label>
                                        <input type="text" id="price" value="<% if(price != null) out.print(price); %>" name="price" class="form-control" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <%-- <label for="category">Danh mục hoa</label>
                                        <select id="category" name="category" class="form-control">
                                        <%
                                        if(categories != null && categories.size() > 0){
                                       		 for(Category itemsc : categories){
                                        %>
	                                        <option <% if(catId != null && catId.equals(String.valueOf(itemsc.getId()))) out.print(" selected"); %> value="<%=itemsc.getId() %>"><%=itemsc.getName() %></option>
											<%}} %>
                                        </select> --%>
                                    </div>
                                     <div class="form-group">
                                        <label for="type">Loại hoa</label>
                                        <select id="type" name="type" class="form-control" required="required">
                                        <%
                                        	if(typeFlowers != null && typeFlowers.size() > 0){
                                       		 	for(TypeFlower itemst : typeFlowers){
                                        %>
	                                        <option <% if(typeId != null && typeId.equals(String.valueOf(itemst.getId()))) out.print(" selected"); %> value="<%=itemst.getId() %>"><%=itemst.getName() %></option>
											
											<%}} %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" class="form-control" rows="3" name="preview" required="required"><% if(preview != null) out.print(preview); %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"><% if(detail != null) out.print(detail); %></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
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
<script type="text/javascript">
  	var editor = CKEDITOR.replace('detail');
  	CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/lib/ckfinder/');
  </script>
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
						required: " (Tên Hoa không được trống)",
						
					},
				price:{ 
					required: " (Giá Hoa không được trống)",
					
				},
				type:{ 
					required: " (Chọn danh mục hoa)",
					
				},
				preview:{ 
					required: " (Mô tả không được trống)",
					
				}
				}
			});
		});
</script>
<script>
    document.getElementById("flower").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>