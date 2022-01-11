<%@page import="model.bean.Order"%>
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
        Order order = (Order) request.getAttribute("order");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String quanty = request.getParameter("quanty");
        String total = request.getParameter("total");
        String note = request.getParameter("note");
        String idUser = request.getParameter("idUser");
        String pag =(String) session.getAttribute("pag");
        String err = request.getParameter("err");
        if(order != null){
        	name = order.getDisplay_name();
        	phone = order.getPhone();
        	email = order.getEmail();
        	address = order.getAddress();
        	quanty = String.valueOf(order.getQuanty());
        	total =String.valueOf(order.getTotal());
        	note = order.getNote();
        	idUser = String.valueOf(order.getIdUser());
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
                                <form action="" role="form" method="post" id="form">
                                    <div class="form-group">
                                        <label for="name">Họ tên </label>
                                        <input type="text" id="name" value="<% if(name != null) out.print(name); %> " name="name" class="form-control" disabled="disabled"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">phone </label>
                                        <input type="text" id="phone" value="<% if(phone != null) out.print(phone); %> " name="phone" class="form-control" disabled="disabled" />
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email </label>
                                        <input type="text" id="email" value="<% if(email != null) out.print(email); %> " name="email" class="form-control" disabled="disabled" />
                                    </div>
                                    <div class="form-group">
                                        <label for="idUser">Tình trạng đơn hàng(1/0)?</label>
                                        <input type="text" id="idUser" value="<% if(idUser != null) out.print(idUser); %> " name="idUser" class="form-control"/>
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
				idUser:{
					required: "(Tình trạng đơn hàng không được để trống)",
				},
			}
		});
	});
</script>
<script>
    document.getElementById("order").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>