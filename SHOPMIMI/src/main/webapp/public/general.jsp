<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Meaning"%>
<%@page import="model.bean.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/leftbar.jsp" %>

    <ul class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/index"><span class="icon-home"></span> Home</a> <span class="divider">/</span></li>
		<li><a href="<%=request.getContextPath() %>/meaning">list ý nghĩa</a> <span class="divider">/</span></li>
		<li class="active">chi tiết</li>
    </ul>
<div class="well well-small">
<%
	Meaning item = (Meaning) request.getAttribute("meaning")	;
 	if(item != null){
%>
	<h2> <img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon1.jpg"> <%=item.getName() %></h2>	
		<ul class="thumbnails">
			<li class="span3">
			  <div class="thumbnail">
				<img src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="">
				<div class="caption cntr">
					<p><%=item.getName() %> </p>
				</div>
			  </div>
			</li>
			</ul>
	<h3><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon4.jpg">Ý nghĩa</h3>
	<%=item.getPreview() %> 
	
	<h3><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon4.jpg">Chi tiết</h3>
	
	<p><%=item.getDetail() %></p>
	<%} %>
	<hr class="soft"/>
	<h2><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon1.jpg"> Các màu sắc</h2>
		<div class="row-fluid">
		  <ul class="thumbnails">
		  <%
		  @SuppressWarnings("unchecked")
		  	ArrayList<Color> color = (ArrayList<Color>) request.getAttribute("color");
		  if(color != null && color.size() > 0){
			  for(Color items : color){
		  %>
			<li class="span4">
			  <div class="thumbnail">
				<img src="<%=request.getContextPath() %>/files/<%=items.getPicture() %>" alt="<%=items.getName() %>">
				<div class="caption cntr">
					<p> <%=items.getName() %> </p>
				</div>
			  </div>
			</li>
			<%}}else{ %>
			Chưa có hình ảnh nào!
			<%} %>
			
			</ul>
			<hr class="soft"/>
			<ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Ý nghĩa số lượng hoa</a></li>
              <li class=""><a href="#profile" data-toggle="tab">Các loại hoa khác</a></li>
              
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
			<h3><img alt="icon" src="<%=request.getContextPath() %>/templates/public/assets/img/icon4.jpg"> Ý nghĩa số lượng hoa</h3>
	<p>#1 bông – thường được tặng cho những người bạn yêu, một bông hồng duy nhất biểu thị “tình yêu từ cái nhìn đầu tiên”.</p>

 <p>#3 bông – ‘Anh yêu em’.</p>
	<p>#5 bông– một cách tuyệt vời biểu thị tình yêu của bạn dành cho một người đặc biệt. Nếu bạn muốn cho đối tác hoặc bạn bè thấy bạn chăm sóc họ nhiều như thế nào, năm bông hồng là một lựa chọn lý tưởng.</p>

 <p>#7 bông– khi xem xét ý nghĩa của hoa hồng, đại lượng này biểu thị sự mê đắm.</p>

  <p>#8 bông– nếu một người bạn hoặc thành viên gia đình đang trải qua một thời gian khó khăn, tám hoa hồng là con số hoàn hảo để tặng họ vì nó thể hiện sự ủng hộ.</p>

 <p> #9 bông – biểu tượng của tình yêu vĩnh cửu. Bạn thường sẽ tặng số hoa hồng chính xác này cho những người bạn muốn dành phần còn lại của cuộc đời.</p>

 <p> #10 bông– một cách đơn giản nhưng mạnh mẽ để nói với một người đặc biệt ‘họ hoàn hảo’.

 <p>#11 bông– “bạn là người quý giá của tôi”.</p>

 <p>#12 bông– tặng người mà bạn yêu thích với 12 bông hồng duy nhất là một cách đơn giản để yêu cầu họ là của bạn.</p>

 <p>#13 bông– ý nghĩa của hoa hồng khi được trình bày trong số 13 có thể tượng trưng cho tình bạn vĩnh cửu hoặc một người ngưỡng mộ bí mật.</p>

 <p>#14 bông– nếu bạn tự hào về ai đó, 14 hoa hồng là con số để lựa chọn.</p>

<p> #15 bông– nếu bạn đã làm điều gì đó để làm phiền ai đó và mong muốn được tha thứ, hãy chọn 15 bông hồng.</p>

 <p>#16 bông– chúc may mắn</p>

 <p>#17 bông– đây là số hoa hồng bạn sẽ tặng vợ, vào ngày sinh nhật của cô ấy hoặc một dịp đặc biệt khác.</p>

