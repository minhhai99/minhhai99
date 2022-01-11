<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<!-- 
Body Section 
-->
<%
	User users =(User) session.getAttribute("accLogin");
	
        String msg = request.getParameter("msg");
        String err = request.getParameter("err");
        if("1".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Thêm người dùng thành công!</span>");
    	}
        if("2".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Sửa người dùng thành công!</span>");
    	}
        if("3".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Xoá người dùng thành công!</span>");
    	}
        if("4".equals(msg)){
    		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Cập nhật tài khoản thành công!</span>");
    	}
        if("1".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">ID không tồn tại!</span>");
    	}
        if("2".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Có lỗi xảy ra!</span>");
    	}
        if("3".equals(err)){
    		out.print("<span style = \"background: yellow; color: red; font-weight: bold; padding: 5px;\">Không có quyền truy cập Sửa!</span>");
    	}
        %>
	<hr class="soften">
	<div class="tab-pane fade active in" id="home">
			  <h4><img alt="iconcat" src="<%=request.getContextPath() %>/templates/public/assets/img/find_user.png"> Hồ sơ của tôi</h4>
                <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
                <table class="table table-striped">
				<tbody>
				<%
				if(users != null){
				%>
				<tr class="techSpecRow"><td class="techSpecTD1">Username:</td><td class="techSpecTD2"><%=users.getName() %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Họ tên:</td><td class="techSpecTD2"><%=users.getFullname() %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Email:</td><td class="techSpecTD2"><%=users.getEmail() %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Địa chỉ(hoặc sdt):</td><td class="techSpecTD2"><%=users.getAddress() %></td></tr>
				</tbody>
				</table>
				<a href="<%=request.getContextPath() %>/acc/edit?id=<%=users.getId() %>" title="Cập nhật tài khoản" class="btn btn-primary"><i class="fa fa-edit "></i> Cập nhật</a>
				<%}else{ %>
				<p style = "background: yellow; color: red; font-weight: bold; padding: 5px;" align="center">Bạn chưa đăng nhập!</p>
				<br />
				<%} %>
			</div>
<script>
	document.getElementById("account").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>