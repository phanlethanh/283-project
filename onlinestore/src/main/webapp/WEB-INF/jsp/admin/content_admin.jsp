<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<div class="right_max_width">
<div class="form-message"></div>
	<h2 class="group_title">List Product</h2>
	<div class="clear"></div>
	<table id="product_of_category">
		<tr>
			<th align="left"></th>
			<th align="left">Name</th>
			<th align="center">Description</th>
			<th align="left">Price</th>
			<th align="center">Action</th>
		</tr>
		
	</table>
</div>
<div id="product_detail_content" class="hidden">
	<table id="product_properties">
		<tr>
			<th align="left">Tên</th>
			<th align="left" class="product_name"></th>
		</tr>
		<tr>
			<th align="left">Mô tả</th>
			<th align="left" class="product_description"></th>
		</tr>
		<tr>
			<th align="left">Giá</th>
			<th align="left" class="product_price"></th>
		</tr>
		<tr>
			<th align="left">Số lượng</th>
			<th align="left" class="product_count"></th>
		</tr>
		<tr>
			<th align="left">Tồn kho</th>
			<th align="left" class="product_count_present"></th>
		</tr>
		<tr>
			<th align="left">Khuyến mãi</th>
			<th align="left" class="product_promotion"></th>
		</tr>
		<tr>
			<th align="left">Hình đại diện</th>
			<th align="left" class="product_icon"></th>
		</tr>
		<tr>
			<th align="left">Hình ảnh</th>
			<th align="left" class="product_images"></th>
		</tr>
	</table>
	<div class="product_name_properties">
		
	</div>
		
	<div class="product_content_properties"></div>
</div>