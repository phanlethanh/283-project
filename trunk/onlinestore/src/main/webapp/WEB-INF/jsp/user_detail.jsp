<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(
		function() {
			$('.edit_user_info_button').live('click',
				function(e) {
					$.ajax({
						url : "userDetailForEdit.html",
						data : {},
						type : "POST",
						success : function(data) {
							document.getElementById("form_edit_user_info").reset();
							$("#editUserInfo").reveal();
							$(".edit_user_fullname").val(data.fullname);
							$(".edit_user_address").val(data.address);
							$(".edit_user_email").val(data.email);
							$(".edit_user_phone").val(data.phone);
						}
					});
			});
			
			$(".save_edit_user_info").live('click',
					function() {
						var data_form = $(
							"form.form_edit_user_info")
							.serialize();
						$.ajax({
							url : "editUserInfo.html",
							type : "POST",
							data : data_form,
							success : function(data) {
								if(data.code == 1)
								{
									$("#editUserInfo").trigger('reveal:close');
									document.getElementById("user_detail_fullname").innerHTML = data.fullname;
									document.getElementById("user_detail_address").innerHTML = data.address;
									document.getElementById("user_detail_email").innerHTML = data.email;
									document.getElementById("user_detail_phone").innerHTML = data.phone;
								} else {
									alert("Lưu thất bại.");
								}
							}
						});
				});
			
			$('.change_user_password_button').live('click',
					function(e) {
						$.ajax({
							url : "#",
							data : {},
							type : "POST",
							success : function(data) {
								document.getElementById("form_change_user_password").reset();
								$("#changeUserPassword").reveal();
								$(".change_user_old_password").val("");
								$(".change_user_new_password").val("");
							}
						});
				});
			
			$(".save_change_user_password").live('click',
					function() {
						var data_form = $(
							"form.form_change_user_password")
							.serialize();
						$.ajax({
							url : "changeUserPassword.html",
							type : "POST",
							data : data_form,
							success : function(data) {
								if(data.code == 1)
								{
									$("#changeUserPassword").trigger('reveal:close');
									alert("Đổi mật khẩu thành công.");
								} else if (data.code == 2){
									alert("Mật khẩu cũ không hợp lệ.");
								} else {
									alert("Đổi mật khẩu thất bại.");
								}
							}
						});
				});
		});
</script>

<span class="ctgh_p">Thông tin tài khoản</span>

<div class="user_detail">
	<table>
		<tr>
			<th align="left">Loại tài khoản</th>
			<td><span>${group}</span></td>
		</tr>
		<tr>
			<th align="left">Họ tên</th>
			<td><span id="user_detail_fullname">${fullName}</span></td>
		</tr>
		<tr>
			<th align="left">Địa chỉ</th>
			<td><span id="user_detail_address">${address}</span></td>
		</tr>
		<tr>
			<th align="left">Email</th>
			<td><span id="user_detail_email">${email}</span></td>
		</tr>
		<tr>
			<th align="left">Điện thoại</th>
			<td><span id="user_detail_phone">${phone}</span></td>
		</tr>
		<tr>
			<th></th>
			<td><a class="change_user_password_button" href="#">Đổi mật khẩu</a></td>
		</tr>
		<tr>
			<th></th>
			<td><a class="edit_user_info_button" href="#">Cập nhật thông tin</a></td>
		</tr>
	</table>
</div>

<div id="editUserInfo" class="reveal-editrecordmodalwindow">
	<span class="ctgh_p">Thông tin tài khoản</span>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_edit_user_info" class="form_edit_user_info"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=user_item>
					<span>Họ tên</span><input class="edit_user_fullname"
						type="text" name="user_fullname">
				</div>
				<div class=user_item>
					<span>Địa chỉ</span><textarea class="edit_user_address"
						name="user_address" cols="25" rows="2"></textarea>
				</div>
				<div class=user_item>
					<span>Email</span><input class="edit_user_email"
						type="text" name="user_email">
				</div>
				<div class=user_item>
					<span>Điện thoại</span><input class="edit_user_phone"
						type="text" name="user_phone">
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_edit_user_info" type="button"
					value="Lưu" /> <input class="formButton cancel  close-reveal-all"
					type="button" value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>

<div id="changeUserPassword" class="reveal-editrecordmodalwindow">
	<h4>Đổi mật khẩu</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_change_user_password" class="form_change_user_password"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=password_item>
					<span>Mật khẩu cũ</span><input class="change_user_old_password"
						type="password" name="user_old_password">
				</div>
				<div class=password_item>
					<span>Mật khẩu mới</span><input class="change_user_new_password"
						type="password" name="user_new_password">
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_change_user_password" type="button"
					value="Lưu" /> <input class="formButton cancel  close-reveal-all"
					type="button" value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>