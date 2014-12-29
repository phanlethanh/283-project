<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<script>
	$(document).ready(function(){
		var list_name_image = new Array();
		$('.admin_detail_product').live('click',function (e) {
			//alert("ancmada");
			var id =$(this).attr("idproduct");
			
			$.ajax({
				url:"adminDetailProduct.html",
				data:{id:id},
				type:"POST",
				success:function(data){
					//document.getElementById("form_admin_detail_product").reset();
					$(".icon_content").empty();
					$("#adminDetailProduct").reveal();
					$("#dt_product_id").val(id);
					//$(".form_admin_detail_product").html(data);
					$(".detail_producer").val(data.producer);
					$(".detail_name").val(data.name);
					$(".detail_description").val(data.description);
					$(".detail_price").val(data.price);
					$(".detail_promotion").val(data.name_promotion);
					$(".detail_status").val(data.name_status);
					$(".icon_content").append('<img alt="" src="'+data.icon+'" id="icon_content">');
					for(var i = 0; i < data.images.length; i++)
					{
						//alert(data.images[i]["imag"]);
						$(".gallery_content").append('<div class="gallery_item"><img alt="" src="'+data.images[i]["imageName"]+'"><span id="name_gallery_item">'+(i +1)+'</span></div>')
					}
						
					var length = data.name;
					
				}
			});
		});
		$('.admin_edit_product').live('click',function (e) {
			//alert("ancmada");
			var id =$(this).attr("idproduct");
			
			$.ajax({
				url:"adminDetailProduct.html",
				data:{id:id},
				type:"POST",
				success:function(data){
					document.getElementById("form_admin_edit_product").reset();
					$(".edit_gallery_content").empty();
					$(".icon_content").empty();
					$("#adminEditProduct").reveal();
					$("#edit_product_id").val(id);
					//$(".form_admin_detail_product").html(data);
					$(".edit_producer").val(data.producer);
					$(".edit_name").val(data.name);
					$(".edit_description").val(data.description);
					$(".edit_price").val(data.price);
					
					$(".icon_content").append('<img alt="" src="'+data.icon+'" id="icon_content">');
					for(var i = 0; i < data.images.length; i++)
					{
						//alert(data.images[i]["imag"]);
						$(".edit_gallery_content").append('<div class="gallery_item" id="image'+data.images[i]["id"]+'"><img alt="" src="'+data.images[i]["imageName"]+'"><input type="button" value="Xóa" imageId="'+data.images[i]["id"]+'" class="gallary_delete_image"></div>')
						//$(".list_name_image").val($(".list_name_image").val()+data.images[i]["imageName"]);
						var temp = data.images[i]["id"];
						list_name_image.push({"id" :temp,"name":data.images[i]["imageName"]});
					}
					var cbb_promotion = document.getElementById("edit_promotion");
					$("#edit_promotion").empty();
					for(var j=0; j<data.promotion.length; j++)
					{
						var option = document.createElement('option');
						option.text = data.promotion[j]["name"];
						option.value = data.promotion[j]["id"];
						cbb_promotion.add(option,0);
					}
					$("#edit_promotion option:contains(" + data.name_promotion + ")").attr('selected', 'selected');
					//$("#edit_promotion").find("option[text=" + data.name_promotion + "]").attr("selected", true);
					var cbb_status = document.getElementById("edit_status");
					$("#edit_status").empty();
					for(var j=0; j<data.status.length; j++)
					{
						var option = document.createElement('option');
						option.text = data.status[j]["name"];
						option.value = data.status[j]["id"];
						cbb_status.add(option,0);
					}
					$("#edit_status option:contains(" + data.name_status + ")").attr('selected', 'selected');
					$("#edit_id_product").val(id);
					var length = data.name;
					
				}
			});
		});
		$(".save_change_icon").on("click", function() {
			var formData = new FormData($('#uploadForm')[0]);
			$.ajax({
			    url: "uploadImage.html",
			    type: "POST",
			    contentType: false,
			    processData: false,
			    cache: false,
			    data: formData,
			    success: function(data) {
			    	if(data.code == 1)
			    	{
			    		//alert("success");
			    		$("#changeIconProduct").trigger('reveal:close');
			    		$('#adminEditProduct').reveal();
			    		$(".icon_content").empty();
			    		$(".icon_content").append('<img alt="" src="'+data.link+'" id="icon_content">');
			    		//$(".admin_detail_product_icon").append('<input type="hidden" class="name_icon_change" value="'+data.link+'" name="icon">')
			    		$("#edit_icon_change").val(data.link);
			    	}
			    },
			    error: function() {
			        alert("unable to create the record");
			    }
			});
		});
		$("#button_change_icon").live('click', function() {
			$('#adminEditProduct').hideModal();
			$("#changeIconProduct").reveal();
		});
		$(".cancel_change_icon").live('click', function(){
			$('#changeIconProduct').trigger('reveal:close');
			$('#adminEditProduct').reveal();
		});
		$(".cancel_add_image").live('click', function(){
			$('#addImageGalleryProduct').trigger('reveal:close');
			$('#adminEditProduct').reveal();
			
		});
		$("save_edit_product").live('click', function(){
			var data_form = $("form.form_admin_edit_product").serialize();
			$.ajax({
				url:"editProduct.html",
				type:"POST",
				data:data_form,
				success:function(data){
					
				}
			});
		});
		$(".gallary_delete_image").die();
		$(".gallary_delete_image").live("click",function(){
			var id = $(this).attr('imageId');
			//document.getElementById("gallery").remove();
			//$("#image"+id).remove();
			
			var element = document.getElementById("image"+id);
			element.parentNode.removeChild(element);
			var list_image_deleted = $("#list_id_image_delete").val();
			if(list_image_deleted != "")
				$("#list_id_image_delete").val(list_image_deleted+"|"+id);
			else
				$("#list_id_image_delete").val(id);
			//element.outerHTML = "";
			//delete element;
			for(var key in list_name_image)
			{
				if(list_name_image[key].id == id)
				{
					list_name_image.splice(key,1);
				}
				
			}
			return false;
		});
		
		$(".edit_product_add_image").live('click', function(){
			$('#adminEditProduct').hideModal();
			$("#addImageGalleryProduct").reveal();
		});
		
		$(".save_add_image").on("click", function() {
			var formData = new FormData($('#addImageForm')[0]);
			$.ajax({
			    url: "addImageToGallery.html",
			    type: "POST",
			    contentType: false,
			    processData: false,
			    cache: false,
			    data: formData,
			    success: function(data) {
			    	if(data.code == 1)
			    	{
			    		//alert("success");
			    		$("#addImageGalleryProduct").trigger('reveal:close');
			    		$('#adminEditProduct').reveal();
			    		$(".edit_gallery_content").append('<div class="gallery_item" id=""><img alt="" src="'+data.link+'"><input type="button" value="Xóa" imageId="" class="gallary_delete_image"></div>');
			    		var list_id = $(".list_id_image_add").val();
			    		if(list_id != "")
			    			var new_list = list_id+"|"+data.id_image;
			    		else
			    			var new_list = data.id_image;
			    		$(".list_id_image_add").val(new_list);
			    	}
			    },
			    error: function() {
			        alert("unable to create the record");
			    }
			});
		});
		
		$(".admin_delete_product").live('click', function(){
			var id = $(this).attr("idproduct");
			createConfirm(".main_content", "Delete product ", "Are you sure delete?", 'delete_product');	
			if($('#confirmModaldelete_product span').length <= 0)
			{
				$('#confirmModaldelete_product').append('<span style="display: none">'+id+'</span>');
			} else 
			{
				$('#confirmModaldelete_product span').empty().text(id);
			}	
			
		});
		$("#confirmModaldelete_product .bntsubmit").live('click',function(){
			var id= parseInt($('#confirmModaldelete_product span').text());
			$.ajax({
				url:"deleteProduct.html",
				type:"POST",
				data:{id:id},
				success:function(data){
					var element = document.getElementById("itemid"+id);
					element.parentNode.removeChild(element);
				}
			});
		});
		/*$(".upload_image").live('click', function(){
			//var data = $("#form_upload_image").serialize();
			var data_form = $("form.form_upload_image").serialize();
			var temp = $(".file_name").val();
			alert(data_form);
			$.ajax({
				url:"uploadImage.html",
				type:"POST",
				data:data_form,
				success:function(data){
					
				}
			});
		});*/
		$("#config_field").live('click', function(){
			var id = $("#category_id").val();
			var list_field =["memory","camera","media"];
			$("#fields_product_form .fields_input").empty();
			if(id != '')
			{
				$.ajax({
					url:"configFieldOfProduct.html",
					type:"POST",
					data:{id_category:id},
					success:function(data){
						$("#config_fields_modal").reveal();
						$(".new-field").hide();
						$("#fields_product_form .fields_input").append('<input name="fields_id" id="fields_id" type="hidden" value="'+data[3]['fields_id']+'">');
						for(var i = 0; i < list_field.length; i++)
						{
							var field_name = data[0][list_field[i]]['field_name'];
							$("#fields_product_form .fields_input").append('<div class="checkbox'+field_name+'"><input name="'+list_field[i]+'" type="checkbox" value="'+field_name+'" '+field_name+'>'+list_field[i]+'</div>');							
					
						}
						var count = data[2]["count"];
						for(var i = 0; i < count; i++)
						{
							var temp = data[2][i];
							$("#fields_product_form .fields_input").append('<div class="item-diff"><input value="'+data[1][temp]['field_name']+'" type="hidden" ><input value="'+data[1][temp]['group_name']+'" type="hidden" ><span class="item-diff-name">'+data[2][i]+'</span><span class="item-diff-delete" title="Delete" item_name="'+data[2][i]+'" field_id="'+data[3]['fields_id']+'">X</span></div>');
							
						}
					}
				});
			}
				//window.location="configFieldOfProduct.html?id_category="+id;
		});
		$(".add-new-field").live('click',function(){
			$("#group_name").val("");
			$("#identity_name").val("");
			$("#field_name").val("");
			$(".new-field").show();
		});
		

		$("#submit_new_field").live('click',function(){
			var group_name = $("#group_name").val();
			var identity_name = $("#identity_name").val();
			var field_name = $("#field_name").val();
			var category_id = $("#category_id").val();
			var fields_id = $("#fields_id").val();
			if(group_name != '' && identity_name != '' && field_name != ''){
				$.ajax({
					url:"addNewConfig.html",
					type: "POST",
					data: {id: fields_id,group_name:group_name, identity_name: identity_name,field_name: field_name},
					success: function(data){
						if(data.code == 1){
							$("#fields_product_form .fields_input").append('<div class="item-diff"><input value="'+field_name+'" type="hidden" ><input value="'+group_name+'" type="hidden" ><span class="item-diff-name">'+identity_name+'</span><span class="item-diff-delete" title="Delete" item_name="'+identity_name+'" field_id="'+fields_id+'">X</span></div>');
						} else {
							
						}
					},
					error : function(jqXHR, status, errorThrown){ 
						
					}
				});
			}
		});
		$(".item-diff-delete").live('click',function(){
			var field_name = $(this).attr('item_name');
			var field_id = $(this).attr('field_id');
			var item_obj = $(this).parent();
			$.ajax({
				url: "deleteField.html",
				type: "POST",
				data: {field_id: field_id,field_name: field_name},
				success: function(data){
					if(data.code == 1){
						 item_obj.remove();
					} else {
						alert("Not Success");
					}
				},
				error : function(jqXHR, status, errorThrown){ 
					
				}
			});
		});
		$("#config_fields_modal .bntsubmit").live('click', function(){
			var data_form = $("form.fields_product_form").serialize();
			$.ajax({
				url:"saveConfig.html",
				type:"POST",
				data:data_form,
				success:function(data){
					if(data.code == 1)
					{
						$("#config_fields_modal").trigger('reveal:close');
					}
				}
			});
		});
		$("#fields_product_form .fields_input input").live('click',function(){
			if($(this).text() == "")
				$(this).val("checked");
			else
				$(this).val("");
			//alert("check");
		});
		$( "#tabs" ).tabs();
		$("#dt_tabs").tabs();
		$("#add_tabs").tabs();
		$(".tab_item").live('click', function(){
			var category_id = $("#category_id").val();
			var product_id = $("#edit_product_id").val();
			$(".content_fields").empty();
			$.ajax({
				url:"loadFieldsOfProduct.html",
				data:{category_id:category_id, product_id:product_id},
				type:"POST",
				success:function(data){
						
						var size = data[1]['count'];
						$(".content_fields").append('<input name="id_category" type="hidden" value="'+category_id+'"><input name="product_id" type="hidden" value="'+product_id+'">');
						for(var i = 0; i < size; i++)
						{
							var name = data[1][i];
							$(".content_fields").append('<div class="field_item"><span class="field_name">'+data[1][i]+'</span><input type="text" name="'+data[1][i]+'" value="'+data[0][name]+'" class="field_data"></div>');
						}
						
				}
			});
		});
		$(".dt_tab_item").live('click', function(){
			var category_id = $("#category_id").val();
			var product_id = $("#dt_product_id").val();
			$(".dt_content_fields").empty();
			$.ajax({
				url:"loadFieldsOfProduct.html",
				data:{category_id:category_id, product_id:product_id},
				type:"POST",
				success:function(data){
						
						var size = data[1]['count'];
						$(".dt_content_fields").append('<input name="id_category" type="hidden" value="'+category_id+'"><input name="product_id" type="hidden" value="'+product_id+'">');
						for(var i = 0; i < size; i++)
						{
							var name = data[1][i];
							$(".dt_content_fields").append('<div class="field_item"><span class="field_name">'+data[1][i]+'</span><input class="field_data" type="text" name="'+data[1][i]+'" value="'+data[0][name]+'"></div>');
						}
						
				}
			});
		});
		$("#bntSaveConfig").live('click', function(){
			var data_form = $("form.form_edit_fields_product").serialize();
			$.ajax({
				url:"saveEditConfigProduct.html",
				type:"POST",
				data:data_form,
				success:function(data){
					alert("ok");
				},
			});
		});
		$(".save_edit_product").live('click',function(){
			$("#edit_id_promotion").val($("#edit_promotion").val());
			$("#edit_id_status").val($("#edit_status").val());
			var data_form = $("form.form_admin_edit_product").serialize();
			$.ajax({
				url:"saveEditProduct.html",
				type:"POST",
				data:data_form,
				success:function(data){
					if(data.code == 1)
					{
						$("#adminEditProduct").trigger('reveal:close');
					}
				}
			});
		});
		$(".save_add_product").live('click', function(){
			$("#add_id_promotion").val($("#add_promotion").val());
			$("#add_id_status").val($("#add_status").val());
			var data_form = $("form.form_admin_add_product").serialize();
			$.ajax({
				url:"saveAddProduct.html",
				type:"POST",
				data:data_form,
				success:function(data){
					if(data.code == 1)
					{
						$("#adminAddProduct").trigger('reveal:close');
					}
				}
			});
		});
		$("#add_product").live('click', function(){
			var id_category = $("#category_id").val();
			$.ajax({
				url:"addProduct.html",
				type:"POST",
				data:{id_category:id_category},
				success:function(data){
					$("#adminAddProduct").reveal();
					var cbb_promotion = document.getElementById("add_promotion");
					$("#add_promotion").empty();
					for(var j=0; j<data.promotion.length; j++)
					{
						var option = document.createElement('option');
						option.text = data.promotion[j]["name"];
						option.value = data.promotion[j]["id"];
						cbb_promotion.add(option,0);
					}
					//$("#edit_promotion").find("option[text=" + data.name_promotion + "]").attr("selected", true);
					var cbb_status = document.getElementById("add_status");
					$("#add_status").empty();
					for(var j=0; j<data.status.length; j++)
					{
						var option = document.createElement('option');
						option.text = data.status[j]["name"];
						option.value = data.status[j]["id"];
						cbb_status.add(option,0);
					}
					var cbb_producer = document.getElementById("add_producer");
					$("#add_producer").empty();
					for(var j=0; j<data.sub_category.length; j++)
					{
						var option = document.createElement('option');
						option.text = data.sub_category[j]["name"];
						option.value = data.sub_category[j]["id"];
						cbb_producer.add(option,0);
					}
				}
			});
		});
		$("#button_add_icon").live('click', function(){
			$('#adminAddProduct').hideModal();
			$("#addIconProduct").reveal();
		});
		$(".save_add_icon").on("click", function() {
			var formData = new FormData($('#addUploadForm')[0]);
			$.ajax({
			    url: "uploadImage.html",
			    type: "POST",
			    contentType: false,
			    processData: false,
			    cache: false,
			    data: formData,
			    success: function(data) {
			    	if(data.code == 1)
			    	{
			    		//alert("success");
			    		$("#addIconProduct").trigger('reveal:close');
			    		$('#adminAddProduct').reveal();
			    		$(".icon_content").empty();
			    		$(".icon_content").append('<img alt="" src="'+data.link+'" id="icon_content">');
			    		//$(".admin_detail_product_icon").append('<input type="hidden" class="name_icon_change" value="'+data.link+'" name="icon">')
			    		$("#add_icon_change").val(data.link);
			    	}
			    },
			    error: function() {
			        alert("unable to create the record");
			    }
			});
		});
		$(".add_product_add_image").live('click', function(){
			$('#adminAddProduct').hideModal();
			$("#addProductNewImage").reveal();
		});
		$(".save_add_new_image").live('click', function(){
			var formData = new FormData($('#addProductNewImageForm')[0]);
			$.ajax({
			    url: "addImageToGallery.html",
			    type: "POST",
			    contentType: false,
			    processData: false,
			    cache: false,
			    data: formData,
			    success: function(data) {
			    	if(data.code == 1)
			    	{
			    		//alert("success");
			    		$("#addProductNewImage").trigger('reveal:close');
			    		$('#adminAddProduct').reveal();
			    		$(".add_gallery_content").append('<div class="gallery_item" id=""><img alt="" src="'+data.link+'"><input type="button" value="Xóa" imageId="" class="gallary_delete_image"></div>');
			    		var list_id = $(".list_id_image_add").val();
			    		if(list_id != "")
			    			var new_list = list_id+"|"+data.id_image;
			    		else
			    			var new_list = data.id_image;
			    		$(".list_id_image_add").val(new_list);
			    	}
			    },
			    error: function() {
			        alert("unable to create the record");
			    }
			});
		});
	});
	
