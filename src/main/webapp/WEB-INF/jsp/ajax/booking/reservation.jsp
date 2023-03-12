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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resource/booking.css" type="text/css">
<title>예약하기</title>
</head>
<body>

<div id="wrap">
	<%@ include file="header.jsp" %>  

	<%@ include file="nav.jsp" %>  
	
	<section class="reservation">
			<h2 class="text-center mt-3 mb-3"><b>예약 하기</b></h2>
			<label class="m-0 mb-1"><b>이름</b></label>
			<input type="text" class="form-control mb-3" id="nameInput">
			<label class="m-0 mb-1"><b>예약날짜</b></label>
			<input type="text" class="form-control mb-3" id="dateInput" placeholder="→ 클릭후 날짜를 선택해주세요." readonly>
			<label class="m-0 mb-1"><b>숙박일수</b></label>
			<input type="text" class="form-control mb-3" id="dayInput" placeholder="ex) 1">
			<label class="m-0 mb-1"><b>숙박인원</b></label>
			<input type="text" class="form-control mb-3" id="headcountInput" placeholder="ex) 2">
			<label class="m-0 mb-1"><b>전화번호</b></label>
			<input type="text" class="form-control mb-3" id="phoneNumberInput" placeholder="숫자만 입력 - 자동입력" maxlength="13">
			
			<button type="button" class="btn btn-warning btn-block" id="reservationBtn"><b>예약하기</b></button>
	</section>
	
	
       
	<%@ include file="footer.jsp" %>

</div>

<script>
	$(document).ready(function(){
		// 숙박일수 숫자만 입력가능한 기능
		$("#dayInput").on("input", function() {
		      $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		// 숙박인원 숫자만 입력가능한 기능
		$("#headcountInput").on("input", function() {
		      $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		// 전화번호 ( - ) 하이픈 자동입력 
		$("#phoneNumberInput").on("input", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
		
		$("#dateInput").datepicker({
			dateFormat:"yy년 MM d일 DD",
            monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
            dayNames: [ "일요일","월요일","화요일","수요일","목요일","금요일","토요일" ],
            dayNamesMin: [ "일","월","화","수","목","금","토" ],
            yearSuffix: "년" ,
            showMonthAfterYear: true,
            minDate: 0,
		});
		
		$("#reservationBtn").on("click", function(){
			let name = $("#nameInput").val();
			let date = $("#dateInput").val();
			let day = $("#dayInput").val();
			let headcount = $("#headcountInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			
			if(name == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if(date == "") {
				alert("예약날짜를 입력하세요");
				return;
			}
			
			if(day == "") {
				alert("숙박일수를 입력하세요");
				return;
			}
			
			if(headcount == "") {
				alert("숙박인원을 입력하세요");
				return;
			}
			
			if(phoneNumber == "") {
				alert("전화번호를 입력하세요");
				return;
			} else if(phoneNumber != "") {
                let regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
                if(!regExp.test(phoneNumber)){
                    alert("전화번호 확인해주세요.");
                    return;
                }
            }
			
			$.ajax({
				type:"get"
				, url:"/booking/searchCountList"
				, data:{
					"name":name
					, "phoneNumber":phoneNumber}
				, success:function(data) {
					if(data.result) {
						alert("1인당 한번 예약 가능합니다.\n이미예약하였습니다.");
					} else {
						$.ajax({
							type:"get"
							, url:"/booking/add"
							, data:{
								"name":name
								, "date":date
								, "day":day
								, "headcount":headcount
								, "phoneNumber":phoneNumber}
							, success:function(data) {
								if(data.result) {
									location.href ="/booking/list"; 
								} else {
									alert("예약 실패");
								}
							}
							, error:function() {
								alert("예약 에러");
							}
						});

					}
				}
				, error:function() {
					alert("중복확인 에러");
				}
			});
			
			
			
		});
		
		
	});
</script>

</body>
</html>