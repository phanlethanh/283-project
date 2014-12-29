<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.product_detail {
	background-color: white;
	padding-left: 50px;
	padding-bottom: 50px;
	padding-right: 50px;
	border: 1px solid;
}
</style>
<script type="text/javascript">
	function addToCartOnClick() {
		if (confirm("Thêm sản phẩm này vào giỏ hàng?") == true) {
			var productId = document.getElementById("product_id").value;
			window.location.href = 'addToCart.html?product_id=' + productId;
		}
	}
</script>

<!-- Begin Facebook plugin javascript -->
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<!-- End Facebook plugin javascript -->

<!-- Begin Google+ plugin javascript -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- End Google+ plugin javascript -->

<!-- Begin Twitter plugin javascript -->
<script type="text/javascript">
	window.twttr = (function(d, s, id) {
		var t, js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://platform.twitter.com/widgets.js";
		fjs.parentNode.insertBefore(js, fjs);
		return window.twttr || (t = {
			_e : [],
			ready : function(f) {
				t._e.push(f)
			}
		})
	}(document, "script", "twitter-wjs"));
</script>
<!-- End Twitter plugin javascript -->

<div class="product_detail">
	<form action="" method="get">
		<h2>
			<c:out value="${product['name']}" />
		</h2>
		<!-- Begin Facebook like plugin -->
		<div class="fb-like"
			data-href="http://localhost:8080/onlinestore/productDetail.html?product_id=${product['id']}"
			data-layout="button_count" data-action="like" data-show-faces="true"
			data-share="true"></div>
		<!-- End Facebook like plugin -->

		<!-- Begin Tweet plugin -->
		<a class="twitter-share-button"
			href="https://twitter.com/share"> Tweet </a>
		<!-- End Tweet plugin -->

		<!-- Begin Google+ add plugin -->
		<!-- <div class="g-plusone" data-annotation="inline" data-width="200"></div> -->
		<div class="g-plus" data-action="share"
			data-href="http://localhost:8080/onlinestore/productDetail.html?product_id=${product['id']}"></div>
		<!-- End Google+ add plugin -->
		<br>
		<table>
			<tr>
				<td><img src="${product['icon']}" width="150" height="150"></td>
				<td><input type="button" name="" value="Mua ngay"><input
					type="button" name="add_to_cart" value="Thêm vào giỏ hàng"
					onclick="addToCartOnClick()"></td>
			</tr>
			<tr>
				<th align="left">Trạng thái:</th>
				<td>${product['status']}</td>
			</tr>
			<tr>
				<th align="left">Giá bán:</th>
				<td><c:out value="${product['price']}" /> VNĐ</td>
			</tr>
			<tr>
				<th align="left">Khuyến mãi:</th>
				<td>${product['promotion']}</td>
			</tr>
		</table>
		<input type="hidden" id="product_id" value="${product['id']}">
	</form>
	<br />
	<h3>Thông tin chi tiết</h3>
	<table>
		<tr>
			<th align="left">Nhà sản xuất:</th>
			<td>${product['producer']}</td>
		</tr>
		<tr>
			<th align="left">Thông tin:</th>
			<td>${product['producerDescription']}</td>
		</tr>
		<tr>
			<th align="left">Mô tả sản phẩm:</th>
			<td>${product['description']}</td>
		</tr>
	</table>
	<br />
	<!-- Gallery -->
	<c:forEach var="image" items="${product['images']}">
		<div>
			<img src="${image['imageName']}" width="900">
		</div>
		<p>${image['imageDescription']}</p>
		<br />
	</c:forEach>
	<br>
	<!-- Begin Facebook comment plugin -->
	<div class="fb-comments"
		data-href="https://www.facebook.com/onlinestore.fanpage"
		data-numposts="5" data-colorscheme="light"></div>
	<!-- End Facebook comment plugin -->
</div>