<%@page import="java.io.Console"%>
<%@page import="com.ssafy.model.vo.Food"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
 <title>Insert title here</title>
 <script src="https://unpkg.com/vue"></script>
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
  <script src="https://unpkg.com/vuex"></script>
 <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>호빈이와 주성이</title>
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	padding-top: 120px;
	padding-left: 10px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<jsp:include page="modal.jsp"></jsp:include>
</head>
<body>
	<div id="app">
		<div style="width:700px; float:left">
			<div id="list" >
				<table border="1" style="width:700px;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="board in boards">
			 				<td>{{board.qnum}}</td>
			 				<td><span v-on:click="moveDetailBoard(board.qnum)" class="btn btn-primary">{{board.title}}</span></td>
							<td>{{board.uid}}</td>
							<td v-if="board.isanswer == 1">Y</td>
							<td v-else>N</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<!-- <td><input type="hidden" v-on:click="getBoards(1)">1</td> -->
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
				</table>
			</div>
			<div>
				<router-link to = "/add">글쓰기</router-link>
			</div>
		</div>
		
		<div style="width:500px; float:left; border:1px solid black">
			<router-view :key="$route.fullPath"></router-view>
		</div>
	</div>
<template id="addTemplate">
		<div id = "addBoard">
			<h2>추가정보</h2>
			제목 : <input type="text" v-model="board.title"/> <br/>
			작성자 : <input type="text" v-model="board.uid" /> <br/>
			내용 : <textarea rows="10" cols="70" v-model="board.description"></textarea> <br/>
			<input type="button" value="등록" @click="addBoard"/>
			<input type="button" value="취소" @click="gotoList"/>
		</div>
	</template>
	
 	<template id="detailTemplate">
		<div id="detailBoard">
			<h2>상세정보</h2>
			번호 : <input type="text" v-model="board.qnum" readonly="readonly"/> <br/>
			제목 : <input type="text" v-model="board.title"/> <br/>
			작성날짜 : <input type="text" v-model="board.qdate"/> <br/>
			내용 : <textarea rows="10" cols="50" v-model="board.description"></textarea><br/>
	<!--		
			<div v-show="board.isanswer == 0">
				답변 : <textarea rows="7" cols="70" v-model="answer" readonly="readonly"/><br/>
			</div>
 			
			<div v-show="board.id == '1111'">
				<input type="button" value="수정" @click="modifyBoard"/>
				<input type="button" value="삭제" @click="removeBoard"/>
			</div>
			
			<input type="button" value="취소" @click="gotoList"/> -->
		</div>
	</template>

	<script type="text/javascript">
		console.log("test3..");
 		const store = new Vuex.Store({
			  state: {
			    qnum: 0
			  }
			});	
			
			var addhrm = Vue.component('addhrm',{
			    template: '#addTemplate',
			    data : function() {
					return{
						board : {
							qnum:0,
							title:"",
							description:"",
							uid:"",
							qdate:""
						}
					}
				},
			    methods :{		
			    	addBoard:function(board){
			    
						axios.post("http://70.12.240.110:8080/rest/questions", this.board)
						.then( 	response =>{
								this.getBoards();
							});
					},
					gotoList:function(){
						//router.push("")
					}
				}
			});
			var detailhrm = Vue.component('detailhrm',{
			    template: '#detailTemplate',
			    data : function() {
					return{
						board : {
							qnum:0,
							title:"",
							description:"",
							uid:"",
							qdate:""
						}
					}
				},
				methods : {
					getBoard:function(){
						if(this.$store.state.qnum != 0){
							axios.get("http://70.12.240.110:8080/rest/question/" + this.$store.state.qnum)
								.then( response =>{
											this.board = response.data;
										}
									);
						}
					},
					modifyBoard:function(){
						axios.put("http://70.12.240.110:8080/rest/question/"+ this.$store.state.qnum)
							.then( 	response =>{
										this.getBoards();
									})
					},
					removeBoard:function(){
						axios.delete("http://70.12.240.110:8080/rest/question/"+ this.$store.state.qnum)
							.then( 	response =>{
										this.getBoards();
									})
					},
					gotoList:function(){
						//router.push("")
					}
				
				}
				,mounted(){
					console.log("detail cmp mounted..");
					this.getBoard();
				}
			});
			
			const routes = [
			   { path: '/add', component: addhrm },
			   { path: '/detail', component: detailhrm }
			]; 
			const router = new VueRouter({
				   routes : routes
				}); 

	 		let list = new Vue({
				el : "#app",
	 			router,
				store, 
				data :{
					boards:[],
					board : {}
				},
	 			methods : {
					getBoards(){
						console.log("getBoards...")
						let self = this;
						axios.get("http://70.12.240.110:8080/rest/questions")
						.then( response =>{
								self.boards = response.data;
								}
							)				
					},	
					moveDetailBoard(qNum){
						this.$store.state.qnum=qNum;
						console.log("moveDetailBoard..."+this.$store.state.qnum);
						router.replace("/detail");
					}
				}, 
				created(){
					this.getBoards();
				},
				mounted(){
					this.getBoards();
				}
			});		
	</script>
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>