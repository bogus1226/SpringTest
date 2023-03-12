<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resource/booking.css" type="text/css">
<title>통나무 팬션 예약목록</title>
</head>
<body>

<div id="wrap">
	<%@ include file="header.jsp" %>  
	<%@ include file="nav.jsp" %>  
	
	<h2 class="text-center mt-3 mb-3"><b>예약 목록 보기</b></h2>

	<table class="table text-center">
		<thead>
			<tr>
				<th>이름</th>
				<th>예약날짜</th>
				<th>숙박일수</th>
				<th>숙박인원</th>
				<th>전화번호</th>
				<th>예약상태</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="booking" items="${bookingList}">
				<tr>
					<td>${booking.name}</td>
					<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일"/></td>
					<td>${booking.day}</td>
					<td>${booking.headcount}</td>
					<td>${booking.phoneNumber}</td>
					
					<c:choose>
						<c:when test="${booking.state eq '대기중'}">
							<td><span class="text-info">${booking.state}</span></td>
						</c:when>
						
						<c:when test="${booking.state eq '확정'}">
							<td><span class="text-success">${booking.state}</span></td>
						</c:when>
						
						<c:otherwise>
							<td>${booking.state}</td>
						</c:otherwise>
					</c:choose>
					
					<td><button type="button" class="deleteBtn btn btn-danger btn-sm" data-delete-id="${booking.id}">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
       
	<%@ include file="footer.jsp" %>

</div>

<script>
	$(document).ready(function(){
		
		$(".deleteBtn").on("click", function(){
			let id = $(this).data("delete-id");
			
			$.ajax({
				type:"get"
				, url:"/booking/delete"
				, data:{"id":id}
				, success:function(data) {
					if(data.result) {
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
				, error:function() {
					alert("삭제 에러");
				}
				
			});
			
		});
		
	});
</script>

</body>
</html>