<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Heroic Features - Start Bootstrap Template</title>
  
  <!-- 제이쿼리 -->
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js" ></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>
  
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
<%--   <link href="${pageContext.request.contextPath}/resources/css/heroic-features.css" rel="stylesheet"> --%>
  <jsp:include page="modal.jsp"></jsp:include>
  
</head>
<body>
  <!-- Page Content -->
  <div class="container">
    <!-- Jumbotron Header -->
    <header class="text-center" style="background-color: #e9ecef; padding:0.5rem; margin-bottom: 1rem; border-radius: 0.3rem;">
      <p style="margin:0; font-size:1.25rem">[ 제품 정보 ]</p>
    </header>
    <!-- Page Features -->
    <div class="row text-center">
      <!-- 제품 이미지랑 수량선택, 추가, 찜버튼 -->
      <div class="col-lg-6 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" id="imgg" src="${pageContext.request.contextPath}/resources/${food.img}" alt="" width="100%" height	="300px">
          <div class="card-footer">
          	<c:if test="${user!=null}">
	          	<form action="${pageContext.request.contextPath}/user/addEat.do" method="post">
			          <label for="quantityOption">수량</label> 
			          <select id="quantityOption" name="food_num">
			              <option value="1" selected>1</option>
			              <option value="2">2</option>
			              <option value="3">3</option>
			              <option value="4">4</option>
			              <option value="5">5</option>
			          </select>
			          <input type="hidden" name="user_uid" value="${user.uid}">
			          <input type="hidden" name="food_fcode" value="${food.code}">
			          <input type="submit" class="btn btn-primary" value="추가">
	          	</form>
          	</c:if>
	        <a href="#" class="btn btn-primary">찜</a>
          </div>
        </div>
      </div>
      <!-- 제품명,제조사,원재료,알레르기 -->
      <div class="col-lg-6 col-md-6 mb-4">
        <div class="card h-100">
         <table class="table">
          <tbody>
           <tr>
            <th scope="row" style="width:30%">제품명</th>
            <td id="prodName">${food.name}</td>
           </tr>
           <tr>
            <th scope="row" style="width:30%">제조사</th>
            <td id="prodPlant">${food.maker}</td>
           </tr>
           <tr>
            <th scope="row" style="width:30%">원재료</th>
            <td id="prodMaterial">
            	<c:if test="${food.materials!=null and not empty food.materials}">
	            	<c:forEach items="${food.materials}" var="material">
	            		<a>${material.mname}(${material.origin}),</a>
	            	</c:forEach>
            	</c:if>
            </td>
           </tr>
           <tr>
            <th scope="row" style="width:30%">알레르기 성분</th>
            <td id="prodAllergy">
<%--             	<c:if test="${user!=null}"> --%>
<%-- 	            	<c:forEach items="${user.allergy}" var="allergy"> --%>
<%-- 							<a>${allergy},</a> --%>
<%-- 						<c:if test="${food.material.contains(allergy)}"> --%>
<%-- 						</c:if> --%>
<%-- 					</c:forEach> --%>
<%--             	</c:if> --%>
            </td>
           </tr>
          </tbody>
         </table>
        </div>
      </div>
      <!-- 식품 영양정보 그래프 -->
      <div class="col-lg-6 col-md-6 mb-4">
        <div id="chart" class="card h-100">
        	<canvas id="myChart" width="400" height="400"></canvas>
         <!-- <img class="card-img-top" src="http://placehold.it/500x600" alt=""> -->
         <!-- <div id="piechart"></div> -->
        </div>
      </div>
      <!-- 식품 영양 정보 -->
      <div class="col-lg-6 col-md-6 mb-4">
        <div class="card h-100">
          <table class="table">
          <tbody>
           <tr>
            <th scope="row" style="width:40%">일일제공량</th>
            <td id="prodServing">${food.supportpereat}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">칼로리</th>
            <td id="prodNutr1">${food.calory}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">탄수화물</th>
            <td id="prodNutr2">${food.carbo}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">단백질</th>
            <td id="prodNutr3">${food.protein}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">지방</th>
            <td id="prodNutr4">${food.fat}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">당류</th>
            <td id="prodNutr5">${food.sugar}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">나트륨</th>
            <td id="prodNutr6">${food.natrium}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">콜레스테롤</th>
            <td id="prodNutr7">${food.chole}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">포화지방산</th>
            <td id="prodNutr8">${food.fattyacid}</td>
           </tr>
           <tr>
            <th scope="row" style="width:40%">트랜스지방</th>
            <td id="prodNutr9">${food.transfat}</td>
           </tr>
          </tbody>
         </table>
        </div>
      </div>
      
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
<script>
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['탄수화물','단백질','지방','당류','나트륨','콜레스테롤','포화지방산','트렌스지방'],
        datasets: [{
            label: '# of Votes',
            data: [${food.carbo},${food.protein},${food.fat},${food.sugar},${food.natrium},${food.chole},${food.fattyacid},${food.transfat}],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 100, 64, 0.2)',
                'rgba(30, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 100, 64, 1)',
                'rgba(30, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    }
});
</script>

</html>