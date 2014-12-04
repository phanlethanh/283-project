<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
	$(document).ready(function()
	{
		$("#tree").fancytree({
			autoActivate: false, // we use scheduleAction()
			autoCollapse: true,
//			autoFocus: true,
			autoScroll: true,
			clickFolderMode: 3, // expand with single click
			minExpandLevel: 2,
			tabbable: false, // we don't want the focus frame
			// scrollParent: null, // use $container
			focus: function(event, data) {
				var node = data.node;
				// Auto-activate focused node after 1 second
				if(node.data.href){
					node.scheduleAction("activate", 1000);
				}
			},
			blur: function(event, data) {
				data.node.scheduleAction("cancel");
			},
			activate: function(event, data){
				var node = data.node,
					orgEvent = data.originalEvent;

				if(node.data.href){
					window.open(node.data.href, (orgEvent.ctrlKey || orgEvent.metaKey) ? "_blank" : node.data.target);
				}
			},
			click: function(event, data){ // allow re-loads
				var node = data.node,
				orgEvent = data.originalEvent;
				currentNode = node;
				/*if(node.extraClasses.indexOf("category") != -1){
					//loadCostCentreList();
				}*/
				if(node.isActive() && node.data.href){
					data.tree.reactivate();
					window.open(node.data.href, (orgEvent.ctrlKey || orgEvent.metaKey) ? "_blank" : node.data.target);
				}
			},
     		lazyLoad: function(event, data){
				var node = data.node;
				var classes = data.node.extraClasses;
				
				data.result = $.ajax({
					url:"category.html",
					method:"POST",
					data:{type:classes,parent:node.key},
					dataType:"json"
				});
			},
	
		});
		$(document).contextmenu({
			delegate: ".hasmenu",
			menu: [
				{title: "NEW CATEGORY", cmd: "new-category", uiIcon: "ui-icon-plus"},
				{title: "EDIT CATEGORY", cmd: "edit-category", uiIcon: "ui-icon-pencil"},
				{title: "DELETE CATEGORY", cmd: "delete-category", uiIcon: "ui-icon-minus"},
				],
			beforeOpen: function(event, ui) {
				currentNode = $.ui.fancytree.getNode(ui.target);
				
				var menu = ui.menu;
				var target = ui.target;
				var extraData = ui.extraData; // optionally passed when menu was opened by call to open()
				
				
				var arr = $(event.currentTarget);
				
				if(arr.hasClass('categorys')){
					hideCm("category",['new'],true);
				}  else if(arr.hasClass('category')){
					hideCm("category",['new','edit','delete'],true);
				}
				
				 
			
			},
			 select: function(event, ui) {

				var node = $.ui.fancytree.getNode(ui.target);
				currentNode = node;
				switch(ui.cmd){
					case 'new-category':
						$("#addCategoryCentreModal #categoryName").val("");
						$("#addCategoryCentreModal #categoryDescription").val("");
						event.preventDefault();
						$("#addCategoryCentreModal").reveal();
						  
						
						break;
					case 'edit-category':
						var id = currentNode.key;
						$("#editCategoryCentreModal").reveal();
						currentNode = node.getParent();
						//$(".modalEditCategoryCentreContent").load("<?php echo Router::url(array('plugin' => false, 'controller' => 'settings', 'action' => 'editCostCentre'), true); ?>", {id: id}, function(e){      
						//});
						break;
					case 'delete-category':
						event.preventDefault();
						event.stopPropagation();
						createConfirm(".main_scroll", "Delete Category", "Are you sure delete?", 'deleteCategoryCentre');	
						var id = currentNode.key;
						currentNode = node.getParent();
						if($('#confirmModaldeleteCategoryCentre span').length <= 0)
						{
							$('#confirmModaldeleteCategoryCentre').append('<span style="display: none">'+id+'</span>');
						} else 
						{
							$('#confirmModaldeleteCategoryCentre span').empty().text(id);
						}	
						break;
				}
			}
		});
		
		$("#addCategoryCentreModal .bntsubmit").live('click', function(e){
				$( ".rowform span" ).remove();
				$( ".modalMess p" ).remove();
				$( "input" ).removeClass("texterror");
				e.preventDefault();
				var data_form = $('#addCategoryCentreModal #form_add_subcategory').serialize();
				$.ajax({
					url: "addSubCategory.html",
					type: "POST",
					data: data_form,
					success: function(data){
						//var data = JSON.parse(data);
						if(data.code == 1){
							$('#form_add_subcategory').trigger('reveal:close');
							 //loadCostCentreList(data.mess);
							 currentNode.resetLazy();//load node tree left
							 currentNode.toggleExpanded();
						} else {
							$( ".rowform span" ).remove();
							$("#addCostCentreModal .modalMess").show().html("<p>" + data.mess + "</p>");
							if(data.error.code){
								$("#addCostCentreModal #CcliCode").addClass('texterror');
								if($("#addCostCentreModal #CcliCode span").length <= 0)
									$("#addCostCentreModal #CcliCode").after('<span>' + data.error.code + '</span>');
							}
							if(data.error.name){
								$("#addCostCentreModal #CcliName").addClass('texterror');
								if($("#addCostCentreModal #CcliName span").length <= 0)
									$("#addCostCentreModal #CcliName").after('<span>' + data.error.name + '</span>');
							}
						}
					},
					error : function(jqXHR, status, errorThrown){ 
						
					}
				});
			});
	});
	function hideCm(name, all, is_show){
		if(all instanceof Array){
			for(var i = 0; i < all.length; i++){
				$(document).contextmenu("showEntry",all[i] + '-' + name,is_show);
			}
		}
	}
</script>
<div class="group_product">
	<div class="top_group_product">
		<p><?php echo __('All items');?></p>
		<div class="clear"></div>
	</div>
	<div id="tree">
		<ul>
			<li class="categorys lazy folder hasmenu expand">
				Category
			</li>
		</ul>
	</div>
</div>
<div id="addCategoryCentreModal" class="reveal-modaladd medium">
	<h4>Add Category Centre</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form action="" id="form_add_subcategory" class="addSubCategory" method="post" modelAttribute="Category">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class="info_add_category">
					<span>Name Category</span>
					<input id="categoryName" type="text">
				</div>
				<div class="info_add_category">
					<span>Description</span>
					<input id="categoryDescription" type="text">
				</div>
				
			</div>
			<div class="groupFormButton">
				<input type="submit" class="formButton addCcliButton bntsubmit" value="Add"/>
				<input class="formButton cancel close-reveal-all" type="button" value="Cancel"/>
			</div>
		</form>
		
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>
