<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

</head>
<style>
.product_box {
	background-color: white;
	height: 230px;
	width: 230px;
	padding: 10px;
	border: 1px solid gray;
	float: left;
}
</style>
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
	String cartPrice = "0";
	cartNumber = session.getAttribute("cartNumber").toString();
	cartPrice = session.getAttribute("cartPrice").toString();
%>
<div class="center_content">
      <div class="center_title_bar">Danh sách sản phẩm</div>
      <div class="content_home">
	      <c:forEach var="product" items="${productMapList}">
			<div class="prod_box"  product_id="${product['id']}">
	        <div class="top_prod_box"></div>
	        <div class="center_prod_box">
	          <div class="product_title"><a href="productDetail.html?product_id=${product['id']}">${product['name']}</a></div>
	          <div class="product_img"><a href="productDetail.html?product_id=${product['id']}"><img src="${product['icon']}" alt="" border="0" /></a></div>
	          <input name="product_id" type="hidden" value="${product['id']}"/>
	          <div class="prod_price">
	          	
	          	<c:if test="${product['price_seft'] != '0'}">
	          		<span class="reduce">${product['price']}</span><span class="price"><c:out value="${product['price_seft']}"></c:out></span>
	          	</c:if>
	          	<c:if test="${product['price_seft'] == '0'}">
	          		 <span class="price"><c:out value="${product['price']}"></c:out></span>
	          	</c:if>
	          	 <span class="price">${product['status']}</span>
	          </div>
	        </div>
	        <div class="bottom_prod_box"></div>
	        <div class="prod_details_tab"> <a href="addToCart.html?product_id=${product['id']}" title="header=[Add to cart] body=[&nbsp;] fade=[on]">
	        <img src="image/image_template/cart.gif" alt="" border="0" class="left_bt" /></a>  
	        <a href="productDetail.html?product_id=${product['id']}" class="prod_details">Chi tiết</a> </div>
	      </div>
		</c:forEach>
      </div>
     
    <div class="home_paging">
	</div>  
    <div>
	<input id="home_total_rows" type="hidden">
	<input id="home_page_number_active" type="hidden">
	<input id="home_page_number_last" type="hidden">
	</div>  
    <!-- end of center content -->
    
    <!-- end of right content -->
  </div>
  <div class="right_content">
      <div class="shopping_cart">
        <div class="cart_title"><a href="viewCart.html" id=cart_detail>Giỏ hàng </a></div>
        <div class="cart_details "><span> Số lượng: </span><span class="cart_number"><%=cartNumber%></span><br />
          <span class="border_cart"></span> Tổng tiền: <span class="price"><%=cartPrice%></span> đ</div>
        <div class="cart_icon"><a href="#" title="header=[Checkout] body=[&nbsp;] fade=[on]"><img src="image/image_template/shoppingcart.png" alt="" width="48" height="48" border="0" /></a></div>
       
      </div>
      
      <div class="title_box">Mới nhất</div>
      <div class="border_box">
        <div class="product_title"><a href="productDetail.html?product_id=1">Iphone 6 Plus 128GB</a></div>
        <div class="product_img"><a href="productDetail.html?product_id=1"><img src="image/product_icon/iphone-6-plus.jpg" alt="" border="0" /></a></div>
        <div class="prod_price"><span class="reduce"></span> <span class="price">25,590,000</span> đ</div>
      </div>
      <div class="title_box">Gợi ý</div>
      <ul class="left_menu">
        <li class="odd"><a href="newProducts.html">Sản phẩm mới</a></li>
        <li class="even"><a href="hotProducts.html">Sản phẩm đang HOT</a></li>
        <li class="odd"><a href="waitingProducts.html">Sản phẩm sắp ra mắt</a></li>
        <li class="even"><a href="promotionProducts.html">Khuyến mãi</a></li>
       
      </ul>
      <div class="banner_adds"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/bann1.jpg" alt="" border="0" /></a> </div>
    </div>