<p>#18 bông– nếu bạn muốn nói với một người thân yêu ‘hãy luôn trẻ trung và xinh đẹp’, hãy tặng họ 18 bông hồng, một biểu tượng của sự chân thành và chân thật.</p>

 <p>#19 bông– số lượng hoa hồng để tặng người mà bạn dự định chờ đợi.</p>

 <p>#20 bông– tượng trưng cho sự chân thành và niềm tin.</p>

 <p>#21 bông– thể hiện cam kết của</p>

 <p>#22 bông– số lượng này tự hào có hai ý nghĩa – sự kết hợp và may mắn.</p>

 <p>#24 bông– hãy cho một người đặc biệt biết rằng họ luôn trong tâm trí bạn với một món quà gồm 24 cành hoa hồng duy nhất.</p>

 <p>#25 bông– chúc ai đó hạnh phúc trên thế giới.</p>

 <p>#27 bông– hãy nói với vợ bạn rằng bạn yêu cô ấy nhiều như thế nào với 27 bông hồng.</p>

 <p>#30 bông– số lượng này cho thấy niềm tin và sự chung thủy.</p>

 <p>#33 bông– biểu thị tình cảm.</p>

 <p>#36 bông– một cách để nhắc nhở đối tác của bạn về tất cả những khoảnh khắc lãng mạn mà bạn đã chia sẻ cùng nhau.</p>

 <p>#37 bông– nếu bạn yêu một ai đó từ tận đáy lòng, hãy nói cho họ biết bao nhiêu với món quà của 37 bông hồng.</p>

 <p>#40 bông– nếu bạn giữ một tình yêu đích thực cho một người đặc biệt, đây là con số để lựa chọn.</p>

 <p>#44 bông– khi bạn muốn cam kết một tình yêu không thay đổi và không đổi.</p>

 <p>#47 bông– con số này biểu thị ‘bạn là duy nhất của tôi’.</p>

 <p>#48 bông– đại diện của một tình yêu không thay đổi.</p>

 <p>#50 bông– tình yêu vô điều kiện.</p>

 <p>#51 bông– nếu bạn chỉ có một người trong tâm trí, hãy chọn một bó hoa hồng gồm 51 bông hồng.</p>

 <p>#56 bông– con số này trong một bó hoa chỉ đơn giản là “tình yêu”.</p>

 <p>#66 bông–số lượng này gợi ý ‘tình yêu của tôi dành cho bạn sẽ không bao giờ thay đổi’.</p>

 <p>#77 bông– số hoa hồng này biểu thị cho ‘đức tin’ và bạn tin rằng người bạn đang tặng là người bạn tâm giao của bạn.</p>

 <p>#88 bông– nếu bạn nợ ai đó một lời xin lỗi khá lớn, 88 là số lượng thân cây để lựa chọn.</p>

 <p>#99 bông– muốn cho một người đặc biệt biết bạn sẽ yêu bạn cho đến ngày bạn chết</p>

<p> #100 bông– một cử chỉ của sự tận tụy.</p>

 <p>#101 bông: Yêu em vô cùng</p>

<p> #109 bông: Cầu hôn</p> 

<p> #365 bông: Ngày nào anh cũng nghĩ đến em </p>

 <p>#999 bông: Mãi mãi đắm say </p>

<p>#1001 bông: Mãi mãi bên nhau!</p>
			

</div>
<div class="tab-pane fade" id="profile">
<%
			@SuppressWarnings("unchecked")
			ArrayList<Meaning> means = (ArrayList<Meaning>) request.getAttribute("means");
			if(means != null && means.size() > 0){
				for(Meaning itemRL : means){
			%>
			<div class="row-fluid">	  
			<div class="span2">
				<a href="<%=request.getContextPath() %>/meaning/detail?id=<%=itemRL.getId() %>"><img src="<%=request.getContextPath() %>/files/<%=itemRL.getPicture() %>" alt="Ảnh"></a>
			</div>
			<div class="span6">
				<a href="<%=request.getContextPath() %>/meaning/detail?id=<%=itemRL.getId() %>"><h5><%=itemRL.getName() %> </h5></a>
				<p>
				<%=itemRL.getPreview() %>
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<div class="btn-group">
			  <a href="<%=request.getContextPath() %>/meaning/detail?id=<%=itemRL.getId() %>" class="shopBtn">VIEW</a>
			 </div>
				</form>
			</div>
		</div>
		<hr class="soft">
			<%}} %>
</div>
</div>
<br />
<br />
</div>
</div>
</div>
</div>
<div></div>
<script>
    document.getElementById("meaning").classList.add('active-menu');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>