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
<script type="text/javascript">
		// user.allergys에 들어있는 걸 자바스크립트에 다시 복사해주기 위해서 EL태그를 씀
	    var allergys = [];
		<c:forEach items="${allergy}" var="allergyy">
			allergys.push('${allergyy}');
		</c:forEach>
		
		var allergys_m = [];
		<c:forEach items="${allergy}" var="allergyy">
			allergys_m.push('${allergyy}');
		</c:forEach>
	
		// 페이지가 모두 렌더링되고 나서 해야되기 때문에 $(function(){})을 써줘야 한다.
		$(function(){
			for (var i = 0; i < allergys.length; i++) {
				var tmp = allergys[i] + "_m";
				console.log(tmp);
				$("#"+tmp).attr("checked", "checked");
			}
			
// 			for (var i = 0; i < allergys_m.length; i++) {
// 				var tmp = allergys[i];
// 				console.log(tmp);
// 				$("#"+tmp).attr("checked", "checked");
// 			}
			
// 			var logout = ${logout};
			
// 			if(logout){
// 				alert("로그아웃 성공입니다");
// 			} else {
// 				alert("로그아웃 실패입니다");
// 			}
			
// 			var deletee = ${deletee};
			
// 			if(deletee){
// 				alert("회원 삭제 성공입니다");
// 			} else {	
// 				alert("회원 삭제 실패입니다");
// 			}
			
// 			var signup = ${signup};
			
// 			if(signup){
// 				alert("회원 가입 성공입니다");
// 			} else{
// 				alert("회원 가입 실패입니다");
// 			}
			
// 			var modify = ${modify};
			
// 			if(modify){
// 				alert("수정 성공입니다");
// 			} else{
// 				alert("수정 실패입니다");
// 			}
		});
		
		function signup(){
			if(register_id.value==""){
				alert("아이디를 입력하세요!");
				register_id.focus();
				return;
			}
			if(register_pw.value==""){
				alert("비밀번호를 입력하세요!");
				register_pw.focus();
				return;
			}
			if(register_pw.value!=register_pw2.value){
				alert("비밀번호와 비밀번호 확인이 다릅니다!");
				register_pw.focus();
				return;
			}
			signupForm.submit();
		}
		
		function login(){
			if(id.value==""){
				alert("아이디를 입력하세요!");
				id.focus();
				return;
			}
			if(pw.value==""){
				alert("비밀번호를 입력하세요!");
				pw.focus();
				return;
			}
			loginForm.submit();
		}
		
		function modify(){
			if(modify_pw.value==""){
				alert("비밀번호를 입력하세요!");
				modify_pw.focus();
				return;
			}
			modifyForm.submit();
		}
		
    </script>
</head>
<%
	List<Food> foods=null;
	foods=(List<Food>)request.getAttribute("foods");
%>
<body>
		<!--로그인 modal-->

	<div class="modal fade" id="Modal_login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel"><a href="${pageContext.request.contextPath}/user/goHome.do">GUNSUNG</a></h4>
<!-- 					<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
				</div>

				<form action="${pageContext.request.contextPath}/user/login.do" method="post" name="loginForm">
<!-- 					<input type="hidden" name="action" value="login"> -->
					<div class="modal-body">
						<div class="input-group input-group-sm">
							<span>아이디</span>
							<input type="text" name="uid" class="form-control" id="id" placeholder="ID" aria-describedby="sizing-addon1">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>비밀번호</span>
							<input type="text" name="upw" class="form-control" id="pw" placeholder="Password" aria-describedby="sizing-addon2">
						</div>
					</div>

					<div class="modal-footer">
						<a href="javascript:login()" class="btn btn-primary">login</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!--회원가입 modal-->

	<div class="modal fade" id="Modal_signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/signup.do" method="post" name="signupForm">
