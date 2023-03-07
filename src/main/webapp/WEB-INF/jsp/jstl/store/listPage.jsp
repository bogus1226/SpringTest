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
        <link rel="stylesheet" href="/resource/store.css" type="text/css">
<title>종합문제 2</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="header.jsp" %>
		<section class="main-contents">
			<h2 class="mt-3 mb-3"><b>우리동네 가게</b></h2>
			<c:forEach var="store" items="${storeList}">
				<a href="http://localhost:8080/jstl/test10?id=${store.id}" target="_blank">
					<div class="storeInfo border border-info mb-2">
						<div class="mt-3 ml-3">
							<h4><b>${store.name}</b></h4>
							<div><b>전화번호: ${store.phoneNumber}</b></div>
							<div><b>주소: ${store.address}</b></div>
						</div>
					</div>
				</a>
			</c:forEach>
		</section>
		<%@ include file="footer.jsp" %>
	</div>

</body>
</html>