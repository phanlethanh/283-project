<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.product_box {
	background-color: white;
	height: 230px;
	width: 230px;
	padding: 10px;
	border: 1px solid gray;
	float: left;
}
</style>

<div>
	<c:forEach var="product" items="${productMapList}">
		<div class="product_box">
			<img src="${product['icon']}" width="150" height="150"> <input
				name="product_id" type="hidden" value="${product['id']}" />
			<div>
				<c:out value="${product['status']}" />
				<br />
				<c:out value="${product['price']}" />
				đ <br />
				<c:out value="${product['name']}" />
				<br /> <a href="productDetail.html?product_id=${product['id']}">Chi tiết</a>
			</div>
		</div>
	</c:forEach>
</div>