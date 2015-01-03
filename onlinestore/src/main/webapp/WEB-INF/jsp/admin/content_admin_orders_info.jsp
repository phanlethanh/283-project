<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(function(){
		
		$(".order_status").change(function(){
			var id = $(this).attr("order_id");
			var status_id = $(this).attr("status_id");
			for(var i = 1; i <7; i++ )
			{
				var temp = "#status"+i+id;
				if((i+5) != status_id)
					$(temp).attr('checked', false);
			}
			$.ajax({
				url:"changeOrderStatus.html",
				type:"POST",
				data:{order_id:id,status_id:status_id},
				success:function(data){
					if(data.code == 1)
					{
						alert("Đã câp nhập thành công");
					}
				}
			});
		});
	});
</script>

<div class="admin_list_orders">
<span class="ctgh_p">Danh sách đơn hàng</span>
	<table>
		<tr>
			<td>#</td>
			<td>Địa chỉ</td>
			<td>Số điện thoại</td>
			<td>Khách hàng</td>
			<td>Ngày</td>
			<td>Tình trạng</td>
		</tr>
		<% int i = 0; %>
		<c:forEach var="orderInfo" items="${listOrder}">
			<% i++; %>
			<tr class="${orderInfo.id}">
				<td><%=i %></td>
				<td>${orderInfo.address}</td>
				<td id="orderInfo_${orderInfo.id}">${orderInfo.phone}</td>
				<td >${orderInfo.osUser.fullName}</td>
				<td >${orderInfo.createDate}</td>
				<c:if test="${orderInfo.status.id == 6}">
					<td ><c:out value="Mới"/><input type="checkbox" checked="checked" order_id="${orderInfo.id }" status_id="6" class="order_status" id="status1${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id  != 6}">
					<td ><c:out value="Mới"/><input type="checkbox" order_id="${orderInfo.id }" status_id="6" class="order_status" id="status1${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id == 7}">
					<td ><c:out value="Đã xác nhận"/><input type="checkbox" checked="checked" order_id="${orderInfo.id }" status_id="7" class="order_status" id="status2${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id  != 7}">
					<td ><c:out value="Đã xác nhận"/><input type="checkbox" order_id="${orderInfo.id }" status_id="7" class="order_status" id="status2${orderInfo.id }"></td>
				</c:if>
				
				<c:if test="${orderInfo.status.id == 8}">
					<td ><c:out value="Đã giao hàng"/><input type="checkbox" checked="checked" order_id="${orderInfo.id }" status_id="8" class="order_status" id="status3${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id  != 8}">
					<td ><c:out value="Đã giao hàng"/><input type="checkbox" order_id="${orderInfo.id }" status_id="8" class="order_status" id="status3${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id == 9}">
					<td ><c:out value="Hoàn tất"/><input type="checkbox" checked="checked" order_id="${orderInfo.id }" status_id="9" class="order_status" id="status4${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id  != 9}">
					<td ><c:out value="Hoàn tất"/><input type="checkbox" order_id="${orderInfo.id }" status_id="9" class="order_status" id="status4${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id == 10}">
					<td ><c:out value="Đã hủy"/><input type="checkbox" checked="checked" order_id="${orderInfo.id }" status_id="10" class="order_status" id="status5${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id  != 10}">
					<td ><c:out value="Đã hủy"/><input type="checkbox" order_id="${orderInfo.id }" status_id="10" class="order_status" id="status5${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id == 11}">
					<td ><c:out value="Đã thanh toán"/><input type="checkbox" checked="checked" order_id="${orderInfo.id }" status_id="11" class="order_status" id="status6${orderInfo.id }"></td>
				</c:if>
				<c:if test="${orderInfo.status.id  != 11}">
					<td ><c:out value="Đã thanh toán"/><input type="checkbox" order_id="${orderInfo.id }" status_id="11" class="order_status" id="status6${orderInfo.id }"></td>
				</c:if>
				
			</tr>
		</c:forEach>
	</table>
</div>