<%@page import="java.io.Console"%>
<%@page import="com.ssafy.model.vo.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>호빈이와 주성이</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
<!--
Custom styles for this template -->body {
	padding-top: 56px;
}
</style>
<script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
		
    </script>
</head>
<body>
	<div class="container">
		<header class="jumbotron my-4 text-center" style="background-image: url(img/food-illustration.jpg)">
			<h1 class="display-3">문제가 발생했습니다</h1>
			<p class="lead">${errorMsg}</p>
			<p class="lead">${error}</p>
		</header>
	</div>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 호빈이와 주성이 2019 -> Contact us</p>
			<ul class="m-0 text-white">
				<li>이호빈</li>
				<li>박주성</li>
			</ul>
		</div>
	</footer>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>