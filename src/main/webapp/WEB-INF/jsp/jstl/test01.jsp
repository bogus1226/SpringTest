<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 1</title>
</head>
<body>
	
	<h3>1. JSTL core 변수</h3>
	<c:set var="number1" value="36"/>
	<c:set var="number2" value="3"/>
	<h4>첫번째 숫자  : ${number1 }</h4>
	<h4>두번째 숫자  : ${number2 }</h4>
	
	<h3>2. JSTL core 연산</h3>
	<h4>더하기 : ${number1 + number2 }</h4>
	<h4>빼기 : ${number1 - number2 }</h4>
	<h4>곱하기 : ${number1 * number2 }</h4>
	<h4>나누기 : ${number1 / number2 }</h4>
	
	<h3>3. JSTL core out</h3>
	<c:out value="<title>core out</title>"/> 

	<h3>4. JSTL core if</h3>
	<c:set var="average" value="${(number1 + number2) / 2}"/>
	<c:if test="${average >= 10}">
		<h1>${average}</h1>
	</c:if>
	<c:if test="${average < 10}">
		<h3>${average}</h3>
	</c:if>
	
	<h3>5. JSTL core if</h3>
	<c:set var="number4" value="${number1 * number2 }"/>
	<h4>두수의 곱 : ${number4 }</h4>
	<c:if test="${number4 > 100}">
		<c:out value="<script>alert('너무 큰수 입니다.')</script>" escapeXml="false"/> 
	</c:if>
	
		
	
</body>
</html>