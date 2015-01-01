<%@page import="antlr.CppCodeGenerator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>

<script>
	function searchOnClick() {
		var keyword = document.getElementById("keyword").value;
		var categoryId = document.getElementById("category_select").value;
		window.location.href = 'searchProduct.html?category_id=' 
				+ categoryId + '&keyword=' + keyword;
	}
</script>
<% 
	String cartNumber = "0";
	cartNumber = session.getAttribute("cartNumber").toString();
	List<HashMap<String, Object>> categoryMapList 
		= (List<HashMap<String, Object>>) session.getAttribute("categoryMapList");
%>
<div class="header_content">
	<div class="search_box">
		<div class="search_select">
			<span class="index_select"><select id="category_select">
				<!--  <c:forEach var="category" items="${categoryMapList}">
					<c:choose>
						<c:when test="${category['categoryId'] == categorySelected}">
							<option selected="selected" value="${category['categoryId']}">
							${category['categoryName']}</option>
						</c:when>
						<c:otherwise>
							<option value="${category['categoryId']}">
							${category['categoryName']}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach> -->
				 <%
				 String categorySelected;
				 if (null == request.getParameter("category_id")) {
					 categorySelected = "0";
				 } else {
					 categorySelected = request.getParameter("category_id");
				 }
				 int size = categoryMapList.size();
				 for (int i = 0; i < size; i++) {
					 HashMap<String, Object> map = categoryMapList.get(i);
					 String tempId = map.get("categoryId").toString();
					 String tempName = map.get("categoryName").toString();
					 if (categorySelected.compareTo(tempId) == 0) {
					 %>
					 <option selected="selected" value="<%=tempId%>"><%=tempName%></option>
					 <% } else {
						 %>
						 <option value="<%=tempId%>"><%=tempName%></option>
						 <%
					 }
				 }
				 %>
			</select></span>
		</div>
		<div class="search_keyword">
			<input id="keyword" placeholder="Nhập tên sản phẩm cần tìm kiếm"
				value="${keyword}" />
		</div>
		<div class="search_button">
			<input id="search_submit" type="button" value="Tìm"
				onclick="searchOnClick()" />
		</div>
		<div class="clear_left"></div>
	</div>
	<div class="extend_block">
		<div id="mycart" class="cart_box">
			<a href="viewCart.html" id=cart_detail>Giỏ hàng (<span
				class="cart_number"><%=cartNumber%></span>)
			</a>
		</div>
		<div class="info_user">
			<%
				//chưa sử dụng synchronized ở đây
				/*String os_username = null;
				synchronized(session){
					os_username=session.getAttribute("os_username").toString();
				}*/
				if (session.getAttribute("os_username") != null) {
			%>
			<div id="myorder" class="order_box">
				<a href="viewOrderList.html" id=order_list><span>Đơn hàng</span></a>
			</div>
			<div class="os_username">
				<a href="userDetail.html"><span><%=session.getAttribute("os_username")%>
				</span></a>
			</div>
			<div class="logout">
				<a href="logout.html">Đăng xuất</a>
			</div>
			<%
				} else {
			%>
			<div class="login">
				<a href="#">Đăng nhập</a>
			</div>
			<div class="register">
				<a href="#">Đăng ký</a>
			</div>
			<%
				}
			%>

		</div>
		<div class="clear_left"></div>
	</div>
</div>
<div class="header_menu">
	<div class="vertical_menu">
		<div class="vt_title">DANH MỤC SẢN PHẨM</div>
	</div>
	<ul class="menu_top">
		<li><a href="newProducts.html" class="menu_item">SẢN PHẨM MỚI</a></li>
		<li><a href="hotProducts.html" class="menu_item">SẢN PHẨM ĐANG HOT</a></li>
		<li><a href="waitingProducts.html" class="menu_item">SẢN PHẨM SẮP RA MẮT</a></li>
		<li><a href="promotionProducts.html" class="menu_item">KHUYẾN MÃI</a></li>
		<li class="clear_left"></li>
	</ul>
	<div class="clear_left"></div>
</div>
<div id="form_login" class="reveal-modallogin">
	<h4>Đăng Nhập</h4>
	<form action="" class="form_login" method="post"
		modelAttribute="OsUser" id="form_login_content">
		<div>
			<span id="login_message"></span>
		</div>
		<span>Tên đăng nhập</span> <input name="username" type="text"
			id="login_user_name" title="Name"> <span>Mật khẩu</span> <input
			name="password" type="password" id="login_user_password"
			title="Password"> <input type="checkbox" id="login_save"
			name="login_save"> <span>Ghi nhớ đăng nhập</span> <input
			type="button" id="login_submit" value="Đăng nhập">
	</form>

	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="form_register" class="reveal-modallogin">
	<h4>Register</h4>
	<form action="" id="register" method="post" class="form_register"
		modelAttribute="OsUser">

		<div class="register_info">
			<span>User name</span> <input name="username" type="text"
				id="register_user_name" title="Name">
		</div>

		<div class="register_info">
			<span>Password</span> <input name="password" type="password"
				id="register_user_password" title="Password">
		</div>

		<div class="register_info">
			<span>Full name</span> <input name="fullName" type="text"
				id="register_full_name" title="Full name">
		</div>
		<div class="register_info">
			<span>Email Address</span> <input name="email" type="text"
				id="register_email" title="Email">
		</div>
		<div class="register_info">
			<span>Address</span> <input name="address" type="text"
				id="register_address" title="Address">
		</div>

		<div class="register_info">
			<span>Phone number</span> <input name="phone" type="text"
				id="register_phone_number" title="Phone">
		</div>

		<input type="button" id="register_submit" value="Đăng kí">
	</form>

	<a class="close-reveal-modal close-reveal-all"></a>
</div>
