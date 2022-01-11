<%@page import="model.bean.Meaning"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa ý nghĩa hoa</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        String name = request.getParameter("name");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		String pag =(String) session.getAttribute("pag");
        String err = request.getParameter("err");
        String picture ="";
        Meaning item = (Meaning) request.getAttribute("meaning");
        if(item != null){
        	name = item.getName();
        	preview = item.getPreview();
        	detail = item.getDetail();
        	picture = item.getPicture();
        }
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
                                        <label for="name">Tên Hoa</label>
                                        <input type="text" id="name" value="<% if(name != null) out.print(name); %>" name="name" class="form-control" required="required" />
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
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" class="form-control" rows="3" name="preview" required="required"><% if(preview != null) out.print(preview); %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"><% if(detail != null) out.print(detail); %></textarea>
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
					required: "(tên bài hát không được trống)",
				},
				preview:{
					required: "(mô tả không được trống)",
				}
			}
		});
	});
</script>
<script>
    document.getElementById("meaning").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>