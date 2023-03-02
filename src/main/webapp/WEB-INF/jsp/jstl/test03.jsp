<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>JSTL 응용하기</title>
</head>
<body>
	
	<div class="container">
		<h1>멤버십</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="member" items="${membership }" varStatus="status">
					<tr>
						<td>${member.name }</td>
						<td>${member.phoneNumber }</td>
						
						<%-- 등급에 따른 글자색 --%>
						<td>
							<c:choose>
									<c:when test="${member.grade eq 'VIP'}">
										<div class="text-danger">${member.grade}</div>
									</c:when>	
									
									<c:when test="${member.grade eq 'GOLD'}">
										<div class="text-warning">${member.grade}</div>
									</c:when>
									
									<c:otherwise>
										<div>${member.grade}</div>
									</c:otherwise>
							</c:choose>
						</td>
						
						<%-- 포인트에 따른 글자색 --%>
						<td>
							<c:choose>
								<c:when test="${member.point >= 5000}">
										<div class="text-primary">${member.point}</div>
								</c:when>	
								
								<c:otherwise>
										<div>${member.point}</div>
									</c:otherwise>
							</c:choose>
						</td>				
					</tr>
					
				</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>