<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>
	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/home">Home</a> <span class="divider">/</span></li>
		<li class="active">Đăng ký thông tin</li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/dang-ky-ngay.png"> Thông tin người mua </h3>	
	<hr class="soft"/>
	<div class="well">
	<%
        String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String Email = request.getParameter("Email");
		String address = request.getParameter("address");
        String err = request.getParameter("err");
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Tên đăng nhập bị lỗi!</span>");
    	}
        if("3".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Tên đăng nhập đã tồn tại!</span>");
    	}
        %>
	<form action="" method="post" class="form-horizontal">
		 <div class="control-group">
			<label class="control-label" for="fullname">Họ tên <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="fullname" value="<% if(fullname != null) out.print(fullname); %>" name="fullname" placeholder="Fullname">
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="Email">Email <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="Email" value="<% if(Email != null) out.print(Email); %>" name="Email" placeholder="Email">
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label" for="phone">Điện thoại <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="phone" name="phone" placeholder="nhập số điện thoại">
		</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="address">Địa chỉ <sup>*</sup></label>
			<div class="controls">
			  <textarea rows="3" id="address" name="address"  class="input-xlarge"></textarea>
			</div>
		 </div>
	  <div class="control-group">
			<label class="control-label" for="note">Ghi chú <sup></sup></label>
			<div class="controls">
			  <textarea rows="4" id="note" name="note"  class="input-xlarge"></textarea>
			</div>
		 </div>
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Thanh toán" class="exclusive shopBtn">
		</div>
	</div>
	</form>
	<a href="products.html" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Quay lại </a>
	<a href="<%=request.getContextPath() %>/loginn" class="shopBtn btn-large pull-right">Next <span class="icon-arrow-right"></span></a>
</div>

</div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
