<%@page import="model.bean.Meaning"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<hr class="soften">
	<div class="well well-small">
	<h1>Visit us</h1>
	<hr class="soften"/>	
	<div class="row-fluid">
		<div class="span8 relative">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d958.4764892661129!2d108.15164859930722!3d16.07036919059091!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142192f9cdc823f%3A0x6f62aa12c4a3161a!2zSG9hIFPDoXAgS2ltIE5nw6Ju!5e0!3m2!1svi!2s!4v1635585327710!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
		<div class="absoluteBlk">
		<div class="well wellsmall">
		<h4>Chi tiết liên hệ</h4>
		<h5>
			856/17/08 Tôn Đức Thắng<br/>
			Liên Chiểu, Tp. Đà Nẵng<br/><br/>
			 
			shopmimi@gmail.com<br/>
			﻿Tel 123-456-6780<br/>
			Fax 123-456-5679<br/>
			web:wwwshophoamimi.vn.com
		</h5>
		</div>
		</div>
		</div>
		
		<div class="span4">
		<h4>Liên hệ</h4>
		<%
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String website = request.getParameter("website");
		String message = request.getParameter("message");
		//User userlogin =(User) session.getAttribute("accLogin");
		if(userLogin != null){
			name = userLogin.getFullname();
			email = userLogin.getEmail();
		}
		String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Gửi liên hệ thành công!</span>");
    	}
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Gửi liên hệ thất bại!</span>");
    	}
		%>
		<form action="" method="post" class="form-horizontal" id="formmm" >
        <fieldset>
          <div class="control-group">
           <label for="name">Họ tên</label>
              <input type="text" id="name" name="name" value="<% if(name != null) out.print(name); %>" placeholder="name" class="input-xlarge" required="required"/>
           
          </div>
		   <div class="control-group">
           <label for="email">Địa chỉ Email</label>
              <input type="text" id="email" name="email" value="<% if(email != null) out.print(email); %>" placeholder="email" class="input-xlarge" required="required" email="email"/>
           
          </div>
		   <div class="control-group">
           <label for="website">Website</label>
              <input type="text" id="website" name="website" value="<% if(website != null) out.print(website); %>" placeholder="website" class="input-xlarge" required="required" url="url"/>
          
          </div>
          <div class="control-group">
              <textarea rows="3" id="textarea" name="message"  class="input-xlarge"><% if(message != null) out.print(message); %></textarea>
           
          </div>

            <button class="shopBtn" type="submit">Gửi</button>

        </fieldset>
      </form>
		</div>
	</div>

	
</div>
  <script>
	$().ready(function(){
		// validate the form when it is submit
		var validator =$("#formmm").validate({
			// hiển thị ra thông báo
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id")+ "']").append(error);
			},
			errorElement: "span",
			messages: {
				name:{
					required: "(Tên liên hệ không được trống)",
				},
				email:{
					required: "(Email không được trống)",
					email: "(Nhập email đúng định dạng ***@***.com)",
				},
				website:{
					required: "(website không được trống)",
					url: "(Nhập địa chỉ facebook đúng định dạng http://***.com)",
				},
			}
		});
	});
</script>
<script>
    document.getElementById("contact").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
