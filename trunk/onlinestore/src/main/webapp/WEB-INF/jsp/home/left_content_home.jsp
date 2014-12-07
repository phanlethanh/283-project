<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		
		function  loadProductOfCategory(idParent)
		{
			$.ajax({
				url:"homeProductOfCategory.html",
				data:{id:idParent},
				type:"POST",
				success:function(data){
					if(data.code == 0)
					{
						$.ajax({
							url:"loadHomeProductOfCategory.html",
							type:"POST",
							data:{idCategory:data.id},
							success:function(data1)
							{
								$(".content_home").empty();
								for(var i = 0; i < data1.length; i++)
								{
									$(".content_home").append('<div class="product_box"><img src="'+data1[i]["icon"]+'" width="150" height="150"> <inputname="product_id" type="hidden" value="'+data1[i]["id"]+'" /><div>'+data1[i]["status"]+'<br />'+data1[i]["price"]+'<br />'+data1[i]["name"]+'<br /> <a href="productDetail.html?product_id='+data1[i]["id"]+'">Chi tiết</a></div></div>');
								}
								
							}
						});
						
					}
				}
			});
		}
		
		$("#home_category_tree").fancytree({
			autoActivate: false, // we use scheduleAction()
			autoCollapse: true,
		//	autoFocus: true,
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
				if(node.key != "_1" && node.key != "-2"){
					loadProductOfCategory(currentNode.key);
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
	});
	
</script>

<div id="home_category_tree">
		<ul>
			<li class="categorys expanded">Danh Mục Sản Phẩm
				<ul>
					<li class="category mobile_phones lazy hasmenu">Điện thoại
						<ul>
						</ul>
					</li>
					<li class="category lazy laptops hasmenu">Laptop
						<ul>
						</ul>
					</li>
					<li class="category tablets lazy hasmenu">Máy tính bảng
						<ul>
						</ul>
					</li>
					<li class="category headphones lazy hasmenu">Headphone
						<ul>
						</ul>
					</li>
					<li class="category accessories lazy hasmenu">Phụ kiện
						<ul>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>