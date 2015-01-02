<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		function home_paging(pageSize)
		{
			$(".home_paging").empty();
			var total_row = $('#home_total_rows').val();
			var page_count = 1;
			page_count = ((parseInt(total_row) / pageSize).toFixed(0) );
			if(page_count < (parseInt(total_row) / pageSize))
				page_count = parseInt(page_count) +1;
			var id = 0;
			if(document.getElementById("home_page_number_active") != null)
				var id = $("#home_page_number_active").val();
			
			var page_last = parseInt($("#home_page_number_last").val());
			var page_active = 0;
			if(page_last >= 10)
				page_active = page_last;
			else
			{
				if(id != 0)
					page_active = parseInt(id.substr(4,id.length));
			}
			if(page_active != 0)
			{
				if(parseInt(page_active) > 10)
				{
					if(parseInt(page_active) == parseInt(page_count))
					{
						$('.home_paging').append('<span><a class="page_number" page='+(1)+' id="page'+(1)+'" page_last='+(10)+'>First</a></span>');
						$('.home_paging').append('<span><a class="page_number" page='+(page_active - 10)+' id="page'+(page_active - 10)+'" page_last='+(page_active - 1)+'><</a></span>');
						for(i = page_active -10; i < page_active; i++)
						{
							$('.home_paging').append('<span><a class="page_number" page='+(i+1)+' id="page'+(i+1)+'" page_last='+(page_active - 1)+'>'+(i + 1)+'</a></span>');
						}
					}
					else
					{	
						$('.home_paging').append('<span><a class="page_number" page='+(1)+' id="page'+(1)+'" page_last='+(10)+'>First</a></span>');
						$('.home_paging').append('<span><a class="page_number" page='+(page_active - 10)+' id="page'+(page_active - 10)+'" page_last='+(page_active - 1)+'><</a></span>');
						for(i = page_active -10; i < page_active; i++)
						{
							$('.home_paging').append('<span><a class="page_number" page='+(i+1)+' id="page'+(i+1)+'" page_last='+(page_active - 1)+'>'+(i + 1)+'</a></span>');
						}
						//var temp = page_active + 1;
						$('.home_paging').append('<span><a class="page_number" page='+(page_active+ 1)+' id="page'+(page_active+1)+'" page_last='+(0)+'>></a></span>');
						$('.home_paging').append('<span><a class="page_number" page='+(page_count)+' id="page'+(page_count)+'" page_last='+(0)+'>Last</a></span>');
					}
		
				}
				else
				{
					if(page_count < 10 && page_count > 0)
					{
						for(i = 0; i < page_count; i++)
						{
							$('.home_paging').append('<span><a class="page_number" page='+(i+1)+' id="page'+(i+1)+'" page_last='+(page_active - 1)+'>'+(i + 1)+'</a></span>');
						}
					}
					else if(page_count > 0)
					{
						for(i = 0; i < 10; i++)
						{
							$('.home_paging').append('<span><a class="page_number" page='+(i+1)+' id="page'+(i+1)+'" page_last='+(page_active - 1)+'>'+(i + 1)+'</a></span>');
						}
						$('.home_paging').append('<span><a class="page_number" page='+(11)+' id="page'+(11)+'" page_last='+(0)+'>></a></span>');
						$('.home_paging').append('<span><a class="page_number" page='+(page_count)+' id="page'+(page_count)+'" page_last='+(0)+'>Last</a></span>');
					}
				}
			}
			else
			{
					if(page_count < 10 && page_count > 0)
					{
						for(i = 0; i < page_count; i++)
						{
							$('.home_paging').append('<span><a class="page_number" page='+(i+1)+' id="page'+(i+1)+'" page_last='+(page_count - 1)+'>'+(i + 1)+'</a></span>');
						}
					}
					else if(page_count > 0)
					{
						for(i = 0; i < 10; i++)
						{
							$('.home_paging').append('<span><a class="page_number" page='+(i+1)+' id="page'+(i+1)+'" page_last='+(0)+'>'+(i + 1)+'</a></span>');
						}
						$('.home_paging').append('<span><a class="page_number" page='+(11)+' id="page'+(11)+'" page_last='+(0)+'>></a></span>');
						$('.home_paging').append('<span><a class="page_number" page='+(page_count)+' id="page'+(page_count)+'" page_last='+(0)+'>Last</a></span>');
					}
			}
			if(id != 0)
			{
				if(document.getElementById(id) != null)
					document.getElementById(id).className = "page_number_active";
				else
				{
					var new_id = "page"+parseInt(id.substr(4,id.length)) - 1;
					//document.getElementById(new_id).className = "page_number_active";
				}
			}
		}
		function  loadProductOfCategory(idParent,pageNumber)
		{
			$.ajax({
				url:"homeProductOfCategory.html",
				data:{id:idParent},
				type:"POST",
				success:function(data){
					if(data.code == 0 || data.code == 1)
					{
						$.ajax({
							url:"loadHomeProductOfCategory.html",
							type:"POST",
							data:{idCategory:data.id,page_number:pageNumber},
							success:function(data)
							{
								var length = data.length;
								var total_rows = data[length - 1]["total_rows"];
								var page_size = data[length-1]["page_size"];
								$("#home_total_rows").val(total_rows);
								$(".content_home").empty();
								for(var i = 0; i < data.length - 1; i++)
								{
									//$(".content_home").append('<div class="product_box"><img src="'+data1[i]["icon"]+'" width="150" height="150"> <inputname="product_id" type="hidden" value="'+data1[i]["id"]+'" /><div>'+data1[i]["status"]+'<br />'+data1[i]["price"]+'<br />'+data1[i]["name"]+'<br /> <a href="productDetail.html?product_id='+data1[i]["id"]+'">Chi tiết</a></div></div>');
									$(".content_home").append('<div class="prod_box" product_id="'+data[i]["id"]+'"><div class="top_prod_box"></div><div class="center_prod_box"><div class="product_title"><a href="productDetail.html?product_id='+data[i]["id"]+'">'+data[i]["name"]+'</a></div><div class="product_img"><a href="productDetail.html?product_id='+data[i]["id"]+'"><img src="'+data[i]["icon"]+'" alt="" border="0" /></a></div><input name="product_id" type="hidden" value="'+data[i]["id"]+'" /><div class="prod_price"><span class="">'+data[i]["price"]+'</span> <span class="price">'+data[i]["status"]+'</span></div></div><div class="bottom_prod_box"></div><div class="prod_details_tab"> <a href="#" title="header=[Add to cart] body=[&nbsp;] fade=[on]"><img src="image/image_template/cart.gif" alt="" border="0" class="left_bt" /></a> <a href="productDetail.html?product_id='+data[i]["id"]+'" class="prod_details">Chi tiết</a> </div></div>');
								}
								home_paging(page_size);
								dragProduct();
							}
						});
						
					}
				}
			});
		}
		$('.home_paging .page_number').live('click', function(){
			page_number_active = $(this).attr('page');
			var page_last = $(this).attr('page_last');
			var id = "page"+page_number_active;
			document.getElementById(id).className = "home_page_number_active";
			document.getElementById("home_page_number_last").value = page_last;
			document.getElementById("home_page_number_active").value = id;
			var page = parseInt($(this).attr('page'));
			loadProductOfCategory(currentNode.key,page -1);
			//alert(page_number);
		});
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
					loadProductOfCategory(currentNode.key,0);
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
		dragProduct();
	});
	function dragProduct(){
		$( ".prod_box" ).draggable({
		      appendTo: "body",
		      helper: "clone"
		    });
	    $( ".shopping_cart" ).droppable({
	      activeClass: "",
	      hoverClass: "",
	      accept: ":not(.ui-sortable-helper)",
	      drop: function( event, ui ) {  
	        //$( this ).find( ".placeholder" ).remove();
	        //alert( ui.draggable.attr("product_id"));
	        window.location.href = 'addToCart.html?product_id=' + ui.draggable.attr("product_id");
	      }
	    }).sortable({
	      
	    });
	}
	
</script>
    <div class="left_content">
      <div class="title_box">Danh mục</div>
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
      <div class="title_box">Sản phẩm đặc sắc</div>
      <div class="border_box">
        <div class="product_title"><a href="productDetail.html?product_id=35">Asus Zenfone 5</a></div>
        <div class="product_img"><a href="productDetail.html?product_id=35"><img src="image/product_icon/asus-zenfone-5-icon.jpg" alt="" border="0" /></a></div>
        <div class="prod_price"><span class="reduce"></span> <span class="price">3,990,000</span> đ</div>
      </div>
      <div class="title_box">Đăng ký nhận tin</div>
      <div class="border_box">
        <input type="text" name="newsletter" class="newsletter_input" value="your email"/>
        <a href="#" class="join">Tham gia</a> </div>
      <div class="banner_adds"> <a href="#"><img src="images/bann2.jpg" alt="" border="0" /></a> </div>
    </div>
