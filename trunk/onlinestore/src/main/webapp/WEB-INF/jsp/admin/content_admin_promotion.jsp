<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(
		function() {
			$( "#add_promotion_end_date" ).datepicker({
				dateFormat: 'yy-mm-dd'
			    });
			$( "#add_promotion_start_date" ).datepicker({
				dateFormat: 'yy-mm-dd'
			    });
			$( "#edit_promotion_end_date" ).datepicker({
				dateFormat: 'yy-mm-dd'
			    });
			$( "#edit_promotion_start_date" ).datepicker({
				dateFormat: 'yy-mm-dd'
			    });
			$('.admin_edit_promotion').live('click',
				function(e) {
					var id = $(this).attr("promotionid");
					$.ajax({
						url : "adminDetailPromotion.html",
						data : {
							id : id
						},
						type : "POST",
						success : function(data) {
							document.getElementById("form_admin_edit_promotion").reset();
							$("#adminEditPromotion").reveal();
							$(".edit_promotion_id").val(data.id);
							$(".edit_promotion_name").val(data.name);
							$(".edit_promotion_type").val(data.type_promotion);
							$(".edit_promotion_start_date").val(data.start_date);
							$(".edit_promotion_end_date").val(data.end_date);
							$(".edit_promotion_description").val(data.description);
						}
					});
				});

			$(".save_edit_promotion").live('click',
				function() {
					var data_form = $(
						"form.form_admin_edit_promotion")
						.serialize();
					$.ajax({
						url : "adminEditPromotion.html",
						type : "POST",
						data : data_form,
						success : function(data) {
							if(data.code == 1)
							{
								$("#adminEditPromotion").trigger('reveal:close');
								var promotion_name = "promotion_name_" + data.id;
								var promotion_type = "promotion_type_" + data.id;
								var promotion_start_date = "promotion_start_date_" + data.id;
								var promotion_end_date = "promotion_end_date_" + data.id;
								var promotion_description = "promotion_description_" + data.id;
								document.getElementById(promotion_name).innerHTML = data.name;
								document.getElementById(promotion_type).innerHTML = data.type_promotion;
								document.getElementById(promotion_start_date).innerHTML = data.start_date;
								document.getElementById(promotion_end_date).innerHTML = data.end_date;
								document.getElementById(promotion_description).innerHTML = data.description;
							} else {
								alert("Lưu thất bại.");
							}
						}
					});
			});
			
			$(".admin_delete_promotion").live('click',
					function() {
					if (confirm("Bạn có muốn xóa khuyến mãi này?") == true) {
						var id = $(this).attr("promotionid");
						$.ajax({
							url : "adminDeletePromotion.html",
							type : "POST",
							data : {id:id},
							success : function(data) {
									var element = document.getElementById("promotion_id_" + data.id);
									element.parentNode.removeChild(element);
							}
						});
					}
			});
			
			$('.admin_add_promotion_button').live('click',
				function(e) {
					$.ajax({
						url : "#",
						data : {},
						type : "POST",
						success : function() {
							document.getElementById("form_admin_add_promotion").reset();
							$("#adminAddPromotion").reveal();
							$(".edit_promotion_id").val("");
							$(".edit_promotion_name").val("");
							$(".edit_promotion_type").val("");
							$(".edit_promotion_start_date").val("");
							$(".edit_promotion_end_date").val("");
							$(".edit_promotion_description").val("");
						}
					});
			});
			
			$('.save_add_promotion').live('click',
					function(e) {
						var data_form = $("form.form_admin_add_promotion").serialize();
						$.ajax({
							url : "adminAddPromotion.html",
							data : data_form,
							type : "POST",
							success : function(data) {
								if(data.code == 1)
								{
									$("#adminAddPromotion").trigger('reveal:close');
									window.location.href = 'viewPromotionList.html';
								} else {
									alert("Thêm mới thất bại.");
								}
							}
						});
				});
	});
</script>

