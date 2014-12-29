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
	<div>
	<table>
		<tr>
			<td>#</td>
			<td>Trạng thái</td>
			<td>Địa chỉ giao hàng</td>
			<td>SĐT liên hệ</td>
		</tr>
		<%
			int index = 0;
		%>
		<c:forEach var="order" items="${orderMapList}">
			<%
				index++;
			%>
			<tr>
				<td><%=index%></td>
				<td>${order['status']}</td>
				<td><span>${order['address']}</span></td>
				<td><span>${order['phone']}</span></td>
				<td><a href="viewOrderDetail.html?order_id=${order['id']}">Chi
						tiết</a></td>
				<td><a href="#">Xác nhận</a></td>
				<td><a href="#">Sửa</a></td>
				<td><a href="#">Hủy</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</div>