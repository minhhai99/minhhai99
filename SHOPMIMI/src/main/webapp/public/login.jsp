<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.bean.ProductCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>

	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Đăng nhập</li>
    </ul>
    <%
    String fullname = request.getParameter("fullname");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String note = request.getParameter("note");
	User users =(User) session.getAttribute("accLogin");
	if(users != null){
		fullname = users.getFullname();
		email = users.getEmail();
		address = users.getAddress();
		
	}
    String msg = request.getParameter("msg");
    String err = request.getParameter("err");
    if("1".equals(msg)){
		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Đăng ký thành công!Mời bạn Đăng nhập lại!</span>");
	}
    if("1".equals(err)){
		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Tài khoản hoặc mật khẩu không đúng?</span>");
	}
    if("2".equals(err)){
		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Bạn chưa đăng nhập!</span>");
	}
    Locale locale = new Locale("vi", "VN");
    NumberFormat format = NumberFormat.getCurrencyInstance(locale);
    %>
	<h3> Mời bạn đăng nhập</h3>	
	<hr class="soft"/>
	
	<div class="row">
	<div class="span4">
			<div class="well">
			<h5 align="center">ĐÃ CÓ TÀI KHOẢN</h5>
			<hr class="soften"/>
			<form action="" method="post" id="form">
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Email</label>
				<div class="controls">
				  <input type="text" class="span3" name="email" id="inputEmail" placeholder="Email" required="required">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
				  <input type="password" class="span3" name="password" id="inputPassword" placeholder="Password" required="required" >
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls" align="center">
				  <button type="submit" class="shopBtn btn-large">Đăng nhập</button>
				</div>
			  </div>
			</form>
		</div>
		<div class="span1"> &nbsp;</div>
		</div>
		<div class="span4">
			<div class="well">
			<h5 align="center">CHƯA CÓ TÀI KHOẢN?</h5>
			<hr class="soften"/>
			  <div class="control-group">
			  </div>
			  <div class="controls" align="center">
			  <a href="<%=request.getContextPath() %>/register" class="shopBtn btn-large">Tạo tài khoản mới</a>
			  </div>
		</div>
		</div>
		
</div>

</div>

	</div>	
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
				email:{
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
    document.getElementById("account").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
