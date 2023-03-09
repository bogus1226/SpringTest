<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/resource/favorite.css" type="text/css">	
<title>즐겨 찾기 추가하기</title>
</head>
<body>
	<div class="container">
		<h2><b>즐겨 찾기 추가하기</b></h2>
		<label class="mb-1"><b>제목</b></label>
		<input type="text" class="form-control" id="nameInput">
		<label class="mt-2 mb-1"><b>주소</b></label>
		<div class="d-flex">
			<input type="text" class="form-control" id="urlInput"> 
			<button type="button" class="btn btn-info ml-3" id="duplicateBtn">중복확인</button>	
		</div>
		<div class="hidden text-danger small mt-1">중복된 url 입니다</div>
		<button type="button" class="btn btn-success btn-block mt-3" id="addBtn" >추가</button>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#duplicateBtn").on("click",function(){
				let url = $("#urlInput").val();
				
				if(url == "") {
					alert("주소를 입력하세요!!");
					return;
				} 
				
				if (!url.startsWith("http://") && !url.startsWith("https://")) {
					alert("주소를 확인하세요!!");
					return;	
				} 
				
				$.ajax({
					type:"get"
					, url:"/ajax/favorite/is_duplicate"
					, data:{"url":url}
					, success:function(data) {
						if(data.is_duplicate) {
							alert("중복된 주소입니다");
							$(".hidden").attr(visibility, visible);
						} else {
							alert("사용 가능한 주소입니다")
						}
					}
					, error:function() {
						alert("추가 에러");
					}
				});
			});
			
			$("#addBtn").on("click",function() {
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				if(name == "") {
					alert("주소명을 입력하세요!!");
					return;
				}
				
				if(url == "") {
					alert("주소를 입력하세요!!");
					return;
				} 
				
				if (!url.startsWith("http://") && !url.startsWith("https://")) {
					alert("주소를 확인하세요!!");
					return;	
				} 
				
				// /ajax/favorite/add?name=네이버&url=https://naver.com (type, url, data 로 주소 형식을 반드는것이다!)
				$.ajax({
					type:"post"
					, url:"/ajax/favorite/add"
					, data:{"name":name, "url":url}
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/ajax/favorite/list";
						} else {
							alert("추가 실패");
						}
						
					}
					, error:function() {
						alert("추가 에러");
					}
				}); 
			});
		});
	</script>
</body>
</html>