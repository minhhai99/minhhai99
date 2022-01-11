<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>
	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/home">Home</a> <span class="divider">/</span></li>
		<li class="active">Đăng ký tài khoản</li>
    </ul>
	<h3><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/dang-ky-ngay.png"> Đăng ký tài khoản </h3>	
	<hr class="soft"/>
	<div class="well">
	<%
        String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
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
        if("4".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Đăng nhập không thành công!Bạn có thể đăng kí tài khoản mới!</span>");
    	}
        %>
	<form action="" method="post" class="form-horizontal" id="formm">
		<p style="color: green; font-weight: bold;">Khi tạo tài khoản tại cửa hàng chúng tôi, 
		đơn hàng của bạn sẽ được xử lý nhanh hơn, bạn sẽ có thể lưu lại các địa chỉ giao hàng, 
		xem và theo dõi các đơn hàng trong tài khoản.</p>
		<br />
		<div class="control-group">
			<label class="control-label" for="username">Tên đăng nhập <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="username" value="<% if(username != null) out.print(username); %>" name="username" placeholder="First Name" required="required" maxlength ="15">
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="fullname">Họ tên <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="fullname" value="<% if(fullname != null) out.print(fullname); %>" name="fullname" placeholder="Fullname" required="required">
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="Email">Email <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="Email" value="<% if(Email != null) out.print(Email); %>" name="Email" placeholder="Email" required="required" email="email">
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label" for="password">Mật khẩu <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="password" name="password" placeholder="Password" required="required" minlength ="6">
		</div>
		</div>
	  <div class="control-group">
			<label class="control-label" for="address">địa chỉ <sup></sup></label>
			<div class="controls">
			  <textarea rows="3" id="textarea" name="address"  class="input-xlarge" required="required"><% if(address != null) out.print(address); %></textarea>
			</div>
		 </div>
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Tạo tài khoản" class="exclusive shopBtn">
		</div>
	</div>
	</form>
</div>

</div>
</div>
<script>
	$().ready(function(){
		// validate the form when it is submit
		var validator =$("#formm").validate({
			// hiển thị ra thông báo
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id")+ "']").append(error);
			},
			errorElement: "span",
			messages: {
				username:{
					required: "(Tên đăng nhập không được để trống)",
					maxlength: "(Tên đăng nhập không được quá 15 ký tự)",
				},
				fullname:{
					required: "(Họ tên không được để trống)",
				},
				Email:{
					required: "(Email không được trống)",
					email: "(Nhập email đúng định dạng ***@***.com)",
				},
				password:{
					required: "(Mật khẩu không được để trống)",
					minlength: "(Mật khẩu ít nhất 6 ký tự)",
				},
			}
		});
	});
</script>
<script>
    document.getElementById("register").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
