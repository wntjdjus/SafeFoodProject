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
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
<!--
Custom styles for this template -->body {
	padding-top: 56px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<jsp:include page="modal.jsp"></jsp:include>
</head>
<%
// 	List<Food> foods=null;
// 	foods=(List<Food>)request.getAttribute("foods");
%>
<body>
	<!-- Page Content -->
	<div class="container">
	
		<!-- Jumbotron Header -->
		<header class="jumbotron my-4 text-center" style="background-image: url(${pageContext.request.contextPath}/resources/img/food-illustration.jpg)">
			<h1 class="display-3">WHAT WE PROVIDE</h1>
			<p class="lead">건강한 삶을 위한 먹거리 프로젝트</p>
		</header>
		
		<!-- Search section -->
		<div class="bg-dark text-center" style="padding: 20px; margin: 10px 0">
			<div class="container">
				<div class="row">
					<!--                    input-group을 해줘야 float처럼 하나로 쭉 붙음-->
					<form method="get" action="${pageContext.request.contextPath}/food/search.do">
						<div class="input-group">
							<select name="key">
								<option value="all">전체</option>
								<option value="name">이름</option>
								<option value="maker">제조사</option>
								<option value="material">원재료</option>
							</select>
							<input type="text" class="form-control" name="stmt" placeholder="Search term..." id="search_text" style="width: 700px">
							<input type="submit" class="btn btn-primary" id="search_button" value="검색">
							<input type="hidden" name="action" value="search">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Page Features -->
		<div class="row text-center" id="list">
			<c:if test="${foodList!=null and not empty foodList}">
				<c:forEach items="${foodList}" var="food" varStatus="status">
					<div class='col-lg-3 col-md-6 mb-4'>
						<div class='card h-100'>
							<img class='card-img-top' src="${pageContext.request.contextPath}/resources/${food.img}" alt=''>
							<div class='card-body'>
								<h4 class='card-title'>${food.name}</h4>
								<%-- 		      					<p class='card-text'>${food.material}</p> --%>
							</div>
							<div class='card-footer'>
								<a href='${pageContext.request.contextPath}/food/detail.do?code=${food.code}' class='btn btn-primary'>Find Out More!</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 2019 -> Contact us</p>
			<ul class="m-0 text-white">
				<li>박주성</li>
				<li>전건욱</li>
				<c:if test="${user!=null and user.uid eq 'admin'}">
					<li><a href="${pageContext.request.contextPath}/food/saveDB.do">DB저장</a></li>
				</c:if>
			</ul>
		</div>
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>