</script>
<div class="right_max_width">
<div class="form-message"></div>
	
	<h2 class="group_title">List Product</h2>
	<div class="clear"></div>
	
	<div class="hidden_info">
		<input type="hidden" class="category_id" id="category_id">
	</div>
	<div class="admin_action">
		<input type="button" id="add_product" value="Thêm sản phẩm" class="config_field">
		<input type="button" id="config_field" value="Cài đặt thuộc tính" class="config_field">
	</div>
	
	<table id="product_of_category">
		<tr>
			<th align="left">#</th>
			<th align="left">Tên sản phẩm</th>
			<th align="center">Mô tả</th>
			<th align="left">Giá</th>
			<th align="center">Thao tác</th>
		</tr>
		
	</table>
</div>
<div class="paging">
</div>
<div>
	<input id="total_rows" type="hidden">
	<input id="page_number_active" type="hidden">
	<input id="page_number_last" type="hidden">
</div>

<div id="adminDetailProduct" class="reveal-editrecordmodalwindow">
	<h4>Chi tiết sản phẩm</h4>
	<input type="hidden" id="dt_product_id">
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form action="" id="form_admin_detail_product" method="post" modelAttribute="Product">
			<div class="in-progress"></div>
			<div id="dt_tabs">
				<ul>
					<li><a href="#dt_tab1">Thông tin chung</a></li>
					<li><a href="#dt_tab2" class="dt_tab_item">Thuộc tính</a></li>
				</ul>
				<div class="modalContent" id="dt_tab1">
			
					<div class=admin_detail_product_item>
						<span>Hãng sản xuất</span><input class="detail_producer" type="text" name="producer">
					</div>
					<div class=admin_detail_product_item>
						<span>Tên sản phẩm</span><input class="detail_name" type="text" name="name">
					</div>
					<div class=admin_detail_product_item>
						<span class="dt_name_discription">Mô tả</span><textarea name="description" cols="40" rows="3" class="detail_description"></textarea>
					</div>
					<div class="admin_detail_product_icon">
						<span>Icon</span><div class="icon_content"></div>
					</div>
					<div class=admin_detail_product_item>
						<span class="dt_name_field">Giá</span><input class="detail_price" type="text"name="">
					</div>
					<div class=admin_detail_product_item>
						<span>Trạng thái</span><input class="detail_status" type="text">
					</div>
					<div class=admin_detail_product_item>
						<span>Khuyến mãi</span><input class="detail_promotion" type="text">
					</div>
					<div class=admin_detail_product_gallery>
						<div class="gallery_title">Gallery</div>
						<div class="gallery_content"></div>
						
					</div>
				</div>
				<div id="dt_tab2">
					<div class="dt_content_fields"></div>
				</div>
			</div>
			
			<div class="groupFormButton">
				<input class="formButton cancel  close-reveal-all" type="button" value="Cancel"/>
			</div>
		</form>
		
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="adminEditProduct" class="reveal-editrecordmodalwindow">
	<h4>Cập nhập sản phẩm</h4>
	<input type="hidden" id=edit_product_id>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		
			<div class="in-progress"></div>
			<div id="tabs">
				<ul>
					<li><a href="#tab1">Thông tin chung</a></li>
					<li><a href="#tab2" class="tab_item">Thuộc tính</a></li>
				</ul>
				<div class="modalContent" id="tab1">
				<form id="form_admin_edit_product" class="form_admin_edit_product" method="post" modelAttribute="Product">
				<div class=admin_detail_product_item>
					<span>Hãng sản xuất</span><input class="edit_producer" type="text" name="producer">
				</div>
				<div class=admin_detail_product_item>
					<span>Tên sản phẩm</span><input class="edit_name" type="text" name="name">
				</div>
				<div class=admin_dt_product_item_discript>
					<span  class="dt_name_discription">Mô tả</span><textarea name="description" cols="40" rows="3" class="edit_description"></textarea>
				</div>
				<div class="admin_dt_product_item_discript">
					<span class="dt_name_discription">Icon</span>
					<div class="icon_content">
					</div>
					<input type="button" value="Thay đổi icon" id="button_change_icon">
				</div>
				<div class=admin_detail_product_item>
					<span>Giá</span><input class="edit_price" type="text" name="price">
				</div>
				<div class=admin_detail_product_promotion>
					<span>Trạng thái</span><select id="edit_status"></select>
				</div>
				<div class=admin_detail_product_promotion>
					<span>Khuyến mãi</span><select id="edit_promotion"></select>
				</div>
				<div class=admin_detail_product_gallery id="gallery">
					<div class="gallery_title">Gallery</div>
					<div class="edit_gallery_content"></div>
					<input type="hidden" class="list_name_image" >
					<input type="button" value="Thêm ảnh" class="formButton edit_product_add_image">
				</div>
				<input type="hidden" name="id_product" id="edit_id_product">
				<input type="hidden" class="list_id_image_add" name="list_image_add">
				<input type="hidden" name="list_image_delete" id="list_id_image_delete">
				<input type="hidden" name="id_promotion" id="edit_id_promotion">
				<input type="hidden" name="id_status" id="edit_id_status">
				<input type="hidden" name="icon" id="edit_icon_change">
				</form>
				</div>
				<div id="tab2" class="tab2">
					<form class="form_edit_fields_product" id="form_edit_fields_product" method="post">
						<div class="content_fields"></div>
						<div class="groupFormButton">
							<input type="button" value="Lưu thuộc tính" id="bntSaveConfig">
						</div>
					</form>
					
				</div>
			</div>
			
			<div class="groupFormButton">
				<input class="formButton save_edit_product" type="button" value="Lưu"/>
				<input class="formButton cancel  close-reveal-all" type="button" value="Thoát"/>
			</div>
		
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="changeIconProduct" class="reveal-recordmodalwindow medium">
	<h4>Thay đổi icon sản phẩm</h4>
	<div class="in-progress"></div>
	<div class="modalChangeIconCentreContent">
		<div class="modalMess"></div>
			<div class="in-progress"></div>
			<div class="modalContent">							
				<form id="uploadForm">
				     <input type="file" name="myimage" id="imageid" accept=".png" />
				     			     
				</form>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_change_icon" type="button" value="Lưu"/>
				<input class="formButton cancel_change_icon" type="button" value="Thoát"/>
			</div>
	</div>
