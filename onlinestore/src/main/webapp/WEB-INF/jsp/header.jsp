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
              		if(session.getAttribute("os_username") != null)
              		{%>
              			<div class="os_username">
              				<span><%=session.getAttribute("os_username") %></span>
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
              
              <ul class="vt_list_item">
                  <li class="vt_item">
                      <p><span>Thời Trang Nữ</span><a class="vt_item_detail" href="#" ><img src="image/arrow-right.png" /></a></p>
                  </li> 
                  <li class="vt_item">
                      <p><span>Thời Trang Nam</span><a class="vt_item_detail" href="#" ><img src="image/arrow-right.png" /></a></p>
                  </li>
                  <li class="vt_item">
                      <p><span>Điện Thoại - Phu Kiện</span><a class="vt_item_detail" href="#" ><img src="image/arrow-right.png" /></a></p>
                  </li>
                  <li class="vt_item">
                      <p><span>Máy Tính</span><a class="vt_item_detail" href="#" ><img src="image/arrow-right.png" /></a></p>
                  </li>
              </ul>
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
	<span>Tên đăng nhập</span>
	<input name="User Name" type="text" id="login_user_name" title="Name" >
	<span>Mật khẩu</span>
	<input name="Pass Word" type="password" id="login_user_password" title="Password">
	<input type="button" id="login_submit" value="Đăng nhập">
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="form_register_abc" class="reveal-modallogin">
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
