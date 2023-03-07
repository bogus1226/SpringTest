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
        <link rel="stylesheet" href="/resource/store.css" type="text/css">
<title>종합문제 2</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="header.jsp" %>
		<section class="main-contents">
			<c:forEach var="storeNameInfo" items="${storeName}">
				<h2 class="mt-3 mb-2"><b>${storeNameInfo.name} - 리뷰</b></h2>
			</c:forEach>
			<c:choose>
				<c:when test="${!empty reviewList}">
					<c:forEach var="review" items="${reviewList}">
						<div class="storeInfo border border-info mb-2">
							<div class="mt-2 ml-3">
								<div class="d-flex align-items-center">
									<div class="mt-1"><b>${review.userName}</b></div>
									<div class="ml-2 d-flex">
										<c:set var="countStarFill" value="${review.point / 1}"/>
										<c:set var="countStarHalf" value="${review.point % 1}"/>
										<c:set var="countStarEmpty" value="${(5 - (countStarFill + countStarHalf)) / 1}"/>
										<c:forEach var="i" begin="1" end="${countStarFill}" step="1">
											<img width="15" alt="가득찬 별그림" src="/img/star_fill.png">
										</c:forEach>
										<c:if test="${countStarHalf eq 0.5}">
											<c:forEach var="i" begin="1" end="1" step="1">
												<img width="15" alt="반만찬 별그림" src="/img/star_half.png">
											</c:forEach>
										</c:if>
										<c:if test="${countStarEmpty >= 1}">
											<c:forEach var="i" begin="1" end="${countStarEmpty}" step="1">
												<img width="15" alt="빈 별그림" src="/img/star_empty.png">
											</c:forEach>
										</c:if>
									</div>
								</div> 
								<div class="small text-secondary"><b><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일"/></b></div>
								<c:choose>
									<c:when test="${empty review.review}">
										<div class="mt-1 mb-1 text-secondary small"><b>리뷰 내용이 없습니다.</b></div>
									</c:when>		
									<c:otherwise>
										<div class="mt-1 mb-1 small"><b>${review.review}</b></div>
									</c:otherwise>
								</c:choose>
								<div>
									<label class="menu border small text-center"><b>${review.menu}</b></label>
								</div>	
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h5 class="text-secondary text-center"><b>작성된 리뷰가 없습니다.</b></h5>
				</c:otherwise>
			</c:choose>
		</section>
		<%@ include file="footer.jsp" %>
	</div>

</body>
</html>