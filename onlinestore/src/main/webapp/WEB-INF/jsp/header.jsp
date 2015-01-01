<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header_content">
      	<div class="search_box">
          	<div class="search_select">
              	<span class="index_select">Tất cả danh mục</span>
              </div>
              <div class="search_keyword">
              	<input id="keyword" placeholder="Nhập tên sản phẩm cần tìm kiếm" />
              </div>
              <div class="search_button">
              	<input id="search_submit" type="submit" value="Tim"/>
              	
            </div>
              <div class="clear_left"></div>
       </div>
          <div class="extend_block">
          	<div id="mycart" class="cart_box">
              	<a href="#">Giỏ hàng (<span class="order_cart">0</span>)</a>
              </div>
              <div class="info_user">
              	<%
              		//chưa sử dụng synchronized ở đây
              		/*String os_username = null;
              		synchronized(session){
              			os_username=session.getAttribute("os_username").toString();
              		}*/
              		if(session.getAttribute("os_username") != null)
              		{%>
              			<div class="os_username">
              				<span><%=session.getAttribute("os_username") %></span>
              			</div>
              			<div class="logout">
              				<a href="logout.html">Đăng xuất</a>
              			</div>
              		<%}else
              		{%>
              			<div class="login">
		              		<a href="#">Login</a>
		              	</div>
		              	<div class="register">
		              		<a href="#">Register</a>
		              	</div>
              		<%}
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
                  <li><a href="#" class="menu_item">BỘ SƯU TẬP</a>
                </li>
              <li>
                      <a href="#" class="menu_item">KHUYẾN MÃI</a>
                  </li>
              <li>
                      <a href="#" class="menu_item">HOT TRONG TUẦN</a>
                  </li>
              <li>
                      <a href="#" class="menu_item">SẢN PHẨM SHOP VIP</a>
                  </li>
            </ul>
            <div class="clear_left"></div>
      </div>
<div id="form_login" class="reveal-modallogin">
	<h4>Đăng Nhập</h4>
	<form action="" class="form_login" method="post" modelAttribute="OsUser" id="form_login_content">
		<div>
			<span id="login_message"></span>
		</div>
		<span>Tên đăng nhập</span>
		<input name="username" type="text" id="login_user_name" title="Name" >
		<span>Mật khẩu</span>
		<input name="password" type="password" id="login_user_password" title="Password">
		<input type="checkbox" id="login_save" name="login_save">
		<span>Ghi nhớ mật khẩu</span>
		<input type="button" id="login_submit" value="Đăng nhập">
	</form>
	
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="form_register" class="reveal-modallogin">
	<h4>Register</h4>
	<form action="" id="register" method="post" class="form_register" modelAttribute="OsUser">
		
		<div class="register_info">
			<span>User name</span>
			<input name="username" type="text" id="register_user_name" title="Name" >
		</div>
		
		<div class="register_info">
			<span>Password</span>
			<input name="password" type="password" id="register_user_password" title="Password">
		</div>
		
		<div class="register_info">
			<span>Full name</span>
			<input name="fullName" type="text" id="register_full_name" title="Full name">
		</div>
		<div class="register_info">
			<span>Email Address</span>
			<input name="email" type="text" id="register_email" title="Email">
		</div>
		<div class="register_info">
			<span>Address</span>
			<input name="address" type="text" id="register_address" title="Address">
		</div>
		
		<div class="register_info">
			<span>Phone number</span>
			<input name="phone" type="text" id="register_phone_number" title="Phone">
		</div>
		
		<input type="button" id="register_submit" value="Đăng kí">		
	</form>
	
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
