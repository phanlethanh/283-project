<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
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

<!-- Begin Facebook plugin javascript -->
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<!-- End Facebook plugin javascript -->

<!-- Begin Google+ plugin javascript -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- End Google+ plugin javascript -->

<!-- Begin Twitter plugin javascript -->
<script type="text/javascript">
	window.twttr = (function(d, s, id) {
		var t, js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://platform.twitter.com/widgets.js";
		fjs.parentNode.insertBefore(js, fjs);
		return window.twttr || (t = {
			_e : [],
			ready : function(f) {
				t._e.push(f)
			}
		})
	}(document, "script", "twitter-wjs"));
	
	$(document).ready(function() {
		$('.buy_product_button').live('click', function(e) {
			document.getElementById("form_term_and_conditions").reset();
			$("#termsAndConditions").reveal();
		});

		$(".agree_terms_and_conditions_button").live(
				'click',
				function() {
					var data_form = $(
					"form.form_product_detail")
					.serialize();
					$.ajax({
						url : "createOrderFromProduct.html",
						type : "POST",
						data : data_form,
						success : function(data) {
							if(data.code == 1)
							{
								$("#termsAndConditions").trigger('reveal:close');
								alert("Lập hóa đơn thành công.");
								window.location.href = 'viewOrderList.html';
							} else if (data.code == 2){
								$("#termsAndConditions").trigger('reveal:close');
								alert("Mua hàng thất bại. Vui lòng đăng nhập trước khi đặt, mua hàng.");
							} else {
								alert("Lập hóa đơn thất bại.");
							}
						}
					});
				});
	});
</script>
<!-- End Twitter plugin javascript -->

<div class="dt_product_content">
	<form class="form_product_detail" method="post">
		<span class="ctgh_p">
			<span>${product['name']}</span>
		</span>
		<!-- Begin Facebook like plugin -->
		<div class="link_social_network">
			<div class="fb-like"
				data-href="productDetail.html?product_id=${product['id']}"
				data-layout="button_count" data-action="like" data-show-faces="true"
				data-share="true"></div>
			<!-- End Facebook like plugin -->
	
			<!-- Begin Tweet plugin -->
			<a class="twitter-share-button"
				href="https://twitter.com/share"> Tweet </a>
			<!-- End Tweet plugin -->
	
			<!-- Begin Google+ add plugin -->
			<!-- <div class="g-plusone" data-annotation="inline" data-width="200"></div> -->
			<div class="g-plus" data-action="share"
				data-href="productDetail.html?product_id=${product['id']}"></div>
			<!-- End Google+ add plugin -->
			<br>
		</div>
		
		<table>
			<tr>
				<td><img src="${product['icon']}" width="150" height="150"></td>
				<td>
				<input type="button" class="buy_product_button" value="Mua ngay">
				<input type="button" name="add_to_cart" value="Thêm vào giỏ hàng"
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
		<input type="hidden" id="product_id" name="product_id" value="${product['id']}">
	</form>
	<br />
	<span class="ctgh_p">Thuộc tính</span>
	<table>
		<tr>
			<th>Tên thuộc tính</th>
			<th>Mô tả</th>
		</tr>
		 <c:forEach var="item" items="${product['fieldsData']}">
		 <tr>
		 	<th><span >${item.key}</span></th>
			<td><span >${item.value}</span></td>
		</tr>
		 </c:forEach>
	</table>
	<span class="ctgh_p">Thông tin chi tiết</span>
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
		<div class="dt_product_image">
			<img src="${image['imageName']}" width="900">
		</div>
		<p>${image['imageDescription']}</p>
		<br />
	</c:forEach>
	<br>
	<!-- Begin Facebook comment plugin -->
	<div class="fb-comments"
		data-href="productDetail.html?product_id=${product['id']}"
		data-numposts="5" data-colorscheme="light"></div>
	<!-- End Facebook comment plugin -->
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