<!-- 					<input type="hidden" name="action" value="signup"> -->
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">GUNSUNG</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<div class="input-group input-group-sm">
							<span>아이디 </span>
							<input type="text" class="form-control" placeholder="ID" aria-describedby="sizing-addon1" name="uid" id="register_id">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>비밀번호</span>
							<input type="text" class="form-control" placeholder="Password" aria-describedby="sizing-addon2" name="upw" id="register_pw">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>비밀번호 확인</span>
							<input type="text" class="form-control" placeholder="Password" aria-describedby="sizing-addon2" id="register_pw2">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>이 름</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2" name="uname" id="register_myname">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>주소</span>
							<input type="text" class="form-control" placeholder="address" aria-describedby="sizing-addon2" name="address" id="register_address">
						</div>
						<div class="input-group input-group-sm">
							<span>전화번호</span>
							<input type="text" class="form-control" placeholder="Phone" aria-describedby="sizing-addon2" name="phone" id="register_phone">
						</div>
						<div class="input-group input-group-sm">
							<span>알레르기</span>
						</div>
						<fieldset>
							<legend>Check</legend>
							<input type="checkbox" name="allergy" id="대두" value="대두">
							<label for="대두">대두</label>
							<input type="checkbox" name="allergy" id="땅콩" value="땅콩">
							<label for="땅콩">땅콩</label>
							<input type="checkbox" name="allergy" id="우유" value="우유">
							<label for="우유">우유</label>
							<input type="checkbox" name="allergy" id="게" value="게">
							<label for="게">게</label>
							<input type="checkbox" name="allergy" id="새우" value="새우">
							<label for="새우">새우</label>
							<input type="checkbox" name="allergy" id="참치" value="참치">
							<label for="참치">참치</label>
							<input type="checkbox" name="allergy" id="연어" value="연어">
							<label for="연어">연어</label>
							<input type="checkbox" name="allergy" id="쑥" value="쑥">
							<label for="쑥">쑥</label>
							<input type="checkbox" name="allergy" id="소고기" value="소고기">
							<label for="소고기">소고기</label>
							<input type="checkbox" name="allergy" id="닭고기" value="닭고기">
							<label for="닭고기">닭고기</label>
							<input type="checkbox" name="allergy" id="돼지고기" value="돼지고기">
							<label for="돼지고기">돼지고기</label>
							<input type="checkbox" name="allergy" id="복숭아" value="복숭아">
							<label for="복숭아">복숭아</label>
							<input type="checkbox" name="allergy" id="민들레" value="민들레">
							<label for="민들레">민들레</label>
							<input type="checkbox" name="allergy" id="계란흰자" value="계란흰자">
							<label for="계란흰자">계란흰자</label>
						</fieldset>
					</div>


					<div class="modal-footer">
						<a href="javascript:signup()" class="btn btn-primary">가입하기</a>
<!-- 						<input type="submit" class="btn btn-primary" value="signup"> -->
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- 내 정보 modal-->

	<div class="modal fade" id="Modal_myinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/modify.do" method="post">
<!-- 					<input type="hidden" name="action" value="modify"> -->
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">GUNSUNG</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
<!-- 					user.id처럼 세션에 user라는 속성에서 꺼내옴 -->
					<div class="modal-body">
						<div class="input-group input-group-sm">
							<span>아이디 </span>
							<input type="text" class="form-control" placeholder="ID" aria-describedby="sizing-addon1" name=modify_id value="${user.uid}" readonly>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>비밀번호</span>
							<input type="text" class="form-control" placeholder="Password" aria-describedby="sizing-addon2" name=modify_pw value="${user.upw}" readonly>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>이 름</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2" name=modify_myname value="${user.uname}" readonly>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>주소</span>
							<input type="text" class="form-control" placeholder="address" aria-describedby="sizing-addon2" name=modify_address value="${user.address}" readonly>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>전화번호</span>
							<input type="text" class="form-control" placeholder="Phone" aria-describedby="sizing-addon2" name=modify_phone value="${user.phone}" readonly>
						</div>
						<div class="input-group input-group-sm">
							<span>알레르기</span>
						</div>
						<fieldset>
							<legend>Check</legend>
							<input type="checkbox" name="allergy_m" id="대두_m" value="대두_m" disabled>
							<label for="대두_m">대두</label>
							<input type="checkbox" name="allergy_m" id="땅콩_m" value="땅콩_m" disabled>
							<label for="땅콩_m">땅콩</label>
							<input type="checkbox" name="allergy_m" id="우유_m" value="우유_m" disabled>
							<label for="우유_m">우유</label>
							<input type="checkbox" name="allergy_m" id="게_m" value="게_m" disabled>
							<label for="게_m">게</label>
							<input type="checkbox" name="allergy_m" id="새우_m" value="새우_m" disabled>
							<label for="새우_m">새우</label>
							<input type="checkbox" name="allergy_m" id="참치_m" value="참치_m" disabled>
							<label for="참치_m">참치</label>
							<input type="checkbox" name="allergy_m" id="연어_m" value="연어_m" disabled>
							<label for="연어_m">연어</label>
							<input type="checkbox" name="allergy_m" id="쑥_m" value="쑥_m" disabled>
							<label for="쑥_m">쑥</label>
							<input type="checkbox" name="allergy_m" id="소고기_m" value="소고기_m" disabled>
							<label for="소고기_m">소고기</label>
							<input type="checkbox" name="allergy_m" id="닭고기_m" value="닭고기_m" disabled>
							<label for="닭고기_m">닭고기</label>
							<input type="checkbox" name="allergy_m" id="돼지고기_m" value="돼지고기_m" disabled>
							<label for="돼지고기_m">돼지고기</label>
							<input type="checkbox" name="allergy_m" id="복숭아_m" value="복숭아_m" disabled>
							<label for="복숭아_m">복숭아</label>
							<input type="checkbox" name="allergy_m" id="민들레_m" value="민들레_m" disabled>
							<label for="민들레_m">민들레</label>
							<input type="checkbox" name="allergy_m" id="계란흰자_m" value="계란흰자_m" disabled>
							<label for="계란흰자_m">계란흰자</label>
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_modify">수정</button>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_delete">탈퇴</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 modal-->
	<div class="modal fade" id="Modal_changepassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/findpassword.do" method="post">
