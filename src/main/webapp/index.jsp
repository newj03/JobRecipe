<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%-- <link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
<script type="text/javascript" src="./js/testJs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> --%>
</head>
<body>
	<!-- <div style="display: flex; text-align:center; flex:auto; min-height: 698px; ">
		<div style="position: absolute; top: 0px; text-align: left; color: #f6993f;">
			<h6>JobRecipe</h6>
		</div>
		<div style="width: 50%;">
			왼쪽 화면 부분
			<div id="newInput" onclick="inputCh(this)"
				style="width: 40%; font-size: 12pt; background-color: white;
				 border: 2px solid; border-color: #bbe0cb; margin: auto auto; min-height: none;"
				v-bind:title="hint">
				<test-input :message="message"> </test-input>
			</div>
		</div>
		<div style="width: 50%; background-color: #f6993f;">
			오른쪽 화면 부분
		</div>
	</div>
	<div style="width: 100%;">
		밑에 부분
	</div> -->
	<script>
	window.onload=function(){
		location.replace('../hire/Search_Job.do')
	}
	/* Vue.component('test-input',{
		props:['message','contents'],
		template: '<label for="inputA" id="forA">{{message}} <input type="text"'
		+'id="inputA" v-model="contents" required="required" style="font-size: 13pt; width: 100%; border: 0;'
		+' outline: 0; display:none;"><p style="color: green">{{contents}}</p></label>'
	})
	new Vue({
	el:'#newInput',
	data(){
		return {
			message: 'insert id',
			hint: '클릭하시면 id를 입력할 수 있습니다',
			contents: ''
		}
	}
}) */
	</script>
</body>
</html>