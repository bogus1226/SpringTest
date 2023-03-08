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
		<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<title>즐겨 찾기 추가하기</title>
</head>
<body>
	<div class="container">
	<!-- 	<form method="post" action="/ajax/favorite/add"> --> 
			<h2><b>즐겨 찾기 추가하기</b></h2>
			<label class="mb-1"><b>제목</b></label>
			<input type="text" class="form-control" name="name" id="nameInput">
			<label class="mt-2 mb-1"><b>주소</b></label>
			<input type="text" class="form-control" name="url" id="urlInput">
			<button type="submit" class="form-control btn-success mt-3" id="addBtn" >추가</button>
	<!--	</form> --> 
	</div>
	
	<script>
		$(document).ready(function(){
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