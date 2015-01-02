<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

</style>

<script type="text/javascript">
$(document).ready(
		function() {
			$(".delete_order_detail_item").live('click',
					function() {
					if (confirm("Bạn có muốn xóa sản phẩm này ra khỏi đơn hàng?") == true) {
						var id = $(this).attr("orderdetailid");
						$.ajax({
							url : "deleteOrderDetailItem.html",
							type : "POST",
							data : {id:id},
							success : function(data) {
									var element = document.getElementById("order_detail_item_" + data.id);
									element.parentNode.removeChild(element);
									document.getElementById("total_product").innerHTML = data.total_product;
									document.getElementById("total_money").innerHTML = data.total_money;
									document.getElementById("transport_fee").innerHTML = data.transport_fee;
									document.getElementById("tax_payment").innerHTML = data.tax_payment;
									document.getElementById("total_payment").innerHTML = data.total_payment;
							}
						});
					}
			});
		});
</script>
<div class="order_detail">
	<span class="ctgh_p">Chi tiết đơn hàng</span>
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
			<tr id="order_detail_item_${orderDetail['id']}">
				<td><%=index%></td>
				<td><img src="${orderDetail['productIcon']}" width="70"
					height="70"></td>
				<td><a
					href="productDetail.html?product_id=${orderDetail['productId']}">${orderDetail['productName']}</a></td>
				<td><span>${orderDetail['quantity']}</span></td>
				<td><span>${orderDetail['price']}</span> đ</td>
				<td><a class="delete_order_detail_item" 
				orderdetailid="${orderDetail['id']}" href="#">Xóa</a></td>
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
			Tổng tiền: <span id="total_money">${totalMoney}</span> đ
		</p>
		<p>
			Phí giao hàng: <span id="transport_fee">${transportFee}</span> đ
		</p>
		<p>
			Thuế <span id="tax_name">${taxName}</span> 
			<span id="tax_value">${taxValue}</span>%: 
			<span id="tax_payment">${taxPayment}</span> đ
		</p>
		<p>
			Thanh toán: <span id="total_payment">${totalPayment}</span> đ
		</p>
	</div>
</div>