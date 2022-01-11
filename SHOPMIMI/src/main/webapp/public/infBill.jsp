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
		<li class="active">Đăng ký thông tin thanh toán</li>
    </ul>
    <%
    @SuppressWarnings("unchecked")
	// ArrayList<ProductCart> listHoa =(ArrayList<ProductCart>) session.getAttribute("listHoa");
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
    if("1".equals(msg)){
		out.print("<span style = \"background: yellow; color: green; font-weight: bold; padding: 5px;\">Đăng ký thành công!Mời bạn Đăng nhập!</span>");
	}
    Locale locale = new Locale("vi", "VN");
    NumberFormat format = NumberFormat.getCurrencyInstance(locale);
    %>
	<h3> Thông tin thanh toán</h3>	
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			<h5>THÔNG TIN NGƯỜI MUA</h5><br/>
			<p style = " color: green; font-weight: bold;">Mời bạn nhập đúng thông tin phần bên dưới.</p>
			<form action="" method="post" id="billOrder">
			  <div class="control-group">
				<label class="control-label" for="fullname"><strong>Họ tên</strong><sup>*</sup></label>
				<div class="controls">
				  <input class="span3"  type="text" id="fullname"  name="fullname" value="<% if(fullname !=null) out.print(fullname); %>" placeholder="họ tên" required="required">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="email"><strong>Địa chỉ E-mail</strong><sup>*</sup></label>
				<div class="controls">
				  <input class="span3"  type="text" id="email"  name="email" value="<% if(email !=null) out.print(email); %>"  placeholder="Email" required="required" email="email">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="phone"><strong>Số điện thoại</strong><sup>*</sup></label>
				<div class="controls">
				  <input class="span3"  type="text" id="phone"  name="phone" value="<% if(phone !=null) out.print(phone); %>" placeholder="phone" required="required" number="number" minlength= "9"  maxlength ="15">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="address"><strong>Địa chỉ </strong><sup>*</sup></label>
				<div class="controls">
				  <textarea rows="3" id="address" name="address" class="input-xlarge" required="required" minlength= "30"><% if(address !=null) out.print(address); %></textarea>
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="note"><strong>Ghi chú </strong><sup></sup></label>
				<div class="controls">
				  <textarea rows="5" id="note" name="note"  class="input-xlarge"><% if(note !=null) out.print(note); %></textarea>
				</div>
			  </div>
			  <div class="controls">
			  <%if(listHoa != null && listHoa.size() > 0){ %>
			  <button type="submit" style="background: red; font-weight: bold; margin-left: 80px; "  class="btn block">Thanh Toán</button>
			 <%}else{ %>
			 	<a href="javascript: void(0)" style="background: red;font-weight: bold; margin-left: 80px; "  class="btn block">Giỏ hàng trống!</a>
			 <%} %>
			  </div>
			</form>
		</div>
		</div>
		<div class="span1"> &nbsp;</div>
		<div class="span5">
			<div class="well">
			<h5>GIỎ HÀNG CỦA BẠN</h5><br />
	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Sản phẩm</th>
                  <th>Đơn giá</th>
                  <th>Số lượng </th>
                  <th>Giá</th>
				</tr>
              </thead>
              <tbody>
              <%
              int j=0;
              float tongTien =0.0f;
              float sale = 0.0f;
              double sum = 0.0d;
              float ship = 30000.0f;
             int soluong = 1;
              if(listHoa != null && listHoa.size() > 0){
            	 
              for(ProductCart item : listHoa){
            	  j++;
            	  tongTien += item.getFlower().getPrice() * item.getQuanty();
              %>
                <tr>
                  <td><img width="100" src="<%=request.getContextPath() %>/fileFlowers/<%=item.getFlower().getPicture() %>" alt=""></td>
                  <td><%=format.format((long)item.getFlower().getPrice()) %> </td>
                  <td>
                  <%if(listHoa ==  null){ %>
					<input class="span1" name="soluong" style="max-width:34px" placeholder="1" id="soluong" size="16" type="text" value="1" disabled="disabled">
				 	<%}else{ %>
				 	<input class="span1" name="soluong" style="max-width:34px" placeholder="1" id="soluong" size="16" type="text" value="<%=item.getQuanty() %>" disabled="disabled">
				 	<%} %>
				</td>
				
                  <td><%=format.format((long)item.getFlower().getPrice() * item.getQuanty()) %> </td>
                </tr>
                <%}%>
                
                <tr>
                  <td colspan="3" class="alignR">Tạm tính:	</td>
                  <td> <%=format.format((double)tongTien) %> </td>
                </tr>
                <%
                if(tongTien >= 1000000){
                	sale = 20000;
                %>
                <tr>
               <td colspan="3" class="alignR">giảm giá:	</td>
				 <td> -<%=format.format((double)sale) %> </td>
                </tr>
                <tr>
                  <td colspan="3" class="alignR">Phí vận chuyển:	</td>
                  <td> <%=format.format((float)ship) %> </td>
                </tr>
				 <tr>
                  <td colspan="3" class="alignR">Tổng tiền:	</td>
                  <td class="label label-primary"> <%=format.format((double)tongTien - sale+ship) %> </td>
                </tr>
                <% }else{
                	sale = 0;
                %>
                <tr>
               <td colspan="3" class="alignR">giảm giá:	</td>
				 <td> <%=format.format((double)sale) %> </td>
                </tr>
                <tr>
                  <td colspan="3" class="alignR">Phí vận chuyển:	</td>
                  <td> <%=format.format((float)ship) %> </td>
                </tr>
                <tr>
                  <td colspan="3" class="alignR">Tổng tiền:	</td>
                  <td class="label label-primary"> <%=format.format((double)tongTien - sale+ ship) %> </td>
                </tr>
                <%} %>
                <%
                session.setAttribute("j", j);
                sum += (double) (tongTien -sale);
                session.setAttribute("soluong", soluong);
                session.setAttribute("sum", sum);
                %>
				</tbody>
				
            </table><br/>

            <table class="table table-bordered">
            <%}else{ %>
                <tr><td colspan="4" align="center" style="  background: yellow; color: red; font-weight: bold;" >Chưa có sản phẩm nào!</td></tr>
                <%} %>
			<tbody>
				 
				
			</tbody>
				</table>

</div>

</div>
</div>
<a href="<%=request.getContextPath() %>/carts" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Quay lại </a>
<hr class="soften"/>
	</div>	
</div>

</div>
<script>
	$().ready(function(){
		// validate the form when it is submit
		var validator =$("#billOrder").validate({
			// hiển thị ra thông báo
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id")+ "']").append(error);
			},
			errorElement: "span",
			messages: {
				fullname:{
					required: "(Họ tên không được để trống)",
				},
				email:{
					required: "(Email không được trống)",
					email: "(Nhập email đúng định dạng ***@***.com)",
				},
				phone:{
					required: "(số điện thoại không được trống)",
					number: "(số điện thoại là số)",
					minlength: "(Số máy quý khách vừa nhập là số không có thực)",
					maxlength: "(Đây không phải là số điện thoại)",
				},
				address:{
					required: "(Địa chỉ  không được để trống)",
					minlength: "(Địa chỉ ngắn vậy, chém gió ah?)"
				},
			}
		});
	});
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
  </body>
</html>
