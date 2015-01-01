<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.cart {
	background-color: white;
	padding: 20px;
	border: 1px solid;
}

.cart_product_list {
	border-bottom: 1px;
	border-top: 1px;
	text-align: right;
}

.cart_product_table {
	
}

.cart_summary {
	text-align: right;
	padding-right: 100px;
}
</style>

<script>
	$(document).ready(function() {
		$('.create_order_button').live('click', function(e) {
			document.getElementById("form_term_and_conditions").reset();
			$("#termsAndConditions").reveal();
		});

		$(".agree_terms_and_conditions_button").live(
				'click',
				function() {
					$.ajax({
						url : "createOrderFromCart.html",
						type : "POST",
						data : {},
						success : function(data) {
							if(data.code == 1)
							{
								$("#termsAndConditions").trigger('reveal:close');
								alert("Lập hóa đơn thành công.");
								window.location.href = 'viewOrderList.html';
							} else {
								alert("Lập hóa đơn thất bại.");
							}
						}
					});
				});
		$(".delete_cart_product_from_cart").live('click',
				function() {
				if (confirm("Bạn có muốn xóa sản phẩm này ra khỏi giỏ hàng?") == true) {
					var id = $(this).attr("productid");
					$.ajax({
						url : "deleteCartProductFromCart.html",
						type : "POST",
						data : {id:id},
						success : function(data) {
								var element = document.getElementById("cart_product_id_" + data.id);
								element.parentNode.removeChild(element);
								document.getElementById("total_money").innerHTML = data.totalMoney;
								document.getElementById("transport_fee").innerHTML = data.transportFee;
								document.getElementById("total_payment").innerHTML = data.totalPayment;
						}
					});
				}
		});
	});
</script>
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
				<tr id="cart_product_id_${cp['id']}">
					<td><img src="${cp['productIcon']}" width="70" height="70"></td>
					<td><a href="productDetail.html?product_id=${cp['productId']}">${cp['productName']}</a></td>
					<td><input type="text" name="quantity"
						value="${cp['quantity']}"></td>
					<td>${cp['price']} đ</td>
					<td><a href="#" productid="${cp['id']}" class="delete_cart_product_from_cart">Xoá</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="cart_summary">
		<p>
			Tổng tiền: <span id="total_money">${totalMoney}</span> đ
		</p>
		<p>
			Phí giao hàng: <span id="transport_fee">${transportFee}</span> đ
		</p>
		<p>
			Thanh toán: <span id="total_payment">${totalPayment}</span> đ
		</p>
		<input type="button" value="Lập đơn hàng" class="create_order_button"
			id="create_order_button">
	</div>
</div>

<div id="termsAndConditions" class="reveal-editrecordmodalwindow">
	<h4>CHẤP NHẬN ĐIỀU KHOẢN</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_term_and_conditions" class="form_term_and_conditions"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=terms_and_conditions_item>
					<textarea class="terms_and_conditions" readonly
						name="terms_and_conditions" cols="90" rows="20">						
ĐIỀU KHOẢN MUA BÁN HÀNG HÓA TẠI ONLINE STORE

# Điều 1: Xác nhận đơn hàng
Hệ thống sẽ gửi đến địa chỉ email của quý khách hàng để xác nhận đơn hàng. Để xác nhận đơn hàng, quý khách xin vui lòng click vào địa chỉ kèm theo trong email.

# Điều 2: Chấp nhận đơn hàng và giá cả
Chúng tôi có quyền từ chối hoặc hủy đơn hàng của quý khách vì bất kỳ lý do gì vào bất kỳ lúc nào. Chúng tôi có thể hỏi thêm về số điện thoại và địa chỉ trước khi nhận đơn hàng.
Chúng tôi cam kết sẽ cung cấp thông tin giá cả chính xác nhất cho người tiêu dùng. Tuy nhiên, đôi lúc vẫn có sai sót xảy ra, ví dụ như trường hợp giá sản phẩm không hiển thị chính xác trên trang web hoặc sai giá, tùy theo từng trường hợp chúng tôi sẽ liên hệ hướng dẫn hoặc thông báo hủy đơn hàng đó cho quý khách. Chúng tôi cũng có quyền từ chối hoặc hủy bỏ bất kỳ đơn hàng nào dù đơn hàng đó đã hay chưa được xác nhận hoặc đã bị thanh toán.

# Điều 3: Thay đổi, hủy bỏ giao dịch
Trong mọi trường hợp, khách hàng đều có quyền chấm dứt giao dịch nếu đã thực hiện các biện pháp sau đây:
    a. Thông báo cho Online Store về việc hủy giao dịch qua đường dây nóng 0123.123.123.
    b. Trả lại hàng hoá đã nhận nhưng chưa sử dụng hoặc hưởng bất kỳ lợi ích nào từ hàng hóa đó.

# Điều 4: Hình thức thanh toán
Hệ thống hỗ trợ thanh toán tiền mặt tại thời điểm nhận hàng hoặc thông qua các kênh giao dịch trực tuyến như: thẻ nội địa, Credit Card, Paypal, Google Checkout.

# Điều 5: Kiểm tra hàng hóa sau khi nhận hàng
Khách hàng vui lòng kiểm tra số lượng và quy cách sản phẩm ngay khi nhận được hàng. Nếu đơn hàng chưa được giao chính xác, khách hàng phải báo ngay cho Hotline 0123.123.123 trong vòng 30 phút kể từ thời điểm nhận hàng để được hỗ trợ kịp thời. Sau 30 phút đó, Icook không chịu trách nhiệm về những khiếu nại, thắc mắc về đơn hàng đó và đơn hàng sẽ được đóng lại trên hệ thống. 

# Điều 6: Chính sách phản hồi và khiếu nại
Online Store rất trân trọng và khuyến khích những ý kiến đóng góp của khách hàng về chất lượng sản phẩm và dịch vụ của Online Store. Mọi ý kiến đóng góp xin gửi về địa chỉ email: gopy@onlinestore.com hoặc qua hotline 0123.123.123.
						</textarea>
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton agree_terms_and_conditions_button"
					type="button" value="Đồng ý" /> <input
					class="formButton cancel  close-reveal-all" type="button"
					value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>