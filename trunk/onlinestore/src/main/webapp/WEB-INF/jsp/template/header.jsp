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
	        <div class="oferta_pagination"> <span class="current">1</span> <a href="http://all-free-download.com/free-website-templates/">2</a> <a href="http://all-free-download.com/free-website-templates/">3</a> <a href="http://all-free-download.com/free-website-templates/">4</a> <a href="http://all-free-download.com/free-website-templates/">5</a> </div>
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
	        <li><a href="#" class="nav2">Sản phẩm</a></li>
	        <li class="divider"></li>
	        <li><a href="#" class="nav3">Đặc biệt</a></li>
	        <li class="divider"></li>
	       
	        
	        <li><a href="#" class="nav5">Vận chuyển</a></li>
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
	        <li class="currencies">Đơn vị
	          <select>
	            <option>VND</option>
	            <option>Đô la Mỹ</option>
	          </select>
	        </li>
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
