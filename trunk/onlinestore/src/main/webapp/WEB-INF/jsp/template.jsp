<%@taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><tiles:insertAttribute name="title"/></title>
<link rel="stylesheet" type="text/css" href="/onlinestore/css/style.css">
<link rel="stylesheet" type="text/css" href="/onlinestore/css/reveal.css">
<script type="text/javascript" src="/onlinestore/script/jquery-1.7.js" ></script>
<script type="text/javascript" src="/onlinestore/script/jquery.reveal.js" ></script>
<script type="text/javascript" src="/onlinestore/script/jquery-ui-1.11.0.min.js" ></script>
<script type="text/javascript" src="/onlinestore/script/jquery.ui-contextmenu.js" ></script>
<script type="text/javascript" src="/onlinestore/script/jquery.fancytree.js" ></script>
<link rel="stylesheet" type="text/css" href="/onlinestore/css/ui.fancytree.css">
<link rel="stylesheet" type="text/css" href="/onlinestore/css/jquery-ui.min.css">
<script type="text/javascript" src="/onlinestore/script/ebanhang.min.js" ></script>

<link rel="stylesheet" type="text/css" href="/onlinestore/css/style_template.css">

</head>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".login").live('click',function(){
			document.getElementById("form_login_content").reset();
			<% if(session.getAttribute("os_username") != null){
				%>
					window.location="homes.html";
				<%
				}else{ %>
					$("#form_login").reveal();
				<%}%>
		});
		
		//$(".register").die('click');
		$(".register").live("click", function(){
			
			$("#form_register").reveal();
		});
		
		$("#register_submit").live('click', function(){
			var data_form = $("form.form_register").serialize();
			$.ajax({
				url:"register.html",
				type:"POST",
				data:data_form,
				success: function(data){
					var data1 = data[0]; 
					//alert(data1);
					$('#form_register').trigger('reveal:close');
				},
				error : function(jqXHR, status, errorThrown){ 
					alert("Not success");
				}
			});
		});
		
		$("#login_submit").live("click", function(){
			var data_form = $("form.form_login").serialize();
			
				$.ajax({
					url:"login.html",
					type:"POST",
					data:data_form,
					success: function(data){
						var data = data["code"]; 
						if(data == "2")
						{
							$('#form_login').trigger('reveal:close');
							window.location="homes.html";
						}
						else if(data == "1")
						{
							$('#form_login').trigger('reveal:close');
							window.location="admin.html";	
						}
						else
						{
							
							$("#login_message").text("Sai tên đăng nhập hoặc mật khẩu")
						}
					},
					error : function(jqXHR, status, errorThrown){ 
						alert("Not success");
					}
				});
			
			
			
		});
	});
</script>
<body>
	<div id="main_container">
		<div class="banner_top">
		<div class="top_bar">
		
	    <div class="top_search">
	      <div class="search_text"><a href="#">Tìm kiếm</a></div>
	      <input type="text" class="search_input" name="search"  id="keyword" placeholder="Nhập tên sản phẩm cần tìm kiếm" value="${keyword}"/>
	      <input type="image" src="image/image_template/search.gif" class="search_bt" id="search_submit" onclick="searchOnClick()"/>
	    </div>
	    <div class="search_box">
		<div class="search_select">
			<span class="index_select"><select id="category_select">
				<%
				String categorySelected;
				List<HashMap<String, Object>> categoryMapList
					= (List<HashMap<String, Object>>) session.getAttribute("categoryMapList");
				if (null == request.getParameter("category_id")) {
					categorySelected = "0";
				} else {
					categorySelected = request.getParameter("category_id");
				}
				int size = categoryMapList.size();
				for (int i = 0; i < size; i++) {
					HashMap<String, Object> map = categoryMapList.get(i);
					String tempId = map.get("categoryId").toString();
					String tempName = map.get("categoryName").toString();
					if (categorySelected.compareTo(tempId) == 0) {
					%>
						<option selected="selected" value="<%=tempId%>"><%=tempName%></option>
					<% } else {
					%>
						<option value="<%=tempId%>"><%=tempName%></option>
					<%
					}
				}
				%>
			</select></span>
		</div>
		<div class="clear_left"></div>
	</div>
		</div>
	    <div class="header">
	    	<tiles:insertAttribute name="header"/>
	    </div>
	    <div class="content">
	    	<div class="content_left">
	    		<tiles:insertAttribute name="left_content" />
	    	</div>
	    	<div class="main_content">
	    		
	    		<tiles:insertAttribute name="content"/>
	    	</div>
	    	
	    	
	    </div>
	    <div class="footer">
	    	<tiles:insertAttribute name="footer"/>
	    </div>
	    <div id="test"></div>
	</div>
	
</body>
</html>