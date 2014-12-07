<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function removeProductofOrderOnClick() {
		if (confirm("Xóa sản phẩm này khỏi hóa đơn?") == true) {

		}
	}
</script>
<div>
	<table border="1">
		<tr>
			<td>STT</td>
			<td></td>
			<td>Sản phẩm</td>
			<td>Số lượng</td>
			<td>Thành tiền</td>
		</tr>
		<c:forEach var="orderDetail" items="${orderDetailMapList}">
			<tr>
				<td></td>
				<td><img src="${orderDetail['productIcon']}" width="70"
					height="70"></td>
				<td><a
					href="productDetail.html?product_id=${orderDetail['productId']}">${orderDetail['productName']}</a></td>
				<td>${orderDetail['quantity']}</td>
				<td>${orderDetail['price']}đ</td>
				<td>${orderDetail['price']}đ</td>
				<td><a href="#" onclick="removeProductofOrderOnClick()">Xóa</a></td>
			</tr>
		</c:forEach>
	</table>
</div>