<!-- 					<input type="hidden" name="action" value="modify"> -->
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">GUNSUNG</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
<!-- 					user.id처럼 세션에 user라는 속성에서 꺼내옴 -->
					<div class="modal-body">
						<div class="input-group input-group-sm">
							<span>아이디 </span>
							<input type="text" class="form-control" placeholder="ID" aria-describedby="sizing-addon1" name=uid>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>전화번호</span>
							<input type="text" class="form-control" placeholder="Phone" aria-describedby="sizing-addon2" name=phone>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>비밀번호</span>
							<input type="text" class="form-control" placeholder="Password" aria-describedby="sizing-addon2" name=upw>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" >비밀번호 수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<!-- 게시판 -->
	<div class="modal fade" id="Modal_notice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
								<a href="#Modal_notice_detail">메롱메롱</a>
				<c:if test="${not empty noticeList and noticeList != null}">
					<table>
						<tr>
							<td>게시글 번호</td>
							<td>제 목</td>
							<td>글쓴이</td>
							<td>날 짜</td>
						<tr>
						<c:forEach items="${noticeList}" var="notice" varStatus="status">
							<tr>
								<td>${notice.index}</td>
								<td><a href="#Modal_notice_detail">${notice.title}</a></td>
								<td>${notice.author}</td>
								<td>${notice.date}</td>
							<tr>																	
						</c:forEach>
					</table>
					<c:if test="${user.uid == 'administer'}">
					</c:if>
				</c:if>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_new_Notice">새 글</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="Modal_new_Notice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/new_notice.do">
					<h1>새로운 공지사항 작성</h1>
						<c:choose>
							<c:when test="${not empty notice}">
								<table>
									<tr>
										<td>제목</td>
										<td><input type="text" name = "notice_contents" style="width:250px;"/>${notice.title}</td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name = "notice_contents" style="width:250px; height:300px">${notice.content}</textarea></td>
									</tr>
								</table>
							</c:when>
							<c:otherwise>
								<table>
									<tr>
										<td>제목</td>
										<td><input type="text" name = "notice_contents" style="width:250px;"/></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name = "notice_contents" style="width:250px; height:300px"></textarea></td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>
					<input type="submit" value="확인"/>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="Modal_notice_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/notice_detail.do">
					<%-- <h1>${notice.index}. ${notice.title}</h1>
					<table>
						<tr>
							<td>내용</td>
							<td><textarea name = "notice_content">${notice.contents}</textarea></td>
						</tr>
					</table>
					<h1>${notice.date}</h1> --%>
					<input type="submit" value="확인"/>
					<input type="submit" value="수정"/>
					<input type="submit" value="삭제"/>
				</form>
			</div>
		</div>
	</div>
	
	
	<!-- 내 정보 수정 modal-->

	<div class="modal fade" id="Modal_modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/modify.do" method="post" name="modifyForm">
