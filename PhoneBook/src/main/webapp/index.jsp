<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/home3.jpeg");
	width: 100%;
	height: 95vh;
	background-repeat: no repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<div class="container-fluid back-img text-center text-success">
		<h1 class="text-dark">Welcome To PhoneBook</h1>
		<%@include file="component/footer.jsp"%>
	</div>


</body>
</html>