<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(
	function() {
		$('.edit_order_list').live('click',
			function(e) {
				var id = $(this).attr("orderid");
				$.ajax({
					url : "orderDetail.html",
					data : {
						id : id
					},
					type : "POST",
					success : function(data) {
						document.getElementById("form_edit_order_list").reset();
						$("#editOrderList").reveal();
						$(".edit_order_id").val(data.id);
						$(".edit_order_status").val(data.status);
						$(".edit_order_create_date").val(data.create_date);
						$(".edit_order_address").val(data.address);
						$(".edit_order_phone").val(data.phone);
					}
				});
		});
		$(".save_edit_order_list").live('click',
			function() {
				var data_form = $(
					"form.form_edit_order_list")
					.serialize();
				$.ajax({
					url : "editOrder.html",
					type : "POST",
					data : data_form,
					success : function(data) {
						if(data.code == 1)
						{
							$("#editOrderList").trigger('reveal:close');
							var order_address = "order_address_" + data.id;
							var order_phone = "order_phone_" + data.id;
							document.getElementById(order_address).innerHTML = data.address;
							document.getElementById(order_phone).innerHTML = data.phone;
						} else {
							alert("Lưu thất bại.");
						}
					}
				});
		});
		
		$(".delete_order_list").live('click',
				function() {
				if (confirm("Bạn có muốn hủy đơn hàng này?") == true) {
					var id = $(this).attr("orderid");
					$.ajax({
						url : "deleteOrder.html",
						type : "POST",
						data : {id:id},
						success : function(data) {
								var element = document.getElementById("order_item_" + data.id);
								element.parentNode.removeChild(element);
						}
					});
				}
		});
});
</script>
<div>
	<span class="ctgh_p">Danh sách đơn hàng</span>
	<div class="view_order_list">
	<table>
		<tr>
			<td>#</td>
			<td>Trạng thái</td>
			<td>Ngày lập</td>
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
			<tr id="order_item_${order['id']}">
				<td><%=index%></td>
				<td><span id="order_status_${order['id']}">${order['status']}</span></td>
				<td><span id="order_create_date_${order['id']}">${order['createDate']}</span></td>
				<td><span id="order_address_${order['id']}">${order['address']}</span></td>
				<td><span id="order_phone_${order['id']}">${order['phone']}</span></td>
				<td><a href="viewOrderDetail.html?order_id=${order['id']}">Chi
						tiết</a></td>
				<td><a class="confirm_order_list" orderid="${order['id']}" href="#">Xác nhận</a></td>
				<td><a class="edit_order_list" orderid="${order['id']}" href="#">Sửa</a></td>
				<td><a class="delete_order_list" orderid="${order['id']}" href="#">Hủy</a></td>
			</tr>
		</c:forEach>
	</table>
	<div id="wait" style="display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:50%;left:50%;padding:2px;"><img src='image/load.gif' width="64" height="64" /><br>Loading..</div>
	</div>
</div>

<div id="editOrderList" class="reveal-editrecordmodalwindow">
	<h4>Chi tiết đơn hàng</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_edit_order_list" class="form_edit_order_list"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=order_list_item>
					<input class="edit_order_id" type="hidden" name="order_id">
				</div>
				<div class=order_list_item>
					<span>Trạng thái</span><input class="edit_order_status"
						type="text" name="order_status" readonly>
				</div>
				<div class=order_list_item>
					<span>Ngày lập</span><input class="edit_order_create_date" type="text"
						name="order_create_date" readonly>
				</div>
				<div class=order_list_item>
					<span>Địa chỉ giao hàng</span><textarea class="edit_order_address"
					name="order_address" cols="50" rows="3" required maxlength="255"></textarea>
				</div>
				<div class=order_list_item>
					<span>SĐT liên hệ</span><input class="edit_order_phone" type="text"
						name="order_phone" required maxlength="15">
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_edit_order_list" type="button"
					value="Lưu" /> <input class="formButton cancel  close-reveal-all"
					type="button" value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>