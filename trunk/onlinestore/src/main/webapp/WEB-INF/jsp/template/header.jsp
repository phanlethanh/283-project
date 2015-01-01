<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function searchOnClick() {
		var keyword = document.getElementById("keyword").value;
		var categoryId = document.getElementById("category_select").value;
		window.location.href = 'searchProduct.html?category_id=' 
				+ categoryId + '&keyword=' + keyword;
	}
</script>
<div class="header_content">
	<div id="header">
	    <div id="logo"> <a href="#"><img src="image/image_template/logo.png" alt="" border="0" width="237" height="140" /></a> </div>
	    <div class="oferte_content">
	      <div class="top_divider"><img src="image/image_template/header_divider.png" alt="" width="1" height="164" /></div>
	      <div class="oferta">
	        <div class="oferta_content"> <img src="image/image_template/laptop.png" width="94" height="92" alt="" border="0" class="oferta_img" />
	          <div class="oferta_details">
	            <div class="oferta_title">Samsung GX 2004 LM</div>
	            <div class="oferta_text"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco </div>
	            <a href="details.html" class="details">details</a> </div>
	        </div>
	        <div class="oferta_pagination"> <span class="current">1</span> <a href="#">2</a> <a href="">3</a> <a href="#">4</a> <a href="#">5</a> </div>
	      </div>
	      <div class="top_divider"><img src="image/image_template/header_divider.png" alt="" width="1" height="164" /></div>
	    </div>
	    <!-- end of oferte_content-->
  	</div>
	
	<div id="main_content">
		<div id="menu_tab">
	      <div class="left_menu_corner"></div>
	      <ul class="menu">
	        <li><a href="homes.html" class="nav1"> Trang chủ</a></li>
	        <li class="divider"></li>
	        <li><a href="newProducts.html" class="nav2">Sản phẩm MỚI</a></li>
	        <li class="divider"></li>
	        <li><a href="hotProducts.html" class="nav3">Đang HOT</a></li>
	        <li class="divider"></li>
	       
	        
	        <li><a href="viewOrderList.html" class="nav5">Đơn hàng</a></li>
	        <li class="divider"></li>
	        <li><a href="contact.html" class="nav6">Liên hệ</a></li>
	        <li class="divider"></li>
	         <%
				if (session.getAttribute("os_username") != null) {
			%>
			<li><a href="userDetail.html" class="nav4"><%=session.getAttribute("os_username")%></a></li>
	        <li class="divider"></li>
	        <li><a href="logout.html" class="nav4">Đăng xuất</a></li>
	        <li class="divider"></li>
			<%
				} else {
			%>
			<li><a href="#" class="nav4 login">Đăng nhập</a></li>
	        <li class="divider"></li>
	        <li><a href="#" class="nav4 register">Đăng kí</a></li>
	        <li class="divider"></li>
			<%
				}
			%>
	      </ul>
	      <div class="right_menu_corner"></div>
	    </div>
	</div>
	
	
<div id="form_login" class="reveal-modallogin">
	<h4>Đăng Nhập</h4>
	<form action="" class="form_login" method="post"
		modelAttribute="OsUser" id="form_login_content">
		<div>
			<span id="login_message"></span>
		</div>
		<span>Tên đăng nhập</span> <input name="username" type="text"
			id="login_user_name" title="Name" maxlength="15" required> 
			<span>Mật khẩu</span> <input
			name="password" type="password" id="login_user_password"
			title="Password" maxlength="15" required> 
			<input type="checkbox" id="login_save" name="login_save"> 
			<span>Ghi nhớ đăng nhập</span> <input
			type="button" id="login_submit" value="Đăng nhập">
	</form>

	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="form_register" class="reveal-modallogin">
	<h4>Đăng ký</h4>
	<form action="" id="register" method="post" class="form_register"
		modelAttribute="OsUser">

		<div class="register_info">
			<span>Tên tài khoản</span> <input name="username" type="text"
				id="register_user_name" title="Name" maxlength="15" required>
		</div>

		<div class="register_info">
			<span>Mật khẩu</span> <input name="password" type="password"
				id="register_user_password" title="Password" maxlength="15" required>
		</div>

		<div class="register_info">
			<span>Họ tên</span> <input name="fullName" type="text"
				id="register_full_name" title="Full name" maxlength="31" required>
		</div>
		<div class="register_info">
			<span>Email</span> <input name="email" type="email"
				id="register_email" title="Email" maxlength="63" required>
		</div>
		<div class="register_info">
			<span>Địa chỉ</span> <input name="address" type="text"
				id="register_address" title="Address" maxlength="255" required>
		</div>

		<div class="register_info">
			<span>Điện thoại</span> <input name="phone" type="text" pattern="[0-9]"
				id="register_phone_number" title="Phone" maxlength="15" required>
		</div>

		<input type="button" id="register_submit" value="Đăng kí">
	</form>

	<a class="close-reveal-modal close-reveal-all"></a>
</div>
