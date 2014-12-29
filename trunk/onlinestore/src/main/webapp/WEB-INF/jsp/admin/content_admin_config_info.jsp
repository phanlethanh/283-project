<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(
			function() {
				$('.admin_edit_config_info').live(
						'click',
						function(e) {
							var id = $(this).attr("configinfoid");
							$.ajax({
								url : "adminDetailConfigInfo.html",
								data : {
									id : id
								},
								type : "POST",
								success : function(data) {
									document.getElementById(
											"form_admin_edit_config_info")
											.reset();
									$("#adminEditConfigInfo").reveal();
									$(".edit_config_id").val(data.id);
									$(".edit_config_name").val(data.name);
									$(".edit_config_value").val(data.value);
									$(".edit_config_data_type").val(
											data.data_type);
								}
							});
						});

				$(".save_edit_config_info").live(
						'click',
						function() {
							var data_form = $(
									"form.form_admin_edit_config_info")
									.serialize();
							$.ajax({
								url : "adminEditConfigInfo.html",
								type : "POST",
								data : data_form,
								success : function(data) {
									if(data.code == 1)
									{
										$("#adminEditConfigInfo").trigger('reveal:close');
										var config_value_id = "config_value_" + data.id;
										document.getElementById(config_value_id).innerHTML = data.new_value;
									} else {
										alert("Lưu thất bại.");
									}
								}
							});
						});
			});
</script>

<div>
	<table>
		<tr>
			<td>Cấu hình</td>
			<td>Giá trị</td>
			<td>Kiểu giá trị</td>
		</tr>
		<c:forEach var="configInfo" items="${configInfoMapList}">
			<tr>
				<td>${configInfo['name']}</td>
				<td id="config_value_${configInfo['id']}">${configInfo['value']}</td>
				<td>${configInfo['data_type']}</td>
				<td><a class="admin_edit_config_info"
					configinfoid="${configInfo['id']}" href="#">Sửa</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="adminEditConfigInfo" class="reveal-editrecordmodalwindow">
	<h4>Chi tiết cấu hình</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_admin_edit_config_info"
			class="form_admin_edit_config_info" method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class=admin_config_info_item>
					<input class="edit_config_id" type="hidden" name="config_id">
				</div>
				<div class=admin_config_info_item>
					<span>Cấu hình</span><input class="edit_config_name" readonly
						type="text" name="config_name">
				</div>
				<div class=admin_config_info_item>
					<span>Giá trị</span><input class="edit_config_value" type="text"
						name="config_value">
				</div>
				<div class=admin_config_info_item>
					<span>Kiểu giá trị</span><input class="edit_config_data_type"
						readonly type="text" name="config_data_type">
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_edit_config_info" type="button"
					value="Lưu" /> <input class="formButton cancel  close-reveal-all"
					type="button" value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
