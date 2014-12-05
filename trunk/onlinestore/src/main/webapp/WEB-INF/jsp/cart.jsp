<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.cart {
	background-color: white;
}

.cart_product_list {
	border-bottom: 1px;
	border-top: 1px;
	text-align: right;
}

.cart_product_table {
	width: 900px;
}

.cart_summary {
	text-align: right;
	padding-right: 100px;
}
</style>

<div class="cart">
	<div class="cart_product_list">
		<table class="cart_product_table">
			<tr>
				<td></td>
				<td>Sản phẩm</td>
				<td>Số lượng</td>
				<td>Đơn giá</td>
			</tr>
			<c:forEach var="cp" items="${cpMapList}">
				<tr>
					<td><input type="hidden" name="check_box" value="${cp['id']}"></td>
					<td><a href="productDetail.html?product_id=${cp['productId']}">${cp['productName']}</a></td>
					<td><input type="text" name="quantity"
						value="${cp['quantity']}"></td>
					<td>${cp['price']}</td>
					<td><input type="button" value="Xoá"
						name="delete_cart_product"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="cart_summary">
		<p>
			Tổng tiền: <span>0</span> đ
		</p>
		<p>
			Phí giao hàng: <span>0</span> đ
		</p>
		<p>
			Thanh toán: <span>0</span> đ
		</p>
		<input type="button" value="Bước kế tiếp">
	</div>
</div>