</div>
<div id="addIconProduct" class="reveal-recordmodalwindow medium">
	<h4>Chọn icon sản phẩm</h4>
	<div class="in-progress"></div>
	<div class="modalAddIconCentreContent">
		<div class="modalMess"></div>
			<div class="in-progress"></div>
			<div class="modalContent">							
				<form id="addUploadForm">
				     <input type="file" name="myimage" id="imageid" accept=".png" />
				     			     
				</form>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_add_icon" type="button" value="Lưu"/>
				<input class="formButton cancel_add_icon" type="button" value="Thoát"/>
			</div>
	</div>
</div>
<div id="addImageGalleryProduct" class="reveal-recordmodalwindow medium">
	<h4>Thêm ảnh</h4>
	<div class="in-progress"></div>
	<div class="modalChangeIconCentreContent">
		<div class="modalMess"></div>
			<div class="in-progress"></div>
			<div class="modalContent">							
				<form id="addImageForm">
				     <input type="file" name="myimage" id="image_item_id" accept=".png" />	
				     <span  class="">Mô tả</span><textarea name="image_description" cols="40" rows="3" class=""></textarea>			     
				</form>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_add_image" type="button" value="Lưu"/>
				<input class="formButton cancel_add_image" type="button" value="Thoát"/>
			</div>
	</div>