<div class="admin_config_promotion">
	<span class="ctgh_p">Danh sách khuyến mãi</span>
	<input type="button" value="Thêm khuyến mãi" id="admin_add_promotion_button"
		class="admin_add_promotion_button">
	<table>
		<tr>
			<td>#</td>
			<td>Khuyến mãi</td>
			<td>Loại</td>
			<td>Ngày bắt đầu</td>
			<td>Ngày kết thúc</td>
			<td>Mô tả</td>
		</tr>
		<%
			int index = 0;
		%>
		<c:forEach var="promotion" items="${promotionMapList}">
			<%
				index++;
			%>
			<tr id="promotion_id_${promotion['id']}">
				<td><%=index%></td>
				<td id="promotion_name_${promotion['id']}">${promotion['name']}</td>
				<td id="promotion_type_${promotion['id']}">${promotion['type_promotion']}</td>
				<td id="promotion_start_date_${promotion['id']}">${promotion['start_date']}</td>
				<td id="promotion_end_date_${promotion['id']}">${promotion['end_date']}</td>
				<td id="promotion_description_${promotion['id']}">${promotion['description']}</td>
				<td><a class="admin_edit_promotion"
					promotionid="${promotion['id']}" href="#">Sửa</a></td>
				<td><a class="admin_delete_promotion"
					promotionid="${promotion['id']}" href="#">Xóa</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="adminEditPromotion" class="reveal-editrecordmodalwindow">
	<h4>Cập nhập khuyến mãi</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_admin_edit_promotion" class="form_admin_edit_promotion"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=admin_promotion_item>
					<input class="edit_promotion_id" type="hidden" name="promotion_id">
				</div>
				<div class=admin_promotion_item>
					<span>Khuyến mãi</span><input class="edit_promotion_name"
						type="text" name="promotion_name" required>
				</div>
				<div class=admin_promotion_item>
					<span>Loại</span><input class="edit_promotion_type" type="text"
						name="promotion_type" required>
				</div>
				<div class=admin_promotion_item>
					<span>Ngày bắt đầu</span><input class="edit_promotion_start_date" id="edit_promotion_start_date"
						type="date" name="promotion_start_date" required>
				</div>
				<div class=admin_promotion_item>
					<span>Ngày kết thúc</span><input class="edit_promotion_end_date" id="edit_promotion_end_date"
						type="date" name="promotion_end_date" required>
				</div>
				<div class=admin_promotion_item>
					<span>Mô tả</span>
					<textarea name="promotion_description" cols="40" rows="3"
						class="edit_promotion_description" required></textarea>
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_edit_promotion" type="button"
					value="Lưu" /> <input class="formButton cancel  close-reveal-all"
					type="button" value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>

<div id="adminAddPromotion" class="reveal-editrecordmodalwindow">
	<h4>Thêm khuyến mãi</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_admin_add_promotion" class="form_admin_add_promotion"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=admin_promotion_item>
					<input class="add_promotion_id" type="hidden" name="promotion_id">
				</div>
				<div class=admin_promotion_item>
					<span>Khuyến mãi</span><input class="edit_promotion_name"
						type="text" name="promotion_name" required>
				</div>
				<div class=admin_promotion_item>
					<span>Loại</span><input class="edit_promotion_type" type="text"
						name="promotion_type" required>
				</div>
				<div class=admin_promotion_item>
					<span>Ngày bắt đầu</span><input class="edit_promotion_start_date" id="add_promotion_start_date"
						type="date" name="promotion_start_date" required>
				</div>
				<div class=admin_promotion_item>
					<span>Ngày kết thúc</span><input class="edit_promotion_end_date" id="add_promotion_end_date"
						type="date" name="promotion_end_date" required>
				</div>
				<div class=admin_promotion_item>
					<span>Mô tả</span>
					<textarea name="promotion_description" cols="40" rows="3"
						class="edit_promotion_description" required></textarea>
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_add_promotion" type="button"
					value="Thêm" /> <input class="formButton cancel  close-reveal-all"
					type="button" value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
