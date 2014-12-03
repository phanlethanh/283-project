<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/onlinestore/script/jquery.fancytree.js" ></script>
<link rel="stylesheet" type="text/css" href="/onlinestore/css/ui.fancytree.css">
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
			//tabbable: false, // we don't want the focus frame
			// scrollParent: null, // use $container
			/*focus: function(event, data) {
				var node = data.node;
				// Auto-activate focused node after 1 second
				if(node.data.href){
					node.scheduleAction("activate", 1000);
				}
			},*/
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
				if(node.extraClasses.indexOf("category") != -1){
					//loadCostCentreList();
				}
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
						$("#addCategoryCentreModal #CategoryCode").val("");
						$("#addCategoryCentreModal #CategoryName").val("");
						$("#addCategoryCentreModal #CategoryDescription").val("");
						event.preventDefault();
						$("#addCategoryCentreModal").reveal();
						   $.ajax({
								type: 'POST',
								url: "getcode.html",
								data: {model: 'Category',parent:currentNode.key},
								success: function(response){
									var data = JSON.parse(response);
									$("#addCategoryCentreModal #CategoryCode").val(data.code);
								}, 
								error : function(jqXHR, status, errorThrown){ 
									if (errorThrown == 'Internal Server Error'){
										var redirect = "admin.html";
										window.location = redirect;
									}
								}
							});
						
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