<!-- 					<input type="hidden" name="action" value="modify"> -->
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">GUNSUNG</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
<!-- 					user.id처럼 세션에 user라는 속성에서 꺼내옴 -->
					<div class="modal-body">
						<div class="input-group input-group-sm">
							<span>아이디 </span>
							<input type="text" class="form-control" placeholder="ID" aria-describedby="sizing-addon1" name="uid" value="${user.uid}" id="modify_id" readonly>
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>비밀번호</span>
							<input type="text" class="form-control" placeholder="Password" aria-describedby="sizing-addon2" name="upw" value="${user.upw}" id="modify_pw">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>이 름</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2" name="uname" value="${user.uname}" id="modify_myname">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>주소</span>
							<input type="text" class="form-control" placeholder="address" aria-describedby="sizing-addon2" name="address" value="${user.address}" id="modify_address">
						</div>
						<br>
						<div class="input-group input-group-sm">
							<span>전화번호</span>
							<input type="text" class="form-control" placeholder="Phone" aria-describedby="sizing-addon2" name="phone" value="${user.phone}" id="modify_phone">
						</div>
						<div class="input-group input-group-sm">
							<span>알레르기</span>
						</div>
						<fieldset>
							<legend>Check</legend>
							<input type="checkbox" name="allergy" id="대두_m" value="대두">
							<label for="대두">대두</label>
							<input type="checkbox" name="allergy" id="땅콩_m" value="땅콩">
							<label for="땅콩">땅콩</label>
							<input type="checkbox" name="allergy" id="우유_m" value="우유">
							<label for="우유">우유</label>
							<input type="checkbox" name="allergy" id="게_m" value="게">
							<label for="게">게</label>
							<input type="checkbox" name="allergy" id="새우_m" value="새우">
							<label for="새우">새우</label>
							<input type="checkbox" name="allergy" id="참치_m" value="참치">
							<label for="참치">참치</label>
							<input type="checkbox" name="allergy" id="연어_m" value="연어">
							<label for="연어">연어</label>
							<input type="checkbox" name="allergy" id="쑥_m" value="쑥">
							<label for="쑥">쑥</label>
							<input type="checkbox" name="allergy" id="소고기_m" value="소고기">
							<label for="소고기">소고기</label>
							<input type="checkbox" name="allergy" id="닭고기_m" value="닭고기">
							<label for="닭고기">닭고기</label>
							<input type="checkbox" name="allergy" id="돼지고기_m" value="돼지고기">
							<label for="돼지고기">돼지고기</label>
							<input type="checkbox" name="allergy" id="복숭아_m" value="복숭아">
							<label for="복숭아">복숭아</label>
							<input type="checkbox" name="allergy" id="민들레_m" value="민들레">
							<label for="민들레">민들레</label>
							<input type="checkbox" name="allergy" id="계란흰자_m" value="계란흰자">
							<label for="계란흰자">계란흰자</label>
						</fieldset>
					</div>
					<div class="modal-footer">
						<a href="javascript:modify()" class="btn btn-primary">수정하기</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 회원 탈퇴 modal-->
	<div class="modal fade" id="Modal_delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/delete.do" method="get">
<!-- 					<input type="hidden" name="action" value="delete"> -->
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">GUNSUNG</h4>
					</div>
					<div class="modal-body">
						<div class="input-group input-group-sm">
							<span>현재 계정의 비밀번호를 입력하세요!</span>
							<input type="text" name="upw" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="확인">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 섭취식품 modal-->

	<div class="modal fade" id="Modal_myEat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">GUNSUNG</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
<!-- 					user.id처럼 세션에 user라는 속성에서 꺼내옴 -->
					<div class="modal-body">
						<table>
							<thead>
								<tr>
									<td>날짜</td>
									<td>식품명</td>
									<td>섭취 횟수</td>
									<td>지우기</td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty recodingList and recodingList != null}">
									<c:forEach items="${recodingList}" var="recoding">
										<tr>
											<form action="${pageContext.request.contextPath}/user/recoding_delete.do" method="post">
												<input type="hidden" name="uid" value=${user.uid}>
												<td><input type="text" value="${recoding.date}" name = "date" readonly="readonly"></td>
												<td>${recoding.food_fcode}</td>
										 		<td>${recoding.food_num}</td>
										 		<td><input type="submit" value = "지우기"></td>
											</form>
										</tr>
							 		</c:forEach>
						 		</c:if>
							</tbody>
							
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
			</div>
		</div>
	</div>


	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-info fixed-top">
		<div class="container">
			<a class="navbar-brand btn btn-primary" href="${pageContext.request.contextPath}/user/goHome.do">GUNSUNG</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
<!-- 					<li class="nav-item active"><a class="nav-link" href="./index.jsp">Home <span class="sr-only">(current)</span> -->
<!-- 					</a></li> -->
					<li class="nav-item"><a href='${pageContext.request.contextPath}/user/qna.do' class='nav-link'>Q&A</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품정보</a></li>
					<li class="nav-item"><a class="nav-link" href="#">베스트 섭취 정보</a></li>
					<li class="nav-item"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_notice">공지사항</button></li>
				</ul>
			</div>
		</div>
<!-- 		user가 있을 때와 없을 때 탭을 다르게 보이게 한다 -->
		<div>
<!-- 			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_notice">공지사항 보기</button> -->
			<c:if test="${sessionScope.user != null}">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal_myEat">내 섭취 정보</button>
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal">예상 섭취 정보</button>
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal_myinfo">내 정보</button>
				<a href="${pageContext.request.contextPath}/user/logout.do"><button type="button" class="btn btn-primary btn-sm">로그아웃</button></a>
				<a class="navbar-brand" style="color: pink;">${user.uid}님 환영합니다!</a>
			</c:if>
			<c:if test="${sessionScope.user == null}">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_signup">회원가입</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_changepassword">비밀번호 찾기</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal_login">로그인</button>
			</c:if>
		</div>
	</nav>
</body>
</html>