</div>
<div id="addProductNewImage" class="reveal-recordmodalwindow medium">
	<h4>Thêm ảnh</h4>
	<div class="in-progress"></div>
	<div class="modalNewImageCentreContent">
		<div class="modalMess"></div>
			<div class="in-progress"></div>
			<div class="modalContent">							
				<form id="addProductNewImageForm">
				     <input type="file" name="myimage" id="image_item_id" accept=".png" />	
				     <span  class="">Mô tả</span><textarea name="image_description" cols="40" rows="3" class=""></textarea>			     
				</form>
			</div>
			<div class="groupFormButton">
				<input class="formButton save_add_new_image" type="button" value="Lưu"/>
				<input class="formButton cancel_add_image" type="button" value="Thoát"/>
			</div>
	</div>
</div>
<div id="config_fields_modal" class="reveal-editrecordmodalwindow">
	<h4>Config Fields</h4>
	<div class="in-progress"></div>
	<div class="modalConfigFieldsCentreContent">
		<div class="modalMess"></div>
		<div class="config_fields_content">
			<form id="fields_product_form" class="fields_product_form" method="post">
				<div class="fields_input">
				</div>
				<div class="fields_button">
					<div class='add-new-field add'>Add new field</div>
					<div class='new-field'>
						<label>Group name</label><input id='group_name' type='text'></input>
						<label>Identity name</label><input id='identity_name' type='text'>
						<label>Field name</label><input id='field_name' type='text'></input>
						<input id='submit_new_field' type='button' value='Save'></input>
					</div>	
					<div class="groupFormButton">
						<input type="button" class="formButton editUserButton bntsubmit" value="Finish"/>
						<button class="formButton cancel close-reveal-all">Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
