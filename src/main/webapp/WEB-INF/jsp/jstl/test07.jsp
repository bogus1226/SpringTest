<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/resource/test07.css" type="text/css">
<title>종합문제 1</title>
</head>
<body>
	<div id="wrap">
		<section class="main-contents d-flex">
			<%@ include file="main-menu.jsp" %>
			<section class="main-content">
				<div class="container">
					<h4 class="mt-2"><b>과거 날씨</b></h4>
					<table class="table text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="weather" items="${weatherhistoryList}">
								<tr>
									<td class="small"><b><fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일"/></b></td>
									<c:choose>
										<c:when test="${weather.weather eq '비'}">
											<td><img alt="비오는그림" src="/img/rainy.jpg"></td>
										</c:when>	
										<c:when test="${weather.weather eq '구름조금'}">
											<td><img alt="구름조금있는그림" src="/img/partlyCloudy.jpg"></td>
										</c:when>	
										<c:when test="${weather.weather eq '맑음'}">
											<td><img alt="해떠있는그림" src="/img/sunny.jpg"></td>
										</c:when>	
										<c:otherwise>
											<td><img alt="해떠있는그림" src="/img/cloudy.jpg"></td>
										</c:otherwise>
									</c:choose>
									<td class="small"><b>${weather.temperatures}°C</b></td>
									<td class="small"><b>${weather.precipitation}mm</b></td>
									<td class="small"><b>${weather.microDust}</b></td>
									<td class="small"><b>${weather.windSpeed}km/h</b></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</section>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>