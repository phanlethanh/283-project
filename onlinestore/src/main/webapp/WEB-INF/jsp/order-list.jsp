<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function cancelOrderOnClick() {
		if (confirm("Bạn có muốn hủy hóa đơn này?") == true) {
			//...
		}
	}
	function confirmOrderOnClick() {
		if (confirm("Để xác nhận đơn hàng, hệ thống sẽ gửi cho bạn email,"
				+ " vui lòng xác nhận theo email đó!") == true) {
			//...
		}
	}
</script>
<div>
	<table border="1">
		<tr>
			<td>STT</td>
			<td>Trạng thái</td>
			<td>Phí vận chuyển</td>
			<td>Loại thuế</td>
			<td>Giá trị (%)</td>
			<td>Địa chỉ giao hàng</td>
			<td>SĐT liên hệ</td>
		</tr>
		<c:forEach var="order" items="${orderMapList}">
			<tr>
				<td></td>
				<td>${order['status']}</td>
				<td>${order['transportFee']}</td>
				<td>${order['taxName']}</td>
				<td>${order['taxValue']}</td>
				<td>${order['address']}</td>
				<td>${order['phone']}</td>
				<td><a href="viewOrderDetail.html?order_id=${order['id']}">Chi
						tiết</a></td>
				<td><a href="#" onclick="confirmOrderOnClick()">Xác nhận</a></td>
				<td><a href="#" onclick="cancelOrderOnClick()">Hủy</a></td>
			</tr>
		</c:forEach>
	</table>
</div>