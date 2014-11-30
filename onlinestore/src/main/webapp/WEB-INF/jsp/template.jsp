<%@taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><tiles:insertAttribute name="title"/></title>
<link rel="stylesheet" type="text/css" href="/onlinestore/css/style.css">
</head>
<body>
	<div class="banner_top"></div>
    <div class="header">
    	<tiles:insertAttribute name="header"/>
    </div>
    <div class="content">
    	<tiles:insertAttribute name="content"/>
    </div>
    <div class="footer">
    	<tiles:insertAttribute name="footer"/>
    </div>
</body>
</html>