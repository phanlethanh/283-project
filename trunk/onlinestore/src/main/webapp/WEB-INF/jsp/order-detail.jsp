<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.order_detail {
	background-color: white;
	padding: 20px;
	border: 1px solid;
}

.order_list_summary {
	text-align: right;
	padding-right: 100px;
}
</style>

<script type="text/javascript">
	
</script>
<div class="order_detail">
	<div>
	<table>
		<tr>
			<td>#</td>
			<td></td>
			<td>Sản phẩm</td>
			<td>Số lượng</td>
			<td>Đơn giá</td>
		</tr>
		<% int index = 0; %>
		<c:forEach var="orderDetail" items="${orderDetailMapList}">
			<% index++; %>
			<tr>
				<td><%=index%></td>
				<td><img src="${orderDetail['productIcon']}" width="70"
					height="70"></td>
				<td><a
					href="productDetail.html?product_id=${orderDetail['productId']}">${orderDetail['productName']}</a></td>
				<td><span>${orderDetail['quantity']}</span></td>
				<td><span>${orderDetail['price']}</span> đ</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div class="order_list_summary">
		<p>
			Trạng thái đơn hàng: <span id="order_status">${status}</span>
		</p>
		<p>
			Số lượng sản phẩm: <span id="total_product">${totalProduct}</span>
		</p>
		<p>
			Thuế: <span id="tax_name">${taxName}</span> 
			<span id="tax_value">${taxValue}</span>%
		</p>
		<p>
			Tổng tiền: <span id="total_money">${totalMoney}</span> đ
		</p>
		<p>
			Phí giao hàng: <span id="transport_fee">${transportFee}</span> đ
		</p>
		<p>
			Thanh toán: <span id="total_payment">${totalPayment}</span> đ
		</p>
	</div>
</div>