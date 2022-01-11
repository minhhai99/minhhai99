<%@page import="model.bean.ApiUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa người dùng</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        String pag =(String) session.getAttribute("pag");
        @SuppressWarnings("unchecked")
        ArrayList<ApiUser> apiUsers = (ArrayList<ApiUser>) request.getAttribute("apiUsers");
        String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String Email = request.getParameter("Email");
		String address = request.getParameter("address");
		String id_api = request.getParameter("apiuser");
        String err = request.getParameter("err");
        User user = (User) request.getAttribute("user");
        if(user != null){
        	username = user.getName();
        	fullname = user.getFullname();
        	Email = user.getEmail();
        	address = user.getAddress();
        	id_api = String.valueOf(user.getApiUser().getId());
        }
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("2".equals(err)){
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
                                <form role="form" method="post" id="form">
                                    <div class="form-group">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" id="username" value="<% if(username != null) out.print(username); %>" name="username" class="form-control" disabled="disabled" maxlength ="15"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" id="password" value="" name="password" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">Họ tên</label>
                                        <input type="text" id="fullname" value="<% if(fullname != null) out.print(fullname); %>" name="fullname" class="form-control" required="required" />
                                    </div>
                                   <div class="form-group">
                                        <label for="Email">Email</label>
                                        <input type="text" id="Email" value="<% if(Email != null) out.print(Email); %>" name="Email" class="form-control" disabled="disabled" required="required" email="email"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Địa chỉ</label>
                                        <textarea id="address" class="form-control" rows="3" name="address" required="required"><% if(address != null) out.print(address); %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="apiuser">Phân quyền User</label>
                                        <%
                                        if("admin".equals(userLogin.getApiUser().getName()) || "supper mod".equals(userLogin.getApiUser().getName())){
                                        %>
                                        <select id="apiuser" name="apiuser" class="form-control" required="required">
                                        <%}else{ %>
                                        <select id="apiuser" name="apiuser" class="form-control" disabled="disabled" required="required">
                                        <%} %>
                                        <%
                                        	if(apiUsers != null && apiUsers.size() > 0){
                                       		 	for(ApiUser itemst : apiUsers){
                                        %>
	                                        <option <% if(id_api != null && id_api.equals(String.valueOf(itemst.getId()))) out.print(" selected"); %> value="<%=itemst.getId() %>"><%=itemst.getName() %></option>
											
											<%}} %>
                                        </select>
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
				username:{
					
					required: "(Tên đăng nhập không được trống)",
					maxlength: "(Tên đăng nhập không được quá 15 ký tự)",
				},
				fullname:{
					required: "(Họ và tên không được trống)",
				},
				Email:{
					required: "(Email không được trống)",
					email: "(Nhập email đúng định dạng ***@***.com)",
				},
				address:{
					required: "(Địa chỉ không được trống)",
				},
			}
		});
	});
</script>
<script>
    document.getElementById("user").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>