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
<title>판매자 추가</title>
</head>
<body>
	<div class="container">
		<form method="post" action="/jsp/seller/input">
			<h2 class="mt-2"><b>판매자 추가</b></h2>
			
			<label class="m-0 text-secondary"><b>닉네임</b></label>
			<input type="text" class="form-control col-2" name="nickname">
			
			<label class="m-0 mt-2 text-secondary"><b>프로필 사진 url</b></label>
			<input type="text" class="form-control col-5" name="url">
			
			<label class="m-0 mt-2 text-secondary"><b>온도</b></label>
			<input type="text" class="form-control col-2" name="temperature">
			<button type="submit" class="btn btn-primary mt-2">추가</button>
		</form>
	</div>
</body>
</html>