<div id="adminAddProduct" class="reveal-editrecordmodalwindow">
	<h4>Cập nhập sản phẩm</h4>
	<input type="hidden" id=edit_product_id>
	<div class="in-progress"></div>
	<div class="modalAddProductCentreContent">
		<div class="modalMess"></div>
		
			<div class="in-progress"></div>
			<div id="add_tabs">
				<ul>
					<li><a href="#add_tab1">Thông tin chung</a></li>
					<li><a href="#add_tab2" class="tab_item">Thuộc tính</a></li>
				</ul>
				<div class="modalContent" id="add_tab1">
				<form id="form_admin_add_product" class="form_admin_add_product" method="post" modelAttribute="Product">
				<div class=admin_add_product_name>
					<span>Hãng sản xuất</span><select id="add_producer"></select>
				</div>
				<div class=admin_detail_product_item>
					<span>Tên sản phẩm</span><input class="add_name" type="text" name="name">
				</div>
				<div class=admin_dt_product_item_discript>
					<span  class="dt_name_discription">Mô tả</span><textarea name="description" cols="40" rows="3" class="add_description"></textarea>
				</div>
				<div class="admin_dt_product_item_discript">
					<span class="dt_name_discription">Icon</span>
					<div class="icon_content">
					</div>
					<input type="button" value="Chọn icon" id="button_add_icon">
				</div>
				<div class=admin_detail_product_item>
					<span>Giá</span><input class="add_price" type="text" name="price">
				</div>
				<div class=admin_detail_product_promotion>
					<span>Trạng thái</span><select id="add_status"></select>
				</div>
				<div class=admin_detail_product_promotion>
					<span>Khuyến mãi</span><select id="add_promotion"></select>
				</div>
				<div class=admin_detail_product_gallery id="gallery">
					<div class="gallery_title">Gallery</div>
					<div class="add_gallery_content"></div>
					<input type="hidden" class="list_name_image" >
					<input type="button" value="Thêm ảnh" class="formButton add_product_add_image">
				</div>
				<input type="hidden" class="list_id_image_add" name="list_image_add">
				<input type="hidden" name="list_image_delete" id="list_id_image_delete">
				<input type="hidden" name="id_promotion" id="add_id_promotion">
				<input type="hidden" name="id_status" id="add_id_status">
				<input type="hidden" name="icon" id="add_icon">
				</form>
				</div>
				<div id="add_tab2" class="add_tab2">
					<form class="form_edit_fields_product" id="form_edit_fields_product" method="post">
						<div class="content_fields"></div>
						<div class="groupFormButton">
							<input type="button" value="Lưu thuộc tính" id="bntSaveConfig">
						</div>
					</form>
					
				</div>
			</div>
			
			<div class="groupFormButton">
				<input class="formButton save_add_product" type="button" value="Lưu"/>
				<input class="formButton cancel  close-reveal-all" type="button" value="Thoát"/>
			</div>
		
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
