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

<div class="product_detail">
	<form action="" method="get">
		<h2>
			<c:out value="${product['name']}" />
		</h2>
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
</div>