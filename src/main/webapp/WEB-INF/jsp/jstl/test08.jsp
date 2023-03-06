<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<form method="get" action="/jstl/add">
						<h4 class="mt-2"><b>날씨 입력</b></h4>
						<div class="d-flex justify-content-center align-items-center">
							<label class="mt-2 mr-2">날짜</label><input type="text" class="form-control col-3" placeholder="ex) 2022-05-02" name="date">
							<label class="mt-2 mr-2 ml-5">날씨</label>
							<select class="form-control col-2" name="weather">
								<option value="맑음">맑음</option>
								<option value="구름조금">구름조금</option>
								<option value="흐림">흐림</option>
								<option value="비">비</option>
							</select>
							<label class="mt-2 mr-2 ml-5">미세먼지</label>
							<select class="form-control col-2" name="microDust">
								<option value="좋음">좋음</option>
								<option value="보통">보통</option>
								<option value="나쁨">나쁨</option>
								<option value="최악">최악</option>
							</select>
						</div>
						
						<div class="input-group mt-4 d-flex justify-content-center align-items-center">
							<label class="mt-2">기온</label><input type="text" class="form-control col-2 ml-2" name="temperatures">
							<div class="input-group-append">
							 	<span class="input-group-text">℃</span>
							</div>
							
							<label class="mt-2 ml-4">강수량</label><input type="text" class="form-control col-2 ml-2" name="precipitation">
							<div class="input-group-append">
							 	<span class="input-group-text">mm</span>
							</div>
							
							<label class="mt-2 ml-3">풍속</label><input type="text" class="form-control col-2 ml-2" name="windSpeed">
							<div class="input-group-append">
							 	<span class="input-group-text">km/h</span>
							</div>
						</div>	
						
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-success">저장</button>
						</div>
					</form>
				</div>
			</section>
		</section>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>