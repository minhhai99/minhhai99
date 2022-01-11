<%@page import="model.bean.ApiUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>
	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/index">Home</a> <span class="divider">/</span></li>
		<li><a href="<%=request.getContextPath() %>/myAccount">myAccount</a> <span class="divider">/</span></li>
		<li class="active">Update tài khoản</li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/dang-ky-ngay.png"> Update tài khoản </h3>	
	<hr class="soft"/>
	<div class="well">
	<%
	@SuppressWarnings("unchecked")
    ArrayList<ApiUser> apiUsers = (ArrayList<ApiUser>) request.getAttribute("apiUsers");
        String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String Email = request.getParameter("Email");
		String address = request.getParameter("address");
		//String id_api = request.getParameter("apiuser");
		User user = (User) request.getAttribute("user");
        if(user != null){
        	username = user.getName();
        	fullname = user.getFullname();
        	Email = user.getEmail();
        	address = user.getAddress();
        	//id_api = String.valueOf(user.getApiUser().getId());
        }
        String err = request.getParameter("err");
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("3".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Tên đăng nhập đã tồn tại!</span>");
    	}
        if("4".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập Sửa!</span>");
    	}
        %>
	<form action="" method="post" class="form-horizontal">
		<div class="control-group">
			<label class="control-label" for="username">Tên đăng nhập <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="username" value="<% if(username != null) out.print(username); %>" name="username" placeholder="Name login" disabled="disabled">
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="fullname">Họ tên <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="fullname" value="<% if(fullname != null) out.print(fullname); %>" name="fullname" placeholder="Fullname">
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="Email">Email <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="Email" value="<% if(Email != null) out.print(Email); %>" name="Email" placeholder="Email" disabled="disabled">
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label" for="password">Mật khẩu <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="password" name="password" placeholder="Password">
		</div>
		</div>
	  <div class="control-group">
			<label class="control-label" for="address">địa chỉ <sup></sup></label>
			<div class="controls">
			  <textarea rows="3" id="textarea" name="address"  class="input-xlarge"><% if(address != null) out.print(address); %></textarea>
			</div>
		 </div>
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Hoàn thành" class="exclusive shopBtn">
		</div>
	</div>
	</form>
</div>

</div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
